; duel.ks
; 決闘関連イベント


;■ワイルド・ブル
;-----------------------------------------------------------------------------------------
; チーム構成読み込み（自動にせずその都度指定する）
*wildbull_load

[iscript]
//------------------------------------------------------------------------------
game.curTeam = o.ワイルド・ブル;
game.curTeam.interruption = game.curTeam.interval;
f.fightNakedry = [0, 0, 0, 0, 0];	// 脱いで戦うかどうかのフラグ

// メイン２人のパラメータを設定（だんだん強くなる）
m.アレックス.life   = game.curTeam.level * 64 + 160;
m.アレックス.attack = [game.curTeam.level * 6 + 17, game.curTeam.level * 7 + 29];
if(o.ワイルド・ブル.members.has(m.エリック))
{
	m.エリック.life     = game.curTeam.level * 32 + 96;
	m.エリック.attack   = [game.curTeam.level * 4 + 8, game.curTeam.level * 5 + 14];
	game.curTeam.members = [m.アレックス, m.エリック];
}
else game.curTeam.members = [m.アレックス, m.ハイウェイマン];

// パーティーを編成
switch(game.curTeam.level)
{
	case 0:  game.curTeam.members.push(m.バンディット, m.アルケミスト, m.ブッシュワッカー); break;
	case 1:  game.curTeam.members.push(m.パイレーツ, m.アルケミスト, m.ブッシュワッカー); break;
	case 2:  game.curTeam.members.push(m.キャプテン, m.ネクロマンサー, m.スパイ); break;
	case 3:  game.curTeam.members.push(m.キャプテン, m.ネクロマンサー, m.アサシン); break;
	case 4:  game.curTeam.members.push(m.ゴーレム, m.ヴァンパイア, m.アサシン); break;
	case 5:  game.curTeam.members.push(m.ゴーレム, m.ノスフェラトゥ, m.マスターシャドウ); break;
	case 6:  game.curTeam.members.push(m.ストーンゴーレム, m.ノスフェラトゥ, m.マスターシャドウ); break;
	default: game.curTeam.members.push(m.ストーンゴーレム, m.ヴァンパイアロード, m.マスターシャドウ);
}

// 引き渡し可能な女性モンスターがいるなら２番目の位置に配置
if(game.curTeam.slaves.count == 3) game.curTeam.hostage = void;
else if(! o.アコライト.contracted) game.curTeam.hostage = o.アコライト;
else if(! o.スナイパー.contracted) game.curTeam.hostage = o.スナイパー;
else if(! o.チャンピオン.contracted) game.curTeam.hostage = o.チャンピオン;
else if(! o.ソードダンサー.contracted) game.curTeam.hostage = o.ソードダンサー;
else if(! o.メイガス.contracted) game.curTeam.hostage = o.メイガス;
else game.curTeam.hostage = void;
if(game.curTeam.hostage !== void)
{
	game.curTeam.members[2] = game.curTeam.hostage.data;
	f.fightNakedry[2] = 1;	// 半裸で戦う
}

// 戦闘可能な奴隷ヒロインがいれば２、３、４番目の位置に追加
if(game.curTeam.slaves[0] !== void && ! game.curTeam.slaves[0].isPregnant())
{
	game.curTeam.members[2] = m.奴隷ヒロイン０;
	f.fightNakedry[2] = 0;
}
if(game.curTeam.slaves[1] !== void && ! game.curTeam.slaves[1].isPregnant())
{
	game.curTeam.members[3] = m.奴隷ヒロイン１;
}
if(game.curTeam.slaves[2] !== void && ! game.curTeam.slaves[2].isPregnant())
{
	game.curTeam.members[4] = m.奴隷ヒロイン２;
}

//------------------------------------------------------------------------------
[endscript]
@return

;----------------------------------------------------------------------------------------
; 決闘の提案
*wildbull_encounter
@call target=*wildbull_load
@mu f=duel
@jump target=*_wildbull_slave_exist cond='game.curTeam.slaves.count > 0'

;----------------------------------------------------------------------------------------
; 囚われている仲間がいない時

@fg c=アレックス e=通常
[texton w=1]
[if exp='game.map == o.ワイルドブルのアジト２Ｆ']
	[アレックス]「What are you guys doing here?」[k]
	[if exp='game.isFreeMode']
		[if exp='! f.encounterWildBullAlready']
			[アレックス]「I'm Alex, the leader of Wild Bull!」[k]
			Wild Bull are a notorious group of outlaws in Sapphire City.[k]
			@eval exp='f.encounterWildBullAlready = true'
		[else]
			During our search, we were stopped by Alex, the leader of Wild Bull, a party of outlaws.[k]
		[endif]
		[アレックス]「You knew this is Wild Bull's hideout, but you came here anyway?!」[k]
		It seems that I walked into a dangerous place.[k]
	[else]
		[テオ]「Alex...!」[k]
		We were stopped by Alex, the leader of Wild Bull, a party of outlaws.[k]
		[アレックス]「You knew this is Wild Bull's hideout, but you came here anyway?!」[k]
		[テオ]「...」[k]
		I knew this was a dangerous place, but I might still have been too hasty...[k]
	[endif]
[else]
	[アレックス]「Hey! You guys, stop right there!」[k]
	[if exp='game.isFreeMode']
		[if exp='! f.encounterWildBullAlready']
			[アレックス]「I'm Alex, the leader of Wild Bull!」[k]
			Wild Bull are a notorious group of outlaws in Sapphire City.[k]
			@eval exp='f.encounterWildBullAlready = true'
		[else]
			During our search, we were stopped by Alex, the leader of Wild Bull, a party of outlaws.[k]
		[endif]
		[アレックス]「This whole area is my territory. I can't just let you through.」[k]
		We caught the attention of a troublesome bunch...[k]
	[else]
		[テオ]「Ah...!」[k]
		During our search, we were stopped by Alex, the leader of the Wild Bull, a party of outlaws.[k]
		[テオ]「Alex...!」[k]
		[アレックス]「This whole area is my territory. I can't just let you through.」[k]
		We caught the attention of a troublesome bunch...[k]
	[endif]
[endif]
[textoff]

@fg r=thief_green_fight1 b
@fg l=thief_blue_fight1
[texton w=1]
[if exp='game.isFreeMode']
	You were surrounded by Wild Bull members![k]
[else]
	[テオ]「...!」[k]
	We were surrounded by Wild Bull members![k]
