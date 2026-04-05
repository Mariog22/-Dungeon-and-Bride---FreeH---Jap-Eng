; stay.ks
; 宿屋滞在に伴うイベント・会話等をここに記述する


/*
入れたいイベントについて考える

・昼間に説明や挨拶 → 予約時についでに選択できるようにした
・夜中に移動して覗き見たり会話したり → チェックイン後にもう一度夜用マップが開く
・就寝後の強制イベント → 移動イベントを終わらせたら発生する
・翌朝の朝の挨拶を兼ねてのイベント → 就寝後イベントが終わり次第発生
 （時系列の矛盾をなくすため深夜イベントに早朝イベントをくっつけるのはやめた）

（朝のものも含め）強制イベントが終わったら朝のロビーへ移動 → レベルアップ → 退出

＜時間やラベル名について＞
	day      日中。町やダンジョン、ホテルの予約画面を行き来している状態
	sunset   夜散歩への移行時。切替時に発生するイベント、夜散歩時に使うボタンを登録する
	night    夜散歩。設置されているボタンがあったらそのイベントが起きる
	midnight 就寝後。就寝ボタンを押した後、深夜に発生するイベントを登録する
	slave    深夜イベント後。奴隷イベントを登録する。この直前に日付が変わる
	morning  退店時。翌日の早朝に起こるイベントを登録する

	reservation  先行予約
	booking   指定の予約を断る条件と断る際の会話
	reserved  先行予約を勝手に行ったキャラとの会話
	talk      夜散歩での会話
*/


;■マップイベント
; その他のホテルマップ画面内で発生するすべての任意イベントをここに登録する
;==============================================================================
*map_冒険者の宿_説明

[texton]
[フロント係]「You can place all the parties in a vacant room and press check-in to stay.」[k]
[フロント係]「Even if you don't have enough money, you can still stay at the inn, but your money will go negative. So you won't be able to shop elsewhere until the debt is paid.」[k]
[フロント係]「In addition, [b] staying in the stable does not recover anything, and you may lose money and items[/b].[r]
So it is recommended that you do not stay in the stables if possible.
 」[k]
[textoff]
@deleventbtn map=冒険者の宿 label=説明

[hoteloff]
;------------------------------------------------------------------------------
*map_冒険者の宿_宿の外_1

@eval exp='game.curChara = game.chara[f.surroundedGnomeID]'
@addevent name=ミューズ num=4
@eval exp='game.hotelView.stopSleeping = void'
@jump storage="heroine04a.scn" target=*theo_05

[hoteloff]
;------------------------------------------------------------------------------
*map_冒険者の宿_指南１

[texton]
[name n=Guest]「On a midnight walk?」[k]
[name n=Guest]「Other members who stayed at the inn may [b]move to another room[/b] after checking in.」[k]
[name n=Guest]「They are free to move around, so be careful, especially of the men.」[k]
[name n=Guest]「If there is a girl you are interested in, try not to leave her alone.」[k]
[textoff]
@deleventbtn map=冒険者の宿 label=指南１

[hoteloff]
;------------------------------------------------------------------------------
*map_潮風のペンション_指南２

[texton]
[name n=Guest]「Are you starting to get used to the inn system now?」[k]
[name n=Guest]「Lust is especially important. Men do nothing when their lust is 0, but when it goes up, they start to take various actions.」[k]
[name n=Guest]「Also, if you leave a girl alone with a guy, her lust will increase, and when it exceeds 100, her shield level will decrease by one and their relationship will advance.」[k]
[name n=Guest]「In other words, the key is to suppress everyone's excitement. Exciting situations or making the girls wear skimpy clothing increases the risk.」[k]
[name n=Guest]「Even if it's tempting to dress the girls in sexy clothes, it's best to dress them as modestly as possible.」[k]
[textoff]
@deleventbtn map=潮風のペンション label=指南２

[hoteloff]
;------------------------------------------------------------------------------
*map_ホテル琥珀_指南３

[texton]
[name n=Guest]「Assigning troublesome men with irrelevant women... That's certainly not a bad idea.」[k]
[name n=Guest]「However, as these women keep sleeping with them, they end up genuinely falling in love with them.」[k]
[name n=Guest]「That's going to be a problem. She'll end up actively cooperating with the guy to help him get other women.」[k]
[name n=Guest]「Don't forget to pay attention to the movements of women who are pawns of men.」[k]
[textoff]
@deleventbtn map=ホテル琥珀 label=指南３

[hoteloff]
;------------------------------------------------------------------------------
*map_雪の宿_指南４

[texton]
[name n="Rude Guest"]「When does a man stop being horny?! That's obvious!」[k]
[name n="Rude Guest"]「First, sleep. No matter how excited you are, you'll naturally calm down after a night's sleep.」[k]
[name n="Rude Guest"]「Then there are drugs with sedative effects. If you use a [b]Potion[/b] or [b]Remembrance Flower[/b], even a standing ○○○○ will become limp.」[k]
[name n="Rude Guest"]「Being approached by a serious guy is also a turn-off. It's not a big deal, but it's kind of off-putting.」[k]
[name n="Rude Guest"]「But the most effective thing is to have sex with a woman and ejaculate as hard as you can! Once you get it out, your ○○○ will go away whether you like it or not.」[k]
[name n="Rude Guest"]「There's no better sedative than a woman's ○○○○![r]You should keep a few women around to fuck whenever you want.」[k]
[textoff]
@deleventbtn map=雪の宿 label=指南４

[hoteloff]
;------------------------------------------------------------------------------
*map_大洞窟ホテル_指南５

[texton]
[name n=Guest]「Most of the rooms at this inn are single-occupancy. Be careful, women are especially likely to be targeted by men!」[k]
[textoff]
@deleventbtn map=大洞窟ホテル label=指南５

[hoteloff]
;------------------------------------------------------------------------------
*map_簡易宿泊所_指南６

[texton]
[name n=Guest]「If you feel like events aren't progressing, it's a good idea to try staying overnight by yourself for a change!」[k]
[textoff]
@deleventbtn map=簡易宿泊所 label=指南６

[hoteloff]
;------------------------------------------------------------------------------
*map_ホテル・クイーン_隠し通路_1

@out
@deleventbtn map=ホテル・クイーン label=隠し通路_1
@jump storage="main11.scn" target=*hotel_6

[hoteloff]
;------------------------------------------------------------------------------
*map_ホテル・クイーン_隠し通路_2

@out
@deleventbtn map=ホテル・クイーン label=隠し通路_2
@eval exp='f.checkinList = game.hotelView.store()'
@eval exp='game.hour = "day"'
@eval exp='game.hotelView.close()'
@eval exp='game.townView.close()'
@eval exp='game.loadDungeonAtBackGround(%[map:"ホテルの地下Ｂ１", x:11, y:3, way:"s"])'

[eventoff]
;------------------------------------------------------------------------------
*_ホテル・クイーン_戻る

@eval exp='game.party.clearStatusOnDungeonExit()'
@eval exp='game.gameFrame.clearCompassAndCoordinate()'
@eval exp='game.view.close()'
@eval exp='game.popup.open()'
@eval exp='game.popup.write("Entering the Hotel Queen...")'
@eval exp='game.hour = "night"'
@fadeoutbgm time=1000
@wait time=500
@playbgm storage="inn"
@eval exp='game.openHotelView(o.ホテル・クイーン, true)'
@eval exp='game.hotelView.restore(f.checkinList)'
@eval exp='game.hotelView.sleepButton.visible = game.hotelView.sleepButton.selectable = true'

[hoteloff]
;==============================================================================




;■就寝キャンセル
; 何らかの理由ですぐに就寝できないときのイベントを記述する
;==============================================================================
*stop_冒険者の宿_宿の外_1

[texton]
[テオ f=06]「I haven't found [ミューズ] yet. I need to find her.」[k]
[textoff]

[hoteloff]
;==============================================================================




;■先行予約
; ホテルを開いた瞬間に先行予約される場合はここに記述する
;==============================================================================
*reservation_冒険者の宿

@eval exp='tf.rooms = ["ロイヤルスイート", "スイートルーム", "エコノミールーム"]'
@eval exp='tf.num = game.hotelView.rooms[0].visMarkers.count'
@reserve room=&'tf.rooms.pop()' cond='tf.num <= 8'
@reserve room=&'tf.rooms.pop()' cond='tf.num <= 6'
@call target=*_guys_and_captives_reserve_rooms

