; 汎用イベント
; ラベルは  *event_数字    発生条件は  ;[exp] 式
; 移動後・戦闘終了直後・町施設出入り後にイベントの発生をチェックされる
; 一度発生したイベントは自動では削除されない
; もう発生させない場合は @delevent で削除すること

; イベントチェックのタイミング
;・町マップと各施設の出入り時
;・宿で予約を決定した直後
;・宿で就寝ボタンを押した直後

; イベントで何を行うか
;・ストーリー
;・ちょっとした説明等
;・特殊な戦闘
;・イベントボタンの設置
;・ダンジョンマップの変化
;・その他各種データの変更


;■ゲーム中いつでも発生しうるイベント
;==============================================================================
*event_0
;[exp] view == dungeonView && party.getNumExist() == 0

; ゲームオーバー
@jump storage="script.ks" target=*game_over

[eventoff]
;------------------------------------------------------------------------------
*event_1
;[exp] view == townView && party.members.count < 4

@delevent

[eventoff]
;------------------------------------------------------------------------------
*event_2
;[exp] party.lastIsMove || party.lastIsTurn

; ダンジョン中で一定時間（行動回数）が経過したことを数え、経過したらイベントを起こす仕組み
@eval exp='game.party.lastIsMove = game.party.lastIsTurn = false'
@eval exp='f.specialActionCounter --'
@delevent cond='f.specialActionCounter == -1'
@jump storage=&'f.specialActionMap' target=&'f.specialActionLabel' cond='f.specialActionCounter == -1'

[eventoff]
;------------------------------------------------------------------------------
*event_3
;[exp] view == dungeonView && map.isOutdoor && random < 0.2 && o.ワイルド・ブル.getBigBellySlave() !== void && (map == o.コリンズの森 || map == o.ランドン渓谷・崖上 || map == o.ヤネクの森・西)

; ワイルド・ブルによる妊娠キャラ返還イベント
@jump storage="duel.ks" target=*wildbull_give

[eventoff]
;------------------------------------------------------------------------------
*event_4
;[exp] party.members.count >= 4

; 隊列解説
; 初めて４人以上でパーティーを編成したときに発生
@delevent
@jump storage="main04.scn" target=*tutorial_6

[eventoff]
;------------------------------------------------------------------------------
*event_5
;[exp] map.kind == "dungeon" && map.blind == "darkness" && ! party.status.has(o.照明)

; 暗闇
@delevent
@notice text="It's pitch black! <r>I can't see anything without light!"

[eventoff]
;------------------------------------------------------------------------------
*event_6
;[exp] map.kind == "dungeon" && map.underWater && party.isSwimming()

; 初めて水中に入ったときのイベント
@delevent

; その他の潜水装備を解禁
; アクアマリンの魔石は水に潜れないと手に入らないので制限不要
@eval exp='game.closeItems.remove(o.貝のお守り)'
@eval exp='game.closeItems.remove(o.ドルフィンスーツ)'
@eval exp='game.closeItems.remove(o.シャークパンツ)'

; ストーリーモードの場合、マックスイベントへ
@jump storage="main09.scn" target=*into_water_first cond='! game.isFreeMode'

[eventoff]
;------------------------------------------------------------------------------
*event_11
;[exp] party.members.has(o.マックス) && o.マックス.active && getInfoEquipingAnyItem(true, tf.sexyEquipments *) !== void

; 恥ずかしい任意装備イベント
@delevent
@addevent num=12
@eval exp='f.dayOfSexyEquipmentsEvent = game.date'
@eval exp='tf.temp = game.getInfoEquipingAnyItem(true, tf.sexyEquipments *)'
@eval exp='game.curChara = tf.temp.chara'
@eval exp='game.curItem = tf.temp.item'

@wait time=500
@fg r=キャラ f=&'game.curChara.expose < 70 ? "29" : "25"'
@fg l=マックス f=15
[texton]
[マックス f=15]「Hey, [キャラ], isn't it great!」[k]
[if exp='game.curChara.expose < 70']
	[   if exp='isHUM'][リム f=29]「Please don't look...!」[k]
	[elsif exp='isELF'][クレア f=25]「Idiot! Don't stare!」[k]
	[elsif exp='isDWA'][フレデリカ f=29]「No, please don't look at me...」[k]
	[elsif exp='isGNO'][ミューズ f=29]「... (Kyaaaa)」[k]
	[elsif exp='isSYL'][マルエット f=27]「What are you looking at? Pervert!」[k]
	[elsif exp='isLIS'][リーゼル f=26]「Umm... it's embarrassing if you stare so much...」[k]
	[endif]
	[キャラ] is embarrassed.[k]
