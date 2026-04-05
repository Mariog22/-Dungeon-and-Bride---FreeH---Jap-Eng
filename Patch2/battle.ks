; battle.ks
; 戦闘シーン。キャンプモードからアイテムや魔法を使ったときも使う


;-----------------------------------------------------------------------------------------
*battle_start_skip_opening
@eval exp='tf.monstersList = game.enemy.getMonstersList()'
@cancelskip
@cancelautomode
@clickskip enabled=false
@jump target=*_battle_start_skip_opening


*battle_start

; 設定
@waittrig name="popupClose" cond='game.popup.visible'
@stopbgm
@eval exp='game.dungeonView.stopMapSound()'
@cancelskip
@cancelautomode
@clickskip enabled=false

; エンカウント警告・演出（画面を少し後ろに引く）
@playse storage=encounter
@eval exp='game.popup.open(1000)'
@eval exp='game.popup.write("A monster appeared!")'
@eval exp='System.doCompact()'
@wait time=1000
[if exp='game.view == game.dungeonView']
	@eval exp='game.view.bufScreen.shiftWallImage(4)'
	@eval exp='game.view.stretchAndPrintToViewScreen(45, 30, 930, 620)'
	@wait time=50
	@eval exp='game.view.bufScreen.shiftWallImage(3)'
	@eval exp='game.view.stretchAndPrintToViewScreen(0, 0, 1020, 680)'
[endif]

; モンスターリストを得る
@eval exp='tf.monstersList = game.enemy.getMonstersList()'

; モンスターが友好的だったら
@eval exp='tf.isFriendly = false'
[if exp='game.enemy.isFriendly(tf.monstersList)']
	@eval exp='tf.isFriendly = true'
	@wait time=500
	@eval exp='game.enemy.putMonsters(tf.monstersList)'
	@question top=450 title=&'"<y>A friendly monster!<r>What will you do?"' ytext=Fight ntext=Leave
	@call target=*change_alignment
	[if exp='tf.result == 0']
		@eval exp='game.enemy.disappear()'
		@jump target=*battle_end
	[endif]
[endif]

; 戦闘突入
@eval exp='game.normalBattleBgm = "battle" + (game.map.level < 10 ? 0 : (game.map.level < 50 ? 1 : 2))'
@playbgm storage=&'game.specialBattleBgm !== void ? game.specialBattleBgm : game.normalBattleBgm'
@wait time=500
*_battle_start_skip_opening
@eval exp='game.enemy.putMonsters(tf.monstersList)' cond='! game.enemy.visible'
@eval exp='game.battleCount ++'

; 不意打ち
@eval exp='game.firstStrike = tf.isFriendly ? void : game.isFirstStrike()' cond='game.firstStrike === void'
[if exp='game.firstStrike == "enemy"']
	@eval exp='game.popup.open(1000)'
	@eval exp='game.popup.write("Ambushed by the enemy!")'
	@wait time=1000
	@eval exp='game.party.clearAllMembersAction()'
[elsif exp='game.firstStrike == "party"']
	@eval exp='game.popup.open(1000)'
	@eval exp='game.popup.write("We ambushed the enemy!")'
	@wait time=1000
[endif]

; 決闘表示
@anime_duel_sign visible=true cond='game.inDuelBattle'

; ターン開始・コマンドとターゲットを選択
*turn_start
@btmes off
@wait time=500
@eval exp='game.advanceClock(game.timeByTurn)' cond='game.turnCount < game.timeOfADay \ game.timeByTurn'

; イベント挿入
@eval exp='game.turnStarted = false'
@eval exp='game.checkBattleEvent()'
*_skip_turn_start
@jump target=*user_command cond='game.firstStrike == "party"'

; 前列が減ったら後列が前に出る
; とはいえ、最後列には最後列にふさわしいモンスターがいるはずなので一気には前に出ない
@enemymove far=false cond='game.enemy.getNumExist(0) < game.enemy.getNumExist(1)'
@enemymove far=true cond='game.enemy.getNumExist(1) < game.enemy.getNumExist(2)'
@enemymove far=false cond='game.enemy.getNumExist(0) == 0'
@eval exp='game.enemy.updateLife()'

; 敵の行動を決定
@eval exp='game.enemy.setPartyActions()'
@jump target=*set_order cond='game.firstStrike == "enemy"'

; コマンド選択
*user_command
@eval exp='game.party.restoreFaces()'
	; ↑ 登場したモンスターを見て反応