[hoteloff]
;------------------------------------------------------------------------------
*reservation_ホテル琥珀

@eval exp='tf.rooms = ["エコノミールーム1", "エコノミールーム2"]'
@call target=*_guys_and_captives_reserve_rooms

[hoteloff]
;------------------------------------------------------------------------------
*reservation_潮風のペンション

@eval exp='tf.rooms = ["真珠の間", "珊瑚の間", "海月の間", "椰子の間"]'
@eval exp='tf.num = game.hotelView.rooms[0].visMarkers.count'
@reserve room=&'tf.rooms.pop()' cond='tf.num == 8'
@reserve room="潮騒の間" cond='tf.num <= 7'
@call target=*_guys_and_captives_reserve_rooms

[hoteloff]
;------------------------------------------------------------------------------
*reservation_ホテル・クイーン

@eval exp='tf.rooms = ["１号室", "２号室", "３号室", "４号室", "５号室", "６号室"]'
@eval exp='tf.num = game.hotelView.rooms[0].visMarkers.count'
@reserve
@reserve cond='tf.num <= 8'
@reserve cond='tf.num <= 6'
@reserve cond='tf.num <= 4'
@call target=*_guys_and_captives_reserve_rooms
[if exp='o.売春組織の実体を暴け.completed']
	@eval exp='o.ホテル・クイーン.addEventButton(%[label: "隠し通路_2", name: "隠し通路", img: "down", x: 900, y: 200])'
	@eval exp='game.hotelView.suspendSleeping = true'
[endif]

[hoteloff]
;------------------------------------------------------------------------------
*reservation_雪の宿

@eval exp='tf.rooms = ["松の間", "竹の間", "梅の間"]'
@eval exp='tf.num = game.hotelView.rooms[0].visMarkers.count'
@reserve room=&'tf.rooms.pop()' cond='tf.num <= 8'
@call target=*_guys_and_captives_reserve_rooms

[hoteloff]
;------------------------------------------------------------------------------
*reservation_簡易宿泊所

@eval exp='tf.rooms = ["大部屋"]'
@call target=*_guys_and_captives_reserve_rooms

[hoteloff]
;------------------------------------------------------------------------------
*reservation_大洞窟ホテル

@eval exp='tf.rooms = ["９号室"]'
@call target=*_guys_and_captives_reserve_rooms

[hoteloff]
;------------------------------------------------------------------------------
*_guys_and_captives_reserve_rooms
; 寝取り男とその虜のヒロインたちが指定された部屋を先行予約する。虜は２人まで参加
; なお、ブルーは強引に部屋に入れるので虜の女たちの協力を得る必要がない

@return cond='game.isFreeMode'
@eval exp='tf.rooms.shuffle(game.getSeedForRandomADay())'

[if exp='tf.rooms.count > 0 && game.guest.members.has(o.ブルー)']
	@eval exp='tf.temp = tf.rooms.pop()'
	@reserve room=&'tf.temp' chara=ブルー
	[if exp='game.wife !== void && game.wife.married']
		@reserve room=&'tf.temp' id=&'game.chara.find(game.wife)'
		@eval exp='game.wife.dontMove = true'
		@eval exp='o.ブルー.dontMove = true'
		@eval exp='o.ブルー.heat += 30'
		@eval exp='o.ブルー.priorTarget = game.wife'
		@eval exp='game.wife.booking.remove(3)'
	[endif]
[endif]

[if exp='tf.rooms.count > 0 && game.guest.members.has(o.ライナス)']
	@reserve room=&'tf.rooms.pop()' chara=ライナス
[endif]

[if exp='tf.rooms.count > 0 && game.party.members.has(o.マックス)']
	@reserve room=&'tf.rooms.pop()' chara=マックス
[endif]

@eval exp='tf.temp = o.ライナス.getCaptiveHeroines()'
[if exp='tf.rooms.count > 0 && tf.temp[0] !== void']
	[if exp='tf.temp[0].isUserChara']
		@reserve room=&'tf.rooms.pop()' id=&'game.chara.find(tf.temp[0])'
	[else]
		@reserve room=&'tf.rooms.pop()' chara=&'tf.temp[0].name'
	[endif]
[endif]
[if exp='tf.rooms.count > 0 && tf.temp[1] !== void']
	[if exp='tf.temp[1].isUserChara']
		@reserve room=&'tf.rooms.pop()' id=&'game.chara.find(tf.temp[1])'
	[else]
		@reserve room=&'tf.rooms.pop()' chara=&'tf.temp[1].name'
	[endif]
[endif]

@eval exp='tf.temp = o.マックス.getCaptiveHeroines()'
[if exp='tf.rooms.count > 0 && tf.temp[0] !== void']
	[if exp='tf.temp[0].isUserChara']
		@reserve room=&'tf.rooms.pop()' id=&'game.chara.find(tf.temp[0])'
	[else]
		@reserve room=&'tf.rooms.pop()' chara=&'tf.temp[0].name'
	[endif]
[endif]
[if exp='tf.rooms.count > 0 && tf.temp[1] !== void']
	[if exp='tf.temp[1].isUserChara']
		@reserve room=&'tf.rooms.pop()' id=&'game.chara.find(tf.temp[1])'
	[else]
		@reserve room=&'tf.rooms.pop()' chara=&'tf.temp[1].name'
	[endif]
[endif]

@return
;==============================================================================




;■予約時のキャラごとの条件判定
; キャラの求める条件に合わなかったときに予約を拒否する
;==============================================================================
*booking_マックス_0
;[exp] game.hotelView.curHotel.innType == "lovehotel" && inSameRoom(o.テオ)

[texton]
[マックス f=01]「Hey, staying at a love hotel with a guy? I'm not into that kind of thing.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_ライナス_0
;[exp] inSameRoom(o.マックス)

[texton]
[ライナス f=05]「I don't like this guy. I don't want to stay in the same room.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_ライナス_1
;[exp] inSameRoom(o.テオ)

[texton]
[ライナス f=05]「Why do I have to stay in the same room with you?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_ブルー_0
;[exp] inSameRoom(o.テオ) || inSameRoom(o.マックス) || inSameRoom(o.ライナス)

[texton]
[ブルー f=05]「I have no use for men. [テオ], you weren't listening to me?!」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_リム_0
;[exp] isNovice() && game.hotelView.curHotel.innType != "lovehotel" && inSameRoomWithGuy()

[texton]
[if exp='game.isFreeMode']
	[リム f=09]「Umm... I don't want to stay with a guy I don't know...」[k]
[else]
	[リム f=09]「Umm... I don't want to stay with a guy other than the captain...」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_リム_1
;[exp] inSameRoom(getOpponentOfQuarrel())

@eval exp='tf.temp = game.curChara.getOpponentOfQuarrel()'
[texton]
[リム f=08]「[b][emb exp='tf.temp.displayName'][/b] and I are fighting! I don't want to stay with her!」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_リム_2
;[exp] feelJealous()

@eval exp='tf.temp = game.getPlayersFavoriteHeroine()'
[texton]
[リム f=08]「Captain, you and [b][emb exp='tf.temp.displayName'][/b] are always together lately, aren't you? I wonder what's going on?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_クレア_0
;[exp] isNovice() && game.hotelView.curHotel.innType != "lovehotel" && inSameRoomWithGuy()

[texton]
[if exp='game.isFreeMode']
	[クレア f=09]「I don't want to stay with a man I don't know.」[k]
[else]
	[クレア f=09]「I don't want to stay with a man. But the captain is fine.」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_クレア_1
;[exp] inSameRoom(getOpponentOfQuarrel())

@eval exp='tf.temp = game.curChara.getOpponentOfQuarrel()'
[texton]
[クレア f=08]「I don't even want to look at [b][emb exp='tf.temp.displayName'][/b] right now, let alone stay with her.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_クレア_2
;[exp] feelJealous()

@eval exp='tf.temp = game.getPlayersFavoriteHeroine()'
[texton]
[クレア f=19]「The captain is obsessed with [b][emb exp='tf.temp.displayName'][/b] lately～. I wonder what he's up to.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_フレデリカ_0
;[exp] isNovice() && game.hotelView.curHotel.innType != "lovehotel" && inSameRoomWithGuy()

