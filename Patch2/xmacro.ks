; ゲーム専用マクロ


; ゲームモードを表示する
@macro name="gameon"
	@eval exp='game.eraseAllFigureTags()'
	@wakuset w=0
	@image layer=0 storage=0000 left=0 top=0 visible=true opacity=255 cond='+mp.fade'
	@eval exp='game.gameVisible = true'
	@eval exp='game.view.visible = true'
	@move layer=0 path=,,0 time=%time|1000 cond='+mp.fade'
	@wm cond='+mp.fade'
	@layopt layer=0 visible=false opacity=255
	@layopt layer=0 page=back left=0 top=0 visible=false opacity=255
@endmacro


; 現在のマップで使われている音楽と環境音を流す
@macro name="playmapsound"
	@playbgm storage=&'game.map.bgm' cond='kag.bgm.currentStorage != game.map.bgm'
	@eval exp='game.view.playMapSound(game.map.sound)' cond='game.map.kind == "dungeon" && game.map.sound !== void'
@endmacro


; イベントモードで警告ウインドウを表示
@macro name="notice"
	@pausebgm cond='mp.se !== void'
	@playse buf=0 storage=%se cond='mp.se !== void'
	@eval exp='mp.temp = kag.fore.messages[0].visible'
	@layopt layer=message0 visible=false
	@eval exp='game.notice.open(game.notice.processScenario,, mp.wait !== void ? +mp.wait : void)'
	@eval exp='game.notice.write(mp.text, mp.x !== void ? +mp.x : void, mp.y !== void ? +mp.y : void)'
	@eval exp='game.notice.left = +mp.left' cond='mp.left !== void'
	@eval exp='game.notice.top = +mp.top' cond='mp.top !== void'
	@waitinput name="noticeClick"
	@ws buf=0 cond='mp.se !== void'
	@resumebgm cond='mp.se !== void'
	@layopt layer=message0 visible=&'mp.temp'
@endmacro


; イベントモードですぐ消える警告ウインドウを表示
@macro name="popup"
	@eval exp='mp.time = 500' cond='mp.time === void'
	@eval exp='game.popup.open(+mp.time)'
	@eval exp='game.popup.write(mp.text)'
	@wait time=%time
@endmacro


; イベントモードでコマンドウインドウを表示
@macro name="command"
	@cancelskip cond='! sf.keepAutoClickMode'
	@cancelautomode cond='! sf.keepAutoClickMode'
	@eval exp='game.curBoard = game.cmdWin' cond='mp.type === void'
	@eval exp='game.curBoard = game.shortMenu' cond='mp.type == "short"'
	@eval exp='game.curBoard = game.longMenu' cond='mp.type == "long"'
	@eval exp='game.curBoard = game.miniMenu' cond='mp.type == "mini"'
	@eval exp='game.curBoard.openByTag(mp)'
@endmacro


; イベントモードでコマンドウインドウに選択肢を表示させる
@macro name="select"
	@eval exp='game.curBoard.putCommandByTag(mp)'
@endmacro


; イベントモードで出したコマンドへの回答を待つ
@macro name="ask"
	@eval exp='game.curBoard.commands[0].focus()' cond='KEY_PRESSED || MOUSE_HIDDEN'
	@waitinput name="askQuestion"
@endmacro


; イベントモードで「はい」「いいえ」を問うウインドウを表示
@macro name="question"
	@eval exp='mp.record = false'
	@eval exp='game.curBoard = game.yesNoWin'
	@eval exp='game.curBoard.openByTag(mp)'
	@eval exp='game.curBoard.y = 90' cond='mp.title === void'
	@select text=%ytext|Yes exp='tf.result = true'
	@select text=%ntext|No exp='tf.result = false'
	[ask]
@endmacro


; イベントモードでアイテムを選ばせる
@macro name="selectitem"
	@eval exp='mp.chara = mp.chara !== void ? o[mp.chara] : void'
	@eval exp='game.setPrev(game.itemWin.selectItemAndClose)'
	@eval exp='game.itemWin.openInventory(mp.chara, "select")'
	@waitinput name="selectItemAndClose"
	@eval exp='game.resetPrevForKag()'
@endmacro


; イベントモードでアイテムを削除する
@macro name="ejectitem"
	[if exp='mp.item !== void']
		; 指定したアイテムをパーティー内から探す
		@eval exp='game.party.ejectItem(o[mp.item],, true)'
	[else]
		; すでに選択させた後
		@eval exp='mp.chara = game.itemWin.curChara'
		@eval exp='mp.chara.ejectItem(mp.chara.reservedItem, mp.chara.reservedGrid)'
	[endif]
@endmacro