[else]
	[   if exp='isHUM'][リム f=06]「Please don't look...」[k]
	[elsif exp='isELF'][クレア f=07]「Don't stare at me anymore. So filthy.」[k]
	[elsif exp='isDWA'][フレデリカ f=10]「I don't want you to see it...」[k]
	[elsif exp='isGNO'][ミューズ f=25]「... (Kyaa)」[k]
	[elsif exp='isSYL'][マルエット f=08]「What are you staring at? Pervert.」[k]
	[elsif exp='isLIS'][リーゼル f=06]「Don't stare so much...」[k]
	[endif]
	[キャラ] is embarrassed, naturally.[k]
[endif]
However, Max is staring without worrying about her.[k]

[if exp='game.curItem == o.怪盗のレオタード || game.curItem == o.妖艶妻のシルク']
	[マックス f=22]「Isn't it almost completely transparent? Oh, I'm excited!」[k]
[elsif exp='game.curItem == o.暗殺者のかたびら']
	[マックス f=03]「Hey, you can see the nipples through the gaps in the net!」[k]
[elsif exp='game.curItem == o.クラムボトムズ']
	[マックス f=03]「You're only hiding the bare essentials, your ass is completely exposed!」[k]
[elsif exp='game.curItem == o.貝のネックレス']
	[マックス f=03]「Is it okay for your boobs to be exposed? Let me take a closer look, okay?」[k]
[elsif exp='game.curItem == o.クラムトップス']
	[マックス f=03]「Only your nipples are covered. So sexy!」[k]
[endif]

[if exp='game.curChara.expose < 70']
	[テオ f=12]「Hey... don't stare so much...」[k]
	[マックス f=15]「Even if you say that, it's so sexy you can't help but look.」[k]
	[   if exp='isHUM'][リム f=29]「I don't really want to equip this...」[k]
	[elsif exp='isELF'][クレア f=27]「I can't help having to wear it! This is the equipment we have!」[k]
	[elsif exp='isDWA'][フレデリカ f=38]「It's embarrassing...! But I will put up with it to fight...」[k]
	[elsif exp='isGNO'][ミューズ f=38]「Don't say that...! It's pretty embarrassing...」[k]
	[elsif exp='isSYL'][マルエット f=27]「I'm not wearing it to show you! That's enough!」[k]
	[elsif exp='isLIS'][リーゼル f=26]「I'll try not to worry about it, but please don't look too much.」[k]
	[endif]
	[マックス f=03]「Yes, yes.」[k]
	[テオ f=10]「...」[k]
	It may be painful for her. But she has to endure it to win battles. I'm sorry, [キャラ]...[k]
[else]
	[テオ f=12]「Hey... keep it in moderation...」[k]
	[マックス f=15]「Even if you say that, it's so sexy you can't help but look.」[k]
	[   if exp='isHUM'][リム f=08]「Honestly, Max is so dirty!」[k]
	[elsif exp='isELF'][クレア f=08]「You're always thinking about... disgusting things...」[k]
	[elsif exp='isDWA'][フレデリカ f=10]「Max is very naughty...」[k]
	[elsif exp='isGNO'][ミューズ f=30]「Max... your eyes... are disgusting...」[k]
	[elsif exp='isSYL'][マルエット f=08]「Are you stupid? Can't you think of anything else?」[k]
	[elsif exp='isLIS'][リーゼル f=05]「Do you really want to see me so badly...?」[k]
	[endif]
	[マックス f=03]「Haha!」[k]
	[テオ f=10]「...」[k]
	It might be a little embarrassing, but I guess I'll ask [キャラ] to bear with me...[k]
[endif]
[textoff]
@clf

[eventoff]
;------------------------------------------------------------------------------
*event_12
;[exp] f.dayOfSexyEquipmentsEvent < date && getInfoEquipingAnyItem(true, tf.sexyEquipments *) === void