@eval exp='game.resetPrevForBattle()'
@waitinput name="setBattleCommand" cond='game.inputNextBattleCommand()'
@eval exp='game.cutOutFigure("alternate")'

; ゲストの行動を決定
@eval exp='game.guest.setPartyActions()'
@wait time=300

; 全員の攻撃順を決定
*set_order
@eval exp='game.sortFightingOrder()'

; 次に行動するキャラとターゲットを選定する。行動出来なければ次のキャラへ
; 全員の行動が終わっていたらステータスをチェック後、次のターンへ移行する
*next_chara
@eval exp='game.turnStarted = true'
@eval exp='game.checkBattleEvent()'
	; イベント挿入
*_skip_next_chara

; ★デバッグ用
; @eval exp='game.enemy.setDying()' cond='underDevelopment'

@eval exp='game.curFighter = game.getNextFighter()'
@jump target=*status_check cond='game.curFighter === void'
@eval exp='game.curTarget = game.curFighter.getTarget()'
@jump target=*next_chara cond='game.curFighter.act === void'
@jump target=*next_chara cond='game.curFighter.act.range >= 1 && game.curTarget === void'

; 中断フラグ
@eval exp='game.interruptTurn = false'
@eval exp='kag.rightClickHook.push2(game.inputInturruptTurn)' cond='game.inBattle'
@eval exp='kag.keyDownHook.push2(game.inputInturruptTurn)' cond='game.inBattle'

; 行動開始
*action_start
; 重量オーバーのとき
[if exp='game.curFighter.isUserChara && game.curFighter.getTotalWeight() > game.curFighter.muscle']
	@eval exp='tf.message = game.curFighter.displayName + " cannot move due to heavy equipment!"'
	@eval exp='game.curFighter.act = o.動けない'
	@playse storage=ironbreak
[endif]

; 衰弱状態のとき
[if exp='tf.message === void && game.curFighter.status.has(o.衰弱)']
	@eval exp='tf.message = game.curFighter.displayName + " was too weak to move!"'
	@eval exp='game.curFighter.act = o.動けない'
[endif]

; 恐怖状態のとき
[if exp='tf.message === void && game.curFighter.status.has(o.恐怖)']
	[if exp='game.curFighter.team == game.enemy && random < 0.5']
		@eval exp='game.curFighter.act = o.逃げる'
	[elsif exp='random < 0.5']
		@eval exp='tf.message = game.curFighter.displayName + " was too afraid to move!"'
		@eval exp='game.curFighter.act = o.動けない'
	[endif]
[endif]

; 行動するキャラを表示
; ここまでで tf.message === void ならば動けないわけではないのでカットインは通常通りでよい
; アイテム使用によるアイテム破壊カットインでポーズを維持するため tf.lastPose に現在のポーズを保存する
@eval exp='tf.lastPose = game.curFighter.cutInFigureOnBattle()' cond='game.inBattle'

; アイテム・魔法など使用時に使えなくなっている場合
;（アイテムを盗まれる or 敵に破壊される、魔法が封じられる、ＭＰが吸収される等）
@eval exp='tf.message = game.curFighter.checkCurrentAction()' cond='tf.message === void'

; 何らかの理由で行動不能になっていたらミスして終了
[if exp='tf.message !== void']
	@btmes
	@eval exp='game.curTarget = game.curFighter'
	[emb exp='tf.message']
	@damage v=0
	[if exp='game.figureLayer.visible']
		@wait time=300
		@shake layer=cutin loop=8 length=4 cond='game.curFighter.act == o.動けない'
		@wait time=700
		@eval exp='game.cutOutFigure("alternate")'
	[endif]
	@eval exp='tf.message = void'
	@wait time=500
	@return cond='! game.inBattle'
	@jump target=*next_chara
[endif]

; 移動モード中にマロールを実行
@return target=*field_malor cond='! game.inBattle && game.curFighter.act.attrib == "ワープ"'

; 表示＆アニメ＆罠の回避（罠はここからスタート）
@eval exp='game.curFighter.checkStatusByOneTurn()'
@jump target=*next_chara cond='game.curFighter.act === void'