; イベントモードで宝箱を表示
@macro name="treasure"
	@eval exp='game.exitTravelMode()'
	[if exp='+mp.hide']
		@image layer=e2 storage=box_put_a0 visible=true left=40 top=-80
		@notice text="There was a hidden chest!"
	[endif]
	[if exp='mp.gold !== void']
		@eval exp='o.額指定金貨.price = +mp.gold'
		@eval exp='o.額指定金貨.displayName = mp.gold + "G"'
		@eval exp='o.額指定金貨.img = "money_" + Math.pow(5, cap(Math.log(+mp.gold / 20) / Math.log(5), 4)) * 20'
		@eval exp='mp.item += ","' cond='mp.item !== void'
		@eval exp='mp.item += "額指定金貨"'
	[endif]
	@eval exp='mp.temp = o[mp.trap]' cond='mp.trap !== void'
	@eval exp='game.treasureBox.createTreasureBox(game.getItemObjArrayByText(mp.item), mp.temp, +mp.level, +mp.closely)'
	[if exp='mp.trap !== void && game.party.getCurPicker() !== void']
		@call storage="script.ks" target=*treasure_in_event
		@eval exp='game.processPrev()'
	[else]
		@eval exp='game.openTreasureBox()'
	[endif]
	@waitinput name="closeTreasureBox" cond='game.itemWin.visible'
	@eval exp='game.resetPrevForKag()'
	@layopt layer=e2 visible=false cond='+mp.hide'
@endmacro


; イベントモードでアイテムやお金を手に入れる。バッグに入りきらない場合は一時保管庫に送られる
; 取得後は元に戻せないので、重要なアイテムのやり取りには使わないように
@macro name="getitem"
	[if exp='mp.item !== void']
		@se f=%sound|period cond='! +mp.silent'
		@eval exp='mp.dic = game.getItemObjArrayByText(mp.item)[0]'
		[if exp='mp.dic.state < 0']
			@eval exp='mp.itemName = mp.dic.itemData.getUnknownName()'
		[else]
			@eval exp='mp.itemName = mp.dic.itemData.displayName'
			@eval exp='sf[mp.dic.itemData.name] = true'
		[endif]
		@eval exp='mp.chara = game.storeItemSomewhere(mp.dic)'
		[if exp='mp.message === void']
			@eval exp='mp.name = (mp.chara !== void) ? "<c>" + mp.chara.displayName : "<y>Party"'
			@eval exp='mp.message = mp.name + "<y> obtained <p>" + mp.itemName + "<y>!"'
		[endif]
		[if exp='mp.chara === void']
			@eval exp='mp.message += "<r>We have no inventory space, so it will be sent to the <c>temporary storage facility<y> in the town warehouse."'
		[endif]
		@notice text=&'mp.message'
	[else]
		@se f=%sound|coin
		@notice text=&'"<y>Obtained <p>" + number_format(+mp.gold) + "G<y>!"'
		@eval exp='game.party.gold += +mp.gold'
	[endif]
@endmacro


; イベントモードでキャラ選択を待つ。保存先は game.curTarget。キャンセルすると void になる
@macro name="waitchoosechara"
	@eval exp='game.enterSelectTargetMode(game.setTarget, false, +mp.guest)'
	@eval exp='game.instruct(mp.text, 470)'
	@eval exp='game.setPrev(game.cancelChooseTarget)'
	@eval exp='game.setPrev()'
	@waitinput name="waitChooseTarget"
	@eval exp='game.instruction.close()'
	@eval exp='game.exitSelectTargetMode()'
@endmacro


; イベントモードで魔法を使用するキャラ選択を待つ。保存先は game.curTarget。キャンセルすると void になる
@macro name="waitchoosemagicuser"
	@eval exp='game.curTarget = void'
	@eval exp='game.party.useMagic(o[mp.cmd], game.setTarget)'
	@eval exp='game.setPrev(game.cancelChooseTarget)'
	@eval exp='game.setPrev()'
	@waitinput name="waitChooseTarget"
	@eval exp='game.instruction.close()'
	@eval exp='game.exitSelectTargetMode()'
	[if exp='game.curTarget !== void']
		@eval exp='game.curTarget[o[mp.cmd].category][o[mp.cmd].magicLV - 1] --'
	[endif]
@endmacro


