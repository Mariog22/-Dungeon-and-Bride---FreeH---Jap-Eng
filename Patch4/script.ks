; script.ks
; システムで利用する戦闘以外のスクリプト

;-----------------------------------------------------------------------------------------
; 移動中の死亡判定
*defeated_check_in_walking
@btmes
@call storage="battle.ks" target=*defeated_check
@wait time=1000
@btmes off
@eval exp='game.enterTravelMode()'
[s]

;-----------------------------------------------------------------------------------------
; ゲームオーバー
*game_over
@btmes off
@notice text="The party was wiped out!"
*_event_game_over
@anime_duel_sign visible=false
@stopbgm
@skipoff
@playse buf=3 storage=failure
@image layer=9 storage=back_gameover visible=true opacity=255 left=0 top=0
@backlay
@image layer=0 page=back storage=0000 visible=true
@wait time=2000
@skipon
@trans method=crossfade time=2000
@wt
@eval exp='game.gameVisible = false'
@wait time=2000
@layopt layer=9 page=back visible=false
@trans method=crossfade time=2000
@wt
@gotostart

;-----------------------------------------------------------------------------------------
; イベントモードで宝箱が表示された時の飛び先（戻るのはシナリオ内の呼び出し元）
*treasure_in_event
@eval exp='tf.leaveTreasureBox = false'
@eval exp='game.trapWin.open()'
[s]

; 罠を解除せずに去ったとき
*leave_treasure_in_event
@eval exp='tf.leaveTreasureBox = true'
@eval exp='game.previewActions = []'
@return

;-----------------------------------------------------------------------------------------
; 落下
*fall_to_lower
[if exp='game.party.throughDoor']
	@notice text="It can't support us!"
	@eval exp='game.party.throughDoor = false'
[endif]
@wait time=20
@eval exp='game.view.top -= (275 - game.view.opacity) \ 2'
@eval exp='game.view.skyLayer.opacity = game.view.opacity -= 20'
@eval exp='game.view.skyLayer.visible = false' cond='game.map.isCeiling(game.party.curX, game.party.curY)'
@jump target=*fall_to_lower cond='game.view.top > -600'
@eval exp='game.view.skyLayer.opacity = game.view.opacity = 0'
@wait time=300
@eval exp='game.view.skyLayer.visible = true'
@eval exp='game.view.top = 20, game.view.opacity = 255'
@eval exp='game.view.skyLayer.top = 0, game.view.skyLayer.opacity = 255'
@eval exp='game.map.open()'
@eval exp='game.updateView()'
*_to_over_water
@eval exp='tf.temp = game.map.getFloorInfo()'
[if exp='tf.temp.type == "water" || tf.temp.type == "stream"']
	@playse storage=bashan1 buf=2
[elsif exp='tf.temp.type != "air"']
	@wait time=20
	@eval exp='game.view.top = 0'
	@wait time=20
	@eval exp='game.view.top = -20'
	@wait time=20
	@playse storage=dosa
	@eval exp='game.view.top = -40'
	@wait time=20
	@eval exp='game.view.top = -20'
	@wait time=20
	@eval exp='game.view.top = -40 * ! game.party.isFloating()'
	@wait time=200
	@eval exp='game.popup.open()'
	@eval exp='game.popup.write("I fell downstairs!")'
	@mu f=&'game.map.bgm'
	@wait time=500
[endif]
@eval exp='game.onGameRestart()'
@eval exp='game.walkFinished(true)'
[s]