*trap_start
@btmes
@eval exp='game.extraEffect = void'
[emb exp='game.curFighter.act.actionMessage(game.curFighter, game.curTarget)']
@anireset
@eval exp='tf.result = game.party.avoidTrap(game.curFighter.act, game.curFighter, game.curTarget)'
@call storage="anime.ks" target=&'game.curFighter.act.anime'
@eval exp='game.party.restoreFaces()' cond='tf.result'
@eval exp='game.party.excuseForFailure(game.curFighter.act, game.trapWin.curPicker, game.curTarget)'

; ターゲットにダメージや効果を与える
*apply_damage

;「かばう」実行  tf.covering は「かばう」を実行しているキャラを入れる変数
@eval exp='tf.covering = void'
[if exp='game.curTarget !== void && ! game.curTarget.avoidingTrap']
	@eval exp='tf.covering = game.getCharaCovering(game.curFighter.act, game.curTarget)'
	[if exp='tf.covering !== void']
		@call storage="anime.ks" target=*covering
		@eval exp='game.curTarget = tf.covering'
	[endif]
[endif]

; 反射（リフレク）
[if exp='game.curTarget !== void && ! game.curTarget.avoidingTrap && game.curTarget.isReflectingAttack(game.curFighter.act)']
	@damage v="b,0xFFFFFF,REFLECT"
	[r][emb exp='game.curTarget.displayName'] reflected the attack!
	@wait time=500
	@return cond='game.curFighter == game.virtualChara'
		; ↑ 宝箱に対しては跳ね返さない
	@eval exp='game.curTarget = game.curFighter'
[endif]

; ※カウンターはここから
*_counter_attack

; 無効化
@eval exp='tf.cancelAction = void'
[if exp='game.curTarget !== void && ! game.curTarget.avoidingTrap']
	@eval exp='tf.cancelAction = game.curTarget.getCancelAction(game.curFighter, tf.inCounter)'
[endif]
[if exp='tf.cancelAction !== void']
	@call storage="anime.ks" target=&'tf.cancelAction.anime'
	@damage v=&'tf.cancelAction.doDamage()'
	[r][emb exp='tf.cancelAction.resultMessage(game.curTarget)']
	@wait time=100
[endif]

; ダメージの計算・適用・表示
; 追加効果などがあった時にメッセージがあれば doDamage 内で game.extraEffect に代入される
; 後の死亡判定があるので、もし死んでいてもここでは dead = true にはしない
[if exp='tf.cancelAction === void']
	@eval exp='game.extraEffect = void'
	@eval exp='tf.act = tf.inCounter ? o.攻撃 : game.curFighter.act'
	@eval exp='tf.damage = tf.act.doDamage(game.curFighter, game.curTarget)'
	[if exp='tf.damage > 0 && tf.act.reach == -1']
		; 追加ダメージがある時はそのアニメを表示
		@call storage="anime.ks" target=*extra_damage
	[endif]
	@damage v=&'tf.damage'
	[if exp='tf.inCounter']
		[r][emb exp='o.攻撃.resultMessage(game.curTarget, tf.damage)']
	[else]
		[r][emb exp='tf.act.resultMessage(game.curTarget, tf.damage)']
	[endif]
	[if exp='tf.act == o.ＳＰ灰']
		; ＳＰ灰ならここで終了（ＳＰ解放は戦闘中には行えない）
		[r][emb exp='game.curTarget.displayName']'s [emb exp='game.curTarget.brokenItem.displayName'] was destroyed!
		@eval exp='game.curTarget.brokenItem = void'
		@wait time=1000
		@return
	[endif]
	[if exp='game.extraEffect !== void']
		; 追加効果があった
		@clearemit layer=e3
		@anireset
		@call storage="anime.ks" target=&'game.extraEffect.anime'
		@damage v=&'game.extraEffect.doDamage(game.curFighter, game.curTarget)'
		[r][emb exp='game.extraEffect.catchMessage(game.curTarget)']
		@eval exp='game.cutOutFigure("alternate")' cond='! game.curFighter.isAttackingAgain(game.curTarget)'
		@eval exp='tf.lastPose = void'
	[endif]
	@wait time=100
[endif]

;「かばう」で変わった位置を元に戻す
[if exp='tf.covering !== void']
	@wait time=500
	@eval exp='tf.covering.parent = tf.originalParent'
	@eval exp='tf.covering.resetPos()'
[endif]