; イベントモードで戦闘コマンドを実行
@macro name="btcmd"
	@eval exp='mp.toEnemy = o[mp.name].toEnemy'
	@eval exp='mp.category = o[mp.name].category'
	@eval exp='mp.scene = o[mp.name].scene'
	@eval exp='mp.magicLV = o[mp.name].magicLV'
	@eval exp='o[mp.name].category = "event"'
	@eval exp='o[mp.name].toEnemy = false'
	@eval exp='o[mp.name].scene = "all"'
	@eval exp='o[mp.name].magicLV = 0'
	@layopt layer=message0 visible=false
	@eval exp='game.popup.open(1000)' cond='mp.message !== void'
	@eval exp='game.popup.write(mp.message)' cond='mp.message !== void'
	@eval exp='game.curFighter = game.virtualChara'
	@eval exp='game.curFighter.setAction(o[mp.name])'
	[if exp='o[mp.name].range == 1 || o[mp.name].range == 2']
		[if exp='+mp.random']
			@eval exp='game.curFighter.target = game.curFighter.getRandomTarget(o[mp.name])'
		[else]
			@eval exp='game.setPrev(game.cancelChooseTarget)'
			@eval exp='game.setPrev()'
			@waitinput name="waitChooseTarget"
		[endif]
		@call storage="battle.ks" target=*field_start cond='game.curFighter.target !== void'
	[else]
		@call storage="battle.ks" target=*field_start
	[endif]
	@eval exp='o[mp.name].toEnemy = mp.toEnemy'
	@eval exp='o[mp.name].category = mp.category'
	@eval exp='o[mp.name].scene = mp.scene'
	@eval exp='o[mp.name].magicLV = mp.magicLV'
@endmacro


; イベントモードでパーティーを特定の方向に自動的に移動させる
@macro name="walk"
	@eval exp='mp.lastWay = game.party.curFront'
	@eval exp='game.party.turnByForce(mp.turn)' cond='mp.turn !== void && mp.move === void'
	@eval exp='game.party.setCurPos(,, mp.turn)' cond='mp.turn !== void && mp.move !== void'
	@eval exp='game.party.moveByForce(mp.move)' cond='mp.move !== void'
	@waittrig name="walkFinished" cond='mp.move !== void || (mp.turn !== void && mp.turn != mp.lastWay)'
@endmacro


; イベントモードでワープさせる
@macro name="warp"
	@playse storage=poyon cond='mp.sound === void'
	@playse storage=%sound cond='mp.sound !== void && mp.sound != "false" && mp.sound != "0"'
	@eval exp='game.backScreen.visible = true'
	@wait time=20
	@eval exp='game.backScreen.visible = false'
	@eval exp='game.changePosition(%[map: mp.map, x: +mp.x, y: +mp.y, way: mp.way], true)'
@endmacro


; エレベーターで移動する
@macro name="elevator"
	@se f=elevator
	@wait time=200
	@eval exp='tf.elevatorMoving = true'
	@eval exp='game.moveToFloorVertically(%[map: mp.map, lift: mp.lift])'
@endmacro


; イベントバトルを起こす
@macro name="callbattle"
	@eval exp='tf.stopBgmAfterBattle = true' cond='+mp.stopbgm'
	@eval exp='game.inEventBattle = true'
	@eval exp='game.isNeverEscapeBattle = true' cond='mp.escape !== void && ! +mp.escape'
	@eval exp='game.specialBattleBgm = mp.bgm'
	@eval exp='game.inEvent = false' cond='+mp.gameover || +mp.normal'
	@call storage="battle.ks" target=*call_event_battle cond='! +mp.skipstart'
	@call storage="battle.ks" target=*call_event_battle_skip_opening cond='+mp.skipstart'
	@eval exp='game.inEventBattle = false'
	[if exp='+mp.normal']
		@delevent
		@eval exp='game.appearTreasureBox()'
		@eval exp='f.saveEnabled = true' cond='! f.saveIsForbidden'
		[s]
	[endif]
	@eval exp='game.inEvent = true'
	@eval exp='game.resetPrevForKag()'
@endmacro


; イベントバトルで出現させる敵を指定
;「奴隷ヒロイン＊」を名前に指定したらそのキャラが敵となって出現する（３人まで）
@macro name="monster"
	@eval exp='mp.pre = game.curTeam.img' cond='game.curTeam !== void'
	@eval exp='m.奴隷ヒロイン０.setOriginalData(game.curTeam.slaves[0], mp.pre)' cond='mp.name == "奴隷ヒロイン０"'
	@eval exp='m.奴隷ヒロイン１.setOriginalData(game.curTeam.slaves[1], mp.pre)' cond='mp.name == "奴隷ヒロイン１"'
	@eval exp='m.奴隷ヒロイン２.setOriginalData(game.curTeam.slaves[2], mp.pre)' cond='mp.name == "奴隷ヒロイン２"'
	@eval exp='m[mp.name].customName = mp.custom' cond='mp.custom !== void'
	@eval exp='game.enemy.reservedMonsters[+mp.pos] = m[mp.name]'
	@eval exp='game.enemy.members[+mp.pos].isNaked = +mp.naked' cond='mp.naked !== void'
	@eval exp='game.enemy.members[+mp.pos].invincible = +mp.invincible' cond='mp.invincible !== void'
@endmacro


; イベントバトルで出現させる敵のスペックを一時的に調整する
; この戦闘が終わったら元のスペックに戻る
@macro name="adjust"
	@eval exp='game.enemy.adjustSpec(mp)'
@endmacro