[endif]
[アレックス]「Whoa, you're not leaving here for free.」[k]
[アレックス]「Duel with us. If you beat us, you can go home.」[k]
[アレックス]「Well, there's no way you can beat us! Gahahahahaha!」[k]
[textoff]

; 決闘の選択
@call target=*duel_offer
@jump target=&'"*wildbull_" + tf.result'

;----------------------------------------------------------------------------------------
; 囚われている仲間がいる時
*_wildbull_slave_exist

; イベントがなければ奴隷１人をはべらせてアレックス登場
@eval exp='game.curChara = game.curTeam.getBigBellySlave()'
@eval exp='game.curChara = game.curTeam.slaves[-1]' cond='game.curChara === void'

@fg c=アレックス e=通常
[texton w=1]
[アレックス]「What are you guys doing here?」[k]
[if exp='game.isFreeMode']
	You were stopped by Alex, the leader of the Wild Bull, a party of outlaws.[k]
	[アレックス]「What are you doing here? Come to steal back your friends?」[k]
[else]
	[テオ f=10]「Alex...!」[k]
	We were stopped by Alex, the leader of Wild Bull, a party of outlaws.[k]
	[アレックス]「What are you doing here? Come to steal back your friends?」[k]
	[テオ f=10]「...」[k]
[endif]
[アレックス]「Hey, check out [キャラ].」[k]
[textoff]

[if exp='game.curChara.isBigBelly()']
	@cl b
	@fg l=アレックス e=通常 b
	@fg r=キャラ e=穴あき鎧・ボテ腹 f=40
	[texton]
	[if exp='game.isFreeMode']
		To my surprise, [キャラ] was pregnant. Someone had impregnated her while she was being held by the enemy.[k]
		[アレックス f=03]「She's got swollen from all the fucking we've all been doing! Gahahahahahaha!」[k]
		[アレックス]「If you want to fight, let's do it. Well, you might not like the result!」[k]
	[else]
		[テオ f=12]「[キャラ]...!」[k]
		To my surprise, [キャラ] was pregnant. Someone had impregnated her while she was being held by the enemy.[k]
		[アレックス f=03]「She's got swollen from all the fucking we've all been doing! Gahahahahahaha!」[k]
		[テオ f=09]「Damn... what a terrible thing to do...!」[k]
		[アレックス]「If you want to fight, let's do it. Well, you might not like the result!」[k]
		[アレックス]「I was just wanting a new toy... Now, who am I going to get pregnant next?!」[k]
		Then he licks his lips and looks at the female members here.[k]
		[テオ]「I won't let you do it! I won't let you hurt any more of my party!」[k]
	[endif]
[else]
	@cl b
	@fg l=アレックス e=通常 b
	@fg r=キャラ f=30 e=&'game.curChara.isPregnant() ? "穴あき鎧・妊娠" : "現在の装備"'
	[texton]
	[if exp='game.isFreeMode']
		What a terrible way for [キャラ] to be dressed... How on earth is she being treated...?[k]
		In order to save [キャラ], Wild Bull must be defeated in a fight.[k]
	[else]
		[テオ f=12]「[キャラ]...!」[k]
		What a terrible way for [キャラ] to be dressed... How on earth is she being treated...?[k]
		We have to rescue her somehow. But can we beat Wild Bull...?[k]
	[endif]
	[アレックス]「If you want to fight, let's do it. Well, you might not like the result!」[k]
[endif]
[textoff]

@call target=*wildbull_offer
@jump target=&'"*wildbull_" + tf.result'

;----------------------------------------------------------------------------------------
; 決闘の選択
*wildbull_offer

@return cond='f.replayMode'

[if exp='game.curTeam.getFreeSlave() === void']
	[texton]
	[アレックス]「Oh yeah, sorry, but none of your guys are [b]out of custody[/b] right now. You still want to fight?」[k]
	[textoff]
[endif]
@call target=*wildbull_load
@call target=*duel_offer
@return target=*wildbull_cancel cond='tf.result == "cancel"'
@return

;----------------------------------------------------------------------------------------
; 決闘受諾
*wildbull_accept

[texton]
[アレックス]「We have a deal. Let's go!」[k]
[textoff]
@jump target=*wildbull_start

;----------------------------------------------------------------------------------------
; 決闘申し込み
*wildbull_decide

[texton]
[if exp='game.isFreeMode']
	You challenged Alex to a duel.[k]
[else]
	[テオ]「Alex, I challenge you to a duel!」[k]
[endif]
[アレックス]「What the hell?」[k]
[アレックス]「...Hunh, all right. But you might not like the result!」[k]
[textoff]
@jump target=*wildbull_start

;----------------------------------------------------------------------------------------
; 決闘をやめる
*wildbull_cancel

[texton]
[if exp='game.isFreeMode']
	[アレックス f=02]「Hmm, what's wrong? Aren't you going to fight?」[k]
	You decided now was not the time to leave, not fight.[k]
[else]
	[アレックス f=02]「Hmm, what's wrong?」[k]
	[テオ f=10]「No, it's nothing. Well then.」[k]
	Now was not the time to fight. We decided to leave.[k]
[endif]
[textoff]
@layopt layer=0 page=back visible=false left=0 top=0
@cl
@jump target=*wildbull_exit

;----------------------------------------------------------------------------------------
; 金を払って決闘を断る
*wildbull_escape

[texton]

[if exp='game.party.gold < game.curTeam.penalty']
	[アレックス]「Looks like we're short on money. I guess we'll just have to fight!」[k]
	[textoff]
	@jump target=*wildbull_start
[endif]

[アレックス]「What the hell? Not up to it? 」[k]
@se f=coin
@eval exp='game.party.gold -= game.curTeam.penalty'
[nw][b][emb exp='number_format(game.curTeam.penalty)']G paid to opponent.[/b][/nw][k]
[textoff]
@cl

@eval exp='game.curTeam.penalty *= 4'
@eval exp='game.curTeam.penalty = 999999' cond='game.curTeam.penalty > 999999'
@jump target=*wildbull_exit

;----------------------------------------------------------------------------------------
; 対戦相手を設定
*wildbull_start
@monster pos=3 name=&'game.curTeam.members[0].name' naked=&'f.fightNakedry[0]'
@monster pos=5 name=&'game.curTeam.members[1].name' naked=&'f.fightNakedry[1]'
@monster pos=1 name=&'game.curTeam.members[2].name' naked=&'f.fightNakedry[2]'
@monster pos=9 name=&'game.curTeam.members[3].name' naked=&'f.fightNakedry[3]'
@monster pos=11 name=&'game.curTeam.members[4].name' naked=&'f.fightNakedry[4]'