;（敵に）壊された装備のチェックと破壊カットイン表示
[if exp='game.curTarget !== void && game.curTarget.brokenItem !== void']
	@clearemit layer=e3
	[if exp='game.curTarget instanceof "MonsterObject"']
		@call storage="anime.ks" target=*monster_broken
		[r][emb exp='game.curTarget.displayName']'s clothes were destroyed...!
		@eval exp='game.curTarget.brokenItem = void'
	[elsif exp='game.curFighter.act === void || game.curFighter.act.category != "sp"']
		@eval exp='game.cutInFigure(game.curTarget.figureLayer, "alternate", 600,, true)'
		@wait time=600
		@eval exp='tf.lastPose = void'
		@call storage="anime.ks" target=*equipment_broken
		@btmes
		[emb exp='game.curTarget.displayName']'s [emb exp='game.curTarget.brokenItem.displayName'] was damaged!
		@eval exp='game.curTarget.brokenItem = void'
		@eval exp='game.cutOutFigure("alternate")'
	[endif]
[endif]

; ２回目攻撃
[if exp='! tf.inCounter && game.curFighter.isAttackingAgain(game.curTarget)']
	@eval exp='game.curFighter.act = o.再攻撃'
	@wait time=500
	@call storage="anime.ks" target=*second_attack
	@jump target=*_counter_attack
[endif]

; カウンターがあれば「攻撃」コマンドで反撃を行う（距離は無視）
[if exp='! tf.inCounter && game.curTarget !== void && game.curTarget.isCounterAttacking(game.curFighter)']
	@eval exp='tf.inCounter = true'
	@wait time=500
	@call storage="anime.ks" target=*counter_attack
	[r][emb exp='game.curTarget.displayName']'s counter attack!
	@eval exp='game.curTarget <-> game.curFighter'
	@call storage="anime.ks" target=&'o.攻撃.anime'
	@jump target=*_counter_attack
[endif]
[if exp='tf.inCounter']
	@eval exp='tf.inCounter = false'
	@eval exp='game.curFighter.marks ++' cond='game.curTarget.life == 0'
	; 記録
	@eval exp='sf.totalMarks ++' cond='game.curTarget.life == 0 && game.curFighter.team == game.party'
	@eval exp='game.curTarget <-> game.curFighter'
	@eval exp='game.curFighter.target = void'
[endif]

; 次のターゲットがまだいるか調べ、いたらダメージ判定に再度戻る（複数攻撃時）
@eval exp='game.curTarget = game.curFighter.getTarget(true)'
@jump target=*apply_damage cond='game.curTarget !== void'

; ２つ目以降のＳＰ
[if exp='game.curFighter.act !== void && game.curFighter.act.category == "sp"']
	@eval exp='tf.result = game.curItem.getSpecialPower(game.curFighter.act)']
	[if exp='tf.result !== void']
		@eval exp='game.curFighter.act = tf.result'
		@eval exp='game.curFighter.target = game.curFighter.getRandomTarget(game.curFighter.act)'
		@eval exp='game.curTarget = game.curFighter.getTarget()'
		@wait time=500
		@anireset
		@call storage="anime.ks" target=&'game.curFighter.act.anime'
		@jump target=*_counter_attack
	[endif]
[endif]

; １人の行動が終了＆若干の待ち時間＆アイテム・ＭＰの消費
@eval exp='game.curFighter.useResource(tf.damage)' cond='! tf.inCounter'
@wait time=400 cond='game.curFighter.act !== void && game.curFighter.act.anime != "*nothing"'
@wait time=200

;（自分で）壊したアイテムのチェックと破壊カットイン表示
[if exp='game.curFighter.brokenItem !== void']
	@eval exp='game.curTarget = game.curFighter'
	[if exp='game.curFighter.brokenItemEquiped && ! [o.ＳＰ石化, o.ＳＰ灰].has(game.curFighter.act)']
		; 装備していて、一部ＳＰの解放ではない
		@eval exp='game.cutInFigure(game.curFighter.figureLayer, "alternate", 600,, true)'
		@wait time=200
		@call storage="anime.ks" target=*equipment_broken
		@eval exp='game.cutOutFigure("alternate")'
	[else]
		; 装備していない
		@eval exp='game.cutOutFigure("alternate")'
		@wait time=600
		@call storage="anime.ks" target=*item_broken
	[endif]
	@btmes
	[emb exp='game.curFighter.displayName']'s [emb exp='game.curFighter.brokenItem.displayName'] was [if exp='game.curFighter.brokenItemStat > 0']damaged[else]destroyed[endif]!
	@eval exp='game.curFighter.brokenItem = void'
	@wait time=500