; 恥ずかしい任意装備イベントを復帰。翌日になる＆一度全員がまともな装備にする
@delevent
@addevent num=11

[eventoff]
;------------------------------------------------------------------------------
*event_13
;[exp] party.members.has(o.マックス) && o.マックス.active && getInfoEquipingAnyItem(true, tf.sexyCursedEquipments *) !== void

; 恥ずかしい呪い装備イベント
@delevent
@addevent num=14
@eval exp='f.dayOfSexyEquipmentsEvent = game.date'
@eval exp='tf.temp = game.getInfoEquipingAnyItem(true, tf.sexyCursedEquipments *)'
@eval exp='game.curChara = tf.temp.chara'
@eval exp='game.curItem = tf.temp.item'

@wait time=500
@fg r=キャラ f=38
@fg l=マックス f=22
[texton]
[マックス f=37]「Wow! Amazing!」[k]
[if exp='game.curChara.expose < 70']
	[   if exp='isHUM'][リム f=37]「Kyaa!」[k]
	[elsif exp='isELF'][クレア f=37]「Don't look, it's embarrassing!」[k]
	[elsif exp='isDWA'][フレデリカ f=37]「Please don't look～!」[k]
	[elsif exp='isGNO'][ミューズ f=38]「...!」(Aaaaah!)[k]
	[elsif exp='isSYL'][マルエット f=37]「Idiot! Don't look!」[k]
	[elsif exp='isLIS'][リーゼル f=38]「It's embarrassing...!」[k]
	[endif]
	[キャラ] was forced to wear the cursed [emb exp='game.curItem.displayName'].[k]
	[キャラ] is embarrassed and her face is bright red.[k]
[else]
	[   if exp='isHUM'][リム f=11]「Kya!」[k]
	[elsif exp='isELF'][クレア f=12]「What the hell is this?」[k]
	[elsif exp='isDWA'][フレデリカ f=17]「W-what is this～?」[k]
	[elsif exp='isGNO'][ミューズ f=17]「Oh... no...」[k]
	[elsif exp='isSYL'][マルエット f=12]「Oh, no, hey, what?」[k]
	[elsif exp='isLIS'][リーゼル f=10]「Oh no... I can't take it off...」[k]
	[endif]
	[キャラ] was forced to wear the cursed [emb exp='game.curItem.displayName'].[k]
	It's natural for [キャラ] to be embarrassed.[k]
[endif]

[if exp='game.curItem == o.魔法の革ひも']
	[マックス f=32]「But it looks great... It's basically like you're wearing nothing at all!」
[elsif exp='game.curItem == o.奴隷の鎧・上 || game.curItem == o.背徳の鎧・上']
	[マックス f=22]「The nipples are barely covered! Oh, I'm excited!」
[elsif exp='game.curItem == o.奴隷の鎧・下']
	[マックス f=03]「Hey it shows off the bare ass! It's a dangerous look.」
[elsif exp='game.curItem == o.安物のビキニ・上 || game.curItem == o.安物のビキニ・下']
	[マックス f=22]「Isn't it almost completely transparent? Oh, I'm excited!」
[endif][k]

[if exp='game.curChara.expose < 70']
	[   if exp='isHUM'][リム f=38]「Um... don't look...!」[k]
	[elsif exp='isELF'][クレア f=92]「I'm telling you not to look!」[k]
	[elsif exp='isDWA'][フレデリカ f=37]「You're not allowed to look!」[k]
	[elsif exp='isGNO'][ミューズ f=38]「...Stop... Don't look...!」[k]
	[elsif exp='isSYL'][マルエット f=93]「I'll kill you if you stare any more!」[k]
	[elsif exp='isLIS'][リーゼル f=38]「Please... don't look any more...!」[k]
	[endif]
	[マックス f=32]「Ah, did I say that aloud? I can't take my eyes off it.」[k]
	[   if exp='isHUM'][リム f=29]「Captain, please break the curse as soon as possible...!」[k]
	[elsif exp='isELF'][クレア f=29]「Hey, break the curse as soon as possible... please...!」[k]
	[elsif exp='isDWA'][フレデリカ f=29]「Captain, please lift the curse as soon as possible...!」[k]
	[elsif exp='isGNO'][ミューズ f=38]「Break the curse as soon as possible... please...!」[k]
	[elsif exp='isSYL'][マルエット f=29]「You have to break the curse as soon as possible! I'm begging you!」[k]
	[elsif exp='isLIS'][リーゼル f=29]「I'm hoping to break the curse as soon as possible...」[k]
	[endif]
	[テオ f=10]「I-I understand.」[k]
	[キャラ] looks so pitiful. It's hard not to stare, so let's get rid of it as soon as we can.[k]
