; street.ks
; 町で発生するイベントをここに記述する
; 各施設で条件により起こるイベント


; 通常イベント
;========================================================================================

; サファイアシティ
;----------------------------------------------------------------------------------------
*event_サファイアシティ_0
;[exp] true

; サファイアシティへ到達
@delevent
@jump storage="main04.scn" target=*city_1

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_1
;[exp] true

; メンバー挨拶
@delevent
@jump storage="main04.scn" target=*first_greeting

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_2
;[exp] true

; ポラリスの神殿のイベント後に起きる。ジャンプが買えるようになる
@delevent
@wait time=500
[texton]
[name n="Magic Store Owner" f=dorothy_01]「A new magic store has opened in Sapphire City!」[k]
[name n="Magic Store Owner" f=dorothy_01]「It's on the northwest main street. There are lots of magic books and scrolls, so please visit～!
 
 」[k]
[textoff]
@eval exp='game.closeItems.remove(o.ジャンプの巻物)'

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_3
;[exp] ! isDemoVersion

; ライナス登場
@delevent
@delevent name=世界一の道具店 num=0
@addevent name=世界一の道具店 num=1
@eval exp='o.世界一の道具店.specialItem.unshift(o.リーゼルの髪飾り)'
@eval exp='o.ベトリヌスの酒場.quests.remove(o.ポラリス神殿を守ってほしい)'
@eval exp='o.ベトリヌスの酒場.quests.add(o.コボルド退治)'
@jump storage="main05.scn" target=*kobold_1

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_4
;[exp] ! isDemoVersion

; シュバルツがムーンストーンの魔石を渡しに来る
@delevent
@jump storage="main05.scn" target=*kobold_6

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_5
;[exp] true

; ゴーレムが動き出す
@delevent
@delevent map=ジョセフの森 num=2
@addevent map=ジョセフの森 num=4
@addevent name=ベトリヌスの酒場 num=3
@addevent name=冒険者の宿 num=3
@addevent name=サファイア城 num=5
@addevent name=公園 num=2
@addevent name=サファイアシティ・北西門 num=2
@addevent name=サファイアシティ・北東門 num=2
@addevent name=サファイアシティ・南西門 num=2
@addevent name=下水道入口 num=2
@changefloor map=ジョセフの森 x=8 y=14 pimg=void
@eval exp='game.lapse = false'
@jump storage="main05.scn" target=*golem_1

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_6
;[exp] MORNING && game.party.hasItem(o.リーゼルの髪飾り) && f.hasSeenLieselBlizzardEvent

; 翌朝
@delevent
@addevent name=闘技場 num=0
@addevent name=サファイアシティ num=7
@addevent name=サファイアシティ num=8
@addevent name=全般 num=47
@eval exp='o.闘技場.visible = o.闘技場.appeared = true'
@eval exp='f.daysOfTournament = game.date + 14 - game.date % 7'
@jump storage="main06.scn" target=*tournament_1

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_7
;[exp] MORNING && f.daysOfTournament - game.date > 1

; トーナメントまで・宿屋に泊まった直後に毎日問い合わせをする
@question title=&'"There are <y>" + (f.daysOfTournament - game.date) + "<g> days until the tournament. Would you like to skip to it?"'
[townoff cond='! tf.result']

@out
@eval exp='game.date = f.daysOfTournament - 1'
@eval exp='game.gameFrame.updateCalender()'
@gameon fade
@jump target=*event_サファイアシティ_8

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_8
;[exp] f.daysOfTournament - game.date <= 1

; 大会前日・リーゼル、マックスとの会話
@delevent name=全般 num=47
@delevent name=サファイアシティ num=7
@delevent name=サファイアシティ num=8
@delevent name=闘技場 num=0
@addevent name=サファイアシティ num=9
@addevent name=王立ギルド num=6
@addevent name=待合所 num=3
@addevent name=ベトリヌスの酒場 num=4
@addevent name=冒険者の宿 num=4
@addevent name=サファイア城 num=6
@addevent name=公園 num=3
@addevent name=闘技場 num=1
@addevent name=サファイアシティ・北西門 num=3
@addevent name=サファイアシティ・北東門 num=3
@addevent name=サファイアシティ・南西門 num=3
@addevent name=サファイアシティ・南東門 num=2
@addevent name=下水道入口 num=3
@jump storage="main06.scn" target=*tournament_2

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_9
;[exp] MORNING

; 大会当日
@delevent
@delevent name=闘技場 num=0
@addevent name=ベトリヌスの酒場 num=5
@addevent name=冒険者の宿 num=5
@addevent name=サファイア城 num=7
@addevent name=公園 num=4
@addevent name=闘技場 num=2
@jump storage="main06.scn" target=*tournament_4

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_10
;[exp] true

@delevent
@wait time=500
@eval exp='game.backScreen.visible = false'
@eval exp='o.公園.links.push2("ワープポイント")'
@wait time=500
[texton]
[if exp='game.isFreeMode']
	[リーダー f=05]「This is...!」[k]
	Apparently, Wild Bull had a secret warp point linking to here. They've been using this to get up to evil deeds in town...![k]
	To get back to their hideout, we can use the warp point in this park.[k]
[else]
	[テオ f=05]「This is... the Sapphire City park!」[k]
	Apparently, Wild Bull had a secret warp point linking to here. They've been using this to get up to evil deeds in town...![k]
	If you want to go back to their hideout, you can use the warp point in this park.[k]
[endif]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_11
;[exp] true

@delevent
@wait time=500
[texton]
[住民]「Hey, you know what? I heard that Hawk Wing recently replaced its leader.」[k]
[住民]「The previous leader, Linus, got kicked out, and now he's in the bar every day!」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_12
;[exp] f.dayOfNakedHeroineEvent < game.date

; 恥ずかしい格好イベントを復帰
@delevent
@addevent name=ベトリヌスの酒場 num=25

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_13
;[exp] true

; エルフイベント１・町に出たところでクレアがさらわれ警備隊長が報告に来る
@delevent
@addevent map=パワーの森 num=4
@addevent map=パワーの森 num=5
@addevent map=パワーの森 num=6
@addevent map=ランドン渓谷・崖上 num=13
@addevent map=ランドン渓谷・崖上 num=14
@addevent map=ランドン渓谷・谷底 num=3
@addevent map=ペンスキー峠・峠道 num=7
@addevent map=モイーズ湿地帯・西の沼地 num=8
@addevent map=モイーズ湿地帯・東の沼地 num=5
@addevent map=モイーズ湿地帯・死霊の森 num=10
@addevent name=サファイアシティ・北西門 num=6
@addevent name=サファイアシティ・北東門 num=6
@addevent name=下水道入口 num=6
@addevent name=王立ギルド num=10
@addevent name=待合所 num=7
@addevent name=ベトリヌスの酒場 num=20
@addevent name=冒険者の宿 num=15
@addevent name=ホテル・クイーン num=3 cond='o.ホテル・クイーン.visible'
@addevent name=サファイア城 num=13
@addevent name=公園 num=10
@addevent name=闘技場 num=11
@addevent name=シーガルの村・南門 num=2
@addevent name=海岸ギルド num=1
@addevent name=潮風のペンション num=3
@addevent name=かもめ亭 num=9
@eval exp='o.パワーの森.antiWarp = true'
@eval exp='game.curChara = game.chara[f.kidnappedElfID]'
@jump storage="heroine02b.scn" target=*theo_07

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_14
;[exp] true

; ドワーフ婚約イベント１・町中でマリアと会う
@delevent
@addevent name=フレデリカ num=11
@jump storage="heroine03b.scn" target=*theo_12

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_15
;[exp] ! isDemoVersion && game.getNumOfJewels() >= 1

; シュバルツがムーンストーンの魔石を渡しに来る
; ※フリーモード用
@delevent
@jump storage="free02.scn" target=*kobold_6

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ_16
;[exp] true

; 不具合フォロー用
@delevent
@jump target=*event_サファイアシティ_8

[townoff]
;----------------------------------------------------------------------------------------
*event_冒険者の宿_0
;[exp] ! inHouse

[texton]
[マリア f=02]「This is the best inn in Sapphire City. You'll usually stay here.」[k]
[マリア f=02]「When you're done with all your errands, come stay here.」[k]
[textoff]

[townoff]
;------------------------------------------------------------------------------
*event_冒険者の宿_2
;[exp] inHouse

; 宿システムの説明
@delevent
[texton]
[フロント係]「Welcome to the Adventurer's Inn.[r]
Here, you can reserve a room and rest overnight to recover HP and MP.」[k]
[textoff]

@question title="View tutorial?"
@jump storage="main04.scn" target=*tutorial_5 cond='tf.result'

[texton]
[フロント係]「First go to the [b]Reservation Screen[/b] and reserve a room for every member!」[k]
[textoff]

[hoteloff]
;----------------------------------------------------------------------------------------
*event_ホテル・クイーン_0
;[exp] ! inHouse

@delevent
@jump storage="main11.scn" target=*hotel_1

[townoff]
;------------------------------------------------------------------------------
*event_ホテル・クイーン_1
;[exp] SUNSET

; 夜の主人公イベントへ
@delevent
@wait time=1000

; ☆フリーモード
@jump storage="free02.scn" target=*hotel_5 cond='game.isFreeMode'

@eval exp='game.curChara = o.テオ.getRoomMates()[0]'
@jump storage="main11.scn" target=*hotel_1 cond='game.curChara === void'
@jump storage="main11.scn" target=*hotel_wife_1 cond='game.curChara.married'
@jump storage="heroine01b.scn" target=*hotel_theo_1 cond='game.curChara == o.リム'
@jump storage="heroine02b.scn" target=*hotel_theo_1 cond='game.curChara == o.クレア'
@jump storage="heroine03b.scn" target=*hotel_theo_1 cond='game.curChara == o.フレデリカ'
@jump storage="heroine04b.scn" target=*hotel_theo_1 cond='game.curChara == o.ミューズ'
@jump storage="heroine05b.scn" target=*hotel_theo_1 cond='game.curChara == o.マルエット'

[hoteloff]
;------------------------------------------------------------------------------
*event_ホテル・クイーン_6
;[exp] ! game.isFreeMode && SUNSET

[texton]
[nw][b]The sensual atmosphere of the love hotel affected the party mood![/nw][/b][k]
[textoff]
@se f=period
@eval exp='game.party.changeHeat(20)'
@notice text="<y>Everyone's lust increased by <p>20<y>!"

[hoteloff end]
;------------------------------------------------------------------------------
*event_冒険者の宿_10
;[exp] inHouse
*event_ホテル琥珀_1
;[exp] inHouse
*event_潮風のペンション_1
;[exp] inHouse
*event_雪の宿_0
;[exp] inHouse

; マックスとライナスの会話
@delevent name=冒険者の宿 num=10
@delevent name=ホテル琥珀 num=1
@delevent name=潮風のペンション num=1
@delevent name=雪の宿 num=0
@jump storage="main08.scn" target=*linus_3

[hoteloff]
;----------------------------------------------------------------------------------------
*event_世界一の道具店_0
;[exp] inHouse

@delevent
[texton]
[name n=Nora f=nora_00]「Welcome! [r]This is the best tool store in the world! We have the best selection and the cheapest prices in the world!」[k]
[name n=Nora f=nora_01]「What? Not much different from the others?」[k]
[name n=Nora f=nora_00]「No, it's not true～[r]It's all in your mind! [r]It's definitely more economical to buy from us～!」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_世界一の道具店_1
;[exp] inHouse

@delevent
@addevent name=世界一の道具店 num=2
@jump storage="main05.scn" target=*comb_1

[shopoff]
;----------------------------------------------------------------------------------------
*event_世界一の道具店_2
;[exp] inHouse && game.party.hasItem(o.リーゼルの髪飾り)

@delevent
@jump storage="main05.scn" target=*comb_2

[shopoff]
;----------------------------------------------------------------------------------------
*event_世界一の道具店_4
;[exp] inHouse

@delevent
@jump storage="heroine03a.scn" target=*theo_03