[endif]

; 攻撃者のカットインを非表示に
[if exp='game.figureLayer.visible']
	@eval exp='game.cutOutFigure("alternate")'
	@wait time=200
[endif]

; 中断フラグ解除
@eval exp='kag.rightClickHook.remove(game.inputInturruptTurn)'
@eval exp='kag.keyDownHook.remove(game.inputInturruptTurn)'

; 逃亡判定・逃亡成功なら戦闘終了
[if exp='game.curFighter.act == o.逃げる && o.逃げる.result']
	@jump target=*escape cond='game.curFighter.team == game.party'
	@call storage="anime.ks" target=*enemy_escape
	@eval exp='game.curFighter.dead = true'
	@jump target=*battle_win cond='game.getBattleResult() == "win"'
[endif]

; 倒されたかどうかのチェック（味方パーティーはここで順番が入れ替わる事があるので元の配列は温存必須）
*defeated_check
@eval exp='tf.i = 0, tf.arr = game.getAllLivingFighters()'
*_defeated_check_loop
[if exp='tf.arr[tf.i].life == 0']
	[r][emb exp='tf.arr[tf.i].displayName'] 
	[emb exp='tf.arr[tf.i] instanceof "MonsterObject" ? "was defeated" : "died"']...!
	@eval exp='tf.arr[tf.i].setStatus(o.死亡, true)'
	@eval exp='tf.arr[tf.i].retire(o.死亡)'
	@eval exp='game.curFighter.marks ++' cond='game.curFighter !== void'
	; 記録
	@eval exp='sf.totalMarks ++' cond='game.curFighter !== void && game.curFighter.team == game.party'
	@wait time=100
[elsif exp='tf.arr[tf.i].knockOut']
	@eval exp='tf.arr[tf.i].retire()'
[endif]
[if exp='game.party.arrangeTimer.enabled']
	@waittrig name="arrangeMember"
	@wait time=200
[endif]
@eval exp='tf.i ++'
@jump target=*_defeated_check_loop cond='tf.i < tf.arr.count'
@eval exp='game.party.restoreFaces()' // １人行動するごとに変化

; 特殊コマンドなどで描画をスキップしアクションを終了させたいときはここへ飛ぶ
*skip_process

; 戦闘以外ならここで終了
@return cond='! game.inBattle'

; 敵を全滅させていたら戦闘終了
@jump target=*battle_win cond='game.getBattleResult() == "win"'
@jump target=*battle_lose cond='game.getBattleResult() == "lose"'

; 敵が１列消滅していたら前に詰める
@enemymove far=false cond='game.enemy.getNumExist(0) == 0 && game.enemy.getNumExist(1) > 0'
@enemymove far=true cond='game.enemy.getNumExist(1) == 0 && game.enemy.getNumExist(2) > 0'
@enemymove far=false cond='game.enemy.getNumExist(0) == 0'
@eval exp='game.enemy.updateLife()'

; 次のキャラへ（ステータスチェック後ならターン終了）
@wait time=300
@jump target=*party_status_check cond='tf.inStatusCheck'
[if exp='game.interruptTurn']
	@eval exp='game.interruptTurn = false'
	@eval exp='game.resetPrevForBattle()'
	@eval exp='game.openMenuForBattle(true)'
	[s]
[endif]
@jump target=*next_chara

; ステータスのチェック（要素がなかったり途中で削除されたりするので処理の流れには特に注意すること）
*status_check
@btmes
@eval exp='tf.i = -1, tf.arr = game.getAllLivingFighters()'
*_status_check_each_chara_loop
@eval exp='tf.i ++'
@jump target=*status_check_finished cond='tf.i == tf.arr.count'
@eval exp='game.curTarget = tf.arr[tf.i]'
@eval exp='tf.j = game.curTarget.status.count'
*_status_check_each_status_loop
@eval exp='tf.j --'
@jump target=*_status_check_each_chara_loop cond='tf.j == -1'
@eval exp='game.curTarget.sickTime[tf.j] --' cond='game.curTarget.sickTime[tf.j] > 0'
[if exp='game.curTarget.sickTime[tf.j] == 0']
	[r][emb exp='game.curTarget.status[tf.j].releaseMessage(game.curTarget)']
	@eval exp='game.curTarget.removeStatus(game.curTarget.status[tf.j])'
	@wait time=100