;-----------------------------------------------------------------------------------------
; 水中へ落下
*fall_to_water
@wait time=20
@eval exp='game.view.top += (30 + game.view.top) \ 2'
@jump target=*fall_to_water cond='game.view.top > -500'
@playse storage=bashan1
@image layer=e4 storage=screen_white left=0 top=0 opacity=255 visible=true
@eval exp='game.guest.dressSpecialSuits("swim")'
@eval exp='tf.result = game.guest.eraseSummonedMonster(o.潜水)'
@wait time=500
@eval exp='game.map.open()'
@eval exp='game.updateView()'
@eval exp='game.view.top = 0, game.view.opacity = 255'
*_to_under_water
@layopt layer=e4 opacity=160
@wait time=20
@eval exp='game.view.top = -10'
@layopt layer=e4 opacity=128
@wait time=20
@eval exp='game.view.top = -20'
@layopt layer=e4 opacity=96
@wait time=20
@eval exp='game.view.top = -30'
@layopt layer=e4 opacity=64
@wait time=20
@eval exp='game.view.top = -36'
@layopt layer=e4 opacity=32
@wait time=20
@eval exp='game.view.top = -40'
@layopt layer=e4 opacity=255 visible=false
@wait time=300
@notice text="Summoned monsters that cannot enter the water disappeared" cond='tf.result'
@mu f=&'game.map.bgm'
@wait time=200
@eval exp='game.onGameRestart()'
@eval exp='game.walkFinished(true)'
[s]

;-----------------------------------------------------------------------------------------
; 水中での落下
*fall_to_lower_under_water

@wait time=20
@eval exp='game.view.top -= 20'
@eval exp='game.view.skyLayer.opacity = game.view.opacity -= 20'
@eval exp='game.view.skyLayer.visible = false' cond='game.map.isCeiling(game.party.curX, game.party.curY)'
@jump target=*fall_to_lower_under_water cond='game.view.opacity > 20'
@eval exp='game.view.skyLayer.opacity = game.view.opacity = 0'
@wait time=300
@eval exp='game.view.skyLayer.visible = true'
@eval exp='game.view.top = 20, game.view.opacity = 255'
@eval exp='game.view.skyLayer.top = 0, game.view.skyLayer.opacity = 255'
@eval exp='game.map.open()'
@eval exp='game.updateView()'
@eval exp='game.view.top = 0, game.view.opacity = 255'
@jump target=*_to_over_water cond='! game.map.underWater'
@eval exp='tf.result = false'
@jump target=*_to_under_water

;-----------------------------------------------------------------------------------------
; 落とし穴による落下
*fall_by_chute
@playse storage=door2
@notice text="It's a pitfall!"
@jump target=*fall_to_lower

;-----------------------------------------------------------------------------------------
; 床の崩落による落下
*fall_by_collapse
@quake time=500 hmax=20 vmax=0
@wq
@jump target=*fall_to_lower

;-----------------------------------------------------------------------------------------
; 垂直に上り下り
*movo_to_upper_vertically
@eval exp='tf.delta = 40'
@jump target=*_move_vertically
*movo_to_lower_vertically
@eval exp='tf.delta = -40'
*_move_vertically
@wait time=20
@eval exp='game.view.top += tf.delta'
@eval exp='game.view.skyLayer.opacity = game.view.opacity = cap(game.view.opacity - 35)'
@jump target=*_move_vertically cond='game.view.top != tf.delta * 8'
@eval exp='game.view.skyLayer.visible = game.view.visible = false'
@eval exp='game.view.skyLayer.opacity = game.view.opacity = 255'
@wait time=300
@wait time=700 cond='tf.elevatorMoving'
@eval exp='tf.elevatorMoving = false'
[if exp='game.map.kind == "town"']
	@eval exp='game.enterTown(game.map)'
	[s]
[endif]
[if exp='game.map.kind == "hotel"']
	@eval exp='game.enterHotelFromDungeon(game.map)'
	[s]
[endif]
@eval exp='game.map.open()'
@eval exp='game.updateView()'
@eval exp='game.view.visible = true'
@eval exp='game.view.top = -tf.delta * 5'
@eval exp='game.view.skyLayer.visible = true' cond='! game.map.isCeiling(game.party.curX, game.party.curY)'
*_move_vertically2
@eval exp='game.view.top += tf.delta'
@wait time=20
@jump target=*_move_vertically2 cond='game.view.top != -40 * ! game.party.isFloating()'
@eval exp='game.view.skyLayer.visible = true'
@mu f=&'game.map.bgm'
@eval exp='game.onGameRestart()'
@eval exp='game.walkFinished(true)'
[s]