[texton]
[フレデリカ f=17]「I'm sorry! I'm scared to be alone with a man I don't know well.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_フレデリカ_1
;[exp] inSameRoom(getOpponentOfQuarrel())

@eval exp='tf.temp = game.curChara.getOpponentOfQuarrel()'
[texton]
[フレデリカ f=09]「Sorry, things are awkward between me and [b][emb exp='tf.temp.displayName'][/b]. Can I have another room tonight?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_フレデリカ_2
;[exp] feelJealous()

@eval exp='tf.temp = game.getPlayersFavoriteHeroine()'
[texton]
[フレデリカ f=08]「Captain, you and [b][emb exp='tf.temp.displayName'][/b] are together a lot lately. I hope you're not playing favorites.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_ミューズ_0
;[exp] isNovice() && game.hotelView.curHotel.innType != "lovehotel" && inSameRoomWithGuy()

[texton]
[ミューズ f=10]「Excuse me... I'm scared to stay in the same room as a man I don't know...」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_ミューズ_1
;[exp] inSameRoom(getOpponentOfQuarrel())

@eval exp='tf.temp = game.curChara.getOpponentOfQuarrel()'
[texton]
[ミューズ f=10]「I don't want to be in the same room as [b][emb exp='tf.temp.displayName'][/b]...」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_ミューズ_2
;[exp] feelJealous()

@eval exp='tf.temp = game.getPlayersFavoriteHeroine()'
[texton]
[ミューズ f=10]「Captain... You're always with [b][emb exp='tf.temp.displayName'][/b]... Not fair...」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_マルエット_0
;[exp] isNovice() && game.hotelView.curHotel.innType != "lovehotel" && inSameRoomWithGuy()

[texton]
[if exp='game.isFreeMode']
	[マルエット f=07]「Hey! You're making me stay in the same room as a guy?! I'm leaving the party!」[k]
[else]
	[マルエット f=07]「Hey, Captain! You're making me stay in the same room as a guy?! I'm leaving the party!」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_マルエット_1
;[exp] inSameRoom(getOpponentOfQuarrel())

@eval exp='tf.temp = game.curChara.getOpponentOfQuarrel()'
[texton]
[マルエット f=07]「Is putting me with [b][emb exp='tf.temp.displayName'][/b] a joke?! I'm sick of her!」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_マルエット_2
;[exp] feelJealous()

@eval exp='tf.temp = game.getPlayersFavoriteHeroine()'
[texton]
[マルエット f=07]「Captain! Why are you always in the same room as [b][emb exp='tf.temp.displayName'][/b]?! It's suspicious!」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_リム_3
;[exp] inSameRoom(o.ブルー) && ! f.inLoveHotelQuest
*booking_クレア_3
;[exp] inSameRoom(o.ブルー) && ! f.inLoveHotelQuest
*booking_フレデリカ_3
;[exp] inSameRoom(o.ブルー) && ! f.inLoveHotelQuest
*booking_ミューズ_3
;[exp] inSameRoom(o.ブルー) && ! f.inLoveHotelQuest
*booking_マルエット_3
;[exp] inSameRoom(o.ブルー) && ! f.inLoveHotelQuest