[else]
	@eval exp='tf.damage = game.curTarget.status[tf.j].effectInBattle(game.curTarget)'
	[if exp='tf.damage !== void']
		@eval exp='tf.message = game.curTarget.status[tf.j].effectMessage(game.curTarget, tf.damage)'
		[if exp='game.curTarget.status[tf.j] == o.拘束']
			@eval exp='tf.energyDrainOccured = false'
			@call storage="anime.ks" target=*capture_event
			[if exp='! game.curTarget.status.has(o.拘束) && ! tf.energyDrainOccured']
				@eval exp='tf.damage = "0,0xFFFFFF,RELEASED"' 
				@eval exp='tf.message = o.拘束.releaseMessage(game.curTarget)'
			[endif]
		[endif]
		@damage v=&'tf.damage'
		[r][emb exp='tf.message']
		@eval exp='tf.message = void'
		@wait time=500
	[endif]
[endif]
@jump target=*_status_check_each_status_loop

; ステータスチェック終了・死亡判定へ
*status_check_finished
@wait time=900 cond='kag.current.x > kag.current.marginL || kag.current.y > kag.current.marginT'
@eval exp='tf.inStatusCheck = true'
@jump target=*defeated_check

; パーティー全体のステータスチェック
*party_status_check
@btmes
@eval exp='tf.i = game.party.status.count'
*_party_status_check_loop
@eval exp='tf.i --'
@jump target=*turn_end cond='tf.i == -1'
@eval exp='game.party.sickTime[tf.i] --' cond='game.party.sickTime[tf.i] > 0'
[if exp='game.party.sickTime[tf.i] == 0']
	[r][emb exp='game.party.status[tf.i].releaseMessage(game.party)']
	@eval exp='game.party.removeStatus(game.party.status[tf.i])'
	@wait time=1000
[endif]
@jump target=*_party_status_check_loop

; ターン終了
*turn_end
@eval exp='game.firstStrike = void'
@eval exp='tf.inStatusCheck = false'
@eval exp='game.turnCount ++'
@jump target=*turn_start

;-----------------------------------------------------------------------------------------
; 勝利で戦闘終了
*battle_win

; 石化・麻痺などで残ったままの敵を一掃
@eval exp='tf.i = 0, tf.result = false'
*_unavailable_check_loop
[if exp='! game.enemy.members[tf.i].dead']
	@wait time=1000 cond='! tf.result'
	@eval exp='tf.result = true'
	@eval exp='game.enemy.members[tf.i].retire(o.死亡)'
[endif]
@eval exp='tf.i ++'
@jump target=*_unavailable_check_loop cond='tf.i < game.enemy.members.count'

; 戦闘結果画面表示
@wait time=300
@stopbgm cond='game.map.bgm != kag.bgm.currentStorage'
@wait time=2000 cond='game.inEventBattle && game.specialBattleBgm !== void'
@playse storage=clear
@btmes off
@eval exp='game.battleResult.open(game.curExp, game.curGold)'
; 記録
@eval exp='sf.winCount ++'
@eval exp='game.winCount ++'
@wait time=2200
@waitclick

; 迷宮画面へ戻る
@eval exp='game.battleResult.close()'
[if exp='game.view == game.dungeonView']
	@eval exp='game.view.bufScreen.shiftWallImage(4)'
	@eval exp='game.view.stretchAndPrintToViewScreen(45, 30, 930, 620)'
	@wait time=50
	@eval exp='game.view.bufScreen.shiftWallImage(0)'
	@eval exp='game.view.stretchAndPrintToViewScreen(60, 40, 900, 600)'
[endif]
@jump target=*battle_end

;-----------------------------------------------------------------------------------------
; 敗北で戦闘終了（全滅）
*battle_lose
@wait time=500
@btmes
The party was defeated.
@fa
@wait time=1000
@btmes off
[if exp='game.inEvent']
	@eval exp='game.exitBattle()'
	@return
[endif]
@eval exp='game.exitBattle()'
@jump storage="script.ks" target=*game_over

;-----------------------------------------------------------------------------------------
; 逃亡で戦闘終了
*escape
@wait time=500
@playse storage=footstep2 buf=1
@eval exp='game.enemy.disappear()'
@eval exp='game.party.escape()'
@btmes
Escaped from battle!
@wait time=1000
@btmes off
@jump target=*battle_end