; イベントモードで入力ウインドウを表示
@macro name="textedit"
	@eval exp='game.textEdit.openByTag(mp)'
	@waitinput name="askQuestion"
	@eval exp='tf.result = game.convertName(game.textEdit.editBox.text)'
	@eval exp='tf.result = mp.default' cond='tf.result == ""'
@endmacro


; 戦闘時に敵の列を前後に移動させる
@macro name="enemymove"
	@eval exp='game.enemy.groupMoving(1, +mp.far)'
	@wait time=50
	@eval exp='game.enemy.groupMoving(2, +mp.far)'
	@wait time=50
	@eval exp='game.enemy.groupMoving(3, +mp.far)'
	@wait time=50
	@eval exp='game.enemy.groupMoving(4, +mp.far)'
	@eval exp='game.enemy.exchangeGroupPosInfo(+mp.far)'
@endmacro


; 戦闘メッセージウインドウを初期化する or 閉じる ( off )
@macro name="btmes"
	@eval exp='game.battleInfo.ready()' cond='mp.off === void && mp.show === void'
	@eval exp='game.battleInfo.open()' cond='+mp.show'
	@eval exp='game.battleInfo.close()' cond='+mp.off'
@endmacro


; ダメージを表示。属性に void 以外が代入されると文字が飛び出す
; １以上の数値、または先頭に「 1, 」を付けたものを代入するとダメージ音が鳴る
; 先頭に「 b, 」を付けたものを代入するとブロックアニメになる
@macro name="damage"
	@eval exp='game.curTarget.damageAnim(mp.v)' cond='mp.v !== void && game.curTarget !== void'
@endmacro


; ダンジョン内でショップを表示
@macro name="shop"
	@eval exp='tf.temp = o[mp.name]'
	@call storage="script.ks" target=*shop_enter
@endmacro


; ダンジョン内の家に入る
@macro name="enterhouse"
	@stop_map_effect
	@eval exp='game.backScreen.loadImages(%[storage: mp.img])' cond='mp.img !== void'
	@eval exp='game.backScreen.visible = true' cond='mp.img !== void'
@endmacro


; ダンジョン内の家から出る
@macro name="exithouse"
	@start_map_effect
	@eval exp='game.backScreen.visible = false'
	@eval exp='game.map.recordAreaOpened(game.party.curX, game.party.curY,, true)'
	@eval exp='mp.way = WAY == "n" ? "s" : (WAY == "s" ? "n" : (WAY == "e" ? "w" : "e"))'
	@walk turn=&'mp.way' move=&'mp.way'
	@eval exp='game.miniMap.setPartyMark()' cond='game.miniMap.visible'
@endmacro


; 壁の状態を変化させる
@macro name="changewall"
	@eval exp='mp.map = mp.map !== void ? o[mp.map] : game.map'
	@eval exp='mp.x = +mp.x' cond='mp.x !== void'
	@eval exp='mp.y = +mp.y' cond='mp.y !== void'
	@eval exp='mp.map.changeObject(mp, mp.x, mp.y, mp.way, +mp.behind)'
	@eval exp='game.updateView()'
@endmacro


; 床の状態を変化させる
@macro name="changefloor"
	@eval exp='mp.warp = "?"' cond='mp.warp == "up"'
	@eval exp='mp.warp = "@"' cond='mp.warp == "down"'
	@changewall * way=f
@endmacro


; 扉を開閉する
@macro name="switchfence"
	@eval exp='mp.mode = "open"' cond='+mp.open'
	@eval exp='mp.mode = "close"' cond='+mp.close'
	@eval exp='mp.mode = "switch"' cond='+mp.switch'
	@eval exp='mp.mapObj = game.map' cond='mp.map === void'
	@eval exp='mp.mapObj = o[mp.map]' cond='mp.map !== void'
	@eval exp='mp.mapObj.switchFence(+mp.x, +mp.y, mp.way, mp.mode, mp.fence, mp.arch)'
@endmacro