;-----------------------------------------------------------------------------------------
; 建てかけばしごでよじ登る
*rise_to_surface
@eval exp='tf.underWater = true'
*climb_wall_ladder
@eval exp='game.view.walkTimer.enabled = false'
@eval exp='game.view.bufScreen.shiftWallImage(1)'
@eval exp='game.view.stretchAndPrintToViewScreen(75, 50, 870, 580)'
@wait time=20
@eval exp='game.view.bufScreen.shiftWallImage(2)'
@eval exp='game.view.stretchAndPrintToViewScreen(120, 80, 780, 520)'
*_climb_wall_ladder
@wait time=20
@eval exp='game.view.top += 40 - tf.underWater * 20'
@jump target=*_climb_wall_ladder cond='game.view.top < 200'
@eval exp='game.view.visible = false'
@eval exp='game.view.skyLayer.visible = false'
@wait time=300
@eval exp='game.map.open()'
@eval exp='game.updateView()'
@eval exp='game.view.bufScreen.shiftWallImage(3)'
@eval exp='game.view.stretchAndPrintToViewScreen(0, 0, 1020, 680)'
@eval exp='game.view.visible = true'
@eval exp='game.view.top = -120'
@eval exp='game.view.skyLayer.visible = true'
@playse storage=bashan2 cond='tf.underWater'
*_climb_wall_ladder2
@wait time=20
@eval exp='game.view.top += 40 - tf.underWater * 20'
@jump target=*_climb_wall_ladder2 cond='game.view.top < -40 * ! game.party.isFloating()'
@eval exp='tf.underWater = false'
@wait time=20
@mu f=&'game.map.bgm'
@eval exp='game.onGameRestart()'
@eval exp='game.walk("goForward", true)'
@eval exp='game.view.animCount = 1'
@eval exp='game.party.lastIsMove = true'
[s]

;-----------------------------------------------------------------------------------------
; 階段を上り下り
*walk_stairs_to_up
@eval exp='tf.delta = 25'
@jump target=*_walk_stairs
*walk_stairs_to_down
@eval exp='tf.delta = -25'
*_walk_stairs
@image layer=e3 storage=screen_black
@eval exp='game.view.walkTimer.interval = 40'
@eval exp='game.view.top += tf.delta'
@layopt layer=e3 opacity=64 visible=true
@wait time=40
@eval exp='game.view.top += tf.delta'
@layopt layer=e3 opacity=128
@wait time=40
@eval exp='game.view.top += tf.delta'
@layopt layer=e3 opacity=192
@wait time=40
@layopt layer=e3 opacity=255
@eval exp='game.view.walkTimer.interval = game.view.walkSpeed'
@wait time=300
@layopt layer=e3 visible=false
@eval exp='game.view.resetPos()'
@eval exp='game.onGameRestart()'
[s]

;-----------------------------------------------------------------------------------------
; 正面に置かれた物体が落下
*object_fall
@eval exp='tf.temp = game.map.getPosRelatively()'
@wait time=40
@image layer=e3 storage=&'game.view.fallenObject.img + "_put_a1"' visible=true left=100 top=-80
@wait time=200
[if exp='game.view.fallenObject.collapse']
	@shake layer=e3 length=10 time=50 loop=10
	@playse storage=rockdrop buf=2
	@changefloor img=void pimg=void x=&'tf.temp.x' y=&'tf.temp.y'
[endif]
[if exp='game.view.fallenObject.intoWater']
	@playse storage=bashan1
	@image layer=e4 storage=PE_base_view visible=true left=0 top=-40
	@startemit layer=e4 storage=PE_splash time=500
[endif]
@image layer=e3 storage=&'game.view.fallenObject.img + "_put_a1"' top=-20 clipheight=540
@wait time=20
@image layer=e3 storage=&'game.view.fallenObject.img + "_put_a1"' top=100 clipheight=420
@wait time=20
@image layer=e3 storage=&'game.view.fallenObject.img + "_put_a1"' top=340 clipheight=180
@wait time=20
@layopt layer=e3 visible=false
@wait time=300
[if exp='game.view.fallenObject.crash']
	@playse storage=collapse buf=2
	@eval exp='game.popup.open(1000)'
	@eval exp='game.popup.write("I heard rocks crashing down!")'