;-----------------------------------------------------------------------------------------
; マロールで戦闘終了
*malor_battle_end
@call storage="anime.ks" target=*spell_malor
@btmes
Escaped from battle!
@wait time=1000
@btmes off
@eval exp='game.party.lastIsMove = true'
@eval exp='game.party.afterEscaped = true'
@jump target=*battle_end

;-----------------------------------------------------------------------------------------
; ロクトフェイトで戦闘終了
*loktofeit_battle_end
@eval exp='game.curFighter.useResource(true)'
@call storage="anime.ks" target=*spell_loktofeit
@eval exp='game.exitBattle()'
[s]

;-----------------------------------------------------------------------------------------
; 終了処理
*battle_end
@playbgm storage=&'game.map.bgm' cond='! tf.stopBgmAfterBattle'
@eval exp='tf.stopBgmAfterBattle = false'
@eval exp='game.dungeonView.backSound.play()' cond='game.map.kind == "dungeon" && game.map.sound !== void'
@eval exp='game.exitBattle()'
@return target=*escape_event_battle cond='game.inEventBattle && game.party.afterEscaped'
@return cond='game.inEventBattle'
@eval exp='game.afterWonBattle()' cond='! game.party.afterEscaped'
@eval exp='game.afterEscapedBattle()' cond='game.party.afterEscaped'
[s]

;-----------------------------------------------------------------------------------------
; イベントバトル
*call_event_battle
@eval exp='game.callBattle()'
[s]

*call_event_battle_skip_opening
@eval exp='game.callBattle(true)'
[s]

; 逃げた場合は戻り先がここになり、そのままイベント終了
*escape_event_battle
@eval exp='game.inEventBattle = false'
@eval exp='game.afterEscapedBattle()'
@eval exp='game.onGameRestart()'
[s]

;-----------------------------------------------------------------------------------------
; 属性の変化
*change_alignment
@eval exp='tf.i = 0'
*_change_alignment_loop
@eval exp='tf.temp = game.party.members[tf.i]'
@eval exp='tf.temp2 = tf.temp.beCursed'
[if exp='tf.temp.tryChangeMind(! tf.result)']
	@wait time=100
	@playse storage=fear
	@notice text=&'"Alignment of <p>" + tf.temp.displayName + "<y> changed to <c>" + tf.temp.alignment.displayName + "<y>!"'
	[if exp='tf.temp.beCursed && ! tf.temp2']
		@wait time=100
		@playse storage=fear
		@notice text=&'"<p>" + tf.temp.displayName + "<y> is cursed!"'
	[endif]
[endif]
@eval exp='tf.i ++'
@jump target=*_change_alignment_loop cond='tf.i < game.party.members.count'
@return

;-----------------------------------------------------------------------------------------
; 宝箱の警報が作動した場合
*treasure_warning
@eval exp='game.inEventBattle = true'
@call storage="battle.ks" target=*call_event_battle
@eval exp='game.inEventBattle = false'
[if exp='game.inEvent']
	@eval exp='game.previewActions = [game.openTreasureBox, void]'
	@return
[endif]
@eval exp='game.exitTravelMode()'
@eval exp='tf.temp = []'
@eval exp='tf.temp.assign(game.treasureBox.bag)'
@eval exp='tf.temp2 = []'
@eval exp='tf.temp2.assign(game.treasureBox.bagStat)'
@eval exp='game.treasureBox.createTreasureBox([])'
@eval exp='game.treasureBox.bag = tf.temp'
@eval exp='game.treasureBox.bagStat = tf.temp2'
@eval exp='game.openTreasureBox()'
[s]

;-----------------------------------------------------------------------------------------
; 宝箱のテレポートが作動した場合
*treasure_teleport
@eval exp='tf.byTreasureTrap = true'
@call storage="anime.ks" target=*spell_malor
@eval exp='tf.byTreasureTrap = false'
@btmes
The party was teleported somewhere!
@wait time=1000
@btmes off
@wait time=500
@mu f=&'game.map.bgm'
@return cond='game.inEvent'
@eval exp='game.enterTravelMode()'
@eval exp='game.party.lastIsMove = true'
@eval exp='game.walkFinished(true)'
[s]