; 戦闘開始・勝った場合はここに戻ってくることなく報酬を貰って終了
@call target=*duel_play

;----------------------------------------------------------------------------------------
; 敗北

@mu f=duel
@fg l=アレックス
[texton w=1]
[if exp='game.isFreeMode']
	[アレックス]「Heh heh heh... I guess I win.」[k]
	Alex looked down at you with triumphant eyes as you sprawled on the floor, lives intact, but barely able to move.[k]
[else]
	[テオ]「Damn...!」[k]
	[アレックス]「Heh heh heh... I guess I win.」[k]
	Alex looked down on us with triumphant eyes as we sprawled on the floor. Our lives were intact, but we could barely move.[k]
[endif]

@jump target=&'"*wildbull_" + game.curTeam.getDemand().type'

;----------------------------------------------------------------------------------------
; 集金
*wildbull_money
[アレックス]「Well, I'll take your money then.」[k]
@se f=coin
@eval exp='game.party.gold = 0'
[nw][b]The party had all their money taken.[/nw][k]
@cl
[textoff]
@jump target=*wildbull_exit

;----------------------------------------------------------------------------------------
; アイテム収奪
*wildbull_items
[アレックス]「Well then, I'll take your items.」[k]
@se f=coin
@eval exp='tf.result = game.curTeam.demandItems()'
[nw][b]The party had [emb exp='tf.result'] items taken![/nw][k]
@cl
[textoff]
@jump target=*wildbull_exit

;----------------------------------------------------------------------------------------
; 奴隷化
*wildbull_slave

@eval exp='game.curChara = game.curTeam.demandSlave()'
[アレックス]「Hehehehe... then...」[k]
[アレックス]「I'll take [emb exp='game.curChara.displayName']!」[k]
@fgf r=キャラ f=17
[キャラ f=17]「No!」[k]
[if exp='game.isFreeMode']
	Alex wants to take the reluctant [キャラ] with him.[k]
	But you're powerless to stop him, thanks to the Duel God's rules...[k]
	[アレックス]「See ya!」[k]
[else]
	[テオ f=5]「[キャラ]!」[k]
	Alex wants to take the reluctant [キャラ] with him.[k]
	But we're all powerless to stop him, thanks to the Duel God's rules...[k]
	[アレックス]「See ya!」[k]
	[テオ]「...」[k]
[endif]
[textoff]
@eval exp='game.curTeam.addSlave(game.curChara)'
@cl

[texton w=1]
[キャラ] was taken away by Alex and his gang...[k]
She's obligated to belong to [emb exp='game.curTeam.displayName'] for [b]at least [emb exp='game.curTeam.slaveTerm'] days[/b], and after that you must win a duel to take her back.[k]
[if exp='! o.ワイルドブルのアジト２Ｆ.visited']
	But even if you can beat them, you can't duel them if you don't know where they are in the first place.[k]
	...Rumor has it that they have a hideout somewhere in [b]Landon Canyon[/b]. But where the hell is it?![k]
[endif]
[if exp='! game.isFreeMode']
	[テオ]「Damn...!」[k]
	[キャラ] is our precious companion. Somehow, I have to get her back...![k]
[endif]
[textoff]

; 寝取り男にアレックスを追加
@eval exp='game.lovers.push2(o.アレックス)'

; 体験版の場合、公園の入口を先に追加
@eval exp='o.公園.links.push2("ワープポイント")' cond='isDemoVersion'

@jump target=*wildbull_exit

;----------------------------------------------------------------------------------------
; 決闘を終了
*wildbull_exit
@mu f=&'game.map.bgm'
@eval exp='game.party.escape(true)' cond='game.map == o.ワイルドブルのアジト２Ｆ'
[eventoff]

;----------------------------------------------------------------------------------------
; 奪回したキャラが妊娠していた
*wildbull_pregnant

@eval exp='tf.temp = game.curChara.isBigBelly() ? "*wildbull_bigbelly" : "*wildbull_pregnant"'
[if exp='game.isFreeMode'][call storage="stay.ks" target=*describe_support_for_freemode]
[elsif exp='isHUM'][call storage="heroine01a.scn" target=&'tf.temp']
[elsif exp='isELF'][call storage="heroine02a.scn" target=&'tf.temp']
[elsif exp='isDWA'][call storage="heroine03a.scn" target=&'tf.temp']
[elsif exp='isGNO'][call storage="heroine04a.scn" target=&'tf.temp']
[elsif exp='isSYL'][call storage="heroine05a.scn" target=&'tf.temp']
[endif]
@return

;----------------------------------------------------------------------------------------
; 妊娠したキャラを引き渡し
*wildbull_give

@eval exp='game.curTeam = o.ワイルド・ブル'
@eval exp='game.curChara = game.curTeam.getBigBellySlave()'
@eval exp='game.curChara.events.push2(99)'

@mu f=duel
@fg c=アレックス e=通常 f=00
[texton w=1]
[アレックス f=00]「Hey, long time no see.」[k]
[if exp='game.isFreeMode']
	We had a surprise encounter with Wild Bull. Are they planning on challenging us to another duel?[k]
	[アレックス f=00]「Hey, I'm not here to fight today. I've come to give [キャラ] back.」[k]
[else]
	[テオ f=05]「Alex...!」[k]
	We had a surprise encounter with Wild Bull. Are they planning on challenging us to another duel?[k]
	[テオ f=07]「What the hell do you want?」[k]
	[アレックス f=00]「Hey, I'm not here to fight today. I've come to give [キャラ] back.」[k]
	[テオ f=05]「What did you say...?」[k]
[endif]
[アレックス f=02]「Look, here she is.」[k]
[textoff]

@cl b
@fg l=アレックス e=通常 f=00 b
@fg r=キャラ e=穴あき鎧・ボテ腹 f=40
[texton w=1]
[if exp='! game.isFreeMode']
	[テオ f=12]「[キャラ]...!」[k]
[endif]
To my surprise, [キャラ] was pregnant. Someone had impregnated her while she was being held by the enemy.[k]
[アレックス f=03]「She's got swollen from all the fucking we've all been doing! Gahahahahahaha!」[k]
[if exp='! game.isFreeMode']
	[テオ f=09]「Damn... what a terrible thing to do...!」[k]
[endif]
[アレックス f=00]「I don't want this girl anymore, so you guys can have her back. Here you go!」[k]
@clf r
@se f=period
[nw][b red][emb exp='game.curChara.displayName'][/b] returned to the party![r]
She can't fight because she's pregnant, so she'll return to [b][emb exp='game.waitingRoom.displayName'][/b] in town.[k]
[アレックス f=00]「See ya!」[k]
[textoff]
@cl