[endif]
[if exp='game.view.fallenObject.intoPool']
	@wait time=700 cond='game.view.fallenObject.intoWater'
	@changefloor img=&'game.view.fallenObject.img' x=&'tf.temp.x' y=&'tf.temp.y'
	@wait time=500
	@clearemit layer=e4
[endif]
@eval exp='game.view.fallenObject = void'
@eval exp='game.onGameRestart()'
[s]

;-----------------------------------------------------------------------------------------
; 調査
*search_start

; 調査開始
@eval exp='game.popup.open(1300)'
@eval exp='game.popup.write("Investigating ")'
	*_search_loop
	@wait time=100
	@eval exp='game.popup.write("・")'
	@jump target=*_search_loop cond='game.popup.waitTimer.enabled'
@eval exp='game.popup.close()'

; イベントがあるかチェックする。あればイベントラベルにジャンプする
@eval exp='game.checkMapEvent()'

; クリックオブジェクトがあるか調べる。あればイベントラベルにジャンプするか、停止する
@s cond='game.checkClickObject()'

; 隠しオブジェクトがあるか調べる。あればここで停止
@s cond='game.searchFrontSecretObject()'

; 何もなかった
@wait time=200
@eval exp='game.popup.open()'
@eval exp='game.popup.write("Nothing found.")'
@eval exp='game.inSearching = false'
@eval exp='game.onGameRestart()'
[s]

;-----------------------------------------------------------------------------------------
; 扉のこじあけ
*pick_start
@playse storage=picking
@eval exp='game.popup.open(1300)'
@eval exp='game.popup.write("Let me pick it ")'
	*_pick_loop
	@wait time=100
	@eval exp='game.popup.write("・")'
	@jump target=*_pick_loop cond='game.popup.waitTimer.enabled'
@eval exp='game.popup.close()'
@wait time=500
[if exp='game.curChara.tryPickDoor()']
	@playse storage=kacha
	@wait time=500
	@eval exp='game.popup.open()'
	@eval exp='game.popup.write("The door was unlocked!")'
[else]
	@eval exp='game.popup.open()'
	@eval exp='game.popup.write("I failed to unlock it!")'
[endif]
@eval exp='game.onGameRestart()'
[s]

;-----------------------------------------------------------------------------------------
; 教会での蘇生
*raise_start
@eval exp='game.popup.open(3200)'
@eval exp='game.popup.write("Praying ")'
	@wait time=400
	@eval exp='game.popup.write("・")'
	@wait time=400
	@eval exp='game.popup.write("・")'
	@wait time=400
	@eval exp='game.popup.write("・")'
	*_raise_loop
	@wait time=400
	@eval exp='game.popup.write("・")'
	@jump target=*raise_failure cond='! game.curChara.tryRaising()'
	@jump target=*_raise_loop cond='game.popup.waitTimer.enabled'

; 蘇生成功
@eval exp='game.curChara.beRaised()'
@eval exp='game.notice.open(game.churchWin.enterRaiseMode)'
@eval exp='game.notice.write("Revived " + game.curChara.name + "!")'
[s]

; 蘇生失敗
*raise_failure
@eval exp='game.notice.open(game.churchWin.enterRaiseMode)'
[if exp='game.curChara.status.has(o.灰)']
	@eval exp='game.notice.write("Failed to revive!<r>" + game.curChara.name + " disappeared")'
	@eval exp='game.curChara.beLost()'
[else]
	@eval exp='game.notice.write("Failed to revive!<r>" + game.curChara.name + " turned into ashes")'
	@eval exp='game.curChara.setStatus(o.灰, true)'
[endif]
[s]