[texton]
[キャラ f=10]「...」[k]
[テオ f=05]「[キャラ]...」[k]
...I can't do something as cruel as asking [キャラ] to be Blue's partner. Consider other allocations.
 [k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_リーゼル_0
;[exp] isNovice() && game.hotelView.curHotel.innType != "lovehotel" && inSameRoomWithGuy()

[texton]
[リーゼル f=06]「I'm a little scared to stay in the same room as a guy I don't know very well...」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*booking_リーゼル_1
;[exp] inSameRoom(getOpponentOfQuarrel())

@eval exp='tf.temp = game.curChara.getOpponentOfQuarrel()'
[texton]
[リーゼル f=06]「I don't want to stay in the same room as [b][emb exp='tf.temp.displayName'][/b]...」[k]
[textoff]

[hoteloff]
;==============================================================================




;■予約時キャライベント
; 勝手に先に予約をしてしまったキャラとの会話をここに登録する
;==============================================================================
*reserved_マックス

[texton]
[マックス f=03]「I like this room～ I'll stay here～」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_ライナス

[texton]
[ライナス f=05]「I've decided to stay in this room! Don't tell me what to do!」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_ブルー

[texton]
[if exp='game.wife !== void && game.wife.married']
	[ブルー f=53]「I'll take good care of your wife.」[k]
[else]
	[ブルー f=05]「I'm staying in this room. You got a problem with that?」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_ミレディ

[texton]
[ミレディ f=59]「I want this room! Don't bother me!」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_サンドラ

[texton]
[if exp='o.ホテル・クイーン.events.has(1)']
	[サンドラ f=07]「Hey! Don't talk to me![r]The enemy will find out about the operation, won't they?」[k]
[else]
	[サンドラ f=13]「I'm sorry. Blue was very picky about me taking this room.」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_リム

[texton]
[if exp='o.リム.married']
	[リム f=30]「I really don't want to, but I'll spend the night with Blue... 」[k]
[elsif exp='o.リム.love.max >= 50']
	[リム f=13]「Sorry... Max told me to take this room...」[k]
[elsif exp='o.リム.love.linus >= 50']
	[リム f=13]「I'm sorry... Linus insisted on me taking this room...」[k]
[elsif exp='o.リム.love.blue >= 50']
	[リム f=13]「I'm sorry... Blue insisted on me taking this room...」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_クレア

[texton]
[if exp='o.クレア.married']
	[クレア f=10]「I really don't want to, but I promised Blue I'd spend the night... 」[k]
[elsif exp='o.クレア.love.max >= 50']
	[クレア f=29]「Well... Max insisted on this room...」[k]
[elsif exp='o.クレア.love.linus >= 50']
	[クレア f=29]「Well... Linus insisted on this room...」[k]
[elsif exp='o.クレア.love.blue >= 50']
	[クレア f=29]「Well see... Blue insisted on this room...」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_フレデリカ

[texton]
[if exp='o.フレデリカ.married']
	[フレデリカ f=14]「I really don't want to, but I have to spend the night with Blue... 」[k]
[elsif exp='o.フレデリカ.love.max >= 50']
	[フレデリカ f=13]「I'm sorry, Max insisted that I take this room... 」[k]
[elsif exp='o.フレデリカ.love.linus >= 50']
	[フレデリカ f=13]「I'm sorry, Linus insisted that I take this room... 」[k]
[elsif exp='o.フレデリカ.love.blue >= 50']
	[フレデリカ f=13]「I'm sorry, Blue insisted that I take this room... 」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_ミューズ

[texton]
[if exp='o.ミューズ.married']
	[ミューズ f=10]「I have to stay with Blue at night... I really don't want to, but... 」[k]
[elsif exp='o.ミューズ.love.max >= 50']
	[ミューズ f=30]「Umm... Max told me to stay in this room... 」[k]
[elsif exp='o.ミューズ.love.linus >= 50']
	[ミューズ f=30]「Umm... Linus told me to stay in this room... 」[k]
[elsif exp='o.ミューズ.love.blue >= 50']
	[ミューズ f=30]「Umm... Blue told me to stay in this room... 」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_マルエット

[texton]
[if exp='o.マルエット.married']
	[マルエット f=09]「I'm with Blue again tonight. I really don't want to, but I can't resist him... 」[k]
[elsif exp='o.マルエット.love.max >= 50']
	[マルエット f=29]「Well... Max insisted that I stay in this room, so... 」[k]
[elsif exp='o.マルエット.love.linus >= 50']
	[マルエット f=29]「Well... Linus insisted that I stay in this room, so... 」[k]
[elsif exp='o.マルエット.love.blue >= 50']
	[マルエット f=29]「Well... Blue insisted that I stay in this room, so... 」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_リーゼル

[texton]
[リーゼル f=10]「I'm sorry... Blue insisted that I stay in this room. 」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_ブレイズマン
*reserved_ソードダンサー
*reserved_チャンピオン
*reserved_エンジェルナイト
*reserved_アコライト
*reserved_ハイプリースト

[texton]
[if exp='game.curChara.love.max >= 50']
	[雇用キャラ f=01]「I'm sorry... Max insisted that I take this room...」[k]
[elsif exp='game.curChara.love.linus >= 50']
	[雇用キャラ f=01]「I'm sorry... Linus insisted that I take this room...」[k]
[elsif exp='game.curChara.love.blue >= 50']
	[雇用キャラ f=01]「I'm sorry, Blue insisted that I take this room... 」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*reserved_スナイパー
*reserved_マスターアーチャー
*reserved_ミスティック
*reserved_メイガス

[texton]
[if exp='game.curChara.love.max >= 50']
	[雇用キャラ f=01]「Umm... Max was insistent I take this room.」[k]
[elsif exp='game.curChara.love.linus >= 50']
	[雇用キャラ f=01]「Umm... Linus was insistent I take this room.」[k]
[elsif exp='game.curChara.love.blue >= 50']
	[雇用キャラ f=01]「Umm... Blue was insistent I take this room.」[k]
[endif]
[textoff]

[hoteloff]
;==============================================================================




;■夜会話
; チェックイン後のメンバーとの会話をここに記述する
;==============================================================================
*free_mode

@playse storage=buzzer
@notice text="<y>You cannot talk in Free Mode."

[hoteloff]
;------------------------------------------------------------------------------
*no_action_count

@playse storage=buzzer
@notice text="<y>With 0 actions, you can't act."

[hoteloff]
;------------------------------------------------------------------------------
*player_dead

@playse storage=buzzer
@notice text="<y>Unable to speak, as the main character is dead."

[hoteloff]
;------------------------------------------------------------------------------
*talk_テオ

[texton]
[テオ e=通常 f=06]「Well, what should I do?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_リム

[if exp='o.リム.inSameRoom(o.テオ)']
	[texton]
	[if exp='o.リム.married']
		[if exp='o.リム.inSameRoomOnly(o.テオ) && o.リム.love.theo >= 20']
			[リム e=通常 f=04]「It's just the two of us today, my love ♪」[k]
			[テオ e=通常 f=02]「Oh.」[k]
			@moveheart her=リム guy=テオ num=1
		[else]
			[リム e=通常 f=02]「Well, I'm going to bed.」[k]
		[endif]
	[else]
		[if exp='! o.リム.likePlayerChara()']
			[リム]「Well, I'm going to bed.」[k]
		[elsif exp='o.リム.inSameRoomOnly(o.テオ)']
			[リム e=通常 f=22]「It's just me and the captain today...」[k]
			[テオ e=通常 f=13]「O-oh...」[k]
			@moveheart her=リム guy=テオ num=3
		[else]
			[リム e=通常 f=04]「I'm in the same room as the captain today ♪」[k]
			[テオ e=通常 f=02]「Oh, nice to see you, [リム].」[k]
			@moveheart her=リム guy=テオ num=1
		[endif]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.リム.beSeducedEarly(o.ブルー, true)']
	[texton]
	[if exp='o.リム.married && ! o.リム.events.has(79)']
		[リム e=黒いブラ f=38]「My dear, please... don't look at me in Blue's arms...!」[k]
	[else]
		[リム e=裸 f=37]「Ah... Ah... Blue...」[k]
		[テオ e=通常 f=06]「...」[k]
		[リム] was shaking her hips madly against Blue. I left without saying a word.[k]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.リム.beSeducedEarly(o.マックス)']
	[texton]
	[リム e=裸 f=37]「Ah... Ah... Max...」[k]
	[テオ e=通常 f=06]「...」[k]
	[リム] was shaking her hips madly against Max. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.リム.beSeducedEarly(o.ライナス)']
	[texton]
	[リム e=裸 f=37]「Ah... Ah... Linus...」[k]
	[テオ e=通常 f=06]「...」[k]
	[リム] was shaking her hips madly against Linus. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='! o.リム.inSameRoomWithGuy() && game.party.hasItem(o.魔法の錠前) && ! o.リム.getRoom().lock']
	[texton]
	[if exp='o.リム.married']
		[リム e=通常 f=02]「Oh, what's wrong, dear?」[k]
	[else]
		[リム e=通常 f=02]「Oh, captain... what's wrong?」[k]
	[endif]
	[textoff]
	@question title="Use a magic lock?"
	[texton]
	[if exp='tf.result']
		@se f=period
		@eval exp='o.リム.setMagicalLockToMyRoom()'
		[テオ e=通常 f=02]「It could be dangerous at night, so you could use this magic lock to lock your door.」[k]
		[if exp='o.リム.married']
			[リム f=04]「Thank you for going to the trouble, dear.」[k]
		[else]
			[リム f=03]「Wow! Thank you for going to the trouble, Captain!」[k]
		[endif]
		[textoff]
		@moveheart her=リム guy=テオ num=3
	[else]
		[テオ e=通常 f=02]「It's nothing. Good night, [リム].」[k]
		[if exp='o.リム.married']
			[リム f=02]「Yes, good night, dear.」[k]
		[else]
			[リム f=02]「Yes, good night, Captain.」[k]
		[endif]
		[textoff]
		@eval exp='o.リム.changeHeatByAnime(intrandom(-30, -20))'
		@moveheart her=リム guy=テオ num=1
	[endif]
	[hoteloff]
[endif]

[if exp='! o.リム.married && o.リム.love.theo >= 5']
	[texton]
	[リム e=通常 f=02]「Oh, captain... what's wrong?」[k]
	[テオ e=通常 f=02]「I just thought I'd do a little night patrol. Anything unusual?」[k]
	[リム f=03]「No! I'm fine! Thanks for coming to see me!」[k]
	[textoff]
	@eval exp='o.リム.changeHeatByAnime(intrandom(-30, -20))'
	@moveheart her=リム guy=テオ num=1
	[hoteloff]
[endif]

[texton]
[if exp='o.リム.married']
	[リム e=通常 f=02]「Oh, what's wrong, dear?」[k]
[else]
	[リム e=通常 f=02]「Captain, what's wrong?」[k]
[endif]
[テオ e=通常 f=02]「I just came by to check on you.」[k]
[リム]「Well, I'm going to bed.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_クレア

[if exp='o.クレア.inSameRoom(o.テオ)']
	[texton]
	[if exp='o.クレア.married']
		[if exp='o.クレア.inSameRoomOnly(o.テオ) && o.クレア.love.theo >= 20']
			[クレア e=寝室のキャミソール f=22]「It's just the two of us tonight, love.」[k]
			[テオ e=通常 f=02]「Oh.」[k]
			@moveheart her=クレア guy=テオ num=1
		[else]
			[クレア e=寝室のキャミソール f=02]「Well, I'm going to bed.」[k]
		[endif]
	[else]
		[if exp='! o.クレア.likePlayerChara()']
			[クレア e=通常 f=02]「Well, I'm going to bed.」[k]
		[elsif exp='o.クレア.inSameRoomOnly(o.テオ)']
			[クレア e=通常 f=22]「Just me and the captain today...」[k]
			[テオ e=通常 f=13]「O-oh...」[k]
			@moveheart her=クレア guy=テオ num=3
		[else]
			[クレア e=通常 f=01]「I'm in the same room as the captain today ♪」[k]
			[テオ e=通常 f=02]「Oh, nice to see you, [クレア].」[k]
			@moveheart her=クレア guy=テオ num=1
		[endif]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.クレア.beSeducedEarly(o.ブルー, true)']
	[texton]
	[if exp='o.クレア.married && ! o.クレア.events.has(79)']
		[クレア e=寝室のキャミソール f=72]「No, honey... don't look at me getting messed up by Blue...!」[k]
	[else]
		[クレア e=裸 f=37]「Ahhh... Blue... Blue...!」[k]
		[テオ e=通常 f=06]「...」[k]
		[クレア] was shaking her hips madly against Blue. I left without saying a word.[k]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.クレア.beSeducedEarly(o.マックス)']
	[texton]
	[クレア e=裸 f=37]「Ahhh... Max...」[k]
	[テオ e=通常 f=06]「...」[k]
	[クレア] was shaking her hips madly against Max. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.クレア.beSeducedEarly(o.ライナス)']
	[texton]
	[クレア e=裸 f=37]「Ahhh... Linus...」[k]
	[テオ e=通常 f=06]「...」[k]
	[クレア] was shaking her hips madly against Linus. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='! o.クレア.inSameRoomWithGuy() && game.party.hasItem(o.魔法の錠前) && ! o.クレア.getRoom().lock']
	[texton]
	[if exp='o.クレア.married']
		[クレア e=通常 f=02]「Oh, what's wrong, dear?」[k]
	[else]
		[クレア e=通常 f=02]「Oh, Captain, what is it?」[k]
	[endif]
	[textoff]
	@question title="Use a magic lock?"
	[texton]
	[if exp='tf.result']
		@se f=period
		@eval exp='o.クレア.setMagicalLockToMyRoom()'
		[テオ e=通常 f=02]「It could be dangerous at night, so you could use this magic lock to lock your door.」[k]
		[if exp='o.クレア.married']
			[クレア f=16]「Oh, thank you so much, dear.」[k]
		[else]
			[クレア f=16]「Sorry to bother you. Thanks, Captain.」[k]
		[endif]
		[textoff]
		@moveheart her=クレア guy=テオ num=3
	[else]
		[テオ e=通常 f=02]「It's nothing. Good night, [クレア].」[k]
		[if exp='o.クレア.married']
			[クレア f=02]「Yes, good night, dear.」[k]
		[else]
			[クレア f=02]「See you tomorrow, Captain.」[k]
		[endif]
		[textoff]
		@eval exp='o.クレア.changeHeatByAnime(intrandom(-30, -20))'
		@moveheart her=クレア guy=テオ num=1
	[endif]
	[hoteloff]