[if exp='! game.isFreeMode']
	[texton w=0]
	Alex said what he wanted and quickly walked away.[k]
	[テオ f=09]「Damn... Alex!」[k]
	My anger at Wild Bull was reignited. We can't let people like him run wild...!
	 [k]
	[textoff]
[endif]

; 妊娠状態＆帰還
@eval exp='game.curChara.removeEquipmentsByForce()'
@eval exp='game.curChara.dressEquipment(o.マタニティドレス　)'
@eval exp='game.curTeam.restoreSlave(game.curChara, game.waitingRoom)'

; まれに２人以上妊娠キャラがいる可能性があるので一応チェックしてからイベントを削除
@delevent cond='game.curTeam.getBigBellySlave() === void'

; 会話イベント後、サファイアシティへ
@mu f=&'game.map.bgm'
@call target=*wildbull_pregnant
@eval exp='game.enterTown(o.サファイアシティ, o.待合所, true)'

[eventoff]
;========================================================================================



;■スライム団
;========================================================================================
; 決闘の提案
*slimes_encounter

[iscript]
game.curTeam = o.スライム軍団;
game.curTeam.interruption = game.curTeam.interval;
[endscript]

@mu f=duel
@fg c=slime_green left=450 top=386 b
@fg l=slime_red left=250 top=376 b
@fg r=slime_blue left=650 top=376
[texton w=1]
Suddenly, a group of slimes stood before us![k]
[name n=Slime f=slime_green]「...」[k]
[name n=Slime f=slime_red]「...」[k]
[name n=Slime f=slime_blue]「...」[k]
They blocked the way and would not move even when shoved.[k]
[name n=Slime f=slime_green]「...!」(← They are appealing to us to duel with them)[k]
[name n=Slime f=slime_green]「...!」(← Threatening to keep messing round until you agree to a duel.)[k]
[textoff]

@call target=*duel_offer
@jump target=&'"*slimes_" + tf.result'

;-----------------------------------------------------------------------------------------
; 決闘受諾
*slimes_accept
[texton w=1]
@se f=cheer
[name n=Slime f=slime_green]「...!」(← The slimes are elated and totally hyped by all this)[k]
[textoff]
@monster pos=3 name=&'game.curTeam.members[0].name'
@monster pos=2 name=&'game.curTeam.members[1].name'
@monster pos=4 name=&'game.curTeam.members[2].name'
@monster pos=1 name=&'game.curTeam.members[3].name'
@monster pos=5 name=&'game.curTeam.members[4].name'
@monster pos=8 name=&'game.curTeam.members[5].name'
@monster pos=12 name=&'game.curTeam.members[6].name'
@monster pos=10 name=&'game.curTeam.members[7].name'
@se f=fingerwhistle
@wait time=1000
@se f=swing2
@move layer=1 time=50 path=1024,,
@move layer=2 time=50 path=-200,,
@wait time=600
@call storage="anime.ks" target=*enemy_rushing
@wait time=500
[texton w=1]
[name n=Slime f=slime_green]「...!」(← At a signal from the slime that seemed to be the leader, the slimes lithely formed up.)[k]
[textoff]
@clf
@eval exp='game.enemy.visible = false'
@monster pos=3 name=&'game.curTeam.members[0].name'
@monster pos=2 name=&'game.curTeam.members[1].name'
@monster pos=4 name=&'game.curTeam.members[2].name'
@monster pos=1 name=&'game.curTeam.members[3].name'
@monster pos=5 name=&'game.curTeam.members[4].name'
@monster pos=8 name=&'game.curTeam.members[5].name'
@monster pos=12 name=&'game.curTeam.members[6].name'
@monster pos=10 name=&'game.curTeam.members[7].name'
@jump target=*slimes_start