[else]
	[   if exp='isHUM'][リム f=09]「I can't believe you're already... Max...」[k]
	[elsif exp='isELF'][クレア f=07]「Don't stare... anymore...」[k]
	[elsif exp='isDWA'][フレデリカ f=10]「Max is really naughty...」[k]
	[elsif exp='isGNO'][ミューズ f=10]「Please don't look...」[k]
	[elsif exp='isSYL'][マルエット f=08]「Honestly... you're so dirty!」[k]
	[elsif exp='isLIS'][リーゼル f=10]「Don't stare so much...」[k]
	[endif]
	[   if exp='isHUM'][リム f=09]「I want the curse to be lifted as soon as possible.」[k]
	[elsif exp='isELF'][クレア f=09]「Hey, break the curse as soon as possible」[k]
	[elsif exp='isDWA'][フレデリカ f=09]「Please break the curse as soon as possible.」[k]
	[elsif exp='isGNO'][ミューズ f=10]「I want the curse to be lifted as soon as possible.」[k]
	[elsif exp='isSYL'][マルエット f=08]「Please break the curse as soon as possible!」[k]
	[elsif exp='isLIS'][リーゼル f=09]「Hey, I want you to break the curse as soon as possible.」[k]
	[endif]
	[テオ f=10]「I-I understand.」[k]
	I'm also having trouble averting my gaze, so let's do something soon.[k]
[endif]
[textoff]
@clf

[eventoff]
;------------------------------------------------------------------------------
*event_14
;[exp] f.dayOfSexyEquipmentsEvent < date && getInfoEquipingAnyItem(true, tf.sexyCursedEquipments *) === void

; 恥ずかしい呪い装備イベントを復帰。一度全員の恥ずかしい呪い装備を解除すると復帰する
@delevent
@addevent num=13

[eventoff]
;------------------------------------------------------------------------------
*event_15
;[exp] getInfoEquipingAnyItem(true, o.背徳の鎧・下) !== void

; 背徳の鎧イベント
@delevent
@addevent num=16
@eval exp='game.curChara = game.getInfoEquipingAnyItem(true, o.背徳の鎧・下).chara'
; @recordsex guy=アイテム sex=1 orgasm=0 acts=膣挿入
@wait time=500
@jump storage="heroine01a.scn" target=*sexy_armor cond='isHUM'
@jump storage="heroine02a.scn" target=*sexy_armor cond='isELF'
@jump storage="heroine03a.scn" target=*sexy_armor cond='isDWA'
@jump storage="heroine04a.scn" target=*sexy_armor cond='isGNO'
@jump storage="heroine05a.scn" target=*sexy_armor cond='isSYL'
@jump storage="heroine06a.scn" target=*sexy_armor cond='isLIS'

[eventoff]
;------------------------------------------------------------------------------
*event_16
;[exp] getInfoEquipingAnyItem(true, o.背徳の鎧・下) === void

; 背徳の鎧イベントを復帰。一度全員の背徳の鎧を解除すると復帰する
@delevent
@addevent num=15

[eventoff]
;==============================================================================


;■ゲームの達成状況に応じて発生するイベント
;==============================================================================
*event_21
;[exp] game.party.hasItem(o.ボム)

@delevent
@notice text="Got a bomb!"
[texton]
[nw]A bomb is an item that can destroy destructible walls and other objects. [r]
Use one from the item screen.[r]
It will be placed [b]one tile ahead of you[/b].[k]
To use in the current tile, you must [b]take one step back[/b] and use it.
 [k]
[textoff]
@eval exp='game.closeItems.remove(o.ボム)'

[eventoff]
;------------------------------------------------------------------------------
*event_22
;[exp] game.party.hasItem(o.魔法の浮き橋)