;-----------------------------------------------------------------------------------------
; 召喚契約
*contract_monster
@eval exp='game.contractableMonster.figureLayer.clear()'
@eval exp='game.contractableMonster.loadImages(game.contractableMonster.img)'
@eval exp='tf.x = 512 - game.contractableMonster.figureLayer.width \ 2'
@eval exp='game.cutInFigure(game.contractableMonster.figureLayer, "alternate", tf.x, 0)'
@notice top=450 text=&'"<c>" + game.contractableMonster.displayName + "<w> looks at me as if it<r>wants a contract"'
[if exp='game.contractableMonster.magicLV == 9']
	@eval exp='tf.temp = "Large "'
[else]
	@eval exp='tf.temp = ""'
[endif]
@question top=450 title=&'"<c>Contract " + game.contractableMonster.displayName + "?<r><y>(Consumes 1 " + tf.temp + "Summon Bottle)"'
[if exp='Storages.isExistentStorage(game.contractableMonster.img + "_l.png")']
	@eval exp='game.contractableMonster.figureLayer.clear()'
	@eval exp='game.contractableMonster.loadImages(game.contractableMonster.img + "_l")'
[endif]
@jump target=*cancel_contract cond='! tf.result'
[if exp='! game.party.isUsableSkill(o.契約)']
	@notice top=450 text="None of the members in the party can form <y>contracts<w>"
[elsif exp='game.contractableMonster.magicLV == 9 && ! game.party.ejectItem(o.大きな召喚びん)']
	@notice top=450 text="<y>I didn't have a Large Summon Bottle to form the contract."
[elsif exp='game.contractableMonster.magicLV <= 8 && ! game.party.ejectItem(o.召喚びん)']
	@notice top=450 text="<y>I didn't have a Summon Bottle to form the contract."
[else]
	@eval exp='game.contractMonster()'
	@notice top=450 text=&'"<c>" + game.contractableMonster.displayName +"<w> contracted!"'
	; 記録
	@eval exp='tf.num = game.getNumContractedHelpers(true)'
	@eval exp='sf.numContractedMonsters = tf.num' cond='tf.num > sf.numContractedMonsters'
[endif]
@eval exp='game.cutOutFigure("alternate")'
@jump target=*exit_contract

*cancel_contract
@eval exp='game.cutOutFigure("alternate")'
@notice top=450 text=&'"<c>" + game.contractableMonster.displayName +"<w> left,<r>looking lonely"'

*exit_contract
@wait time=200
@return cond='game.inEvent'
@eval exp='game.getBattlePrize()'
[s]

;-----------------------------------------------------------------------------------------
; 移動モード中にコマンドを使った場合 or 罠にかかった場合
*field_start
@eval exp='tf.lastPose = void'
@eval exp='game.noReturnMenu = false'
@eval exp='game.curTarget = game.curFighter.getTarget()'
[if exp='/trap|fixture|sp/.test(game.curFighter.act.category) || game.curFighter.act == o.解除済み']
	@call target=*trap_start
	@wait time=200
	@btmes off
[else]
	@call target=*action_start
	@wait time=200
	@btmes off
	@eval exp='game.checkEventAfterBootableAction()'
	@eval exp='game.checkTrapAfterBootableAction()'
[endif]
[if exp='o.コールアウラ.cursedChara !== void']
	@playse storage=fear
	@notice text=&'"<p>" + o.コールアウラ.cursedChara.displayName + "<y> is cursed!"'
	@eval exp='o.コールアウラ.cursedChara = void'
[endif]
@eval exp='tf.ignoreReturn = ! game.inEvent && (game.curFighter.act == o.ディテクト || game.curFighter.act == o.アンロック)'
@eval exp='game.party.clearAllMembersAction()'
@return cond='game.inEvent && ! tf.ignoreReturn'
@eval exp='game.processPrev()' cond='! game.noReturnMenu'
[if exp='game.noReturnMenu && ! game.view.enabled && ! game.yesNoWin.visible && ! game.notice.visible']
	@eval exp='game.enterTravelMode()'
[endif]
@eval exp='game.noReturnMenu = false'
[s]

;-----------------------------------------------------------------------------------------
; 移動モード中にマロールを実行
*field_malor
@btmes
[emb exp='game.curFighter.act.actionMessage(game.curFighter)']
@wait time=1000
@btmes off
@eval exp='game.autoMap.enterMalorMode()'
@waitinput name="closeAutoMap"
@call storage="anime.ks" target=*spell_malor
@eval exp='game.party.lastIsMove = true'
@eval exp='game.walkFinished(true)'
@mu f=&'game.map.bgm'
@eval exp='game.enterTravelMode()'
[s]

;-----------------------------------------------------------------------------------------