;-----------------------------------------------------------------------------------------
; 金を払って決闘を断る
*slimes_escape
[texton w=1]
[if exp='game.party.gold < game.curTeam.penalty']
	[name n=Slime f=slime_green]「...!」(← Angry to find out I didn't have the money after all)[k]
	[textoff]
	@jump target=*slimes_start
[endif]
[name n=Slime f=slime_green]「...!」(← Impatient at being denied a fight)[k]
@se f=coin
@eval exp='game.party.gold -= game.curTeam.penalty'
[nw][b][emb exp='number_format(game.curTeam.penalty)']G paid to opponent.[/b][/nw][k]
[textoff]
@cl
@eval exp='game.curTeam.penalty *= 4'
@eval exp='game.curTeam.penalty = 999999' cond='game.curTeam.penalty > 999999'
@jump target=*slimes_exit

;-----------------------------------------------------------------------------------------
; 戦闘開始・勝った場合はここに戻ってくることなく報酬を貰って終了
*slimes_start
@eval exp='o.スライム軍団の討伐.flag = 1' cond='o.スライム軍団の討伐.accepted'
@call target=*duel_play

;-----------------------------------------------------------------------------------------
; 敗北（スライムの要求は食べ物の収奪だけ）
@eval exp='o.スライム軍団の討伐.flag = 0' cond='o.スライム軍団の討伐.accepted'
@mu f=duel
@fg c=slime_green left=450 top=386 b
@fg l=slime_red left=250 top=376 b
@fg r=slime_blue left=650 top=376
[texton w=1]
[if exp='! game.isFreeMode']
	[テオ]「Damn...! I can't believe we lost to this...!」[k]
[endif]
[name n=Slime f=slime_green]「...!」(← Looking down at us sprawling on the floor)[k]
[name n=Slime f=slime_black]「...」(← Rummaging through the items to see if there's any food in the loot)[k]
@se f=coin
@eval exp='tf.result = game.curTeam.demandItems()'
[nw][b]The party had [emb exp='tf.result'] items taken![/nw][k]
[textoff]
@cl
@wait time=500
[texton w=1]
The slimes left in high spirits, their eyes shining with pride...[k]
[textoff]
@jump target=*slimes_exit

;-----------------------------------------------------------------------------------------
; 決闘を終了
*slimes_exit
@mu f=&'game.map.bgm'
[eventoff]
;========================================================================================



;■チーム・アマゾネス
;========================================================================================
; 決闘の提案
*amazon_encounter

[iscript]
//------------------------------------------------------------------------------
// チーム構成（自動にせずその都度指定する）

game.curTeam = o.チーム・アマゾネス;
game.curTeam.interruption = game.curTeam.interval;

if(game.findItem(o.スターカード・林檎) !== void || o.魔法店ベイワロ・スターズ.events.count == 0)
{
	game.curTeam.itemsList = "ライトストリームの魔法書,リカバリーの魔法書,シャムシール,鉄の槍,炎のロッド,縞のブラ,ピンクのパンツ,赤いパンツ,白いパンツ,宝箱の鍵";
}

// パーティーを編成
// 引き渡す仲間は、後ろに書いたものほど早く渡されることになる
game.curTeam.members = [];
game.curTeam.hostage = void;

game.curTeam.members[1] = m.マスターランサー;

if(o.マスターアーチャー.contracted) game.curTeam.members[2] = m.シューター;
else game.curTeam.members[2] = m.マスターアーチャー, game.curTeam.hostage = o.マスターアーチャー;

if(o.ミスティック.contracted) game.curTeam.members[4] = m.アークメイジ;
else game.curTeam.members[4] = m.ミスティック, game.curTeam.hostage = o.ミスティック;

if(o.ハイプリースト.contracted) game.curTeam.members[3] = m.アークプリースト;
else game.curTeam.members[3] = m.ハイプリースト, game.curTeam.hostage = o.ハイプリースト;

if(o.ブレイズマン.contracted) game.curTeam.members[0] = m.グラディエイター;
else game.curTeam.members[0] = m.ブレイズマン, game.curTeam.hostage = o.ブレイズマン;

//------------------------------------------------------------------------------
[endscript]

@mu f=duel
@fg l=&'game.curTeam.members[1].img' left=250 top=60 b
@fg c=&'game.curTeam.members[0].img' left=450 top=90 b
@fg r=&'game.curTeam.members[2].img' left=670 top=50
[texton w=1]
[ライバル f=01]「Hey there! Stop!」[k]
As I was walking along the road, I was stopped by a women-only party, Team Amazoness.[k]
[ライバル f=01]「You guys are [emb exp='game.party.displayName'], right?」[k]
[ライバル f=01]「We, Team Amazoness, formally challenge you all to a duel!」[k]
[if exp='o.仲間を助け出してほしい.completed']
	[ライバル f=01]「You are no enemies of ours, but we are still rivals! So, let's fight fair and square!」[k]
[endif]
It was troublesome. But now that I had been formally challenged to a duel, I had no choice but to follow the rules.[k]
The girls were either full of confidence or just highly motivated. After all, the losing party will be in trouble.[k]
[ライバル f=01]「Come on! What are you going to do? Are you going to take it? Are you going to take it?」[k]
[textoff]

; 決闘の提案
@call target=*duel_offer
@jump target=&'"*amazon_" + tf.result'

; 決闘受諾
*amazon_accept
[texton w=1]
[ライバル f=05]「That's how it should be! Let's go!」[k]
[textoff]
@clf
@eval exp='game.enemy.visible = false'
@jump target=*amazon_start

; 金を払って決闘を断る
*amazon_escape
[texton w=1]
[if exp='game.party.gold < game.curTeam.penalty']
	[ライバル f=01]「What, you don't have enough money.」[k]
	[ライバル f=01]「If you don't have the money, you'll have to fight for it.」[k]
	[textoff]
	@jump target=*amazon_start
[endif]
[ライバル f=05]「Oh, running away? Cowards.」[k]
@se f=coin
@eval exp='game.party.gold -= game.curTeam.penalty'
[nw][b][emb exp='number_format(game.curTeam.penalty)']G paid to opponent.[/b][/nw][k]
[textoff]
@cl
@eval exp='game.curTeam.penalty *= 4'
@eval exp='game.curTeam.penalty = 999999' cond='game.curTeam.penalty > 999999'
@mu f=&'game.map.bgm'
[eventoff]

; 戦闘開始・勝った場合はここに戻ってくることなく報酬を貰って終了
*amazon_start
@monster pos=3 name=&'game.curTeam.members[0].name'
@monster pos=1 name=&'game.curTeam.members[1].name'
@monster pos=5 name=&'game.curTeam.members[2].name'
@monster pos=9 name=&'game.curTeam.members[3].name'
@monster pos=11 name=&'game.curTeam.members[4].name'
@call target=*duel_play

; 敗北
@mu f=duel
@fg c=bladesman_blue left=450 top=90 b
@fg l=valkyrie_yellow left=250 top=60 b
@fg r=priest_blue left=650 top=64
[texton w=1]
[ライバル f=05]「Phew, we won...」[k]
@jump target=&'"*amazon_" + game.curTeam.getDemand().type'

; 集金
*amazon_money
[ライバル f=05]「Well, I'll take your money.」[k]
@se f=coin
@eval exp='game.party.gold = 0'
[nw][b]The party had all their money taken.[/nw][k]
[textoff]
@jump target=*amazon_exit

; アイテム収奪
*amazon_items
[ライバル f=05]「I'll take your items.」[k]
@se f=coin
@eval exp='tf.result = game.curTeam.demandItems()'
[nw][b]The party had [emb exp='tf.result'] items taken![/nw][k]
[textoff]
@jump target=*amazon_exit

; 決闘を終了
*amazon_exit
[texton w=1]
[ライバル f=05]「Bye, bye ♪」[k]
@cl
@wait time=500
The group took one last look at us with condescending eyes and left happily...[k]
[textoff]
@mu f=&'game.map.bgm'
[eventoff]
;========================================================================================



;■ホーク・ウイング
;========================================================================================
; 決闘の提案
*hawkwing_encounter

[iscript]
game.curTeam = o.ホーク・ウイング;
game.curTeam.interruption = game.curTeam.interval;
[endscript]

@mu f=duel
@fg l=thief_black_fight1 left=200 top=60 b
@fg c=ルーファス f=05 left=450 top=60 b
@fg r=bandit_black_fight left=750 top=100
[texton w=1]
[if exp='game.isFreeMode']
	[ルーファス f=05]「Hey! You guys, stop right there!」[k]
	[ルーファス f=05]「We are an adventurer party, Hawk Wing. Come and duel with us.」[k]
	[ルーファス f=01]「You guys have some nice equipment. Give it to us. We'll take good care of it.」[k]
	Someone challenged me to a duel to get my equipment. What should I do?[k]
[else]
	[ルーファス f=05]「Hey.」[k]
	[テオ f=05]「Ah...!」[k]
	[if exp='game.guest.members.has(o.ライナス)']
		[ライナス f=11]「You're Rufus...!」[k]
	[endif]
	Our party was stopped by Linus' former team, Hawk Wing.[k]
	Hawk Wing was once a party led by Linus, but now belongs to a man named Rufus.[k]
	[テオ f=05]「What do you want from us?」[k]
	[ルーファス f=05]「Isn't it obvious? We're two parties, so a duel!」[k]
	[テオ f=06]「...!」[k]
	[ルーファス f=01]「You guys have some nice equipment. Give it to us. We'll take good care of it.」[k]
	[テオ f=06]「...」[k]
	Hawk Wing was reborn with Rufus as the leader. I hear it has become quite a formidable party since then.[k]
	What will you do? Accept the duel? Or...[k]
[endif]
[textoff]

; 決闘の提案
@call target=*duel_offer
@jump target=&'"*hawkwing_" + tf.result'

; 決闘受諾
*hawkwing_accept
[texton w=1]
[ルーファス f=15]「That's what I'm talking about. Here we go!」[k]
[textoff]
@clf
@eval exp='game.enemy.visible = false'
@jump target=*hawkwing_start

; 金を払って決闘を断る
*hawkwing_escape
[texton w=1]
[if exp='game.party.gold < game.curTeam.penalty']
	[ルーファス f=05]「Huh? You don't have enough money. Are you kidding me?」[k]
	[ルーファス f=15]「If you can't pay, you have no choice but to fight.」[k]
	[textoff]
	@jump target=*hawkwing_start
[endif]
[ルーファス f=11]「Tch, that's boring.」[k]
@se f=coin
@eval exp='game.party.gold -= game.curTeam.penalty'
[nw][b][emb exp='number_format(game.curTeam.penalty)']G paid to opponent.[/b][/nw][k]
[ルーファス f=01]「See ya. Fight me next time.」[k]
[textoff]
@cl
@eval exp='game.curTeam.penalty *= 4'
@eval exp='game.curTeam.penalty = 999999' cond='game.curTeam.penalty > 999999'
@mu f=&'game.map.bgm'
[eventoff]

; 戦闘開始・勝った場合はここに戻ってくることなく報酬を貰って終了
*hawkwing_start
@monster pos=1 name=&'game.curTeam.members[1].name'
@monster pos=2 name=&'game.curTeam.members[3].name'
@monster pos=3 name=&'game.curTeam.members[0].name'
@monster pos=4 name=&'game.curTeam.members[4].name'
@monster pos=5 name=&'game.curTeam.members[2].name'
@monster pos=9 name=&'game.curTeam.members[5].name'
@monster pos=10 name=&'game.curTeam.members[7].name'
@monster pos=11 name=&'game.curTeam.members[6].name'
@call target=*duel_play

; 敗北・敗北時シナリオに言ってそのまま終了。アイテムを奪われる
@mu f=duel
@jump storage="others02.scn" target=*rufus_duel
;========================================================================================



;■共通
;========================================================================================
; 決闘の提案
*duel_offer
[if exp='game.curTeam.slaves.count > 0']
	@command type=long title=&'"Do you want to duel <y>" + game.curTeam.displayName + "?"'
	@select text="Yes" target=*duel_answer exp='tf.result = "decide"'
	@select text="No" target=*duel_answer exp='tf.result = "cancel"'
[else]
	@command type=long title=&'"<y>" + game.curTeam.displayName + "<g> want to duel!<r>"'
	@select text="Duel" target=*duel_answer exp='tf.result = "accept"'
	@eval exp='tf.temp = number_format(game.curTeam.penalty)'
	@select text=&'tf.temp + "G to avoid"' target=*duel_answer exp='tf.result = "escape"'
[endif]
@select text="View info" target=*duel_offer exp='game.partyInfo.viewInfo(game.curTeam, true)'
@eval exp='game.curBoard.write(game.curTeam.getDemand().text, 36, 250)'
@eval exp='m.奴隷ヒロイン０.name = "奴隷ヒロイン０"'
@eval exp='m.奴隷ヒロイン１.name = "奴隷ヒロイン１"'
@eval exp='m.奴隷ヒロイン２.name = "奴隷ヒロイン２"'
[s]

; 行動を選択後、いったん元のシナリオに戻る
*duel_answer
@return

; 決闘開始・実行
*duel_play
@anime_duel_net visible=true
@eval exp='game.inDuelBattle = true'
@callbattle bgm=boss
@anime_duel_net visible=false
@anime_duel_sign visible=false
@return target=*duel_demand cond='game.getBattleResult() == "win"'
@eval exp='game.party.minimumRecovery(true)'
@notice text="<y>The party was defeated, but with the blessing of the Duel God, members are resurrected with low HP and in a weakened state."
@return

; 勝利後の報酬
*duel_demand
@eval exp='game.party.minimumRecovery(true)'
@notice text=&'"Defeated " + game.curTeam.displayName +"!"'
@eval exp='game.curTeam.level ++'

; 報酬メニュー
*demand_menu
@command type=long title="<y>You <p>win<y>! What do you request from the<r>other party?"
@select text="Take their money" target=*demand_money
@select text="Receive 10 items" target=*demand_items cond='game.curTeam.itemsList != ""'
@select text="Order a 90-day suspension" target=*demand_suspend
@select text="Demand rival member" target=*demand_member cond='game.curTeam.hostage !== void'
@select text="Return a friend" target=*demand_slave cond='game.curTeam.slaves.count > 0'
[s]

; 金銭奪取
*demand_money
[texton w=0]
@se f=coin
@eval exp='game.party.gold += game.curTeam.gold'
[nw][b]Took [emb exp='number_format(game.curTeam.gold)']G from the other party![/b][/nw][k]
[textoff]
[eventoff]

; アイテム奪取
*demand_items
[texton w=0]
[nw][b]Took the other party's items![/b][/nw][k]
@treasure item=&'game.curTeam.itemsList' closely=true
[textoff]
[eventoff]

; 活動停止命令
*demand_suspend
[texton w=0]
@eval exp='game.curTeam.interruption = 90'
[nw][b]At your request, [b red][emb exp='game.curTeam.displayName'][b]has withdrawn for 90 days![/b][/nw][k]
[textoff]
[eventoff]

; 敵からメンバーを奪う
*demand_member
[iscript]
//------------------------------------------------------------------------------
// 奪ったメンバーを復帰・加入させる
game.guest.summonMonster(game.curTeam.hostage);
game.guest.opacity = 255;	// 分かりやすくするため表示を戻す
game.curTeam.hostage.contracted = true;
game.curTeam.hostage.equipLife = G_WHOLE;

// 陵辱の日記を付加
if(game.curTeam == o.ワイルド・ブル)
{
	for(var i = 0; i < 10; i++)
	{
		var rec = game.curTeam.hostage.getSexRecord(o.アレックス,,,, game.date - 10 + i);
		game.curTeam.hostage.addSexRecordAndChangeHeart(rec);
	}
	game.lovers.push2(o.アレックス);	// 寝取り男にアレックスを追加
}

// 記録
tf.num = game.getNumContractedHelpers(false);
if(tf.num > sf.numContractedHirings) sf.numContractedHirings = tf.num;

//------------------------------------------------------------------------------
[endscript]
@se f=up1
@fg c=&'game.curTeam.hostage.img' left=450 b
@layopt layer=3 page=back top=&'560 - kag.back.layers[3].height'
@fg
[texton w=1]
[nw][b]Co-opted [emb exp='game.curTeam.hostage.displayName']![/b][/nw][k]
[textoff]
@cl
[eventoff]

; 奴隷の返却
*demand_slave

; 返却可能な奴隷の一覧表示
@command type=duel title="<y>Select member to return"
@select text=&'game.curTeam.slaves[0].name' exp='tf.result = 0' cmdcond='game.curTeam.slaves[0].slaveTerm == 0'
[if exp='game.curTeam.slaves[1] !== void']
	@select text=&'game.curTeam.slaves[1].name' exp='tf.result = 1' cmdcond='game.curTeam.slaves[1].slaveTerm == 0'
[endif]
[if exp='game.curTeam.slaves[2] !== void']
	@select text=&'game.curTeam.slaves[2].name' exp='tf.result = 2' cmdcond='game.curTeam.slaves[2].slaveTerm == 0'
[endif]
@select text="Cancel" exp='tf.result = -1'
[waitinput name="askQuestion"]
@jump target=*demand_menu cond='tf.result == -1'

; 奴隷選択
@eval exp='game.curChara = game.curTeam.slaves[tf.result]'
@delevent name=全般 num=3
@eval exp='game.curChara.events.push2(99)'

; 妊娠していたら妊娠イベントへ
@call target=&'"*" + game.curTeam.img + "_pregnant"' cond='game.curChara.isPregnant()'

; 妊娠中 or パーティー満杯なら待合所に帰還
[texton]
[nw][b red][emb exp='game.curChara.displayName'] returned to the party![r]

[if exp='game.curChara.isNursing()']
	; 育休中だったら誤解を避けるため通常状態に戻す
	@eval exp='game.curChara.pregnant = NO_PREGNANCY'
[endif]

[if exp='game.curChara.isPregnant()']
	; 妊娠中
	@eval exp='game.curChara.removeEquipmentsByForce()'
	@eval exp='game.curChara.dressEquipment(game.curChara.isBigBelly() ? o.マタニティドレス　 : o.マタニティドレス)'
	@eval exp='game.curTeam.restoreSlave(game.curChara, game.waitingRoom)'
	She can't fight because she's pregnant, so she'll return to [b][emb exp='game.waitingRoom.displayName'][/b] in town.
	@eval exp='game.enterTown(o.サファイアシティ, o.待合所, true)'

[elsif exp='game.party.members.count >= game.party.maxMembers']
	; パーティー満杯
	@eval exp='game.curChara.removeEquipmentsByForce()'
	@eval exp='game.curChara.setInitialItems()'
	@eval exp='game.curTeam.restoreSlave(game.curChara, game.waitingRoom)'
	The party's full, so she'll return to [b][emb exp='game.waitingRoom.displayName'][/b] in town.

[else]
	; どちらでもないので通常復帰
	@eval exp='game.curTeam.restoreSlave(game.curChara, game.party)'

[endif]
[/b][/nw][k]
[textoff]

[eventoff]
;========================================================================================



;■トーナメント
;========================================================================================
; 参加
*tournament_entry

[if exp='game.date == f.dayOfTournamentFinished']
	[texton]
	[受付]「Today's competition is over. Please come back next week.
	 」[k]
	[textoff]
	[otheroff]
[endif]

[if exp='game.getValuesOfDate(game.date).day != "SUN"']
	[texton]
	[受付]「No competitions are being held today. Tournaments are only held every Sunday.
	 」[k]
	[textoff]
	[otheroff]
[endif]

[texton]
[受付]「Today is the date of the tournament. The entry fee is 5,000G. Would you like to enter?
 」[k]
[textoff]
@question title="Do you want to enter the competition?"
[otheroff cond='! tf.result']

[if exp='game.party.gold < 5000']
	[texton]
	[受付]「You don't have the entry fee. If you wish to participate, please pay 5,000G
	 」[k]
	[textoff]
[endif]

@eval exp='f.dayOfTournamentFinished = game.date'
@se f=coin
@eval exp='game.party.gold -= 5000'
[texton]
[受付]「You're accepted! Please proceed inside.」[k]
[textoff]
@mu f=brave
@anime_duel_net visible=true storage=other_arena
[texton]
[name n=Commentator]「Let the tournament begin! The last team standing is the winner!」[k]
[textoff]

; １回戦
@eval exp='tf.temp = "Round 1"'
@eval exp='game.curTeam = o.スライム軍団'
@monster pos=1 name=ポイズンスライム
@monster pos=2 name=レッドスライム
@monster pos=3 name=スライム
@monster pos=4 name=ブラックスライム
@monster pos=5 name=ゴーストスライム
@monster pos=8 name=マジカルスライム
@monster pos=10 name=ジャンボスライム
@monster pos=12 name=ブルースライム
@call target=*match_ready
@mu f=brave
[texton]
[name n=Commentator]「Congratulations on making it through the first round! Please proceed to the next match!」[k]
[textoff]

; ２回戦
@eval exp='tf.temp = "Round 2"'
@eval exp='game.curTeam = o.デッドリー・ロア'
@monster pos=1 name=コボルド
@monster pos=3 name=オークソルジャー
@monster pos=5 name=シニアコボルド
@monster pos=9 name=コボルドリーダー
@monster pos=11 name=オークシャーマン
@call target=*match_ready
@mu f=brave
[texton]
[name n=Commentator]「Congratulations on making it through the second round! Now, on to the next match!」[k]
[textoff]

; ３回戦
@eval exp='tf.temp = "Round 3"'
@eval exp='game.curTeam = o.チーム・アマゾネス'
@monster pos=1 name=シューター
@monster pos=3 name=チャンピオン
@monster pos=5 name=グラディエイター
@monster pos=9 name=ハイプリースト
@monster pos=11 name=アークメイジ
@call target=*match_ready
@mu f=brave
[texton]
[name n=Commentator]「Congratulations on making it through the third round! Now, on to the next match!」[k]
[textoff]

; 準々決勝
@eval exp='tf.temp = "Quarter Final"'
@eval exp='game.curTeam = o.地獄の処刑人'
@monster pos=1 name=トログロダイト
@monster pos=3 name=アサシン
@monster pos=5 name=パイレーツ
@monster pos=9 name=キャプテン
@monster pos=11 name=マスターシャドウ
@call target=*match_ready
@mu f=brave
[texton]
[name n=Commentator]「Congratulations on making it through the quarterfinals! Now, time for the semi-finals!」[k]
[textoff]

; 準決勝
@eval exp='tf.temp = "Semi Final"'
@eval exp='game.curTeam = o.アビスバイパー'
@monster pos=1 name=ゴーレム
@monster pos=3 name=ゴールドマン
@monster pos=5 name=ストーンゴーレム
@monster pos=8 name=ラミア
@monster pos=10 name=サイクロプス
@monster pos=12 name=マッドウイング
@call target=*match_ready
@mu f=brave
[texton]
[name n=Commentator]「Congratulations on making it through the semi-finals! Now, time for the final round!」[k]
[textoff]

; 決勝
@eval exp='tf.temp = "Final"'
@eval exp='game.curTeam = o.死霊大隊'
@monster pos=0 name=レブナント
@monster pos=1 name=レブナント
@monster pos=2 name=スケルトンキング
@monster pos=3 name=スケルトンキング
@monster pos=4 name=スケルトンキング
@monster pos=5 name=レブナント
@monster pos=6 name=レブナント
@monster pos=8 name=ゴースト
@monster pos=9 name=パワーリッチ
@monster pos=10 name=ヴァンパイアロード
@monster pos=11 name=ネクロマンサー
@monster pos=12 name=ゴースト
@call target=*match_ready

; 勝利
@mu f=celebration
[texton]
[name n=Commentator]「You're the winner! Congratulations! Please collect your prize!」[k]
[textoff]
[if exp='game.findItem(o.ダイアモンドの魔石) === void']
	[texton]
	[name n=Commentator]「By the way, I heard that you guys are collecting magic stones.」[k]
	[if exp='! game.isFreeMode']
		[テオ]「Eh...? How do you know that...?」[k]
	[endif]
	[name n=Commentator]「I heard from the Princess.
	 
	 [k]
	[name n=Commentator]「Only the worthy deserve the magic stones. Winning this competition proves you are eligible, so please accept your prize.」[k]
	@treasure gold=100000 item=ダイアモンドの魔石
	[texton]
	[if exp='game.isFreeMode']
		It turns out that the tournament organizer possessed a magic stone. If we hadn't won, it would have been lost forever.
		 [k]
	[else]
		[テオ]「This is...!」[k]
		I can't believe the tournament organizer had a magic stone...![r]If we hadn't won, it would have been lost forever.
		 [k]
	[endif]
	[textoff]
[else]
	@notice text="Got the prize!"
	@treasure gold=100000 item=フランベルジュ
[endif]
[texton]
[name n=Commentator]「Thanks for your efforts! I look forward to seeing you again!」[k]
[textoff]
@fa
@anime_duel_net visible=false
@mu f=city
[eventoff]

; 敗北
*_lose_tournament
@mu f=city
@eval exp='game.enemy.reservedMonsters = []'
@eval exp='game.party.minimumRecovery()'
@notice text="<y>The party was defeated, but with the blessing of the Duel God, members are resurrected with low HP and in a weakened state."
@eval exp='tf.temp = []'
@eval exp='tf.temp = [2000, "守りの腕輪"]' cond='game.curTeam == o.地獄の処刑人'
@eval exp='tf.temp = [10000, "黄金の胸当て"]' cond='game.curTeam == o.アビスバイパー'
@eval exp='tf.temp = [30000, "破魔の短剣"]' cond='game.curTeam == o.死霊大隊'
[if exp='tf.temp.count > 0']
	[texton]
	[name n=Commentator]「This is your prize. Please accept it.」[k]
	[textoff]
	@notice text="Got the prize!"
	@treasure gold=&'tf.temp[0]' item=&'tf.temp[1]'
[endif]
[texton]
[name n=Commentator]「Thanks for your efforts! Really looking forward to seeing you again!」[k]
[textoff]
@anime_duel_net visible=false
[eventoff]

; 対戦相手
*match_ready
@notice text=&'"<c>" + tf.temp + "<r><y>    " + game.party.displayName + "<r>             VS  " + game.curTeam.displayName'
*_match_menu
@command type=long title=&'"<c>" + tf.temp + "<g> opponent is <y>" + game.curTeam.displayName + "<g>.<r>Start the match?"' record=false
@select text="Start" target=*match_start
@select text="Concede" target=*match_cancel
@select text="View info" target=*_match_menu exp='game.partyInfo.viewInfo(game.curTeam)'
[s]

; 試合開始
*match_start
@eval exp='game.inDuelBattle = true'
@callbattle bgm=boss escape=false
@anime_duel_sign visible=false
@return target=*_lose_tournament cond='game.getBattleResult() == "lose"'
@eval exp='game.party.minimumRecovery()'
@return

; 棄権
*match_cancel
@question title="Do you wish to concede the match?"
@jump target=*_lose_tournament cond='tf.result'
@jump target=*_match_menu

; 説明
*tournament_detail
[texton]
[受付]「This is a tournament-style arena where parties battle each other to determine the strongest party. The winner of the battle will move on to the next round, and the party that ultimately survives will be crowned the winner!」[k]
[受付]「The entry fee is 5,000G. The event will be held only once a week. The winning team will of course receive a prize, but there will also be prizes for teams that make it to the quarterfinals, so come and join in the fun!」[k]
[受付]「In this tournament, you have the blessing of the Duel God, so even if you lose, you will not die, and you will be able to revive with minimal HP. Please fight to your heart's content.」[k]
[textoff]
[otheroff]

; 賞品を見る
*tournament_trophy
[texton]
[nw]
[b blue]Prize List[/b][r]
  [b]Top 8[/b][locate x=120]2,000G & Bracelet of Protection[r]
  [b]Top 4[/b][locate x=120]10,000G & Gold Breastplate[r]
  [b]2nd Place[/b][locate x=120]30,000G & Exorcising Dagger[r]
  [b]Winner[/b][locate x=120]100,000G & ??? [locate x=615][k]
[textoff]
[otheroff]
;========================================================================================