[shopoff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_0
;[exp] ! inHouse

@delevent
@eval exp='o.盗賊メンバー派遣の依頼.accepted = true'
@jump storage="main04.scn" target=*city_2

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_2
;[exp] inHouse

@delevent
@wait time=500
[texton]
[name n=Vetrinus f=vetrinus_00]「Ohohoho! this is Vetrinus' Bar! Welcome, here I am!」[k]
[name n=Vetrinus f=vetrinus_02]「Enjoy plenty of delicious sake and food at this[r]amazing shop!」[k]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_10
;[exp] inHouse && ! isDemoVersion

@delevent
@wait time=500
[texton]
[客]「There is a tournament every Sunday in the arena!」[k]
[客]「If you're confident in your skills, you should join regularly! It's a good money-maker and you get prizes!」[k]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_11
;[exp] ! inHouse

; ライナス加入
@delevent
@addevent name=冒険者の宿 num=10
@addevent name=ホテル琥珀 num=1
@addevent name=潮風のペンション num=1
@addevent name=雪の宿 num=0
@jump storage="main08.scn" target=*linus_2

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_12
;[exp] inHouse && game.date >= f.dayDiscoverHideoutsQuestAccepted + 2

; この後「オークの拠点を制圧せよ」を受領すると、警備隊長が外出済みになってしまう
; さっきまで会話していた相手がいきなりいなかった事になるのは不自然なので
; このクエストは「ワイルド・ブルのアジトを探せ」を受けてから２日後に発生させる
@delevent
@eval exp='o.ベトリヌスの酒場.quests.add(o.オークの拠点を制圧せよ)'
@eval exp='o.ベトリヌスの酒場.events.push2(17, 16, 13)' cond='game.isFreeMode'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_13
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests() && ! f.policeChiefIsOut

@delevent
@eval exp='o.ベトリヌスの酒場.quests.push2(o.売春組織の実体を暴け)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_14
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests() && game.date >= o.スライム軍団の討伐.end + 10

@delevent
@eval exp='o.ベトリヌスの酒場.quests.add(o.オーケストラを作りたい)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_15
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests() && game.date >= o.オーケストラを作りたい.end + 10

@delevent
@eval exp='o.ベトリヌスの酒場.quests.add(o.飛び入り参加求む！)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_16
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests()

@delevent
@eval exp='o.ベトリヌスの酒場.quests.add(o.人身売買の証拠をつかめ)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_17
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests() && ! f.policeChiefIsOut

@delevent
@eval exp='o.ベトリヌスの酒場.quests.push2(o.教団を壊滅させろ)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_18
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests() && o.ワイルド・ブルのアジトを探せ.completed

@delevent
@eval exp='o.ベトリヌスの酒場.quests.unshift(o.ワイルド・ブル壊滅作戦)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_23
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests() && f.encounterWildBullAlready

; ※フリーモード用
@delevent
@eval exp='o.ベトリヌスの酒場.quests.unshift(o.ワイルド・ブルのアジトを探せ)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_24
;[exp] inHouse && o.ベトリヌスの酒場.hasSpaceOfQuests()

; ※フリーモード用
@delevent
@eval exp='o.ベトリヌスの酒場.quests.add(o.若さを維持したい)'

[baroff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_25
;[exp] inHouse && game.getCharaBlushing(100) !== void

; 恥ずかしい格好イベント
@delevent
@addevent name=サファイアシティ num=12
@eval exp='f.dayOfNakedHeroineEvent = game.date'
@call storage="speech.ks" target=*_sexy_costumes

[baroff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_0
;[exp] ! inHouse

[texton]
[マリア f=02]「This is the guild. This is where you can add new members and reorganize your party.」[k]
[マリア f=02]「Let's head to the bar first though.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_1
;[exp] ! inHouse

@delevent
@addevent num=2
@addevent num=3
@addevent num=4 cond='! game.isFreeMode'
@addevent name=サファイアシティ num=1 cond='! game.isFreeMode'
@eval exp='f.defaultCharactorCount = o.王立ギルド.members.count + game.party.members.count'
@jump storage="main04.scn" target=*city_3

[townoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_2
;[exp] f.defaultCharactorCount > o.王立ギルド.members.count + game.party.members.count

; プレイヤーがキャラを削除した
@eval exp='f.defaultCharactorCount = o.王立ギルド.members.count + game.party.members.count'

[guildoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_3
;[exp] f.defaultCharactorCount < o.王立ギルド.members.count + game.party.members.count

@delevent
@delevent num=2
@wait time=500
[texton]
[受付 f=desk_00]「Your new companion has been successfully registered.」[k]
[受付 f=desk_00]「Use "Add Member" to have the newly created character[r]join you.」[k]
[textoff]

[guildoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_4
;[exp] game.party.members.count >= 4

@delevent
@wait time=500
[texton]
[受付 f=desk_00]「You now have the minimum 4 members[r]needed for an adventure.」[k]
[受付 f=desk_00]「Let's go on an adventure right away. Go into town,[r]equip yourself, and head to the dungeon.」[k]
[受付 f=desk_00]「Of course, you can increase the number of members.[r]The more you have, the safer you are.」[k]
[textoff]

[guildoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_5
;[exp] inHouse

@delevent
@jump storage="main04.scn" target=*tutorial_4

[guildoff]
;----------------------------------------------------------------------------------------
*event_待合所_0
;[exp] ! inHouse

[texton]
[マリア f=02]「This is a waiting area, which is a different facility from the guild.」[k]
[マリア f=02]「Let's head to the bar first though.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_待合所_2
;[exp] inHouse

@delevent
@wait time=500
[texton]
[受付 f=desk_01]「This is a waiting area.」[k]
[受付 f=desk_01]「Characters who couldn't join the party, or who[r]were forced to leave wait here.」[k]
[受付 f=desk_01]「If that happens, please look for them here.」[k]
[受付 f=desk_01]「You can't create characters or change jobs here.[r]Please use another guild.」[k]
[textoff]

[guildoff]
;----------------------------------------------------------------------------------------
*event_サファイア城_0
;[exp] ! inHouse

[texton]
[マリア f=02]「This is a castle. The Sapphire Kings who rule this country live here.」[k]
[マリア f=02]「You can't enter without the King's permission, so nothing for us here.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイア城_2
;[exp] ! inHouse && ! game.party.hasItem(o.入城許可証)

[texton]
[name n=Guard]「No one without a permit is allowed inside. Go home!」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイア城_3
;[exp] inHouse

@delevent
@addevent map=ポラリスの神殿 num=2
@jump storage="main04.scn" target=*shrine_1

[otheroff]
;----------------------------------------------------------------------------------------
*event_サファイア城_4
;[exp] inHouse

@delevent
@jump storage="main04.scn" target=*shrine_6

[otheroff]
;----------------------------------------------------------------------------------------
*event_サファイア城_16
;[exp] inHouse

@delevent
@eval exp='f.fionaHasSeduced = true'
@jump storage="others01.scn" target=*fiona_trophy

[otheroff]
;----------------------------------------------------------------------------------------
*event_アイテム保管庫_0
;[exp] ! inHouse

[texton]
[マリア f=02]「It's a warehouse. They'll take care of the stuff you can't carry.」[k]
[マリア f=02]「They say you can also collect the luggage of the friends you parted company with along the way here.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_闘技場_0
;[exp] ! inHouse

[texton]
[name n=Attendant]「No matches are currently being held.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_闘技場_2
;[exp] ! inHouse

[texton]
[name n=Attendant]「This is the arena reception desk. Are you a participant?」[k]
[textoff]
@question title="Would you like to enter the arena?"
[townoff cond='! tf.result']
@delevent
@addevent name=闘技場 num=3
@jump storage="main06.scn" target=*tournament_5

[townoff]
;----------------------------------------------------------------------------------------
*event_闘技場_3
;[exp] ! inHouse

@question title="Start the second round?"
[townoff cond='! tf.result']
@delevent
@addevent name=闘技場 num=4
@jump storage="main06.scn" target=*tournament_6

[townoff]
;----------------------------------------------------------------------------------------
*event_闘技場_4
;[exp] ! inHouse

@question title="Start the semi-finals?"
[townoff cond='! tf.result']
@delevent
@addevent name=闘技場 num=5
@jump storage="main06.scn" target=*tournament_7

[townoff]
;----------------------------------------------------------------------------------------
*event_闘技場_5
;[exp] ! inHouse

@question title="Start the final?"
[townoff cond='! tf.result']
@delevent
@addevent name=闘技場 num=0
@jump storage="main06.scn" target=*tournament_8

[townoff]
;----------------------------------------------------------------------------------------
*event_公園_0
;[exp] ! inHouse

[texton]
[マリア f=02]「It's a park. It's a place for everyone to relax.」[k]
[マリア f=02]「Maybe take a little visit to take your mind off your adventures.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_公園_3
;[exp] ! inHouse

@delevent name=公園 num=3
@delevent name=王立ギルド num=6
@delevent name=待合所 num=3
@delevent name=ベトリヌスの酒場 num=4
@delevent name=冒険者の宿 num=4
@delevent name=サファイア城 num=6
@delevent name=闘技場 num=1
@addevent name=闘技場 num=0
@jump storage="main06.scn" target=*tournament_3

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・北西門_0
;[exp] ! inHouse
*event_サファイアシティ・北東門_0
;[exp] ! inHouse
*event_サファイアシティ・南西門_0
;[exp] ! inHouse
*event_サファイアシティ・南東門_0
;[exp] ! inHouse

[texton]
[マリア f=02]「This is the gate that leads out of town. There are four gates in total in Sapphire City.」[k]
[マリア f=02]「There's no point in going out of town now. Let's go around town.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_下水道入口_0
;[exp] ! inHouse

[texton]
[マリア f=02]「This is the sewer entrance.」[k]
[マリア f=02]「It's dirty and there's nothing inside. Let's go somewhere else.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_待合所_1
;[exp] ! inHouse
*event_冒険者の宿_1
;[exp] ! inHouse
*event_ベトリヌスの酒場_1
;[exp] ! inHouse
*event_サファイア城_1
;[exp] ! inHouse
*event_公園_1
;[exp] ! inHouse
*event_サファイアシティ・北西門_1
;[exp] ! inHouse
*event_サファイアシティ・北東門_1
;[exp] ! inHouse
*event_サファイアシティ・南西門_1
;[exp] ! inHouse
*event_サファイアシティ・南東門_1
;[exp] ! inHouse
*event_下水道入口_1
;[exp] ! inHouse

[texton]
[テオ]「Let's go to the guild rather than that now.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_3
;[exp] ! inHouse
*event_冒険者の宿_3
;[exp] ! inHouse
*event_サファイア城_5
;[exp] ! inHouse
*event_公園_2
;[exp] ! inHouse
*event_サファイアシティ・北西門_2
;[exp] ! inHouse
*event_サファイアシティ・北東門_2
;[exp] ! inHouse
*event_サファイアシティ・南西門_2
;[exp] ! inHouse
*event_下水道入口_2
;[exp] ! inHouse

[texton]
[テオ]「We need to go stop the golem as soon as possible.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・北西門_3
;[exp] ! inHouse
*event_サファイアシティ・北東門_3
;[exp] ! inHouse
*event_サファイアシティ・南西門_3
;[exp] ! inHouse
*event_サファイアシティ・南東門_2
;[exp] ! inHouse
*event_下水道入口_3
;[exp] ! inHouse

[texton]
[テオ]「Let's not go out unnecessarily.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_6
;[exp] ! inHouse
*event_待合所_3
;[exp] ! inHouse
*event_ベトリヌスの酒場_4
;[exp] ! inHouse
*event_冒険者の宿_4
;[exp] ! inHouse
*event_サファイア城_6
;[exp] ! inHouse
*event_闘技場_1
;[exp] ! inHouse

[texton]
[テオ]「You're not here... 」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_5
;[exp] ! inHouse
*event_冒険者の宿_5
;[exp] ! inHouse
*event_サファイア城_7
;[exp] ! inHouse
*event_公園_4
;[exp] ! inHouse

[texton]
[テオ]「That's not what we should be doing right now.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・北西門_4
;[exp] ! inHouse
*event_サファイアシティ・北東門_4
;[exp] ! inHouse
*event_サファイアシティ・南西門_4
;[exp] ! inHouse
*event_サファイアシティ・南東門_4
;[exp] ! inHouse
*event_下水道入口_4
;[exp] ! inHouse
*event_王立ギルド_7
;[exp] ! inHouse
*event_待合所_4
;[exp] ! inHouse
*event_ベトリヌスの酒場_6
;[exp] ! inHouse
*event_冒険者の宿_6
;[exp] ! inHouse
*event_サファイア城_8
;[exp] ! inHouse
*event_闘技場_6
;[exp] ! inHouse

[texton]
[テオ]（Today I have a date with Riselle at the park. Let's hurry.）[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_公園_5
;[exp] ! inHouse

@jump storage="main07.scn" target=*liesel_1

[townoff]
;----------------------------------------------------------------------------------------
*event_海岸ギルド_0
;[exp] ! inHouse
*event_潮風のペンション_0
;[exp] ! inHouse
*event_かもめ亭_1
;[exp] ! inHouse
*event_シーガルの村・北門_0
;[exp] ! inHouse
*event_シーガルの村・東門_1
;[exp] ! inHouse
*event_シーガルの村・南門_1
;[exp] ! inHouse

[texton]
[テオ]（Today, Riselle and I are going to swim on the beach in Seagull Village. Let's go quickly.）[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*event_砂浜_0
;[exp] ! inHouse

@jump storage="main07.scn" target=*liesel_2

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・北西門_5
;[exp] ! inHouse
*event_サファイアシティ・北東門_5
;[exp] ! inHouse
*event_サファイアシティ・南西門_5
;[exp] ! inHouse
*event_サファイアシティ・南東門_3
;[exp] ! inHouse
*event_下水道入口_5
;[exp] ! inHouse

[texton]
[テオ]（What am I doing in a place like this?）[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_8
;[exp] ! inHouse
*event_待合所_5
;[exp] ! inHouse
*event_マリオン武器工房_0
;[exp] ! inHouse
*event_鎧屋ドミンゴ_0
;[exp] ! inHouse
*event_世界一の道具店_3
;[exp] ! inHouse
*event_ドロシーの魔法店_0
;[exp] ! inHouse
*event_アウラ中央教会_2
;[exp] ! inHouse
*event_イーラ中央寺院_2
;[exp] ! inHouse
*event_アイテム保管庫_1
;[exp] ! inHouse
*event_アイテム博物館_0
;[exp] ! inHouse

[texton]
[テオ]（This place is off limits on fireworks day.）[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_7
;[exp] ! inHouse
*event_冒険者の宿_7
;[exp] ! inHouse
*event_サファイア城_9
;[exp] ! inHouse
*event_闘技場_7
;[exp] ! inHouse

[texton]
[テオ]（Too many people here might spoil the mood.）[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_公園_6
;[exp] ! inHouse

[iscript]
o.ベトリヌスの酒場.events = [8];
o.冒険者の宿.events = [8];
o.サファイア城.events = [10];
o.闘技場.events = [8];
o.公園.events = [7];
[endscript]

@jump storage="main07.scn" target=*liesel_3

[townoff]
;----------------------------------------------------------------------------------------
*event_冒険者の宿_8
;[exp] ! inHouse
*event_サファイア城_10
;[exp] ! inHouse
*event_闘技場_8
;[exp] ! inHouse
*event_公園_7
;[exp] ! inHouse

[texton]
[テオ]（Let's take Riselle to dinner first.）[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_8
;[exp] ! inHouse

[iscript]
o.ベトリヌスの酒場.events = [9];
o.冒険者の宿.events = [9];
o.サファイア城.events = [11];
o.闘技場.events = [9];
o.公園.events = [8];
[endscript]

@jump storage="main07.scn" target=*liesel_4

[townoff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_9
;[exp] ! inHouse
*event_冒険者の宿_9
;[exp] ! inHouse
*event_サファイア城_11
;[exp] ! inHouse
*event_闘技場_9
;[exp] ! inHouse

[texton]
[テオ]（Let's go to the place I checked out earlier where we can get a good view of the fireworks.）[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_公園_8
;[exp] ! inHouse

@jump storage="main07.scn" target=*liesel_5

[townoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_9
;[exp] ! inHouse
*event_待合所_6
;[exp] ! inHouse
*event_ベトリヌスの酒場_19
;[exp] ! inHouse
*event_ホテル・クイーン_2
;[exp] ! inHouse
*event_サファイア城_12
;[exp] ! inHouse
*event_公園_9
;[exp] ! inHouse
*event_闘技場_10
;[exp] ! inHouse

@eval exp='game.curChara = game.chara[f.walkingHumanID]'
[texton]
[テオ]「You're not here... 」[k]
Where the hell did [リム] go?[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_冒険者の宿_11
;[exp] ! inHouse

@eval exp='game.curChara = game.chara[f.walkingHumanID]'
[texton]
[テオ]「I have to find [リム] now.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_冒険者の宿_12
;[exp] ! inHouse

@delevent
@addevent name=冒険者の宿 num=11
@eval exp='game.curChara = game.chara[f.walkingHumanID]'
@jump storage="heroine01b.scn" target=*theo_10

[townoff]
;----------------------------------------------------------------------------------------
*event_冒険者の宿_13
;[exp] ! inHouse

@jump storage="heroine01b.scn" target=*theo_14

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・北西門_6
;[exp] ! inHouse
*event_サファイアシティ・北東門_6
;[exp] ! inHouse
*event_下水道入口_6
;[exp] ! inHouse
*event_王立ギルド_10
;[exp] ! inHouse
*event_待合所_7
;[exp] ! inHouse
*event_ベトリヌスの酒場_20
;[exp] ! inHouse
*event_冒険者の宿_15
;[exp] ! inHouse
*event_ホテル・クイーン_3
;[exp] ! inHouse
*event_サファイア城_13
;[exp] ! inHouse
*event_公園_10
;[exp] ! inHouse
*event_闘技場_11
;[exp] ! inHouse
*event_シーガルの村・南門_2
;[exp] ! inHouse
*event_海岸ギルド_1
;[exp] ! inHouse
*event_潮風のペンション_3
;[exp] ! inHouse
*event_かもめ亭_9
;[exp] ! inHouse

@eval exp='game.curChara = game.chara[f.kidnappedElfID]'
[texton]
This is no time to take a detour. We must rescue [クレア] as soon as possible.
 [k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・北西門_7
;[exp] ! inHouse
*event_サファイアシティ・北東門_7
;[exp] ! inHouse
*event_サファイアシティ・南西門_6
;[exp] ! inHouse
*event_サファイアシティ・南東門_5
;[exp] ! inHouse
*event_下水道入口_7
;[exp] ! inHouse
*event_王立ギルド_11
;[exp] ! inHouse
*event_待合所_8
;[exp] ! inHouse
*event_冒険者の宿_16
;[exp] ! inHouse
*event_ホテル・クイーン_4
;[exp] ! inHouse
*event_マリオン武器工房_1
;[exp] ! inHouse
*event_鎧屋ドミンゴ_1
;[exp] ! inHouse
*event_世界一の道具店_5
;[exp] ! inHouse
*event_ドロシーの魔法店_1
;[exp] ! inHouse
*event_アウラ中央教会_3
;[exp] ! inHouse
*event_イーラ中央寺院_3
;[exp] ! inHouse
*event_アイテム保管庫_2
;[exp] ! inHouse
*event_サファイア城_14
;[exp] ! inHouse
*event_公園_11
;[exp] ! inHouse
*event_闘技場_12
;[exp] ! inHouse
*event_アイテム博物館_1
;[exp] ! inHouse

[texton]
[テオ e=通常]「Let's take [フレデリカ] out to dinner now.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_ベトリヌスの酒場_21
;[exp] ! inHouse

@delevent
@addevent name=フレデリカ num=5
@delevent name=サファイアシティ・北西門 num=7
@delevent name=サファイアシティ・北東門 num=7
@delevent name=サファイアシティ・南西門 num=6
@delevent name=サファイアシティ・南東門 num=5
@delevent name=下水道入口 num=7
@delevent name=王立ギルド num=11
@delevent name=待合所 num=8
@delevent name=冒険者の宿 num=16
@delevent name=ホテル・クイーン num=4
@delevent name=マリオン武器工房 num=1
@delevent name=鎧屋ドミンゴ num=1
@delevent name=世界一の道具店 num=5
@delevent name=ドロシーの魔法店 num=1
@delevent name=アウラ中央教会 num=3
@delevent name=イーラ中央寺院 num=3
@delevent name=アイテム保管庫 num=2
@delevent name=サファイア城 num=14
@delevent name=公園 num=11
@delevent name=闘技場 num=12
@delevent name=アイテム博物館 num=1
@delevent name=ベトリヌスの酒場 num=21
@eval exp='game.hour = "midnight"'
@eval exp='o.サファイアシティ.img = "town_sapphire"'
@jump storage="heroine03a.scn" target=*theo_06

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・北西門_8
;[exp] ! inHouse
*event_サファイアシティ・北東門_8
;[exp] ! inHouse
*event_サファイアシティ・南西門_7
;[exp] ! inHouse
*event_下水道入口_8
;[exp] ! inHouse

[texton]
[テオ f=06]「The mountain top that [マルエット] was talking about can't be much further ahead...」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_王立ギルド_12
;[exp] ! inHouse
*event_待合所_9
;[exp] ! inHouse
*event_ベトリヌスの酒場_22
;[exp] ! inHouse
*event_冒険者の宿_17
;[exp] ! inHouse
*event_ホテル・クイーン_5
;[exp] ! inHouse
*event_サファイア城_15
;[exp] ! inHouse
*event_公園_12
;[exp] ! inHouse
*event_闘技場_13
;[exp] ! inHouse

[texton]
[テオ f=06]「I have to go to that mountain top with [マルエット].」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_サファイアシティ・南東門_6
;[exp] ! inHouse
*event_シーガルの村・東門_2
;[exp] ! inHouse

@se f=buzzer
@notice text="<y>You cannot proceed beyond this point in the trial version."

[townoff]
;----------------------------------------------------------------------------------------


; ブレイブタウン
;----------------------------------------------------------------------------------------
*event_ブレイブタウン_0
;[exp] true

@delevent
@wait time=500
[texton]
[テオ]「Okay, I managed to complete the request.」[k]
[テオ]「After finishing a quest, I have to report it to the [b]bar[/b]. I need to get paid by the client.」[k]
[textoff]

@delevent
@addevent num=1
@addevent name=森の中の廃屋入口 num=0

[townoff]
;----------------------------------------------------------------------------------------
*event_ブレイブタウン_1
;[exp] o.赤いネックレスを探してほしい.completed

@delevent
@jump storage="trial.scn" target=*skip_past cond='isDemoVersion'
@jump storage="main02.scn" target=*past_1

[townoff]
;----------------------------------------------------------------------------------------
*event_ブレイブタウン_2
;[exp] true

@delevent
@jump storage="main02.scn" target=*town_2

[townoff]
;----------------------------------------------------------------------------------------
*event_ブレイブタウン_3
;[exp] true

@delevent
[texton]
[テオ]「I finally came back to this town... Not that I wanted to, but...」[k]
[テオ]「The Blue Familia base is here... They'll probably be there.」[k]
[テオ]「...I'm worried about Riselle. Maybe we should go see her.」[k]
[textoff]
@eval exp='o.リーゼル.pregnant = 0'

[townoff]
;----------------------------------------------------------------------------------------
*event_ブレイブタウン_4
;[exp] true

@delevent
@addevent name=エミール平原 num=9
@addevent name=マルティナの酒場 num=8
@addevent name=ホテル琥珀 num=2
@addevent name=自宅 num=3
@addevent name=ブルーのアジト num=2
@addevent name=ブレイブタウン・北門 num=1
@addevent name=森の中の廃屋入口 num=4
@addevent name=町外れの遺跡入口 num=2
@eval exp='o.エミール平原.antiWarp = true'
@changefloor map=エミール平原 x=10 y=38 type=block pimg=woods
@changefloor map=エミール平原 x=14 y=31 type=block pimg=woods
@changefloor map=エミール平原 x=18 y=33 type=block pimg=woods
@eval exp='game.party.recovery()'
@jump storage="main11.scn" target=*troll_2

[townoff]
;----------------------------------------------------------------------------------------
*event_ブレイブタウン_5
;[exp] true

@delevent
@delevent name=冒険者の宿 num=14
@delevent name=ホテル琥珀 num=3
@delevent name=潮風のペンション num=2
@delevent name=雪の宿 num=1
@delevent name=大洞窟ホテル num=0
@delevent name=簡易宿泊所 num=1
@eval exp='game.wife.events.remove(13)'
@eval exp='game.wife.booking.remove(3)'
@eval exp='game.party.recovery()'
@jump storage="main12.scn" target=*revive_3

[townoff]
;----------------------------------------------------------------------------------------
*event_ブレイブタウン_6
;[exp] f.dayOfNakedHeroineEvent < game.date

; 恥ずかしい格好イベントを復帰
@delevent
@addevent name=マルティナの酒場 num=7

[townoff]
;----------------------------------------------------------------------------------------
*event_ホテル琥珀_0
;[exp] ! inHouse

[texton]
[テオ]「I have my own place, so don't bother staying at the inn.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_剣の店リーネ_0
;[exp] inHouse

@delevent
[texton]
[name n=Leane f=leane_00]「We specialize in swords, so if it's swords you're after, we've got you covered.」[k]
[name n=Leane f=leane_02]「...Or so I'd say, but we just opened and don't have much in stock yet. Sorry about that.」[k]
[name n=Leane f=leane_01]「Also, you can appraise items, repair items, and remove cursed items here.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_剣の店リーネ_1
;[exp] inHouse

@delevent
[texton]
[name n=Leane f=leane_00]「We have a lot of new swords in stock. Please take your time to look around.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_アイザック防具店_0
;[exp] inHouse

@delevent
[texton]
[name n=Isaac f=isaac_00]「This is an armor store. Please take your time.」[k]
[name n=Isaac f=isaac_00]「You can appraise and repair items, and[r]even remove cursed items.」[k]
[name n=Isaac f=isaac_00]「Unfortunately, we're a little behind right now, and don't have a lot of products available, but bear with us.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_アイザック防具店_1
;[exp] inHouse

@delevent
[texton]
[name n=Isaac f=isaac_00]「We have a lot of new armor in stock. Please take a look.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_ドナの道具屋_0
;[exp] inHouse

@delevent
[texton]
[ドナ]「This is Donna's shop. Please buy a lot.」[k]
[ドナ]「You can also identify, repair, and remove cursed items.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_ドナの道具屋_1
;[exp] inHouse

@delevent
[texton]
[ドナ]「A lot of new items have arrived. Please take your time to look around.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_森の中の廃屋入口_0
;[exp] ! inHouse

[texton]
[テオ]「I don't need to be here any more. Let's get to the bar quickly and report our findings.」[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*event_森の中の廃屋入口_1
;[exp] ! inHouse

[texton]
[ブルー f=05]「Hey, where are you going? We're going to the ruins on the outskirts of town. Did you hear what I said?」[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*event_森の中の廃屋入口_2
;[exp] ! inHouse
*event_町外れの遺跡入口_0
;[exp] ! inHouse

[texton]
[マックス]「We're done here, aren't we? Let's just look for Blue and the others.
 」[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_0
;[exp] inHouse

@delevent
@wait time=500
[texton]
[マルティナ]「Welcome to Martina's Tavern.」[k]
[マルティナ]「You can eat, collect [b]information[/b] and undertake[r][b]quests[/b] here.」[k]
[マルティナ]「If you want to report a completed quest, select the quest you received from the [b]Quest List[/b]. You can then report the outcome to the client!」[k]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_1
;[exp] ! inHouse

@delevent
@jump storage="main02.scn" target=*escape_1

[baroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_3
;[exp] inHouse

@delevent
@eval exp='game.curBar.curTalk = 3'
@wait time=500
[texton]
[マルティナ f=01]「Welcome... Oh, you've been here before...!」[k]
[マルティナ]「Please make yourself at home. Also, this is a good opportunity to catch up on gossip. It may have changed since the last time you were here.」[k]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_4
;[exp] ! inHouse && o.リーゼル.slaveTerm <= 20

; リーゼルと酒場で再会するイベント
; この後すぐに再度アジトを訪れても中に入れないようにする
@delevent
@addevent name=ブルーのアジト num=1
@addevent name=全般 num=49
@jump storage="main08.scn" target=*revenge_2

[baroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_5
;[exp] inHouse && game.date >= o.赤いネックレスを探してほしい.end + 10

@delevent
@eval exp='o.マルティナの酒場.quests.remove(o.赤いネックレスを探してほしい)'
@eval exp='o.マルティナの酒場.quests.add(o.兄に手紙を届けてくれ)'

[baroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_6
;[exp] inHouse && game.date >= o.黄金の人魚像を探してほしい.end + 10

@delevent
@eval exp='o.マルティナの酒場.quests.remove(o.黄金の人魚像を探してほしい)'
@eval exp='o.マルティナの酒場.quests.add(o.銀のユニコーン像)'

[baroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_7
;[exp] inHouse && game.getCharaBlushing(100) !== void

; 恥ずかしい格好イベント
@delevent
@addevent name=ブレイブタウン num=6
@eval exp='f.dayOfNakedHeroineEvent = game.date'
@call storage="speech.ks" target=*_sexy_costumes

[baroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_2
;[exp] ! inHouse
*event_森の中の廃屋入口_3
;[exp] ! inHouse
*event_町外れの遺跡入口_1
;[exp] ! inHouse
*event_自宅_2
;[exp] ! inHouse

[texton]
[テオ]「I don't need to be here any more. Let's refrain from any conspicuous behavior now.」[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*event_自宅_0
;[exp] ! inHouse

[texton]
[マックス]「Better yet, let's get to the bar and report back on our accomplishments!」[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*event_自宅_1
;[exp] ! inHouse

[texton]
[マックス]「Let's look for Blue and the others quickly!」[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*event_ブルーのアジト_0
;[exp] ! inHouse

; アジトでブルーに初めて会う
; この後すぐに再度アジトを訪れても中に入れないようにする
@delevent
@addevent name=ブルーのアジト num=1
@addevent name=全般 num=48
@jump storage="main08.scn" target=*revenge_1

[eventoff]
;----------------------------------------------------------------------------------------
*event_ブルーのアジト_1
;[exp] ! inHouse

; 再びすぐにアジトを訪れてもアジトには入れない
[texton]
Riselle isn't here today. Let's try another day.[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*event_ブレイブタウン・北門_0
;[exp] ! inHouse

@question title="Would you like to leave town? Once you leave, you won't be able to come back for a while!"
@jump storage="main02.scn" target=*escape_2 cond='tf.result'

[otheroff]
;----------------------------------------------------------------------------------------
*event_マルティナの酒場_8
;[exp] ! inHouse
*event_ホテル琥珀_2
;[exp] ! inHouse
*event_自宅_3
;[exp] ! inHouse
*event_ブルーのアジト_2
;[exp] ! inHouse
*event_ブレイブタウン・北門_1
;[exp] ! inHouse
*event_森の中の廃屋入口_4
;[exp] ! inHouse
*event_町外れの遺跡入口_2
;[exp] ! inHouse

[texton]
An army of trolls is closing in. We must defeat them quickly.[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*event_冒険者の宿_14
;[exp] inHouse && ! MORNING
*event_ホテル琥珀_3
;[exp] inHouse && ! MORNING
*event_潮風のペンション_2
;[exp] inHouse && ! MORNING
*event_雪の宿_1
;[exp] inHouse && ! MORNING
*event_大洞窟ホテル_0
;[exp] inHouse && ! MORNING
*event_簡易宿泊所_1
;[exp] inHouse && ! MORNING

@delevent name=冒険者の宿 num=14
@delevent name=ホテル琥珀 num=3
@delevent name=潮風のペンション num=2
@delevent name=雪の宿 num=1
@delevent name=大洞窟ホテル num=0
@delevent name=簡易宿泊所 num=1
@jump storage="main12.scn" target=*wedding_03

[hoteloff]
;----------------------------------------------------------------------------------------


; シーガルの村
;----------------------------------------------------------------------------------------
*event_シーガルの村_0
;[exp] true

@delevent
@jump storage="main03.scn" target=*trip_3

[townoff]
;----------------------------------------------------------------------------------------
*event_シーガルの村_1
;[exp] true

@delevent
@addevent map=ランドン渓谷・崖上 num=7
@w05
[texton]
[name n=Villager]「Recently, it seems that [b]Wild Bull[/b], the infamous outlaw party, became active again.」[k]
[name n=Villager]「You should be careful when passing through the [b]Landon Canyon Pass[/b] to avoid being attacked by them.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_シーガルの村_2
;[exp] f.dayOfNakedHeroineEvent < game.date

; 恥ずかしい格好イベントを復帰
@delevent
@addevent name=かもめ亭 num=11

[townoff]
;----------------------------------------------------------------------------------------
*event_シーガルの村・東門_0
;[exp] ! inHouse
*event_シーガルの村・南門_0
;[exp] ! inHouse

[texton]
[シュバルツ]「Sapphire City is not that way. Go out the [b]north gate[/b] and follow the road north!」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_0
;[exp] inHouse

@delevent
@wait time=500
[texton]
[name n=Shopkeeper f=archer_blue_01]「Welcome～ What would you like to drink?」[k]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_2
;[exp] ! inHouse

; ミレディ加入
@delevent
@jump storage="main08.scn" target=*miredy_1

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_3
;[exp] inHouse && game.date >= o.怪鳥マッドウイングの羽.end + 5 && o.かもめ亭.hasSpaceOfQuests()

@delevent
@eval exp='o.かもめ亭.quests.push2(o.不死鳥フェニックスの羽)'


[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_4
;[exp] inHouse && game.date >= o.モデル募集.end + 10 && o.かもめ亭.hasSpaceOfQuests()

@delevent
@eval exp='o.かもめ亭.quests.push2(o.モデル募集その２)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_5
;[exp] inHouse && game.date >= o.モデル募集その２.end + 10 && o.かもめ亭.hasSpaceOfQuests()

@delevent
@eval exp='o.かもめ亭.quests.push2(o.モデル募集その３)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_6
;[exp] inHouse && game.date >= o.黄金のリンゴを届けてくれ.end + 5 && o.かもめ亭.hasSpaceOfQuests()

@delevent
@eval exp='o.かもめ亭.quests.push2(o.殺人バチの根絶)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_7
;[exp] inHouse && o.かもめ亭.hasSpaceOfQuests()

@delevent
@eval exp='o.かもめ亭.quests.push2(o.娘を助け出してほしい)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_8
;[exp] inHouse && game.date >= o.精霊の力を宿す石.end + 1 && o.かもめ亭.hasSpaceOfQuests()

@delevent
@eval exp='o.かもめ亭.quests.push2(o.倉庫整理のお仕事)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_10
;[exp] inHouse && o.かもめ亭.hasSpaceOfQuests()

; ※フリーモード用
@delevent
@eval exp='o.かもめ亭.quests.push2(o.夫の捜索)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_11
;[exp] inHouse && game.getCharaBlushing(100) !== void

; 恥ずかしい格好イベント
@delevent
@addevent name=シーガルの村 num=2
@eval exp='f.dayOfNakedHeroineEvent = game.date'
@call storage="speech.ks" target=*_sexy_costumes

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_12
;[exp] inHouse && o.かもめ亭.hasSpaceOfQuests()

; ※フリーモード用
@delevent
@addevent name=かもめ亭 num=14
@eval exp='o.かもめ亭.quests.unshift(o.精霊の力を宿す石)' cond='! o.かもめ亭.quests.has(o.精霊の力を宿す石)'
@eval exp='o.かもめ亭.quests.add(o.黄金のリンゴを届けてくれ)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_13
;[exp] inHouse && game.findItem(o.パワーブレスレット)

; ※フリーモード用
@delevent
; @eval exp='o.かもめ亭.quests.add(o.倉庫整理のお仕事)'

[baroff]
;----------------------------------------------------------------------------------------
*event_かもめ亭_14
;[exp] inHouse && o.かもめ亭.hasSpaceOfQuests()

@delevent
@eval exp='o.かもめ亭.quests.push2(o.世界グルメ紀行)'

[baroff]
;----------------------------------------------------------------------------------------
*event_海の男の武器店_0
;[exp] inHouse

@delevent
[texton]
[name n=Seaman f=bull_00]「This is a weapons store for men of the sea! With [r]our weapons, you can kill any giant fish with a single shot!」[k]
[name n=Seaman f=bull_00]「Is what I'd like to say... but we're a little low on stock right now. The selection isn't great, but give me a break.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_海の男の武器店_1
;[exp] inHouse

@delevent
[texton]
[name n=Seaman f=bull_00]「We got a bunch of new man weapons in stock! Go ahead, take a look!」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------


; ノースロップ村
;----------------------------------------------------------------------------------------
*event_ノースロップ村_0
;[exp] f.dayOfNakedHeroineEvent < game.date

; 恥ずかしい格好イベントを復帰
@delevent
@addevent name=山小屋パブ num=3

[townoff]
;----------------------------------------------------------------------------------------
*event_山小屋パブ_0
;[exp] inHouse

@delevent
@wait time=500
[texton]
[name n=Shopkeeper f=muriel_00]「Welcome～ Please take your time!」[k]
[textoff]
@addevent name=山小屋パブ num=2 cond='game.isFreeMode'

[baroff]
;----------------------------------------------------------------------------------------
*event_山小屋パブ_1
;[exp] inHouse

@delevent
@addevent name=温泉・岩場 num=1
@wait time=500
[texton]
[name n="Middle-aged woman"]「Oh, do you have a magic stone by any chance?」[k]
As we took our seats, a nearby middle-aged woman spoke to us.[k]
[テオ f=05]「Do you know about magic stones?」[k]
[name n="Middle-aged woman"]「Yes, I do. Because I had one myself.」[k]
[テオ f=05]「Eh?」[k]
That's unexpected. If the story is true, is it possible to get or borrow it from her?[k]
[テオ f=05]「You had one...?」[k]
[name n="Middle-aged woman"]「I lost it. A few months ago.」[k]
[テオ f=12]「What?!」[k]
[name n="Middle-aged woman"]「I used to wear that [b]Opal Magic Stone[/b] all the time, but then I dropped it.」[k]
[テオ f=12]「Y-you dropped it...?」[k]
[name n="Middle-aged woman"]「When I entered the open-air bath at the hot spring, I slipped and fell.」[k]
[name n="Middle-aged woman"]「Then the magic stone came off and rolled out of the open-air bath... right over a steep cliff next to it!」[k]
[テオ f=12]「So you didn't find it again?」[k]
[name n="Middle-aged woman"]「I gave up, since it fell somewhere I'd never be able to get to. Maybe the magic stone is still there.」[k]
[テオ f=10]「...」[k]
What a resigned woman. She doesn't seem to understand how precious the stone is.[k]
[テオ f=05]「What is the open-air bath called...?」[k]
[name n="Middle-aged woman"]「[b]Yanek Hot Springs[/b] is where it was. The Opal Magic Stone fell down the cliff outside the [b]women's open-air bath[/b].」[k]
[テオ f=06]「Okay... I understand. Thank you very much for your valuable information.」[k]
[name n="Middle-aged woman"]「What? Don't tell me you're going to go look for it?」[k]
[テオ f=06]「Yes. We really need that magic stone... 」[k]
[name n="Middle-aged woman"]「Honestly, I think it's going to be pretty hard to find that thing, so good luck with that. I don't need it anymore, so if you can find it, it's yours.」[k]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_山小屋パブ_2
;[exp] inHouse && game.getNumOfJewels() >= 1 && ! isDemoVersion

@delevent
@addevent name=温泉・岩場 num=1
@jump storage="free02.scn" target=*event_山小屋パブ_3

[baroff]
;----------------------------------------------------------------------------------------
*event_山小屋パブ_3
;[exp] inHouse && game.getCharaBlushing(100) !== void

; 恥ずかしい格好イベント
@delevent
@addevent name=ノースロップ村 num=0
@eval exp='f.dayOfNakedHeroineEvent = game.date'
@call storage="speech.ks" target=*_sexy_costumes

[baroff]
;----------------------------------------------------------------------------------------
*event_山小屋パブ_4
;[exp] inHouse && ! isDemoVersion

; ※フリーモード用。体験版では登場しないようにする
@delevent
@eval exp='o.山小屋パブ.quests.add(o.牢獄への潜入作戦)'

[baroff]
;----------------------------------------------------------------------------------------
*event_マジカル☆ウェンディ_0
;[exp] inHouse && ! isDemoVersion

@delevent
@addevent name=サファイアシティ num=11
@addevent name=ベトリヌスの酒場 num=11
@jump storage="main08.scn" target=*linus_1

[shopoff]
;----------------------------------------------------------------------------------------
*event_マジカル☆ウェンディ_1
;[exp] inHouse

@delevent
[texton]
[name n=Magician f=wendy_00]「Sorry for the wait ☆ Erase Magic spellbooks are now in stock!」[k]
[textoff]
@eval exp='game.closeItems.remove(o.イレースマジックの巻物)'

[shopoff]
;----------------------------------------------------------------------------------------


; 地下の町ライムストーン
;----------------------------------------------------------------------------------------
*event_地下の町ライムストーン_0
;[exp] true

; 少女のお礼と、悪魔が復活して思い悩むイベント
@delevent
@jump storage="main09.scn" target=*return_4

[townoff]
;----------------------------------------------------------------------------------------
*event_地下の町ライムストーン_1
;[exp] true

@delevent
@jump storage="main09.scn" target=*treasury_5

[townoff]
;----------------------------------------------------------------------------------------
*event_地下の町ライムストーン_2
;[exp] f.dayOfNakedHeroineEvent < game.date

; 恥ずかしい格好イベントを復帰
@delevent
@addevent name=大洞窟バル num=3

[townoff]
;----------------------------------------------------------------------------------------
*event_大洞窟バル_0
;[exp] inHouse

@delevent
@wait time=500
[texton]
[name n=Shopkeeper f=chloe_00]「Welcome. Please enjoy your stay.」[k]
[if exp='! game.isFreeMode && game.party.members.has(o.マックス)']
	[マックス f=94]「Ehehe... that shopkeeper is sexy...」[k]
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_大洞窟バル_1
;[exp] inHouse && game.findItem(o.ライトアーマー・上) !== void && game.findItem(o.ライトアーマー・下) !== void && game.date >= o.鎧のテスター募集.end + 5

@delevent
@eval exp='o.大洞窟バル.quests.remove(o.鎧のテスター募集)'
@eval exp='o.大洞窟バル.quests.add(o.鎧のテスター募集その２)'

[baroff]
;----------------------------------------------------------------------------------------
*event_大洞窟バル_2
;[exp] inHouse && game.findItem(o.女傑の鎧・上) !== void && game.findItem(o.女傑の鎧・下) !== void && game.date >= o.鎧のテスター募集その２.end + 5

@delevent
@eval exp='o.大洞窟バル.quests.remove(o.鎧のテスター募集その２)'
@eval exp='o.大洞窟バル.quests.add(o.鎧のテスター募集その３)'

[baroff]
;----------------------------------------------------------------------------------------
*event_大洞窟バル_3
;[exp] inHouse && game.getCharaBlushing(100) !== void

; 恥ずかしい格好イベント
@delevent
@addevent name=地下の町ライムストーン num=2
@eval exp='f.dayOfNakedHeroineEvent = game.date'
@call storage="speech.ks" target=*_sexy_costumes

[baroff]
;----------------------------------------------------------------------------------------
*event_ホークワロスの魔法店_0
;[exp] ! inHouse

[texton]
There was a poster on the door of the store:[r]
[b]"Currently out of town. Will be closed for a while."[/b][k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*event_ホークワロスの魔法店_1
;[exp] inHouse && (game.party.hasItem(o.マジカルボートの魔法書) || game.party.hasItem(o.マジカルボートの巻物))

@delevent
@eval exp='game.closeItems.remove(o.マジカルボートの巻物)'

[shopoff]
;----------------------------------------------------------------------------------------


; ダストウェルの町
;----------------------------------------------------------------------------------------
*event_ダストウェルの町_0
;[exp] true

@delevent
@eval exp='game.closeItems.remove(o.疾風の剣)'
@jump storage="main12.scn" target=*revive_1

[townoff]
;----------------------------------------------------------------------------------------
*event_ダストウェルの町_1
;[exp] true

; シュバルツが悪魔復活の報告に来る
@delevent
@addevent name=ブレイブタウン num=5
@jump storage="main12.scn" target=*revive_2

[townoff]
;----------------------------------------------------------------------------------------
*event_ダストウェルの町_2
;[exp] f.dayOfNakedHeroineEvent < game.date

; 恥ずかしい格好イベントを復帰
@delevent
@addevent name=町営食堂 num=1

[townoff]
;----------------------------------------------------------------------------------------
*event_町営食堂_0
;[exp] inHouse

@delevent
@wait time=500
[texton]
[name n=Shopkeeper f=wanda_00]「Oh, a visitor? That's unusual.」[k]
[name n=Shopkeeper f=wanda_00]「You've come all this way? Please take your time.」[k]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*event_町営食堂_1
;[exp] inHouse && game.getCharaBlushing(100) !== void

; 恥ずかしい格好イベント
@delevent
@addevent name=ダストウェルの町 num=2
@eval exp='f.dayOfNakedHeroineEvent = game.date'
@eval exp='game.curChara = game.getCharaBlushing(100)'
@wait time=500
@fgf c=キャラ f=25
[texton]
[キャラ f=25]「... ∗badump∗」[k]
[キャラ] was wearing revealing clothing. She entered the store with a nervous look on her face, but found only the owner and one other customer inside.[k]
[キャラ f=25]「... (Phew)」[k]
Normally this would have been embarrassing for [キャラ], but it seemed like there was no need to worry too much about it here.[k]
[textoff]
@clf

[baroff]
;----------------------------------------------------------------------------------------
*event_簡易宿泊所_0
;[exp] MORNING

@delevent
@addevent name=ダストウェルの町 num=1

[hoteloff]
;----------------------------------------------------------------------------------------


; 町外
;----------------------------------------------------------------------------------------
*event_ドナの行商_0
;[exp] inHouse && ! specialItem.has(o.行動力増加袋)

@delevent
@wait time=500
[texton w=0]
[ドナ f=15]「Oops, customers! Have a good look around!」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_森の魔法屋_0
;[exp] inHouse && (game.party.hasItem(o.ワープの巻物) || game.party.hasItem(o.ワープの魔法書))

@wait time=1000
@delevent
[texton]
[name n=Shopkeeper f=witch_other_01]「Oh, wait a minute!」[k]

[if exp='game.isFreeMode']
	The store owner called out to them while leaving.[k]
[else]
	[テオ f=05]「Hmm? What's wrong?」[k]
[endif]

[name n=Shopkeeper f=witch_other_01]「Right now, the warp network is down, so you can't use the [emb exp='o.ワープ.displayName'] spell.」[k]

[if exp='! game.isFreeMode']
	[テオ f=05]「What...?!」[k]
[endif]

That's disappointing. It seems after going to the trouble of obtaining warp magic, we can't actually warp.[k]
[name n=Shopkeeper f=witch_other_01]「To warp, you'd have to activate the four warp points.」[k]
[name n=Shopkeeper f=witch_other_01]「You see the treasure chest outside the store?」[k]
[name n=Shopkeeper f=witch_other_01]「Set the [b]four elemental plates[/b] in it on [b]four spirit pedestals[/b] in various places. Then you'll be able to warp.」[k]
[name n=Shopkeeper f=witch_other_01]「Please refer to [b]the associated memo[/b] to determine which plate to set on which pedestal. Well, good luck!」[k]
[textoff]

@se f=period
@getitem item=宝箱の鍵 message="<y>I received the key to the treasure chest from the owner!"

[shopoff]
;----------------------------------------------------------------------------------------
*event_スワロスの店_0
;[exp] inHouse

@delevent
[texton]
[name n=Swaros f=waroth_01]「This is Swaros' store. Please buy something from me.」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_スワロスの店_1
;[exp] inHouse && (game.party.hasItem(o.ミスティックアイの魔法書) || game.party.hasItem(o.ミスティックアイの巻物))

@delevent
@eval exp='game.closeItems.remove(o.ミスティックアイの巻物)'
@eval exp='game.closeItems.remove(o.パールリング)'

[shopoff]
;----------------------------------------------------------------------------------------
*event_スワロスの店_2
;[exp] inHouse && game.party.hasItem(o.ラピスラズリの魔石)

@delevent
@wait time=500
[texton]
[name n=Swaros f=waroth_01]「Hmmm! You're quite the connoisseur, aren't you?」[k]
[textoff]

[shopoff]
;----------------------------------------------------------------------------------------
*event_スワロスの店_3
;[exp] inHouse && game.getMembersWearingPanties([], true).count > 0

@delevent
[if exp='o.スワロスの店.events.has(0)']
	@delevent name=スワロスの店 num=0
	[texton]
	[name n=Swaros f=waroth_01]「This is Swaros' store. Please buy something from me.」[k]
	[textoff]
	@wait time=500
[endif]
@jump storage="quest.ks" target=*パンツコレクション_intro

[shopoff]
;----------------------------------------------------------------------------------------
*event_スワロスの店_4
;[exp] inHouse

@delevent
@jump storage="quest.ks" target=*パンツコレクション_0

[shopoff]
;----------------------------------------------------------------------------------------
*event_大人の魔法店_0
;[exp] inHouse && game.party.hasItem(o.ワームの毒液)

@wait time=500
[texton]
[name n=Devil f=succubus_10]「Oh my, you have [b]Worm Venom[/b]! [はーと]」[k]
[name n=Devil f=succubus_10]「Hey, can you give it to me? If you do, I'll sell you a nice spellbook.」[k]
[textoff]

@question title="Hand over the Worm Venom?"

[if exp='! tf.result']
	[texton]
	[name n=Devil f=succubus_11]「Eh～! You won't give it to me? Stingy!」[k]
	[shopoff]
	[textoff]
[endif]

[texton]
[name n=Devil f=succubus_10]「Thanks! [はーと] This tastes wonderful! [はーと]」[k]
[name n=Devil f=succubus_10]「As promised, I'll sell you a special new spellbook. Please buy lots of them! [はーと]」[k]
[textoff]
@eval exp='game.party.ejectItem(o.ワームの毒液)'
@eval exp='o.大人の魔法店.selection[6] = o.レザレクションの魔法書'
@eval exp='o.大人の魔法店.selection[7] = o.リペアの魔法書'
@eval exp='o.大人の魔法店.restockItems()'
@eval exp='game.itemWin.openBuyMode()'
@notice text="<y>Store assortment has been changed"
@delevent

[shopoff]
;----------------------------------------------------------------------------------------
*event_魔法店ベイワロ・スターズ_0
;[exp] inHouse

@delevent
@addevent name=魔法店ベイワロ・スターズ num=1
@wait time=500
[texton]
[name n=Baywalos f=waroth_02]「Welcome to my store. I am the great mage Baywalos. I sell [b]Starburst[/b] magic here.」[k]
[name n=Baywalos f=waroth_02]「Starburst is the strongest alchemy spell. Borrowing the power of the stars, it attacks all enemies with top-class attack power.」[k]
[name n=Baywalos f=waroth_02]「...But this magic can only be used by select mages. You must have the right qualities to use it. So I will put you to the test.」[k]
[name n=Baywalos f=waroth_02]「You must collect [b]10 Star Cards[/b]. Only those who have collected these can learn Starburst!」[k]
[name n=Baywalos f=waroth_02]「[b]Star Cards[/b] are star-patterned cards with 10 different symbols on. You can find them in dungeons around the world. Good luck!」[k]
[textoff]

[shopoff exit]
;----------------------------------------------------------------------------------------
*event_魔法店ベイワロ・スターズ_1
;[exp] inHouse

@wait time=500
@eval exp='tf.num = 0'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・剣))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・盾))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・杖))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・十字架))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・帽子))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・蝶))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・魔法陣))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・杯))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・林檎))'
@eval exp='tf.num += (game.party.hasItem(o.スターカード・髑髏))'
[if exp='tf.num < 10']
	[texton]
	[name n=Baywalos f=waroth_02]「You have collected [b][emb exp='tf.num'] Star Cards[/b].」[k]
	[name n=Baywalos f=waroth_02]「If you collect 10 Star Cards, I'll let you learn Starburst.」[k]
	[textoff]
	[shopoff exit]
[endif]

[texton]
[name n=Baywalos f=waroth_02]「You managed to collect 10 Star Cards! Well done!」[k]
[name n=Baywalos f=waroth_02]「I'll sell you the Starburst spellbook as promised. Before you go, let me present you with a Starburst spellbook and scroll, in honor of your achievement. Here.
 
 」[k]
[textoff]
@getitem item=スターバーストの巻物
@getitem item=スターバーストの魔法書
@eval exp='game.party.ejectItem(o.スターカード・剣)'
@eval exp='game.party.ejectItem(o.スターカード・盾)'
@eval exp='game.party.ejectItem(o.スターカード・杖)'
@eval exp='game.party.ejectItem(o.スターカード・十字架)'
@eval exp='game.party.ejectItem(o.スターカード・帽子)'
@eval exp='game.party.ejectItem(o.スターカード・蝶)'
@eval exp='game.party.ejectItem(o.スターカード・魔法陣)'
@eval exp='game.party.ejectItem(o.スターカード・杯)'
@eval exp='game.party.ejectItem(o.スターカード・林檎)'
@eval exp='game.party.ejectItem(o.スターカード・髑髏)'
@delevent
@eval exp='game.closeItems.remove(o.スターバーストの巻物)'
; 記録
@eval exp='sf.completedStarCards = true'

[shopoff]
;----------------------------------------------------------------------------------------


; 共通
;----------------------------------------------------------------------------------------
*event_アウラ中央教会_0
;[exp] inHouse
*event_浜辺の教会_0
;[exp] inHouse
*event_ブレイブタウン教会_0
;[exp] inHouse
*event_最果ての教会_0
;[exp] inHouse

@wait time=500
[texton]
[シスター]「Welcome to Aura Church.」[k]
[シスター]「Here you can pay to treat [b]paralysis[/b] and [b]petrification[/b], or to revive [b]dead[/b] companions.」[k]
[シスター]「If your friends are in crisis, please rely on us here.」[k]
[textoff]
@delevent name=アウラ中央教会 num=0
@delevent name=浜辺の教会 num=0
@delevent name=ブレイブタウン教会 num=0
@delevent name=最果ての教会 num=0

[churchoff]
;----------------------------------------------------------------------------------------
*event_アウラ中央教会_1
;[exp] inHouse && game.party.hasPatient(o.死亡)
*event_浜辺の教会_1
;[exp] inHouse && game.party.hasPatient(o.死亡)
*event_ブレイブタウン教会_1
;[exp] inHouse && game.party.hasPatient(o.死亡)
*event_最果ての教会_1
;[exp] inHouse && game.party.hasPatient(o.死亡)

@wait time=500
[texton]
[シスター]「Ah, your friend is dead!」[k]
[シスター]「They must be revived as soon as possible. Please use the [b]Revive[/b][r]option.」[k]
[シスター]「However! Revival may fail. If it does, they'll become [b]ash[/b], and it will cost more to save them, so please be careful.」[k]
[textoff]
@delevent name=アウラ中央教会 num=1
@delevent name=浜辺の教会 num=1
@delevent name=ブレイブタウン教会 num=1
@delevent name=最果ての教会 num=1

[churchoff]
;----------------------------------------------------------------------------------------
*event_イーラ中央寺院_0
;[exp] inHouse
*event_雪国の礼拝堂_0
;[exp] inHouse
*event_地下教会_0
;[exp] inHouse

@wait time=500
[texton]
[ブラザー]「Welcome to the Cult of Era!」[k]
[ブラザー]「Here, you can heal the [b]paralyzed[/b] and [b]petrified[/b] and revive the [b]dead[/b] for a fee!」[k]
[ブラザー]「If you want, we'll be happy to help.」[k]
[textoff]
@delevent name=イーラ中央寺院 num=0
@delevent name=雪国の礼拝堂 num=0
@delevent name=地下教会 num=0

[churchoff]
;----------------------------------------------------------------------------------------
*event_イーラ中央寺院_1
;[exp] inHouse && game.party.hasPatient(o.死亡)
*event_雪国の礼拝堂_1
;[exp] inHouse && game.party.hasPatient(o.死亡)
*event_地下教会_1
;[exp] inHouse && game.party.hasPatient(o.死亡)

@wait time=500
[texton]
[ブラザー]「Hmm? Looks like your friend is dead.」[k]
[ブラザー]「You can try to revive an ally, using the [b]Revive[/b] command. Of course, you'll have to pay.」[k]
[ブラザー]「However, revival may fail. If it does, they'll become [b]ash[/b], and it will be more expensive to revive them, so watch out.」[k]
[textoff]
@delevent name=イーラ中央寺院 num=1
@delevent name=雪国の礼拝堂 num=1
@delevent name=地下教会 num=1

[churchoff]
;----------------------------------------------------------------------------------------
*event_アウラ教会_0
;[exp] inHouse

@delevent
[texton][nw]
[シスター]「This is Aura Church. [r]Is there anything we can help you with?」[k]
[/nw][textoff]

[churchoff]
;----------------------------------------------------------------------------------------
*event_イーラ教団_0
;[exp] inHouse

@delevent
[texton][nw]
[ブラザー]「This is the Cult of Era. If you pay us, we'll perform various miracles for you.」[k]
[/nw][textoff]

[churchoff]
;========================================================================================


; 町マップ上のボタンから発生するイベント
;========================================================================================
*map_サファイアシティ_アイテム説明
*map_サファイアシティ_

; @jump target=*_ＣＧテスト

@deleventbtn label=アイテム説明
@jump storage="main04.scn" target=*tutorial_7

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_リムの実家_1

@eval exp='game.curChara = game.chara[f.walkingHumanID]'
[if exp='! game.party.members.has(game.curChara)']
	@se f=buzzer
	@notice text=&'"<c>" + game.curChara.displayName + "<y> is not in the party"'
	[townoff]
[endif]
@out
@jump storage="heroine01b.scn" target=*theo_07

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_リムの実家_2

@deleventbtn map=サファイアシティ label=リムの実家_2
@eval exp='o.冒険者の宿.events = [12]'
@eval exp='game.curChara = game.chara[f.walkingHumanID]'
@jump storage="heroine01b.scn" target=*theo_09

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_リムの実家_3

@eval exp='game.curChara = game.chara[f.walkingHumanID]'
@jump storage="heroine01b.scn" target=*theo_13

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_路地裏_1

@addevent name=リム num=7
@delevent name=サファイアシティ・北西門 num=3
@delevent name=サファイアシティ・北東門 num=3
@delevent name=サファイアシティ・南西門 num=3
@delevent name=サファイアシティ・南東門 num=2
@delevent name=下水道入口 num=3
@delevent name=王立ギルド num=9
@delevent name=待合所 num=6
@delevent name=ベトリヌスの酒場 num=19
@delevent name=冒険者の宿 num=11
@delevent name=ホテル・クイーン num=2 cond='o.ホテル・クイーン.visible'
@delevent name=サファイア城 num=12
@delevent name=公園 num=9
@delevent name=闘技場 num=10
@eval exp='game.curChara = game.chara[f.walkingHumanID]'
@jump storage="heroine01b.scn" target=*theo_11

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_路地裏_2

@deleventbtn map=サファイアシティ label=路地裏_2
@addeventbtn map=サファイアシティ label=路地裏_3 img=incident x=761 y=464 name="Back Alley"
@eval exp='game.curChara = game.chara[f.walkingHumanID]'
@jump storage="heroine01b.scn" target=*theo_15_1st

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_路地裏_3

@deleventbtn map=サファイアシティ label=路地裏_3
@addeventbtn map=サファイアシティ label=路地裏_4 img=incident x=761 y=464 name="Back Alley"
@eval exp='game.curChara = game.chara[f.walkingHumanID]'
@jump storage="heroine01b.scn" target=*theo_15_2nd

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_路地裏_4

@eval exp='game.curChara = game.chara[f.walkingHumanID]'
@jump storage="heroine01b.scn" target=*theo_15_3rd

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_クレア_1

@eval exp='game.curChara = game.chara[f.datingElfID]'
@deleventbtn map=サファイアシティ label=クレア_1
@addevent name=クレア num=3
@jump storage="heroine02a.scn" target=*theo_04

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_マリアの家_1

@deleventbtn map=サファイアシティ label=マリアの家_1
@eval exp='o.山小屋パブ.quests.add(o.牢獄への潜入作戦)'
@jump storage="heroine06b.scn" target=*after_1

[townoff]
;----------------------------------------------------------------------------------------
*map_サファイアシティ_マリアの家_2

@deleventbtn map=サファイアシティ label=マリアの家_2
@eval exp='o.リーゼル.dressEquipment(o.深紅のローブ)'
@eval exp='o.リーゼル.semiRegular = true'
@eval exp='o.リーゼル.sleep = 0'
@eval exp='o.リーゼル.heat = 0'
@eval exp='o.リーゼル.noChangeOfJob = false'
@eval exp='o.リーゼル.pregnant = NO_PREGNANCY'
@eval exp='o.待合所.entry(o.リーゼル)'
@jump storage="heroine06b.scn" target=*after_2

[townoff]
;----------------------------------------------------------------------------------------
*map_ダストウェルの町_売り子_1

[texton]
[name n=Salesgirl f=witch_other_02]「Hey, are you into jewelry?」[k]
[name n=Salesgirl f=witch_other_02]「I have a really beautiful gemstone. It's called a Magic Stone. Would you like to buy it? I'll sell you it for 10,000G.」[k]
[textoff]

@question title="Would you like to purchase a magic stone for 10,000G?"

[texton]
[if exp='tf.result && game.party.gold < 10000']
	[name n=Salesgirl f=witch_other_02]「Sorry, you don't have enough money to buy it.」[k]
[endif]

[if exp='! tf.result || game.party.gold < 10000']
	[name n=Salesgirl f=witch_other_02]「I'll be here, so if you want to buy something, come back.」[k]
	[textoff]
	[townoff]
[endif]

@se f=coin
@eval exp='game.party.gold -= 10000'
[nw][b]Paid 10,000G.[/nw][k]
[name n=Salesgirl f=witch_other_02]「Thank you.」[k]
[textoff]
@getitem item=オブシダンの魔石
[texton]
[name n=Salesgirl f=witch_other_02]「Thanks for buying it. Bye ♪」[k]
[name n=Salesgirl f=witch_other_02]「...」[k]
[name n=Salesgirl f=witch_other_02]「...Ufufu!」[k]
[textoff]
@deleventbtn map=ダストウェルの町 label=売り子_1

[townoff]
;========================================================================================


; 特殊施設のコマンドから起こるイベント
;========================================================================================
*others_アイテム保管庫_倉庫
*others_シーサイド保管庫_倉庫
*others_冒険者の保管庫_倉庫
*others_銀世界の保管庫_倉庫
*others_地下の保管庫_倉庫
*others_塵埃の保管庫_倉庫

@eval exp='game.itemWin.openStockBox("trunkRoom")'
@waitinput name="closeTreasureBox"
@eval exp='game.trunkRoom.collectItemsToStock()'

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム保管庫_一時預かり所
*others_冒険者の保管庫_一時預かり所
*others_シーサイド保管庫_一時預かり所
*others_銀世界の保管庫_一時預かり所
*others_地下の保管庫_一時預かり所
*others_塵埃の保管庫_一時預かり所

@eval exp='game.itemWin.openTemporaryBox()'
@waitinput name="closeTreasureBox"
@eval exp='game.temporaryBox.collectItemsToStock()'

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム保管庫_説明を聞く

[texton]
[管理人]「Hi, this is the item storage area. I'm the manager.」[k]
[管理人]「You can store items here that you don't want to carry. There are 40 pages of storage space, so deposit as much as you like.」[k]
[管理人]「In addition to the warehouse, we also have a temporary storage facility for items.」[k]
[管理人]「Equipment that was removed when you changed jobs and items from allies you've parted ways with are temporarily kept there. If you can't find something, that's where you should look.」[k]
[管理人]「When there are many items stored, not all items will be displayed at once. When that happens, try reloading. If you reload a few times, they should appear.」[k]
[管理人]「Oh yeah, there's one caveat.」[k]
[管理人]「Temporary items have a [b]storage deadline[/b]. After the expiration date, the item will disappear (except for event items).」[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム保管庫_　　　

[if exp='o.下水道入口.events.count > 0']
	[texton]
	[管理人]「Is this really the time for you to be doing this?」[k]
	[textoff]
	[otheroff]
[endif]

[texton]
[管理人]「Ah, it seems you found it.[r]This is an entrance to the sewers of Sapphire City. Would you like to go in?」[k]
[textoff]
@eval exp='f.discoveredEnteranceOfSewer = true'

[if exp='! game.isFreeMode && game.party.members.count < 4']
	[texton]
	[管理人]「...I would say, but you should only go down with least four people in your party.」[k]
	[textoff]
	[otheroff]
[endif]

@question title="Go into the sewer?"

[if exp='tf.result']
	@eval exp='game.enterDungeon(%[map: "下水道・通路", x: 14, y: 3, way: "e"])'
	[s]
[endif]

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム保管庫_マインドリード

[texton]
[if exp='f.discoveredEnteranceOfSewer']
	[管理人][b]（Good grief, I didn't realize how easy it would be to find the entrance to the sewer... I give up.）[k]
[else]
	[管理人][b]（Hehe... No one would ever guess that one of the options hides an entrance to the sewers.）[k]
[endif]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_冒険者の保管庫_説明を聞く

[texton]
[name f=slime_blue]
There was a slime by the warehouse. Apparently he was its manager.[k]
[管理人 f=slime_blue]「...!」(← Surprised at being unexpectedly spoken to)[k]
[管理人 f=slime_blue]「...」(← Eyes sparkling with joy at being visited)[k]
[管理人 f=slime_blue]「...!」(← Apparently remembered something else.)[k]
[管理人 f=slime_blue]「～～～～～～～～」(← Trying to tell them to be careful with [b]items in temporary storage[/b] because they have a [b]storage deadline[/b])[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_冒険者の保管庫_マインドリード

[texton]
[管理人 f=slime_blue][b]「...」(← Bored today. Wondering if there's anything interesting to do.)[k]
[管理人 f=slime_blue][b]「...」(← Recalls a time when he infiltrated the King's Tomb in the southern desert in search of inspiration.)[k]
[管理人 f=slime_blue][b]「...!」(← Remembered going down to B4 and wandering around inside, unable to get back up.)[k]
[管理人 f=slime_blue][b]「～～～～！」(← Itching to tell someone about the thrilling experience of escaping with his life.)[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_シーサイド保管庫_説明を聞く

[texton]
[name f=slime_darkgreen]
There was a slime by the warehouse. Apparently he was its manager.[k]
[管理人 f=slime_darkgreen]「...!」(← Insistent that it's the keeper of the warehouse)[k]
[管理人 f=slime_darkgreen]「...!」(← Indicating eagerness to help store items)[k]
[管理人 f=slime_darkgreen]「...」(← Really wants to say something)[k]
[管理人 f=slime_darkgreen]「...!」...! (← Wanted to say to be careful with [b]items in temporary custody[/b] because they have a [b]storage deadline[/b])[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_シーサイド保管庫_マインドリード

[texton]
[管理人 f=slime_darkgreen][b]「...」(← Thinking about how nice the weather is today, and wishing to go outside and feel the sea breeze.)[k]
[管理人 f=slime_darkgreen][b]「...」(← Subsequently remembering visiting Landon Canyon, north of the village.)[k]
[管理人 f=slime_darkgreen][b]「...!」(← Remembering there was a hidden path at the dead end deep in the forest.)[k]
[管理人 f=slime_darkgreen][b]「...」(← Depressed at remembering being viciously attacked by a group of kobolds after investigating.)[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_銀世界の保管庫_説明を聞く

[texton]
[name f=slime_lavender]
There was a slime by the warehouse. Apparently he was its manager.[k]
[管理人 f=slime_lavender]「...!」(← A little panicked at realizing people are here)[k]
[管理人 f=slime_lavender]「...」(← Swiftly moving to the corner of the room so as not to disturb use of the warehouse)[k]
[管理人 f=slime_lavender]「...!」(← Came back to see if you knew...)[k]
[管理人 f=slime_lavender]「...」(← Thought it would be best to tell you that items in temporary custody have a [b]storage deadline[/b])[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_銀世界の保管庫_マインドリード

[texton]
[管理人 f=slime_lavender][b]「...」(← Feeling cold today. Eager to get back to the nest and warm up)[k]
[管理人 f=slime_lavender][b]「...」(← Thinking that it's a long, hard road back to the nest.)[k]
[管理人 f=slime_lavender][b]「...」(← Feeling fortunate that on cold days, the river can freeze over and allow taking a shortcut)[k]
[管理人 f=slime_lavender][b]「...」(← Secretly hoping the river is frozen today)[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_地下の保管庫_説明を聞く

[texton]
[管理人]「Hi. As usual, I'm looking after your items in the basement. Take advantage of it, as always.」[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_地下の保管庫_マインドリード

[texton]
[管理人][b]（...I know a merchant who went to sell spa tickets to God's Mountain and never came back... I wonder what happened to him?）[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_塵埃の保管庫_説明を聞く

[texton]
[name f=slime_black]
There was a slime by the warehouse. Apparently he was its manager.[k]
[管理人 f=slime_black]「...」(← Taking a sidewards glance at the party but not showing particular interest)[k]
[管理人 f=slime_black]「...」(← Has a brusque attitude, as if to say, "If you want to use the warehouse, go ahead and do it")[k]
[管理人 f=slime_black]「...」(← Doubts the need to explain that [b]items in temporary custody[/b] have a [b]storage deadline[/b])[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_塵埃の保管庫_マインドリード

[texton]
[管理人 f=slime_black][b]「...」(← Feeling tired, considering whether it's time to retire)[k]
[管理人 f=slime_black][b]「...」(← Reminiscing about all the adventures he had when younger)[k]
[管理人 f=slime_black][b]「...!」(← Remembering discovering an invisible aerial bridge on the Mountain of God)[k]
[管理人 f=slime_black][b]「...」（← Would love to visit there again and feel like he's flying.)[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム博物館_武器展示室

@jump target=*_アイテム博物館_入館拒否 cond='game.findItem(o.入館証) === void'
@call storage="appendix.ks" target=*weapons_list
@eval exp='tf.temp = game.party.storePartyMembers()'
@eval exp='game.itemWin.openCollectionOfItems()'
@waitinput name="closeTreasureBox"
@eval exp='game.party.restorePartyMembers(tf.temp)'

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム博物館_防具展示室

@jump target=*_アイテム博物館_入館拒否 cond='game.findItem(o.入館証) === void'
@call storage="appendix.ks" target=*armors_list
@eval exp='tf.temp = game.party.storePartyMembers()'
@eval exp='game.itemWin.openCollectionOfItems()'
@waitinput name="closeTreasureBox"
@eval exp='game.party.restorePartyMembers(tf.temp)'

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム博物館_道具展示室

@jump target=*_アイテム博物館_入館拒否 cond='game.findItem(o.入館証) === void'
@call storage="appendix.ks" target=*items_list
@eval exp='tf.temp = game.party.storePartyMembers()'
@eval exp='game.itemWin.openCollectionOfItems(true)'
@waitinput name="closeTreasureBox"
@eval exp='game.party.restorePartyMembers(tf.temp)'

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム博物館_説明を聞く

@jump target=*_アイテム博物館_入館拒否 cond='game.findItem(o.入館証) === void'
[texton]
[name n=Curator f=slime_00]「Hi, this is the Item Gallery. I'm the curator.」[k]
[name n=Curator f=slime_00]「Here you can see and compare the items you've collected.」[k]
[name n=Curator f=slime_00]「You can temporarily try on equipment by [b]left clicking[/b].」[k]
[name n=Curator f=slime_00]「You can also see the completion rate.[r]I hope this gallery will be useful for viewing your collection.」[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_アイテム博物館_アイテム探し

[texton]
[name n=Curator f=slime_00]「Hey, are you looking for an item?」[k]
[name n=Curator f=slime_00]「If you think you've lost an item you've acquired, let me know.」[k]
[textoff]

*_アイテム探し_再入力
@textedit default="" length=20 title="Enter the full or partial item name"

[if exp='tf.result == ""']
	[otheroff]
[endif]

@eval exp='tf.temp = o[tf.result]'
; Custom: Find an item matching the given EN text. textedit mangles this with ` characters
[iscript]
	if (tf.temp === void) {
		var regex = new RegExp(game.restoreName(tf.result), "i");
		for (var i=0; i < game.items.count; i++) {
			if (regex.match(game.items[i].displayName).count) {
				tf.temp = game.items[i];
				break;
			}
		}
	}
[endscript]
[if exp='tf.temp === void']
	@se f=buzzer
	@notice text="<y>The item name is incorrect. Please enter it correctly. "
	@jump target=*_アイテム探し_再入力
[endif]

@eval exp='tf.result = game.findItem(tf.temp, true)'
@se f=period
[if exp='tf.result === void']
	@notice text=&'"<c>" + tf.temp.displayName + "<y> is nowhere to be found. Either it has been used, not yet obtained, or lost for some other reason."'
[elsif exp='tf.result instanceof "CharaObject"']
	@notice text=&'"<c>" + tf.result.displayName + "<y> has <p>" + tf.temp.displayName'
[else]
	@notice text=&'"<c>" + tf.temp.displayName + "<y> is located in <p>" + game.getTranslation(tf.result.name)'
[endif]

[otheroff]
;----------------------------------------------------------------------------------------
*_アイテム博物館_入館拒否

[texton]
[name n=Curator f=slime_00]「Hi, this is the Item Gallery. I'm the curator.」[k]
[name n=Curator f=slime_00]「Unfortunately, only those with a pass can enter here. Sorry.」[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_自宅_休憩する

[texton]
[if exp='game.guest.members.has(o.ブルー)']
	[ブルー]「Hey, I'll take a break at your house.」[k]
[else]
	[テオ]「Let's rest a little.」[k]
[endif]
[textoff]
@eventsleep left=&'o.自宅.left - 100' top=&'o.自宅.top - 240'

[eventoff]
;----------------------------------------------------------------------------------------
*others_サファイア城_姫と話す

[if exp='o.ポラリス神殿を守ってほしい.accepted']
	[texton]
	[name n=Fiona f=fiona_00]「Please protect the Temple of Polaris. Best of luck to you.」[k]
	[textoff]
	[otheroff]
[endif]

[texton]
[name n=Fiona f=fiona_00]「We are glad to see you again. Good luck with your work as an adventurer.」[k]
[textoff]

[if exp='game.party.hasItem(o.黄金のリンゴ)']
	[texton]
	We handed Princess Fiona the golden apple she had requested.[k]
	[name n=Fiona f=fiona_01]「Oh, my! A golden apple! Thank you so much for delivering it this year!」[k]
	[name n=Fiona f=fiona_01]「Oh, yum ♪ Another great crop! I'm so happy...!」[k]
	[textoff]
	@eval exp='game.party.ejectItem(o.黄金のリンゴ)'
	@complete name=黄金のリンゴを届けてくれ
	@addevent name=かもめ亭 num=6
[endif]

[otheroff]
;----------------------------------------------------------------------------------------
*others_サファイア城_隊名変更

[texton]
[name n=Fiona f=fiona_00]「Oh, you want to change the name of your party?」[k]
[name n=Fiona f=fiona_01]「So, what will it be? Please give it a cool name ♪」[k]
[textoff]

@textedit default=&'game.restoreName(game.party.name)' length=15 title="Enter a new name (15 characters max)"
@notice text="<y>Renamed." se=click cond='game.party.name != tf.result'
@eval exp='game.party.name = tf.result'
@eval exp='game.party.displayName = tf.result'

[otheroff]
;----------------------------------------------------------------------------------------
*others_サファイア城_マップ達成率


@command type=long
@select text="Quick check by location" exp='tf.result = 0'
@select text="Thorough check by sublocation (Slow)" exp='tf.result = 1'
@select text="No" exp='tf.result = 2'
[ask]
[otheroff cond='tf.result == 2']

[texton]
[name n=Fiona f=fiona_00]「Hmmm, the current map completion percentage is...
@eval exp='tf.temp = []'
@eval exp='tf.result = game.getRateOfCoveringAllMaps(tf.result, tf.temp)'
@eval exp='sf.rateOfCoveringMaps = tf.result' cond='tf.result > sf.rateOfCoveringMaps'
@wait time=500
@eval exp='tf.result = int(tf.result * 10)'
[b] [emb exp='tf.result \ 10 + "." + tf.result % 10']%[/b]」[k]
[if exp='! f.completedCoveringAllMaps']
	[if exp='tf.result >= 1000']
		@se f=period
		[name n=Fiona f=fiona_01]「Finally, you have achieved 100%! Thank you very much for your hard work! Allow me to present you with a commemorative gift.
		 」[k]
		[textoff]
		@se f=up2
		@notice text="<y>Congratulations! You've explored all the maps!" wait=2000
		@getitem item=記念カップ
		@eval exp='f.completedCoveringAllMaps = true'
	[else]
		[name n=Fiona f=fiona_01]「[b]
		[emb exp='(1000 - tf.result) \ 10 + "." + (1000 - tf.result) % 10']
		%[/b] remains unexplored.[r]
		Good luck! ♪」[k]
		[if exp='tf.temp.count > 0']
			[textoff]
			@question title="List maps that aren't fully explored?"
			[if exp='tf.result']
				[texton w=0]
				[name n=Fiona f=fiona_01]「The maps that aren't 100% explored are:」
				[r][b][nw]
				@jump target=*_not_covered_map_loop
			[endif]
		[endif]
	[endif]
[else]
	[name n=Fiona f=fiona_00]「It's 100% explored! Thank you for your hard work.
	 」[k]
[endif]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*_not_covered_map_loop
[emb exp='tf.temp.join(", ")']
[/b][/nw][k]
[textoff]
[otheroff]
;----------------------------------------------------------------------------------------
*others_サファイア城_トロフィー

[texton]
[name n=Fiona f=fiona_00]「Here is a list of all the trophies you have won. Please take a look ♪」[k]
[textoff]

; マップ踏破率だけここで計算
@eval exp='tf.result = game.getRateOfCoveringAllMaps()'
@eval exp='sf.rateOfCoveringMaps = tf.result' cond='tf.result > sf.rateOfCoveringMaps'

; 表示
@se f=paper
@eval exp='tf.num = game.openTrophyMode()'

; 姫イベント
@addevent name=サファイア城 num=16 cond='! f.fionaHasSeduced && ! game.isFreeMode && tf.num == 30'

[s]
;----------------------------------------------------------------------------------------
*others_サファイア城_プレイ記録

[texton]
[name n=Fiona f=fiona_01]「You wish to see the gameplay record of your last game? Here you go ♪」[k]
[textoff]

; 表示
@se f=paper
@call storage="appendix.ks" target=*view_last_record

; エンディング後にも表示するので画面の消去はここで行う
@layopt layer=message1 visible=false
@layopt layer=0 visible=false

[otheroff]
;----------------------------------------------------------------------------------------
*others_サファイア城_記録の再取得

@se f=period
@eval exp='game.rewriteDroppedTrophyRecordsByErrors()'
@eval exp='game.rewriteDroppedItemRecordsByErrors()'
@eval exp='game.rewriteDroppedMonsterRecordsByErrors()'
@eval exp='game.rewriteDroppedLabelRecordsByErrors()'
@notice text="<y>Records were reacquired."

[otheroff]
;----------------------------------------------------------------------------------------
*others_サファイア城_マインドリード

[texton]
[if exp='game.party.members.has(o.テオ)']
	[name n=Fiona f=fiona_05][b]（Oh my, this man is rather cool...）[k]
[endif]
[if exp='game.party.members.has(o.マックス)']
	[name n=Fiona f=fiona_04][b]（The elf over there looks like he has a big penis...）[k]
	[name n=Fiona f=fiona_08][b]（Don't... I just can't help it! I can't help but look at your crotch...!）[k]
[endif]
[if exp='! game.party.members.has(o.テオ) && ! game.party.members.has(o.マックス)']
	[name n=Fiona f=fiona_09][b]（Oh, this party is all female.）[k]
	[name n=Fiona f=fiona_03][b]（There aren't any nice gentlemen here... That's a shame.）[k]
[endif]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_公園_中に入る

[texton]
It is a green and relaxing place. Several citizens can be seen relaxing.[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_公園_ワープポイント

[if exp='! game.isFreeMode && o.サファイアシティ・南西門.requireMembers && game.party.members.count < 4']
	@se f=buzzer
	@notice text="<y>In story mode, you must have at least 4 people to enter."
	[otheroff]
[endif]

[if exp='! o.ワイルドブルのアジト２Ｆ.visited || o.ワイルドブルのアジト２Ｆ.events.has(6)']
	@question title="There is a warp point to an unknown location. Do you want to warp?"
	[if exp='tf.result']
		@se f=poyon
		@black on=0 time=1000 off=0
		@eval exp='game.view.close()'
		@eval exp='game.openDungeonView(%[map: "ワイルドブルのアジト２Ｆ", x: 2, y: 4, way: "e"])'
		@delevent map=ワイルドブルのアジト２Ｆ num=6
		@eval exp='game.dungeonView.startExplore()'
		[s]
	[endif]
	[otheroff]
[endif]

@question title="There's a warp point to Wild Bull's hideout. Do you want to warp?"
[if exp='tf.result']
	@se f=poyon
	@black on=0 time=1000 off=0
	@eval exp='game.enterDungeon(%[map: "ワイルドブルのアジト２Ｆ", x: 2, y: 4, way: "e"])'
	[s]
[endif]

[otheroff]
;----------------------------------------------------------------------------------------
*others_砂浜_中に入る

[texton]
Waves are gently lapping on the spacious, empty sandy beach.[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_井戸_調べる

[texton]
It is a very ordinary well. The people of the town probably draw water from here.[k]
When I looked inside, I couldn't see the surface of the water because it was very deep. If I fell in, I would be in big trouble.[k]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_井戸_中に入る

@eval exp='game.enterDungeon(%[map: "井戸・水上", x: 1, y: 1, way: "n"])'
[s]

[otheroff]
;----------------------------------------------------------------------------------------
*others_闘技場_エントリー

[if exp='isDemoVersion']
	[texton]
	You cannot enter tournaments in the trial version.[k]
	[textoff]
	[otheroff]
[endif]
@jump storage="duel.ks" target=*tournament_entry

[otheroff]
;----------------------------------------------------------------------------------------
*others_闘技場_説明を聞く

@jump storage="duel.ks" target=*tournament_detail

[otheroff]
;----------------------------------------------------------------------------------------
*others_闘技場_賞品を見る

@jump storage="duel.ks" target=*tournament_trophy

[otheroff]
;----------------------------------------------------------------------------------------
*others_コルトンの家_話す

[texton]
[if exp='game.findItem(o.ペリドットの魔石) === void']
	[name n=Colton f=boy_blue_01]「My name is Colton. Hey, do you know what magic stones are?」[k]
	[textoff]
	@question title="<y>What do you answer?" cancel=true
	[texton]
	[if exp='! tf.result']
		[name n=Colton f=boy_blue_01]「Well... No, it's okay if you don't know.」[k]
	[else]
		[name n=Colton f=boy_blue_01]「I see! You have a magic stone too?」[k]
		[name n=Colton f=boy_blue_01]「I saw a magic stone once. Amazing, right? It's true! I think it was called a Peridot Magic Stone? The yellow-green one!」[k]
		[name n=Colton f=boy_blue_01]「My old friend Ferrucci had one. I'm not lying! He used to carry that magic stone with him all the time. He loved to show it off.」[k]
		[name n=Colton f=boy_blue_01]「I haven't seen Ferrucci in years, ever since I moved here... I wonder what he's up to now.」[k]
	[endif]
[else]
	[name n=Colton f=boy_blue_01]「What! You got the Peridot Magic Stone?!」[k]
	[name n=Colton f=boy_blue_01]「So... Ferrucci had already left this world... I miss him... 」[k]
	[name n=Colton f=boy_blue_01]「Thanks for letting me know. I'm going to visit his grave one of these days. You take good care of that magic stone.」[k]
[endif]
[textoff]

[otheroff]
;----------------------------------------------------------------------------------------
*others_ムニョスの家_話す

[texton]
[if exp='o.兄に手紙を届けてくれ.flag == 1']
	[name n=Munoz f=boy_green_01]「How's my brother doing?」[k]
	[textoff]
	[otheroff]
[endif]
[name n=Munoz f=boy_green_01]「I'm Muñoz. What can I do for you?」[k]
[if exp='! game.party.hasItem(o.カルロスの手紙)']
	[name n=Munoz f=boy_green_01]「What the hell, if you don't want me, leave.」[k]
	[textoff]
	[otheroff]
[endif]
[name n=Munoz f=boy_green_01]「What? You got a letter from Carlos for me?」[k]
@se f=period
I gave Muñoz the letter from Carlos.[k]
[name n=Munoz f=boy_green_01]「...I see, I've really worried Carlos.」[k]
[name n=Munoz f=boy_green_01]「Thanks for your hard work. Sorry, but could you please deliver a letter from me too? I want you to give it to my brother Carlos.」[k]
[textoff]
@se f=period
@notice text="Got <y>Muñoz's letter!"
[texton]
[name n=Munoz f=boy_green_01]「Well then, I'm counting on you. Give my regards to Carlos.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.カルロスの手紙)'
@getitem item=ムニョスの手紙 message="Got <y>Muñoz's letter!"
@eval exp='o.兄に手紙を届けてくれ.flag = 1'

[otheroff]
;----------------------------------------------------------------------------------------
*others_エヴァの家_話す

[texton w=0]
[name n=Eva f=succubus_30]「I'm a woman with a lot of experience. I've slept with countless men.」[k]
[if exp='game.isFreeMode']
	[name n=Eva f=succubus_30]「So I'm confident in my eye for men. Maybe one day I'll get a chance to see you guys.」[k]
	[textoff]
	[townoff]
[endif]
[name n=Eva f=succubus_30]「So I'm confident in my eye for men. How about I take a look at you guys?」[k]
[textoff]

*_select_guy
@command title="Who would you like to see?" cancel=true
@select text=&'o.テオ.displayName' exp='tf.result = o.テオ'
@select text=&'o.マックス.displayName' exp='tf.result = o.マックス'
@select text="Linus" exp='tf.result = o.ライナス'
@select text="Blue" exp='tf.result = o.ブルー'
@select text="Alex" exp='tf.result = o.アレックス'
@select text="Eric" exp='tf.result = o.エリック'
@select text="No" exp='tf.result = void'
[ask]
[townoff cond='tf.result === void']

@eval exp='game.resetPrevForProcessOnly()'
[texton w=4]
[r][nw] [indent][b blue][emb exp='tf.result.displayName']'s specs[/b][r]
        [indent][r]
Number of partners: [locate x=300][emb exp='"%5d".sprintf(tf.result.loversCount)'][r]
Number of times: [locate x=300][emb exp='"%5d".sprintf(tf.result.sexCount.self)'][r]
Libido: [locate x=300][emb exp='"%5d".sprintf(tf.result.desire)'][r]
Technique: [locate x=300][emb exp='"%5d".sprintf(tf.result.technic)'][r]
Erect penis size: [locate x=300][emb exp='"%5d".sprintf(tf.result.penis)'][r]
Overall rating:              
[if exp='tf.result.loversCount == 0'][locate x=300][b blue]Virgin[/b]
[elsif exp='tf.result.sexCount.self < 10'][locate x=300]Beginner
[elsif exp='tf.result.technic < 30'][locate x=300][b]Poor[/b]
[elsif exp='tf.result.loversCount >= 100 && tf.result.technic >= 100'][locate x=300][b red]Playboy[/b]
[else][font color=0xFFC0A0][locate x=300]Intermediate[/b]
[endif][r][/nw][k]
[textoff]

@jump target=*_select_guy
;========================================================================================





; ＣＧテスト（開発用）
;========================================================================================
*_ＣＧテスト


@eval exp='game.curChara = o.リーゼル'
@eval exp='game.curChara.capturers[0] = m.オークキング'
@wakuset w=2
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_0
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_1
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_2
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_3
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_4
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_5
[c]

@eval exp='game.curChara = o.リーゼル'
@eval exp='game.curChara.capturers[0] = m.ハイパーローパー'
@wakuset w=2
@replay storage="capture.scn" target=*触手陵辱_リーゼル_0
@replay storage="capture.scn" target=*触手陵辱_リーゼル_1
@replay storage="capture.scn" target=*触手陵辱_リーゼル_2
@replay storage="capture.scn" target=*触手陵辱_リーゼル_3
@replay storage="capture.scn" target=*触手陵辱_リーゼル_4
@replay storage="capture.scn" target=*触手陵辱_リーゼル_5
[c]

@eval exp='game.curChara = o.リーゼル'
@eval exp='game.curChara.capturers[0] = m.スワンプデビル'
@wakuset w=2
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_0
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_1
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_2
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_3
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_4
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_5
[c]

@eval exp='game.curChara = o.リム'
@eval exp='game.curChara.capturers[0] = m.キャプテン'
@wakuset w=2
@replay storage="capture.scn" target=*化物陵辱_リム_0
@replay storage="capture.scn" target=*化物陵辱_リム_1
@replay storage="capture.scn" target=*化物陵辱_リム_2
@replay storage="capture.scn" target=*化物陵辱_リム_3
@replay storage="capture.scn" target=*化物陵辱_リム_4
@replay storage="capture.scn" target=*化物陵辱_リム_5
[c]

@eval exp='game.curChara = o.クレア'
@eval exp='game.curChara.capturers[0] = m.キャプテン'
@wakuset w=2
@replay storage="capture.scn" target=*山賊陵辱_クレア_0
@replay storage="capture.scn" target=*山賊陵辱_クレア_1
@replay storage="capture.scn" target=*山賊陵辱_クレア_2
@replay storage="capture.scn" target=*山賊陵辱_クレア_3
@replay storage="capture.scn" target=*山賊陵辱_クレア_4
@replay storage="capture.scn" target=*山賊陵辱_クレア_5
[c]

@eval exp='game.curChara = o.ミューズ'
@eval exp='game.curChara.capturers[0] = m.シャドウインプ'
@wakuset w=2
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_0
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_1
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_2
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_3
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_4
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_5
[c]

@eval exp='game.curChara = o.フレデリカ'
@eval exp='game.curChara.capturers[0] = m.バーバリアン'
@wakuset w=2
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_0
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_1
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_2
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_3
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_4
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_5
[c]

@eval exp='game.curChara = o.リム'
@eval exp='game.curChara.capturers[0] = m.スワンプデビル'
@wakuset w=2
@replay storage="capture.scn" target=*触手陵辱_リム_0
@replay storage="capture.scn" target=*触手陵辱_リム_1
@replay storage="capture.scn" target=*触手陵辱_リム_2
@replay storage="capture.scn" target=*触手陵辱_リム_3
[townoff]



@bgf chara=クレア f=event40 p0=hair p1=01 p2=hip p9=01
[c]
[townoff]


@eval exp='o.リム.capturers.add(m.オークシャーマン)'
@bgf chara=リム f=event01 p0=hair p1=monster p2=hip p14=01
[c]
@bgf chara=リム f=event01 p0=hair p5=monster p6=hip p14=02
[c]
@bgf chara=リム f=event01 p0=hair p7=monster p14=02
[c]
@bgf chara=リム f=event01 p0=hair p8=monster p14=02
[c]

[townoff]
;========================================================================================