; 道案内を案内版に表示する
@macro name="roadguide"
	@eval exp='mp.arr = [mp.n, mp.e, mp.s, mp.w]'
	@eval exp='mp.arr.add(mp.arr.shift())' cond='WAY == "e"'
	@eval exp='mp.arr.unshift(mp.arr.pop())' cond='WAY == "w"'
	@eval exp='mp.arr[0] <-> mp.arr[2], mp.arr[1] <-> mp.arr[3]' cond='WAY == "s"'
	; This is from @notice
	@pausebgm cond='mp.se !== void'
	@playse buf=0 storage=%se cond='mp.se !== void'
	@eval exp='mp.temp = kag.fore.messages[0].visible'
	@layopt layer=message0 visible=false
	@eval exp='game.notice.open(game.notice.processScenario,, mp.wait !== void ? +mp.wait : void)'
	; This is for properly aligned direction display
	[if exp='mp.arr[0] !== void']
		@eval exp='game.notice.writeCentered("↑", void, void, 18)'
		@eval exp='game.notice.writeCentered(mp.arr[0], void, void, 48)'
	[endif]
	[if exp='mp.arr[3] !== void']
		@eval exp='game.notice.writeLeftAligned("← " + mp.arr[3], void, 92)'
	[endif]
	[if exp='mp.arr[1] !== void']
		@eval exp='game.notice.writeRightAligned(mp.arr[1] + " →", void, 92)'
	[endif]
	[if exp='mp.arr[2] !== void']
		@eval exp='game.notice.writeCentered(mp.arr[2], void, void, 130)'
		@eval exp='game.notice.writeCentered("↓", void, void, 160)'
	[endif]
	; This is from @notice
	@waitinput name="noticeClick"
	@ws buf=0 cond='mp.se !== void'
	@resumebgm cond='mp.se !== void'
	@layopt layer=message0 visible=&'mp.temp'
@endmacro


; 樽の水を飲む
@macro name="barrel"
	@question title="<y>Drink water from the barrel?" cancel=true
	[if exp='tf.result']
		@eval exp='o.樽の水.anime = mp.anime !== void ? mp.anime : "*barrel_star"'
		@eval exp='o.樽の水.toGuest = ! (+mp.noguest)'
		@btcmd name=樽の水
		@eval exp='game.curTarget = game.curFighter.target'
			; 最後の対象を探そうとするときに消えてしまうので入れ直す
		@eval exp='tf.result = false'
		[if exp='game.curTarget !== void && ! game.curTarget.knockOut']
			@changefloor pimg=empty click=false
			@delevent
			@eval exp='tf.result = true'
		[endif]
	[endif]
	[eventoff cond='! tf.result']
@endmacro


; 墓を表示させる
@macro name="grave"
	[if exp='game.onObjectTrigger']
		[if exp='mp.name === void']
			@eval exp='mp.arr = []'
			@eval exp='mp.arr.split(",", sampleFemaleNames + "," + sampleMaleNames)'
			@eval exp='mp.name = mp.arr[(game.party.curX * game.party.curY) % mp.arr.count]'
		[endif]
		@notice text=&'"There is a grave.<r><y>" + mp.name + " rests here"'
	[elsif exp='mp.monster !== void']
		@monster pos=3 name=%monster
		@callbattle
	[else]
		@notice text="Nothing found."
	[endif]
@endmacro


; ごみの山を表示させる
@macro name="trash"
	@question title="Do you want to check out the pile of junk?"
	[if exp='tf.result && ! +mp.event']
		[if exp='mp.item !== void']
			@eval exp='mp.dic = game.getItemObjArrayByText(mp.item)[0]'
			@eval exp='mp.itemName = mp.dic.state < 0 ? mp.dic.itemData.getUnknownName() : mp.dic.itemData.displayName'
			@eval exp='mp.chara = game.storeItemSomewhere(mp.dic,,, true)'
			[if exp='mp.chara !== void']
				@changefloor pimg=void click=false
				@delevent
				@playse storage=period
				@notice text=&'"<y>" + mp.chara.displayName + "<w> obtained <p>" + mp.itemName + "<w>!"'
			[else]
				@notice text="I found something, but nobody has room for it."
			[endif]
		[else]
			@changefloor pimg=void click=false
			@delevent
			[if exp='random < 0.2']
				@notice text="It was only junk."
			[elsif exp='random < 0.5']
				@se f=coin
				@eval exp='tf.temp =  +mp.gold * intrandom(1, 8) + intrandom(1, 8)'
				@eval exp='game.party.gold += tf.temp'
				@notice text=&'"Found <g>" + tf.temp + "G<w>"'
			[else]
				@eval exp='mp.arr = []'
				@eval exp='mp.arr.split(",", mp.monster)'
				@eval exp='mp.temp = mp.arr.draw()'
				@monster pos=3 name=&'mp.temp'
				[if exp='random < 0.7']
					@monster pos=2 name=&'mp.temp'
					@monster pos=4 name=&'mp.temp'
					[if exp='random < 0.7']
						@monster pos=1 name=&'mp.temp'
						@monster pos=5 name=&'mp.temp'
					[endif]
				[endif]
				@callbattle
			[endif]
		[endif]
	[endif]
@endmacro


; アイテム・モンスター展示の情報を登録する（閲覧用）
@macro name="exhibit"
	@eval exp='mp.arr = game.getObjArrayByText(mp.monster, m)' cond='mp.monster !== void'
	@eval exp='mp.arr = game.getObjArrayByText(mp.item)' cond='mp.item !== void'
	@eval exp='mp.arr.name = mp.arr.displayName = mp.name'
	@eval exp='mp.arr.displayName = mp.displayname' cond='mp.displayname !== void'
	@eval exp='mp.arr.col = + mp.col' cond='mp.col !== void'
	@eval exp='mp.arr.row = + mp.row' cond='mp.row !== void'
	@eval exp='mp.arr.baseLine = + mp.base'
	@eval exp='mp.arr.img = mp.img' cond='mp.img !== void'
	@eval exp='game.collectionList.add(mp.arr)'