;-----------------------------------------------------------------------------------------
; 結婚・指輪の交換
*start_wedding
[texton]
[if exp='game.churchWin.curChurch.alignment == "good"']
	[シスター]「[テオ] and [emb exp='game.wife.name'] are getting married. So first, please exchange rings.」[k]
[else]
	[ブラザー]「[テオ] and [emb exp='game.wife.name'] are getting married, aren't they? First of all, please exchange rings.」[k]
[endif]
[textoff]
*_retry_wedding
@call target=*select_rings
[if exp='! tf.result']
	@question title="Cancel the wedding?"
	@jump target=*_retry_wedding cond='! tf.result'
	[churchoff]
[endif]
@eval exp='o.テオ.married = game.wife.married = true'
@notice text="We exchanged rings!"
[texton]
[if exp='game.churchWin.curChurch.alignment == "good"']
	[シスター]「You are now officially husband and wife. We wish you many years of happiness.」[k]
[else]
	[ブラザー]「As of today, you are officially husband and wife. May your lives be blessed.」[k]
[endif]
[textoff]
@jump storage="main12.scn" target=*wedding_01

; 結婚指輪の変更
*change_rings
@call target=*select_rings
[if exp='! tf.result']
	@question title="Cancel changes?"
	@jump target=*change_rings cond='! tf.result'
	@exithouse
	[eventoff]
[endif]
@se f=period
@notice text="The ring was changed!"
@eval exp='o.テオ.married = game.wife.married = true'
@exithouse
[eventoff]

; 指輪選択
*select_rings
@notice text="Choose your wedding ring"
@selectitem

[if exp='game.curItem === void']
	@jump target=*select_rings
[endif]

[if exp='game.curItemStat < 0']
	@question title="It hasn't been appraised yet.<r>Choose again?"
	@jump target=*select_rings cond='tf.result'
	@return cond='! tf.result'
[endif]

[if exp='game.curItem.part != "finger"']
	@question title="Not a ring.<r>Choose again?"
	@jump target=*select_rings cond='tf.result'
	@return cond='! tf.result'
[endif]

[if exp='game.curItemStat <= BROKEN']
	@question title="This ring is broken.<r>Choose again?"
	@jump target=*select_rings cond='tf.result'
	@return cond='! tf.result'
[endif]

@eval exp='tf.temp = [game.itemWin.curChara, game.curItem, game.itemWin.curChara.reservedGrid]'

*select_second_ring
@notice text="Choose a matching wedding ring"
@selectitem

[if exp='game.curItem === void']
	@jump target=*select_second_ring
[endif]

[if exp='game.curItemStat < 0']
	@question title="It hasn't been appraised yet.<r>Choose again?"
	@jump target=*select_second_ring cond='tf.result'
	@return cond='! tf.result'
[endif]

[if exp='game.curItem.part != "finger"']
	@question title="Not a ring.<r>Choose again?"
	@jump target=*select_second_ring cond='tf.result'
	@return cond='! tf.result'
[endif]

[if exp='game.curItemStat <= BROKEN']
	@question title="This ring is broken.<r>Choose again?"
	@jump target=*select_second_ring cond='tf.result'
	@return cond='! tf.result'
[endif]

[if exp='game.curItem != tf.temp[1]']
	@question title="The wedding ring doesn't match.<r>Choose again?"
	@jump target=*select_second_ring cond='tf.result'
	@return cond='! tf.result'
[endif]

[if exp='game.itemWin.curChara == tf.temp[0] && game.itemWin.curChara.reservedGrid == tf.temp[2]']
	@question title="That's the same ring as the one you chose earlier. Choose again?"
	@jump target=*select_second_ring cond='tf.result'
	@return cond='! tf.result'
[endif]

@eval exp='o.テオ.married = game.wife.married = false'
@eval exp='game.itemWin.curChara.ejectItem(game.curItem, game.itemWin.curChara.reservedGrid)'
@eval exp='tf.temp[0].ejectItem(tf.temp[1], tf.temp[2])'
@eval exp='o.テオ.dressEquipment(game.curItem,,, true)'
@eval exp='game.wife.dressEquipment(game.curItem,,, true)'
@eval exp='tf.result = true'