@delevent
@notice text="Got the Magic Floating Bridge!"
[texton]
[nw]A [nw]Magic Floating Bridge is an item that allows you to walk across [b]one tile[/b].[r]
When [b]walking[/b] toward an air or water surface while in possession of one, it will automatically appear to walk on.[k]
However, this tile must be adjacent to a solid surface. Also, only one tile can be crossed.[k]
[textoff]

[eventoff]
;------------------------------------------------------------------------------
*event_23
;[exp] game.party.hasItem(o.マジックラダー)

@delevent
@notice text="Got the Magic Ladder!"
@w05
@bg f=tutorial17
[texton w=1][nw]
The Magic Ladder is an item that allows you to climb [b]walls[/b] made of dirt.[k]
With it in your possession, walk toward an [b]earthen wall[/b] and it will automatically deploy and allow you to climb to the upper floor.[k]
@bgf f=tutorial18
Climbing will not be possible for earthen walls that are:[r][b]High[/b],[r]Are in areas [b]with ceilings[/b],[r]
Have [b]obstacles[/b] above them.[k]
[textoff]
@out
@w05

[eventoff]
;------------------------------------------------------------------------------
*event_24
;[exp] game.party.hasItem(o.レビテイトの魔法書) || game.party.hasItem(o.レビテイトの巻物)

@delevent
[texton]
[b][nw]About the Levitate spell[/b][r]
Levitate magic can be used to float, preventing [b]ground traps[/b] from working or [b]floor collapses[/b].[k]
However, it is not possible to move to places where there is no ground to begin with, such as in the air or on water. Also, the effect will automatically disappear in frozen areas.[k]
[textoff]

[eventoff]
;------------------------------------------------------------------------------
*event_25
;[exp] game.party.hasItem(o.マジカルボートの魔法書) || game.party.hasItem(o.マジカルボートの巻物)

@delevent
[texton]
[b][nw]About Magic Boat spell[/b][r]
Use the spell while facing a [b]water surface[/b]. A magic boat will appear, and you will be able to move on the water. It will disappear once you reach land.[k]
[textoff]

[eventoff]
;------------------------------------------------------------------------------
*event_26
;[exp] game.party.hasItem(o.ハイパーボム)

@delevent
@notice text="Got Hyper Bombs!"
[texton w=4]
[nw][b blue]∗Please read this carefully! [/b][r][r]
Hyper Bombs are items that, unlike regular bombs, can destroy [b]Hyper Bomb only walls[/b].[r][r]
Walls destroyable only with Hyper Bombs are [b red]red[/b].[r]
The usage is the same as that of a normal bomb.[k]
Red walls are [b]shortcuts[/b] that reduce the difficulty of the game, as destroying them allows avoiding puzzles or tough battles. Hyper Bombs can also be used in battle to inflict heavy damage on enemies, making it easier to defeat them.[r][r]
As such, the [b blue]number of times[/b] you use Hyper Bombs will be recorded in your save data, [b]lowering your score when you clear the game[/b].[k]
[r]The more Hyper Bombs you use, the easier the game gets, but [b]it can be completed without using them[/b].[r][r]
If you want to advance the game faster and don't care about the score, please use Hyper Bombs.[r]
On the other hand, if you want to clear the game on your own or not lose score, please try to clear the game without them.[r]
[b red]※Please rest assured that areas that can only be entered with Hyper Bombs will not affect the map completion rate.[/b][k]
[textoff]
@eval exp='game.closeItems.remove(o.ハイパーボム)'

[eventoff]
;==============================================================================


;■メインストーリー進行と共に発生するイベント
;==============================================================================
*event_41
;[exp] true

; ☆フリーモード用
@delevent
@jump storage="free01.scn" target=*introduction_1

[eventoff]
;------------------------------------------------------------------------------
*event_42
;[exp] view == dungeonView

; ☆フリーモード用
@delevent
@jump storage="free01.scn" target=*introduction_2

[eventoff]
;------------------------------------------------------------------------------
*event_43
;[exp] true

@delevent
@jump storage="trial.scn" target=*introduction cond='isDemoVersion'
@jump storage="main01.scn" target=*cottage_1

[eventoff]
;------------------------------------------------------------------------------
*event_44
;[exp] true

@delevent
[texton]
[マックス f=01]「If you get new equipment, you have to equip it! This can be done on the [b]item screen[/b]!」[k]
[textoff]
@jump storage="main01.scn" target=*tutorial_3