@endmacro


; ビュー画面上の情報を減らす（シナリオ進行中に画面が見づらくなるので）
@macro name="reduceinfo"
	@eval exp='game.gameFrameInfoReduced = true'
@endmacro


; ビュー画面上の情報を元に戻す
@macro name="restoreinfo"
	@eval exp='game.gameFrameInfoReduced = false'
@endmacro


; イベントを追加する（キャラ・マップ・全般・戦闘）
@macro name="addevent"
	@eval exp='mp.name = mp.map' cond='mp.map !== void'
	[if exp='mp.name === void']
		[if exp='game.inBattle']
			@eval exp='mp.name = "戦闘"'
		[elsif exp='game.curEventObj instanceof "CharaObject"']
			@eval exp='mp.name = game.curEventObj.keyName'
		[else]
			@eval exp='mp.name = game.curEventObj.name'
		[endif]
	[endif]
	[if exp='mp.name == "戦闘"']
		@eval exp='game.bevents.push2(+mp.num)'
	[else]
		@eval exp='o[mp.name].events.push2(+mp.num)'
	[endif]
@endmacro


; イベントを削除する（キャラ・マップ・全般・戦闘）
@macro name="delevent"
	@eval exp='mp.name = mp.map' cond='mp.map !== void'
	[if exp='mp.name === void']
		[if exp='game.inBattle']
			@eval exp='mp.name = "戦闘"'
		[elsif exp='game.curEventObj instanceof "CharaObject"']
			@eval exp='mp.name = game.curEventObj.keyName'
		[else]
			@eval exp='mp.name = game.curEventObj.name'
		[endif]
	[endif]
	[if exp='mp.num === void']
		[if exp='mp.name == "戦闘"']
			@eval exp='mp.num = game.curBattleEventNum'
		[else]
			@eval exp='mp.num = game.curEventNum'
		[endif]
	[endif]
	[if exp='mp.name == "戦闘"']
		@eval exp='game.bevents.remove(+mp.num)'
	[else]
		@eval exp='o[mp.name].events.remove(+mp.num)'
	[endif]
@endmacro


; イベントボタンを追加・設置する（宿・街）
@macro name="addeventbtn"
	@eval exp='mp.curMap = game.hotelView.curHotel' cond='game.view == game.hotelView'
	@eval exp='mp.curMap = game.townView.curTown' cond='game.view == game.townView'
	@eval exp='mp.map = mp.curMap.name' cond='mp.map === void'
	@eval exp='mp.dic = o[mp.map].addEventButton(mp)'
	@eval exp='game.view.setEventButton(mp.dic)' cond='mp.curMap !== void && mp.dic !== void && mp.map == mp.curMap.name'
@endmacro


; イベントボタンを削除・消去する（宿・街）
@macro name="deleventbtn"
	@eval exp='mp.curMap = game.hotelView.curHotel' cond='game.view == game.hotelView'
	@eval exp='mp.curMap = game.townView.curTown' cond='game.view == game.townView'
	@eval exp='mp.map = mp.curMap.name' cond='mp.map === void'
	@eval exp='game.view.removeEventButton(mp)' cond='mp.curMap !== void && mp.map == mp.curMap.name'
	@eval exp='o[mp.map].deleteEventButton(mp)'
@endmacro


; イベントボタンを一時的に隠す
@macro name="hideeventbtns"
	@eval exp='o[mp.map].hideAllEventButtons()'
@endmacro


; 一時的に隠したイベントボタンを表示する
@macro name="showeventbtns"
	@eval exp='o[mp.map].showAllEventButtons()'
@endmacro


; 汎用イベントを終了して元のモードに戻る
@macro name="eventoff"
	@gameon cond='! game.inBattle'
	@eval exp='game.townView.goToStreet()' cond='game.hour == "morning"'
	@eval exp='game.onGameRestart(+mp.skipevent)' cond='game.hour != "morning"'
	@eval exp='playMusic(game.map.bgm)' cond='+mp.bgm && game.map !== void && game.map.bgm !== void'
	[s]
@endmacro


; 戦闘内イベントを終了して元のモードに戻る
@macro name="beventoff"
	@jump storage="battle.ks" target=&'"*_skip_" + game.curEventLabel.substr(1)' cond='+mp.skipevent'
	@jump storage="battle.ks" target=&'game.curEventLabel' cond='! +mp.skipevent'
@endmacro