[endif]

[if exp='! o.クレア.married && o.クレア.love.theo >= 5']
	[texton]
	[クレア e=通常 f=02]「Oh, Captain, what is it?」[k]
	[テオ e=通常 f=02]「I just thought I'd do a little night patrol. Anything unusual?」[k]
	[クレア f=16]「Oh, good job. There's nothing to worry about.」[k]
	[textoff]
	@eval exp='o.クレア.changeHeatByAnime(intrandom(-30, -20))'
	@moveheart her=クレア guy=テオ num=1
	[hoteloff]
[endif]

[texton]
[if exp='o.クレア.married']
	[クレア e=通常 f=02]「Oh, what's wrong, dear?」[k]
[else]
	[クレア e=通常 f=02]「Oh, captain, what is it?」[k]
[endif]
[テオ e=通常 f=02]「I just came by to see how you're doing. Good night, [クレア].」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_フレデリカ

[if exp='o.フレデリカ.inSameRoom(o.テオ)']
	[texton]
	[if exp='o.フレデリカ.married']
		[if exp='o.フレデリカ.inSameRoomOnly(o.テオ) && o.フレデリカ.love.theo >= 20']
			[フレデリカ e=通常 f=04]「It's just the two of us today, my love ♪」[k]
			[テオ e=通常 f=02]「Oh.」[k]
			@moveheart her=フレデリカ guy=テオ num=1
		[else]
			[フレデリカ e=通常 f=02]「Yes, good night, dear.」[k]
		[endif]
	[else]
		[if exp='! o.フレデリカ.likePlayerChara()']
			[フレデリカ e=通常 f=02]「Good night, Captain.」[k]
		[elsif exp='o.フレデリカ.inSameRoomOnly(o.テオ)']
			[if exp='o.フレデリカ.events.has(7)']
				[フレデリカ e=通常 f=25]「Just me and the captain today...」[k]
				[フレデリカ f=57]「But that doesn't mean anything in particular!」[k]
			[else]
				[フレデリカ e=通常 f=22]「It's just me and the captain today... 」[k]
			[endif]
			[テオ e=通常 f=13]「O-oh...」[k]
			@moveheart her=フレデリカ guy=テオ num=3
		[else]
			[if exp='o.フレデリカ.events.has(7)']
				[フレデリカ e=通常 f=57]「Please don't talk to me! Can you please leave me alone?」[k]
			[else]
				[フレデリカ e=通常 f=04]「I'm sharing a room with the captain today.」[k]
				[テオ e=通常 f=02]「Oh, nice to see you, [フレデリカ].」[k]
			[endif]
			@moveheart her=フレデリカ guy=テオ num=1
		[endif]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.フレデリカ.beSeducedEarly(o.ブルー, true)']
	[texton]
	[if exp='o.フレデリカ.married && ! o.フレデリカ.events.has(79)']
		[フレデリカ e=ピンクのブラ f=38]「I don't want you to see me in Blue's arms...」[k]
	[else]
		[フレデリカ e=裸 f=37]「Haan... Blue... 」[k]
		[テオ e=通常 f=06]「...」[k]
		[フレデリカ] was shaking her hips madly against Blue. I left without saying a word.[k]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.フレデリカ.beSeducedEarly(o.マックス)']
	[texton]
	[フレデリカ e=裸 f=37]「Max... That feels good... 」[k]
	[テオ e=通常 f=06]「...」[k]
	[フレデリカ] was shaking her hips madly against Max. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.フレデリカ.beSeducedEarly(o.ライナス)']
	[texton]
	[フレデリカ e=裸 f=37]「Linus... That feels good... 」[k]
	[テオ e=通常 f=06]「...」[k]
	[フレデリカ] was shaking her hips madly against Linus. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='! o.フレデリカ.inSameRoomWithGuy() && game.party.hasItem(o.魔法の錠前) && ! o.フレデリカ.getRoom().lock']
	[texton]
	[if exp='o.フレデリカ.married']
		[フレデリカ e=通常 f=01]「Oh, honey, what's wrong?」[k]
	[else]
		[フレデリカ e=通常 f=01]「Oh, Captain... What's wrong?」[k]
	[endif]
	[textoff]
	@question title="Use a magic lock?"
	[texton]
	[if exp='tf.result']
		@se f=period
		@eval exp='o.フレデリカ.setMagicalLockToMyRoom()'
		[テオ e=通常 f=02]「It could be dangerous at night, so you could use this magic lock to lock your door.」[k]
		[if exp='o.フレデリカ.married']
			[フレデリカ f=04]「My dear, thank you.」[k]
		[else]
			[if exp='o.フレデリカ.events.has(7)']
				[フレデリカ f=57]「I see! Thank you for taking the time!」[k]
			[else]
				[フレデリカ f=03]「Thank you, Captain!」[k]
			[endif]
		[endif]
		[textoff]
		@moveheart her=フレデリカ guy=テオ num=3
	[else]
		[テオ e=通常 f=02]「It's nothing. Good night, [フレデリカ].」[k]
		[if exp='o.フレデリカ.married']
			[フレデリカ f=02]「Yes, dear, good night.」[k]
		[else]
			[フレデリカ f=02]「Yes, good night, Captain.」[k]
		[endif]
		[textoff]
		@eval exp='o.フレデリカ.changeHeatByAnime(intrandom(-30, -20))'
		@moveheart her=フレデリカ guy=テオ num=1
	[endif]
	[hoteloff]
[endif]

[if exp='! o.フレデリカ.married && o.フレデリカ.love.theo >= 5']
	[texton]
	[フレデリカ e=通常 f=01]「Oh, Captain... Is something wrong?」[k]
	[テオ e=通常 f=02]「I just thought I'd do a little night patrol. Anything unusual?」[k]
	[if exp='o.フレデリカ.events.has(7)']
		[フレデリカ f=25]「Did you come to see me because you were worried about me...?」[k]
		[フレデリカ f=57]「...Hmm, hmm! Not that that means anything!」[k]
	[else]
		[フレデリカ f=03]「Yes, it's okay～ I'm glad you came to see me!」[k]
	[endif]
	[textoff]
	@eval exp='o.フレデリカ.changeHeatByAnime(intrandom(-30, -20))'
	@moveheart her=フレデリカ guy=テオ num=1
	[hoteloff]
[endif]

[texton]
[if exp='o.フレデリカ.married']
	[フレデリカ e=通常 f=02]「Oh, honey, what's wrong?」[k]
[else]
	[フレデリカ e=通常 f=02]「Captain, what's going on?」[k]
[endif]
[テオ e=通常 f=02]「I just came by to check on you.」[k]
[フレデリカ f=02]「I see. Good night, Captain.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_ミューズ