[eventoff]
;------------------------------------------------------------------------------
*event_45
;[exp] game.party.hasItem(o.赤いネックレス)

@notice text="Got a Red Necklace!"
@delevent
@delevent name=森の中の廃屋２Ｆ num=2
@addevent name=ブレイブタウン num=0
@addevent name=自宅 num=0
@jump storage="main01.scn" target=*cottage_3

[eventoff]
;------------------------------------------------------------------------------
*event_46
;[exp] MORNING && o.リーゼル.mmagicMax[3] > 0 && ! isDemoVersion

@delevent
@addevent name=リーゼル num=2
@jump storage="main05.scn" target=*liesel_3

[eventoff]
;------------------------------------------------------------------------------
*event_47
;[exp] map != o.サファイアシティ && f.daysOfTournament - game.date == 1 && game.clock >= game.checkoutTime

[texton]
[テオ]「Today is the day before the tournament. It's time to head back to Sapphire City.」[k]
[textoff]
@out
@eval exp='game.party.removeMember(o.リーゼル)'
@eval exp='game.view.close()'
@eval exp='game.openTownView(o.サファイアシティ, true)'
@w05
@gameon fade
@jump storage="street.ks" target=*event_サファイアシティ_8

[eventoff]
;------------------------------------------------------------------------------
*event_48
;[exp] MORNING

; revenge_1 イベントの翌朝からアジト内に入れるようになる
; また、マルティナの酒場で revenge_2 イベントが発生するようになる
@delevent
@delevent name=ブルーのアジト num=1
@addevent name=マルティナの酒場 num=4

[eventoff]
;------------------------------------------------------------------------------
*event_49
;[exp] MORNING

; revenge_2 イベントの翌朝からアジト内に入れるようになる
; 拘束期間が終わるまでは入口でミレディに追い返される
@delevent
@delevent name=ブルーのアジト num=1
@addevent name=全般 num=50

[eventoff]
;------------------------------------------------------------------------------
*event_50
;[exp] MORNING && o.リーゼル.slaveTerm <= 10

; 拘束期間が終わったところで revenge_3 イベントが発生する
; イベントはアジトの中で見られる
@delevent
@addevent map=ブルーのアジト２Ｆ num=1
@wait time=500
[texton]
[テオ]「...」[k]
I'm still worried about Riselle...![k]
If I go to Blue's hideout today, will I see Riselle? Maybe it's worth going there again.[k]
[textoff]

[eventoff]
;------------------------------------------------------------------------------
*event_51
;[exp] MORNING && o.リーゼル.slaveTerm == 0

; ブルーに挑戦可能になる
@delevent
@eval exp='f.enabledToChallengingBlue = true'
@wait time=500
[texton]
[テオ]「...」[k]
If I remember correctly, Riselle's captivity period is about to end.[k]
We're getting pretty good. Is it time to attempt Blue?[k]
Maria is also worried about Riselle, so it would be best to help her as soon as we can.[k]
[textoff]

[eventoff]
;------------------------------------------------------------------------------
*event_52
;[exp] view == townView

; 結婚イベント直後
@delevent
@wait time=1000
[texton]
[住民]「With the defeat of the demon Murmur, the blockade of [b]God's Mountain[/b] on the Island of Mist has been lifted!」[k]
[住民]「I heard that [b]God's Mountain[/b] is home to a feathered race. Why don't you try visiting?」[k]
[textoff]

[eventoff]
;==============================================================================


;■サブイベント内で発生するイベント
;==============================================================================
*event_61
;[exp] game.party.hasItem(o.アメジストの魔石)

; 魔女の隠れ家Ｂ６のイベント
@delevent
@eval exp='o.魔女の隠れ家Ｂ６.events = [1, 2, 3, 13]'
@erasemacro name=boxrun

[eventoff]
;------------------------------------------------------------------------------
*event_62
;[exp] game.map == o.森の城塞３Ｆ && o.森の城塞３Ｆ.getTreasureBox(1, 9) === void

@delevent
@delevent map=森の城塞３Ｆ num=4
@eval exp='o.教団を壊滅させろ.flag = 1'
@eval exp='f.dropMembersCardEnabled = true'
[texton]
There was nothing in the box. The trial can't be completed like this, since there is no proof.
 
 [k]