; ギルドでのイベントを終了して元のモードに戻る
@macro name="guildoff"
	@eventoff cond='! game.guildWin.visible'
	@wakuset w=0
	@eval exp='game.resetPrev()'
	@eval exp='game.setPrev(game.guildWin.close)'
	@eval exp='game.guildWin.openCommand()'
	[s]
@endmacro


; バーでのイベント・クエスト会話を終了して元のモードに戻る
@macro name="baroff"
	@eventoff cond='! game.barWin.visible'
	@wakuset w=0
	@eval exp='game.eraseAllFigureTags()'
	@eval exp='game.barWin.openCommand()' cond='game.barWin.visible'
	[s]
@endmacro


; イベントで特殊な睡眠を取る
@macro name="eventsleep"
	@eval exp='game.othersWin.visible = false'
	[if exp='mp.effect !== "false"']
		@stopbgm
		@playse buf=2 storage=goodnight
		[if exp='! kag.fore.layers[0].visible']
			@image layer=0 storage=0000 visible=true opacity=0
			@move layer=0 time=2000 path=,,255
		[endif]
		@wait time=1500
		@eval exp='game.instruct("Sleeping...", 630)'
		@image layer=e3 storage=PE_base_small visible=true
		@layopt layer=e3 left=%left|380 top=%top|100
		@startemit layer=e3 storage=PE_sleep time=1600
		@wait time=1800
		@eval exp='game.instruction.close()'
		@layopt layer=0 visible=false opacity=255 cond='! +mp.keepblack'
		@clearemit layer=e3
	[endif]
	@eval exp='game.party.recovery()'
	@eval exp='game.elapseByStaying()' cond='game.map.kind != "dungeon" && game.lapse'
	[if exp='+mp.robby && game.hotelView.curHotel !== void']
		@eval exp='game.hotelView.robbyLayer.loadImages(game.hotelView.curHotel.img + "_robby")'
		@eval exp='game.hotelView.robbyLayer.visible = true'
	[endif]
	@notice text="The party regained HP and magic!"
	@eval exp='game.hotelView.checkLevelUp()'
	[waittrig name="finishLevelUpInEvent"]
	@eval exp='game.hour = "day"'
@endmacro


; クエスト完了
@macro name="complete"
	@eval exp='o[mp.name].complete(+mp.failure)'
	@cancelskip
	[if exp='+mp.failure']
		@pausebgm
		@playse storage=failure
		@notice text=&'"<y>Quest <p>" + o[mp.name].displayName + "<y> failed!"' wait=2000
	[else]
		@playse storage=up1
		@notice text=&'"<y>Quest <p>" + o[mp.name].displayName + "<y> completed!"' wait=500
		@pausebgm
		@playse storage=up2
		@eval exp='mp.exp = o[mp.name].exp' cond='mp.exp === void'
		@eval exp='mp.gold = o[mp.name].gold' cond='mp.gold === void'
		@eval exp='game.battleResult.open(+mp.exp * game.party.members.count, +mp.gold, true)'
		@eval exp='game.battleResult.open(+mp.exp * game.party.members.count, +mp.gold, true)'
		@wait time=2200
		@waitclick
		@eval exp='game.battleResult.close()'
	[endif]
	@resumebgm
@endmacro


; ショップ内イベントを終了して元のモードに戻る
@macro name="shopoff"
	@eval exp='game.itemWin.fixPortrait = false'
	@eval exp='game.itemWin.absolute = game.gameBase.absolute - 10'
	@eventoff cond='game.map.kind =="town" && ! game.itemWin.visible'
	@wakuset w=0
	[if exp='+mp.exit']
		@eval exp='game.itemWin.closeShop()'
		[s]
	[endif]
	@eval exp='game.itemWin.enabled = true'
	@eval exp='game.itemWin.shopWin.buttons[0].focus()' cond='MOUSE_HIDDEN'
	@eval exp='game.resetPrev()'
	@eval exp='game.setPrev(game.itemWin.closeShop)'
	@eval exp='game.setPrev(game.itemWin.closeMenu)'
	[s]
@endmacro


; 教会でのイベントを終了して元のモードに戻る
@macro name="churchoff"
	@eventoff cond='game.map.kind =="town" && ! game.townView.curSpot.inHouse'
	@wakuset w=0
	@eval exp='game.eraseAllFigureTags()'
	@eval exp='game.churchWin.openCommand()' cond='game.churchWin.visible'
	[s]
@endmacro


; その他の施設イベントを終了して元のモードに戻る
@macro name="otheroff"
	@eventoff cond='! game.townView.curSpot.inHouse'
	@wakuset w=0
	@eval exp='game.eraseAllFigureTags()'
	@eval exp='game.othersWin.openCommand()'
	[s]
@endmacro


; 奴隷イベントを終了して決闘シナリオに戻る
@macro name="slaveoff"
	@jump storage="duel.ks" target=&'"*_" + game.curTeam.img + "_from_event"'
@endmacro