[if exp='o.ミューズ.inSameRoom(o.テオ)']
	[texton]
	[if exp='o.ミューズ.married']
		[if exp='o.ミューズ.inSameRoomOnly(o.テオ) && o.ミューズ.love.theo >= 20']
			[ミューズ e=通常 f=22]「Just me and the captain today...」[k]
			[テオ e=通常 f=02]「Ah, yes.」[k]
			@moveheart her=ミューズ guy=テオ num=1
		[else]
			[ミューズ e=通常 f=05]「Well, I'm going to bed.」[k]
		[endif]
	[else]
		[if exp='! o.ミューズ.likePlayerChara()']
			[ミューズ e=通常 f=05]「Well, I'm going to bed now...」[k]
		[elsif exp='o.ミューズ.inSameRoomOnly(o.テオ)']
			[ミューズ e=通常 f=22]「It's just me and the captain today...」[k]
			[テオ e=通常 f=13]「O-oh...」[k]
			@moveheart her=ミューズ guy=テオ num=3
		[else]
			[ミューズ e=通常 f=01]「I'm in the same room as the captain today...」[k]
			[テオ e=通常 f=02]「Oh, nice to see you, [ミューズ].」[k]
			@moveheart her=ミューズ guy=テオ num=1
		[endif]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.ミューズ.beSeducedEarly(o.ブルー, true)']
	[texton]
	[if exp='o.ミューズ.married && ! o.ミューズ.events.has(79)']
		[ミューズ e=赤いブラ f=38]「Please, don't look at me in Blue's arms...!」[k]
	[else]
		[ミューズ e=裸 f=37]「Ahhh... Blue...」[k]
		[テオ e=通常 f=06]「...」[k]
		[ミューズ] was shaking her hips madly against Blue. I left without saying a word.[k]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.ミューズ.beSeducedEarly(o.マックス)']
	[texton]
	[ミューズ e=裸 f=37]「Ah... Ah... Max...」[k]
	[テオ e=通常 f=06]「...」[k]
	[ミューズ] was shaking her hips madly against Max. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.ミューズ.beSeducedEarly(o.ライナス)']
	[texton]
	[ミューズ e=裸 f=37]「Ah... Ah... Linus...」[k]
	[テオ e=通常 f=06]「...」[k]
	[ミューズ] was shaking her hips madly against Linus. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='! o.ミューズ.inSameRoomWithGuy() && game.party.hasItem(o.魔法の錠前) && ! o.ミューズ.getRoom().lock']
	[texton]
	[if exp='o.ミューズ.married']
		[ミューズ e=通常 f=05]「Oh, what's wrong, dear?」[k]
	[else]
		[ミューズ e=通常 f=05]「Oh, captain... what's wrong?」[k]
	[endif]
	[textoff]
	@question title="Use a magic lock?"
	[texton]
	[if exp='tf.result']
		@se f=period
		@eval exp='o.ミューズ.setMagicalLockToMyRoom()'
		[テオ e=通常 f=02]「It could be dangerous at night, so you could use this magic lock to lock your door.」[k]
		[if exp='o.ミューズ.married']
			[ミューズ f=22]「I'm glad... Thank you for going to the trouble, Captain.」[k]
		[else]
			[ミューズ f=22]「I'm glad... Thank you for going to the trouble, dear.」[k]
		[endif]
		[textoff]
		@moveheart her=ミューズ guy=テオ num=3
	[else]
		[テオ e=通常 f=02]「It's nothing. Good night, [ミューズ].」[k]
		[if exp='o.ミューズ.married']
			[ミューズ f=05]「Yes, good night, dear.」[k]
		[else]
			[ミューズ f=05]「Yes, good night, Captain.」[k]
		[endif]
		[textoff]
		@eval exp='o.ミューズ.changeHeatByAnime(intrandom(-30, -20))'
		@moveheart her=ミューズ guy=テオ num=1
	[endif]
	[hoteloff]
[endif]

[if exp='! o.ミューズ.married && o.ミューズ.love.theo >= 5']
	[texton]
	[ミューズ e=通常 f=05]「Oh, captain... what's wrong?」[k]
	[テオ e=通常 f=02]「I just thought I'd do a little night patrol. Anything unusual?」[k]
	[ミューズ f=22]「Yes... it's ok. Thank you for coming to see me...」[k]
	[textoff]
	@eval exp='o.ミューズ.changeHeatByAnime(intrandom(-30, -20))'
	@moveheart her=ミューズ guy=テオ num=1
	[hoteloff]
[endif]

[texton]
[if exp='o.ミューズ.married']
	[ミューズ e=通常 f=05]「Oh, is something wrong, dear?」[k]
[else]
	[ミューズ e=通常 f=05]「Oh, captain... what do you need of me?」[k]
[endif]
[テオ e=通常 f=02]「I just came by to see how you're doing. Good night, [ミューズ].」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_マルエット

[if exp='o.マルエット.inSameRoom(o.テオ)']
	[texton]
	[if exp='o.マルエット.married']
		[if exp='o.マルエット.inSameRoomOnly(o.テオ) && o.マルエット.love.theo >= 20']
			[マルエット e=通常 f=02]「It's just the two of us today, my love ♪」[k]
			[テオ e=通常 f=02]「Oh.」[k]
			@moveheart her=マルエット guy=テオ num=1
		[else]
			[マルエット e=通常 f=19]「Well, I'm going to bed.」[k]
		[endif]
	[else]
		[if exp='! o.マルエット.likePlayerChara()']
			[マルエット e=通常 f=06]「Well, I'm going to bed.」[k]
		[elsif exp='o.マルエット.inSameRoomOnly(o.テオ)']
			[マルエット f=22]「Just me and the captain today...」[k]
			[テオ e=通常 f=13]「O-oh...」[k]
			@moveheart her=マルエット guy=テオ num=3
		[else]
			[マルエット e=通常 f=02]「I'm sharing a room with the captain today.」[k]
			[テオ e=通常 f=02]「Oh, nice to see you, [マルエット].」[k]
			@moveheart her=マルエット guy=テオ num=1
		[endif]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.マルエット.beSeducedEarly(o.ブルー, true)']
	[texton]
	[if exp='o.マルエット.married && ! o.マルエット.events.has(79)']
		[マルエット e=マタニティドレス f=38]「Oh no... Don't look at me with Blue...」[k]
	[else]
		[マルエット e=裸 f=37]「Ahhh... Blue... Blue...!」[k]
		[テオ e=通常 f=06]「...」[k]
		[マルエット] was shaking her hips madly against Blue. I left without saying a word.[k]
	[endif]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.マルエット.beSeducedEarly(o.マックス)']
	[texton]
	[マルエット e=裸 f=37]「Ahhh... Max...」[k]
	[テオ e=通常 f=06]「...」[k]
	[マルエット] was shaking her hips madly against Max. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.マルエット.beSeducedEarly(o.ライナス)']
	[texton]
	[マルエット e=裸 f=37]「Ahhh... Linus...」[k]
	[テオ e=通常 f=06]「...」[k]
	[マルエット] was shaking her hips madly against Linus. I left without saying a word.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='! o.マルエット.inSameRoomWithGuy() && game.party.hasItem(o.魔法の錠前) && ! o.マルエット.getRoom().lock']
	[texton]
	[if exp='o.マルエット.married']
		[マルエット e=通常 f=06]「What's wrong, dear?」[k]
	[else]
		[マルエット e=通常 f=06]「What do you want from me?」[k]
	[endif]
	[textoff]
	@question title="Use a magic lock?"
	[texton]
	[if exp='tf.result']
		@se f=period
		@eval exp='o.マルエット.setMagicalLockToMyRoom()'
		[テオ e=通常 f=02]「It could be dangerous at night, so you could use this magic lock to lock your door.」[k]
		[if exp='o.マルエット.married']
			[マルエット f=16]「Oh, how thoughtful of you.」[k]
		[else]
			[マルエット f=16]「Thanks for going out of your way, Captain.」[k]
		[endif]
		[textoff]
		@moveheart her=マルエット guy=テオ num=3
	[else]
		[テオ e=通常 f=02]「It's nothing. Good night, [マルエット].」[k]
		[if exp='o.マルエット.married']
			[マルエット f=02]「Yeah, good night, my love.」[k]
		[else]
			[マルエット f=02]「Yeah, good night.」[k]
		[endif]
		[textoff]
		@eval exp='o.マルエット.changeHeatByAnime(intrandom(-30, -20))'
		@moveheart her=マルエット guy=テオ num=1
	[endif]
	[hoteloff]