@return

;-----------------------------------------------------------------------------------------
; ダンジョン内のショップ
*shop_enter
@stop_map_effect
@eval exp='tf.temp.inHouse = true'
@eval exp='tf.temp.func()'
[s]

*shop_exit
@start_map_effect
@eval exp='game.map.recordAreaOpened(game.party.curX, game.party.curY,, true)'
@eval exp='game.backScreen.visible = false'
@eval exp='game.resetPrevForKag()'
@return

;-----------------------------------------------------------------------------------------
; 睡眠不足で町を出ようとしたとき
*town_stop_going
@playse storage="buzzer"
[texton w=5]
[テオ f=06][nw]「Some of the party are tired. We should probably spend the night here before leaving town.」[k]
[textoff]
[townoff]

;-----------------------------------------------------------------------------------------
; 宿屋・フロント挨拶
*hotel_welcome
[texton w=5]
[if exp='game.party.members.count == 0']
	[フロント係][nw]「Welcome to [emb exp='game.hotelView.curHotel.name'].」[k]
	[フロント係][nw]「Please come again when you have a party.」[k]
	[textoff]
	@eval exp='game.hotelView.leaveHotel()'
[else]
	[フロント係][nw]「Welcome to [emb exp='game.hotelView.curHotel.name']!
	[r]Please reserve a room for all members[r]on the [b]reservation screen[/b].」[k]
	[textoff]
	@eval exp='game.hotelView.startReservation()'
[endif]
[s]

; 宿屋・予約完了 → 散策前イベントのチェック
*hotel_checkin
@playse storage=up1
@image layer=0 storage=0000 visible=true left=0 top=0 opacity=0
@move layer=0 time=500 path=,,255
@wm
@eval exp='game.hotelView.visible = false'
@eval exp='tf.result = game.party.supplyClothesToNakedMembers()'
@notice text="Basic equipment has been provided to<r>naked characters!" cond='tf.result'
@eval exp='game.hotelView.checkEveningEvent()'
[s]

; 宿屋・散策モードへ移行
*hotel_roaming
@layopt layer=0 visible=true opacity=255
@move layer=0 time=500 path=,,0
@wm
@layopt layer=0 visible=false opacity=255
@eval exp='game.onGameRestart()'
[s]

; 宿屋・就寝モードへ移行・途中でイベントへ移行することもある
*hotel_sleepnow
@layopt layer=0 visible=true opacity=255
@move layer=0 time=500 path=,,0
@wm
*hotel_sleeping
@wait time=500 cond='game.hotelView.membersMoving()'
@wait time=500
@waittrig name="waitHeatCounter" cond='game.view.increaseHeroinesHeatByGuys() || game.view.increaseGuysHeatByWife()'
@wait time=&'game.hotelView.breakingAnimeTime'
@wait time=500
@stopbgm
@playse buf=2 storage=goodnight
@image layer=0 storage=0000 visible=true opacity=0 cond='! game.hotelView.sleepNow'
@move layer=0 time=2000 path=,,255
@wait time=1500
@eval exp='game.instruct("Sleeping...", 630)'
@eval exp='game.hotelView.startSleepingEffect()'
@wait time=2000
@eval exp='game.instruction.close()'
@eval exp='game.hotelView.clearHotelView()'
@eval exp='tf.result = game.hotelView.checkTheftAtStable()'
[if exp='tf.result != ""']
	@wait time=500
	@playse storage=coin
	@notice text=&'tf.result + " stolen from the member staying in the stable!"'
	@wait time=500
[endif]
@eval exp='game.hotelView.checkMidNightEvent()'
[s]

; 宿屋・チェックアウト → レベルアップ
*hotel_checkout
@layopt layer=0 visible=false opacity=255
[texton]
[フロント係][nw]「Thank you for staying with us.[r]Well then, safe travels.」[k]
[textoff]
@eval exp='game.hotelView.checkLevelUp()'
@gameon
[s]

;-----------------------------------------------------------------------------------------