; 町イベントを終了して元のモードに戻る
@macro name="townoff"
	@gameon
	@eval exp='game.townView.goToStreet()'
	[s]
@endmacro


; 宿イベントを終了して元のモードに戻る
@macro name="hoteloff"
	@wakuset w=0
	@eval exp='game.eraseAllFigureTags()'
	@return cond='f.replayMode'
	[if exp='+mp.leave']
		@gameon
		@eval exp='game.hotelView.leaveHotel()'
	[elsif exp='game.hour == "early"']
		@eval exp='game.hotelView.checkEarlyEvent(game.curChara, +mp.end)'
	[elsif exp='game.hour == "day"']
		@eval exp='game.enterReservationMode()'
	[elsif exp='game.hour == "sunset"']
		@eval exp='game.hotelView.checkEveningEvent(game.curChara, +mp.end)'
	[elsif exp='game.hour == "night"']
		@gameon
		@eval exp='game.onGameRestart()'
	[elsif exp='game.hour == "midnight"']
		@fa
		@wait time=500
		@eval exp='game.hotelView.checkMidNightEvent(game.curChara, +mp.end)'
	[elsif exp='game.hour == "slave"']
		@eval exp='game.hotelView.checkSlaveEvent(game.curChara, +mp.end)'
	[elsif exp='game.hour == "morning"']
		@eval exp='game.hotelView.checkMorningEvent(game.curChara, +mp.end)'
	[endif]
	[s]
@endmacro


; プレイヤーの操作以外で予約
@macro name="reserve"
	@eval exp='mp.charaObj = game.chara[+mp.id]' cond='mp.id !== void'
	@eval exp='mp.charaObj = o[mp.chara]' cond='mp.chara !== void'
	@eval exp='mp.roomObj = game.hotelView.getRoomFromRoomName(mp.room)' cond='mp.room !== void'
	@eval exp='game.hotelView.reserveRoom(mp.charaObj, mp.roomObj)'
@endmacro


; キャラマーカーを出したり消したり位置を変えたりする
@macro name="markopt"
	@eval exp='mp.temp = game.hotelView.getMarkerFromChara(o[mp.chara])'
	@eval exp='mp.temp.visible = +mp.visible' cond='mp.visible !== void'
	@eval exp='mp.temp.left = +mp.left' cond='mp.left !== void'
	@eval exp='mp.temp.top = +mp.top' cond='mp.top !== void'
	@eval exp='mp.temp.selectable = +mp.selectable' cond='mp.selectable !== void'
	@eval exp='mp.temp.changeToFixedButton("*talk")' cond='mp.temp.label === void'
@endmacro


; キャラマーカーを指定した部屋に移動させる
@macro name="moveroom"
	@eval exp='o[mp.chara].changeRoom(game.hotelView.getRoomFromRoomName(mp.room))'
@endmacro


; ヒロインの指定した男への好感度を上げる（ハートが移動する）
; 宿屋画面ならハートを放出する
@macro name="moveheart"
	@eval exp='o[mp.her].moveHeart(o[mp.guy], +mp.num)'
	[if exp='game.hour == "night"']
		@eval exp='o[mp.her].releaseHeart()'
		@playse storage=poyon
	[endif]
@endmacro


; イベントで性行為があったら記録に追加する。任意のプレイがあったら acts にカンマ区切りで指定する
@macro name="recordsex"
	@eval exp='game.curChara = o[mp.her]' cond='mp.her !== void'
	@eval exp='dm("性行為の記録  " + game.curChara.name + "  " + mp.guy)'
	@eval exp='tf.temp = game.curChara.getSexRecord(o[mp.guy], mp.sex, mp.orgasm, mp.acts, mp.date)'
	@eval exp='game.curChara.addSexRecordAndChangeHeart(tf.temp)'
	[if exp='+mp.show']
		@playse storage=period buf=2
		@eval exp='game.sexReport.drawRecord(tf.temp)'
		@waitclick
		@eval exp='game.sexReport.visible = false'
	[endif]
@endmacro


; 捕縛イベントが発生したら適切なシナリオを開始する
; name はラベルの基本名  num は陵辱が開始される捕縛モンスター数
@macro name="startcapture"
	[if exp='game.curTarget.capturers.count < +mp.num']
		[if exp='sf.skipCaptureEvent']
			@btmes
			[キャラ]<w> shook off the monster and returned to the party!
			@eval exp='game.curChara.removeStatus(o.拘束)'
			@return
		[endif]
	[else]
		@eval exp='mp.label = mp.name + "_" + game.curChara.rapeStep'
		[if exp='sf.skipCaptureEvent && st["trail_capture__skip_" + mp.label] > 0']
			@jump target=&'"*_skip_" + mp.label'
		[else]
			@jump target=&'"*" + mp.label'
		[endif]
	[endif]
@endmacro


; 登録おわり
@return