[endif]

[if exp='! o.マルエット.married && o.マルエット.love.theo >= 5']
	[texton]
	[マルエット e=通常 f=05]「Captain, what's wrong?」[k]
	[テオ e=通常 f=02]「I just thought I'd do a little night patrol. Anything unusual?」[k]
	[マルエット f=16]「Sounds like a lot of work. There's nothing special.」[k]
	[textoff]
	@eval exp='o.マルエット.changeHeatByAnime(intrandom(-30, -20))'
	@moveheart her=マルエット guy=テオ num=1
	[hoteloff]
[endif]

[texton]
[if exp='o.マルエット.married']
	[マルエット e=通常 f=06]「What's wrong, love?」[k]
[else]
	[マルエット e=通常 f=06]「Captain, what's wrong?」[k]
[endif]
[テオ e=通常 f=02]「I just came by to see how you're doing. Good night, [マルエット].」[k]
[マルエット f=02]「Okay, good night.」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_リーゼル

[if exp='o.リーゼル.inSameRoom(o.テオ)']
	[texton]
	[if exp='! o.リーゼル.likePlayerChara()']
		[リーゼル e=通常 f=02]「Ah, good night, Captain.」[k]
	[elsif exp='o.リーゼル.inSameRoomOnly(o.テオ)']
		[リーゼル e=通常 f=59]「I feel a bit embarrassed being alone together...」[k]
		[テオ e=通常 f=26]「Y-yeah...」[k]
		@moveheart her=リーゼル guy=テオ num=3
	[else]
		[リーゼル e=通常 f=01]「We're sharing a room today.」[k]
		[テオ e=通常 f=02]「Oh, hello.」[k]
		@moveheart her=リーゼル guy=テオ num=1
	[endif]
	[textoff]
	[hoteloff]
[endif]

[texton]
[if exp='o.リーゼル.love.theo >= 5']
	[リーゼル e=通常 f=05]「Oh, Captain... You wanted to see me?」[k]
	[テオ e=通常 f=01]「I just thought I'd do a little night patrol. Anything unusual?」[k]
	[リーゼル f=04]「No, I'm fine. Good night, Captain.」[k]
	[テオ f=02]「Okay, good night.」[k]
	@moveheart her=リーゼル guy=テオ num=1
[else]
	[リーゼル e=通常 f=02]「Ah, good night, Captain.」[k]
[endif]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_マックス

[if exp='o.マックス.heat < game.heatToSex']
	[texton]
	[マックス e=通常 f=19]「Whew... I don't feel motivated today...」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.マックス.seduceAnyGirlEarly()']
	[texton]
	[マックス e=汗だく f=72]「I'm in the middle of something! Don't get in the way!」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.マックス.inSameRoomWithHeroine()']
	[texton]
	[マックス e=通常 f=22]「Hehehe... with the girls tonight...」[k]
	[テオ e=通常 f=05]「Max」[k]
	[マックス f=31]「Wow! ...What is it, [テオ]?」[k]
	[テオ f=05]「Max, I'm sure you know what I'm talking about, but mind how you act tonight.」[k]
	[マックス f=23]「I know, I know. I'm not gonna do anything crazy.」[k]
	[textoff]
	@eval exp='o.マックス.changeHeatByAnime(intrandom(-30, -20))'
	[hoteloff]
[endif]

[if exp='o.マックス.heat >= 20']
	[texton]
	[マックス e=通常 f=22]「Hehehe... where is the girls' room...?」[k]
	[テオ e=通常 f=05]「Max」[k]
	[マックス f=12]「Ah, [テオ]...!」[k]
	[テオ f=05]「Max, where are you going at this late hour?」[k]
	[マックス f=23]「Bathroom, bathroom! I'll head right back!」[k]
	[textoff]
	@eval exp='o.マックス.changeHeatByAnime(intrandom(-30, -20))'
	[hoteloff]
[endif]

[texton]
[マックス e=通常 f=01]「Hey, [テオ]. What do you need?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_ライナス

[if exp='o.ライナス.heat < game.heatToSex']
	[texton]
	[ライナス e=通常 f=20]「Whew... I'm kind of tired today...」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.ライナス.seduceAnyGirlEarly()']
	[texton]
	[ライナス e=汗だく f=58]「Haa haa... We're having sex right now! Get lost!」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.ライナス.inSameRoomWithHeroine()']
	[texton]
	[ライナス e=通常 f=21]「Ghehehehe... What shall I do with that girl tonight...?」[k]
	[テオ e=通常 f=05]「Linus」[k]
	[ライナス f=12]「H-hey, what's up [テオ]. What do you want from me?」[k]
	[テオ f=05]「Linus, I'm sure you know what I'm talking about, but mind how you act tonight.」[k]
	[ライナス f=54]「Asshole! Don't tell me what to do!」[k]
	[textoff]
	@eval exp='o.ライナス.changeHeatByAnime(intrandom(-30, -20))'
	[hoteloff]
[endif]

[if exp='o.ライナス.heat >= 20']
	[texton]
	[ライナス e=通常 f=21]「Khehehehe... now go to the girls' room...」[k]
	[テオ e=通常 f=05]「Linus」[k]
	[ライナス f=12]「Ah, [テオ]...!」[k]
	[テオ f=05]「Linus, where are you going at this late hour?」[k]
	[ライナス f=54]「Wherever I want to go, none of your business! Don't tell me what to do!」[k]
	[textoff]
	@eval exp='o.ライナス.changeHeatByAnime(intrandom(-30, -20))'
	[hoteloff]
[endif]

[texton]
[ライナス e=通常 f=06]「What, you want something from me?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_ブルー

[if exp='o.ブルー.heat < game.heatToSex']
	[texton]
	[ブルー e=通常 f=19]「I'm feeling sleepy for some reason... I guess I'll go to bed...」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='game.wife !== void && ! game.wife.events.has(79)']
	[texton]
	[ブルー e=裸 f=02]「I'm about to screw your wife. You just shut up and watch.」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.ブルー.seduceAnyGirlEarly(true)']
	[texton]
	[ブルー e=汗だく f=05]「Oi... Don't talk to me while I'm fucking.」[k]
	[textoff]
	[hoteloff]
[endif]

[texton]
[ブルー e=通常 f=08]「Tch... What do you want?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_マリア

[texton]
[マリア e=通常 f=01]「Let's save Riselle as soon as possible!」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_ミレディ

[if exp='o.ミレディ.beSeducedEarly(o.マックス)']
	[texton]
	[ミレディ e=汗だく f=33]「You have a super big cock! It feels really good!」[k]
	[マックス e=汗だく f=72]「Hey, [テオ], don't you think it's rude to interrupt?」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.ミレディ.beSeducedEarly(o.ライナス)']
	[texton]
	[ミレディ e=裸 f=11]「This dick! It's really big! I wonder if it will fit!」[k]
	[ライナス e=裸 f=58]「Hey, [テオ]! Don't come into my room! You're making my dick shrivel up!」[k]
	[textoff]
	[hoteloff]
[endif]

[texton]
[ミレディ e=通常 f=02]「What's up, want something?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_サンドラ

[if exp='o.サンドラ.beSeducedEarly(o.ブルー)']
	[texton]
	[サンドラ e=汗だく f=37]「Ahh, ahh, it feels good! Blue is the best after all...!」[k]
	[ブルー e=汗だく f=05]「What the hell are you doing here? Don't bother me!」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='o.サンドラ.beSeducedEarly(o.マックス)']
	[texton]
	[サンドラ e=汗だく f=37]「Oh wow! Your cock... is so... big!」[k]
	[マックス e=汗だく f=72]「Hey, hey, [テオ], I'm in the middle of something good. Don't interrupt me.」[k]
	[textoff]
	[hoteloff]
[endif]

[texton]
[サンドラ e=通常 f=02]「Oh, captain, what is it?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_ポラリス