[textoff]

[eventoff]
;------------------------------------------------------------------------------
*event_63
;[exp] party.findEquipedItems(o.試作品の鎧) !== void

; 試作品の鎧を誰かが着た瞬間に発生
@delevent
@jump storage="main10.scn" target=*armor_1

[eventoff]
;------------------------------------------------------------------------------
*event_64
;[exp] isvalid tf.charaWearingTestArmor && tf.charaWearingTestArmor !== void && tf.charaWearingTestArmor.equip.chest === void

; 戦闘開始時に試作品の鎧２を着ていたキャラがいた場合戦闘終了時に必ず呼ばれる
@delevent
@eval exp='o.試作品の鎧２.event = true'
@eval exp='tf.temp = game.party.findItem(o.試作品の鎧２)'
[eventoff cond='tf.temp === void']
[eventoff cond='tf.temp.chara.bagStat[tf.temp.key] > BROKEN']

@delevent name=戦闘 num=6
@eval exp='o.鎧のテスター募集その２.flag = 1'
@jump storage="main10.scn" target=*armor_2

[eventoff]
;------------------------------------------------------------------------------
*event_65
;[exp] f.battleCountByTestingArmor >= 3

; 戦闘開始時に試作品の鎧３の上下を誰かが着ていた状態での戦闘を３度行ったら呼ばれる
@delevent
@delevent name=戦闘 num=7
[texton]
Okay, this much combat should be enough for a field test of the armor. It didn't break this time, so the test was a success. Let's report to the client later.
 [k]
[textoff]
@eval exp='o.鎧のテスター募集その３.flag = 1'

[eventoff]
;------------------------------------------------------------------------------
*event_66
;[exp] o.オークの拠点を制圧せよ.end < game.date

[texton]
[b][nw]
The "Conquer the Orc Den" quest has passed the deadline.[r]
This quest will be marked as a failure.[k]
[/b][/nw]
[textoff]
@eval exp='o.オークの拠点を制圧せよ.flag = 3'
@delevent

[eventoff]
;------------------------------------------------------------------------------
*event_67
;[exp] o.ワイルド・ブル壊滅作戦.end < game.date

[texton]
[b][nw]
The "Destroy Wild Bull" quest has passed the deadline.[r]
This quest will be marked as a failure.[k]
[/b][/nw]
[textoff]
@eval exp='o.ワイルド・ブル壊滅作戦.flag = 2'
@delevent
@delevent map=ワイルド・ブルの砦４Ｆ num=1
@delevent map=ワイルド・ブルの砦５Ｆ num=1
@delevent map=ワイルドブルのアジト２Ｆ num=1

[eventoff]
;==============================================================================


;■キャライベント内で発生するイベント
;==============================================================================
*event_81
;[exp] game.view == game.townView

@delevent
@addevent name=リム num=23
@jump storage="heroine01a.scn" target=*max_03

[eventoff]
;------------------------------------------------------------------------------
*event_82
;[exp] o.テオ.equip.finger !== void && game.wife.equip.finger == o.テオ.equip.finger

[texton]
[b][nw]
Currently, [テオ] and [emb exp='game.wife.displayName'] are wearing [b blue][emb exp='o.テオ.equip.finger.displayName']s.[b][r]
Will you choose this as your wedding ring?[k]
[/nw][/b]
[textoff]

@command type=short
@select text="Use this ring" exp='tf.result = true'
@select text=Reselect exp='tf.result = false'
[ask]

@delevent
[if exp='tf.result']
	@eval exp='o.テオ.married = game.wife.married = true'
	@eval exp='game.curChara = game.wife'
	@jump storage="heroine03b.scn" target=*theo_wedding
[endif]

@eval exp='f.lastRingName = o.テオ.equip.finger.name'
@addevent name=全般 num=83

[eventoff skipevent]
;------------------------------------------------------------------------------
*event_83
;[exp] o.テオ.equip.finger === void || game.wife.equip.finger === void || o.テオ.equip.finger.name != f.lastRingName || game.wife.equip.finger.name != f.lastRingName

@delevent
@addevent name=全般 num=82
@eval exp='f.lastRingName = void'

[eventoff]
;==============================================================================