[texton]
[ポラリス e=通常 f=01]「The adventure with you all is so much fun! Exciting ♪」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_ブレイズマン
*talk_ソードダンサー
*talk_チャンピオン
*talk_エンジェルナイト
*talk_アコライト
*talk_ハイプリースト

[if exp='game.curChara.beSeducedEarly(o.ブルー)']
	[texton]
	[雇用キャラ f=03]「Ah... I'm sorry. Right now, I'm having sex with Blue. Ask me tomorrow?」[k]
	[テオ e=通常]「Okay. Sorry to interrupt.」[k]
	[emb exp='game.curChara.displayName'] seems to be Blue's partner. I thanked her in my heart and walked away.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='game.curChara.beSeducedEarly(o.マックス)']
	[texton]
	[雇用キャラ f=03]「Ah... I'm sorry. Right now, I'm having sex with Max. Ask me tomorrow?」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='game.curChara.beSeducedEarly(o.ライナス)']
	[texton]
	[雇用キャラ f=03]「Ah... I'm sorry. Right now, I'm having sex with Linus. Ask me tomorrow?」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='game.curChara.trust >= 90']
	[texton]
	[雇用キャラ f=01]「I believe my term of employment has long since expired, but I would like to continue working for your party.」[k]
	[雇用キャラ f=01]「I want to be of service to you! Please continue to take me with you.」[k]
	[textoff]
	[hoteloff]
[endif]

[texton]
[雇用キャラ f=01]「Um... how can I serve you?」[k]
[textoff]

[hoteloff]
;------------------------------------------------------------------------------
*talk_スナイパー
*talk_マスターアーチャー
*talk_ミスティック
*talk_メイガス

[if exp='game.curChara.beSeducedEarly(o.ブルー)']
	[texton]
	[雇用キャラ f=03]「Um... I'm having sex with Blue now. Can I do it tomorrow?」[k]
	[テオ e=通常]「Okay. Sorry to interrupt.」[k]
	[emb exp='game.curChara.displayName'] seems to be Blue's partner. I thanked her in my heart and walked away.[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='game.curChara.beSeducedEarly(o.マックス)']
	[texton]
	[雇用キャラ f=03]「Um... I'm having sex with Max now. Can I do it tomorrow?」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='game.curChara.beSeducedEarly(o.ライナス)']
	[texton]
	[雇用キャラ f=03]「Um... I'm having sex with Linus now. Can I do it tomorrow?」[k]
	[textoff]
	[hoteloff]
[endif]

[if exp='game.curChara.trust >= 90']
	[texton]
	[雇用キャラ f=01]「I think my captivity period has expired, but I'm okay staying here for a while longer.」[k]
	[雇用キャラ f=01]「I want to go on more adventures with you guys, so please keep using me!」[k]
	[textoff]
	[hoteloff]
[endif]

[texton]
[雇用キャラ f=01]「Hey, have I been useful?」[k]
[textoff]

[hoteloff]
;==============================================================================




;■その他
;==============================================================================

; 出産施設の説明
;------------------------------------------------------------------------------
*describe_support

@return cond='f.describe_support'
@eval exp='f.describe_support = true'
The Sapphire City Guild offers various facilities and support to adventurers in case something like this happens.[k]
Among them are facilities for pregnant women to rest and give birth, as well as day care centers. Many female adventurers have trouble getting pregnant for various reasons, so this kind of support is available to them.[k]
For this reason, all of us in the Sapphire City Guild pay a considerable insurance premium every month. Frankly speaking, it is quite a burden, but the benefits are well worth it.[k]
I think the Sapphire City Guild is really solid in this area. I'm very happy to have joined. It's thanks to Mr. Schwarz.[k]
@return
;------------------------------------------------------------------------------
*describe_support_for_freemode

; 救出した直後
@saveon
[if exp='game.curChara.isBigBelly()']
	@fg c=キャラ e=穴あき鎧・ボテ腹 f=09
	[texton w=1]
	The rescued [キャラ] had a big belly. It seemed like she had become pregnant against her will.[k]
	When asked, she said she didn't know who the father was.[k]
[else]
	@fg c=キャラ e=穴あき鎧・妊娠 f=09
	[texton w=1]
	The rescued [キャラ] had a slightly expanded belly.[k]
	When asked, she said that she was pregnant and didn't know who the father was.[k]
[endif]
[textoff]
@out
@w05

; 待合所のベッド
@bg f=0007
[texton]
[リーダー] took [キャラ] back to Sapphire City.[k]
After consulting with the guild, it was decided that [キャラ] would stay on the second floor of the waiting room. She would be able to return to work only after safely giving birth.[k]
@se f=period
[nw][b][キャラ] will be staying at a facility in Sapphire City for a while to give birth and recuperate.[r]
[b blue]You can visit her at the Waiting Room[b] in Sapphire City.[k]
[textoff]
@return
;------------------------------------------------------------------------------


; 主人公・ブルー・お目当てのヒロイン以外のメンバーが部屋にいた場合
; その他のメンバーを部屋から追い出す
;------------------------------------------------------------------------------
*kick_out_by_blue

@eval exp='tf.arr = game.curChara.getRoomMates()'
@eval exp='tf.arr.remove(o.テオ)'
@eval exp='tf.arr.remove(o.ブルー)'
@return cond='tf.arr.count == 0'
@eval exp='tf.temp = game.curChara'
@eval exp='tf.num = tf.arr.count'
[texton w=0]
[ブルー e=通常 f=05]「Hey, you[if exp='tf.num >= 2'] guys[endif], go to some other room.」[k]
*_loop_kick_out
@eval exp='game.curChara = tf.arr.pop()'
[if exp='isMAX'][マックス e=通常 f=12]「I-I get it... 」[k][endif]
[if exp='isHUM'][リム e=通常 f=29]「I-I get it... 」[k][endif]
[if exp='isELF'][クレア e=通常 f=28]「Wow, okay... 」[k][endif]
[if exp='isDWA'][フレデリカ e=通常 f=29]「I-I understand... 」[k][endif]
[if exp='isGNO'][ミューズ e=通常 f=30]「I-I get it... 」[k][endif]
[if exp='isSYL'][マルエット e=通常 f=28]「Wow, okay... 」[k][endif]
[if exp='game.curChara == o.ライナス'][ライナス e=通常 f=10]「I-I get it...」[k][endif]
[if exp='game.curChara == o.サンドラ'][サンドラ e=通常 f=30]「Wow, okay... 」[k][endif]
[if exp='[o.ブレイズマン, o.ソードダンサー].has(game.curChara)'][雇用キャラ f=05]「OK, I get it...」[k][endif]
[if exp='[o.チャンピオン, o.エンジェルナイト].has(game.curChara)'][雇用キャラ f=05]「I got it...」[k][endif]
[if exp='[o.アコライト, o.ハイプリースト].has(game.curChara)'][雇用キャラ f=05]「Okay, okay, got it.」[k][endif]
[if exp='[o.ミスティック, o.メイガス].has(game.curChara)'][雇用キャラ f=05]「Yes, I understand.」[k][endif]
[if exp='[o.スナイパー, o.マスターアーチャー].has(game.curChara)'][雇用キャラ f=05]「Okay, I get it...」[k][endif]
@jump target=*_loop_kick_out cond='tf.arr.count > 0'
Blue chased some[if exp='tf.num >= 2'] people[else]one[endif] out.[k]
[textoff]
@eval exp='game.curChara = tf.temp'
@return
;------------------------------------------------------------------------------


; ワイルド・ブル専用の服に着替えさせる
;------------------------------------------------------------------------------
*wildbull_dress_uniform

@delevent
@eval exp='game.curChara.removeEquipmentsByForce()'
@eval exp='game.curChara.dressEquipment(o.奴隷の鎧・上,,, true)'
@eval exp='game.curChara.dressEquipment(o.奴隷の鎧・下,,, true)'
@return
;------------------------------------------------------------------------------


; ヒロインの主人公関連イベントをすべて消す
;------------------------------------------------------------------------------
*clear_heroes_event

[iscript]
game.curChara.clearRelativeEvents();
for(var i = 0; i < 20; i++) game.curChara.events.remove(i);	// 0～19番は主人公イベント
[endscript]

@return
;==============================================================================
