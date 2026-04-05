; hevent.ks
; 宿屋や奴隷などヒロインごとの恋愛・Ｈイベント全般


;■ヒューマン
;==============================================================================

; 主人公関連
;------------------------------------------------------------------------------
*event_リム_0
;[exp] beSeduced(o.テオ) && love.theo >= 0
;[emit] word

@delevent
@addevent name=リム num=1
@jump storage="heroine01a.scn" target=*theo_01

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_1
;[exp] beSeduced(o.テオ) && love.theo >= 10
;[emit] word

@delevent
@addevent name=リム num=2
@jump storage="heroine01a.scn" target=*theo_02

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_2
;[exp] beSeduced(o.テオ) && love.theo >= 20
;[emit] word

@delevent
@addevent name=リム num=3
@addevent name=リム num=4
@jump storage="heroine01a.scn" target=*theo_03

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_3
;[exp] beSeduced(o.テオ) && ! game.party.hasItem(o.ドライアドの霊薬)
;[emit] word

@jump storage="heroine01a.scn" target=*theo_04

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_4
;[exp] beSeduced(o.テオ) && game.party.hasItem(o.ドライアドの霊薬)
;[emit] word

@delevent
@delevent name=リム num=3
@addevent name=リム num=5
@eval exp='o.リム.moveHeart(o.テオ, 15)'
@eval exp='game.party.ejectItem(o.ドライアドの霊薬)'
@jump storage="heroine01a.scn" target=*theo_05

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_5
;[exp] beSeduced(o.テオ) && love.theo >= 40 && f.walkingHumanID === void && ! isDemoVersion
;[emit] word

; マップイベントを設置する
; 他の同種キャラが関連イベント起こしていたら発生しない（ボタンの位置が被るので）
@delevent
@addeventbtn map=サファイアシティ label=リムの実家_1 img=&'o.リム.img + "_" + o.リム.color' x=707 y=370 name=&'o.リム.displayName + "’s Family Home"'
@eval exp='f.walkingHumanID = game.curChara.id'
@eval exp='o.リム.eventInfos.add(%[map: "サファイアシティ", label: "リムの実家_1"])'
@eval exp='o.リム.eventInfos.add(%[exp: "f.walkingHumanID = void"])'
@jump storage="heroine01b.scn" target=*theo_06

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_6
;[exp] MORNING && game.map == o.冒険者の宿 && love.theo >= 50 && f.walkingHumanID === void

; ガラム対面イベント
; 他の同種キャラが関連イベント起こしていたら発生しない（ボタンの位置が被るので）
@delevent
@addevent name=サファイアシティ・北西門 num=3
@addevent name=サファイアシティ・北東門 num=3
@addevent name=サファイアシティ・南西門 num=3
@addevent name=サファイアシティ・南東門 num=2
@addevent name=下水道入口 num=3
@addevent name=王立ギルド num=9
@addevent name=待合所 num=6
@addevent name=ベトリヌスの酒場 num=19
@addevent name=ホテル・クイーン num=2 cond='o.ホテル・クイーン.visible'
@addevent name=サファイア城 num=12
@addevent name=公園 num=9
@addevent name=闘技場 num=10
@addevent name=冒険者の宿 num=11
@hideeventbtns map=サファイアシティ
@addeventbtn map=サファイアシティ label=リムの実家_2 img=&'o.リム.img + "_" + o.リム.color' x=707 y=370 name=&'o.リム.displayName + "’s Family Home"'
[iscript]
for(var i = game.party.allMembers.count - 1; i >= 0; i--)
{
	var one = game.party.allMembers[i];
	if(one != o.テオ) game.removeMemberTemporary(one);
}
[endscript]
@eval exp='f.walkingHumanID = game.curChara.id'
@jump storage="heroine01b.scn" target=*theo_08

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_7
;[exp] MORNING && game.map == o.冒険者の宿 && love.theo >= 60 && f.walkingHumanID === void

; ガラム陵辱＆告白イベント
; 他の同種キャラが関連イベント起こしていたら発生しない（ボタンの位置が被るので）
@delevent
@addevent name=サファイアシティ・北西門 num=3
@addevent name=サファイアシティ・北東門 num=3
@addevent name=サファイアシティ・南西門 num=3
@addevent name=サファイアシティ・南東門 num=2
@addevent name=下水道入口 num=3
@addevent name=王立ギルド num=9
@addevent name=待合所 num=6
@addevent name=ベトリヌスの酒場 num=19
@addevent name=ホテル・クイーン num=2 cond='o.ホテル・クイーン.visible'
@addevent name=サファイア城 num=12
@addevent name=公園 num=9
@addevent name=闘技場 num=10
@addevent name=冒険者の宿 num=13
@hideeventbtns map=サファイアシティ
@addeventbtn map=サファイアシティ label=リムの実家_3 img=&'o.リム.img + "_" + o.リム.color' x=707 y=370 name=&'o.リム.displayName + "’s Family Home"'
@addeventbtn map=サファイアシティ label=路地裏_2 img=incident x=761 y=464 name="Back Alley"
[iscript]
for(var i = game.party.allMembers.count - 1; i >= 0; i--)
{
	var one = game.party.allMembers[i];
	if(one != o.テオ) game.removeMemberTemporary(one);
}
[endscript]
@eval exp='f.walkingHumanID = game.curChara.id'
@jump storage="heroine01b.scn" target=*theo_12

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_8
;[exp] beSeduced(o.テオ) && love.theo >= 60
;[emit] word_love

; 交際中の会話
@jump storage="heroine01b.scn" target=*theo_16

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_9
;[exp] MORNING && love.theo < 20

; 交際開始後にふられる
@delevent
@delevent name=リム num=8
@delevent name=リム num=10
@jump storage="heroine01b.scn" target=*theo_17

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_10
;[exp] beSeduced(o.テオ) && love.theo >= 60 && game.getNumOfJewels() >= 9
;[emit] word

; 婚約イベント 一定数魔石が集まったら発生
; 婚約したら翌朝イベントが発生し結婚へ
@jump storage="heroine01b.scn" target=*theo_18

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_13
;[exp] married
;[emit] sex_soft

; 結婚後最初のイベント
@delevent
@recordsex guy=テオ sex=2 orgasm=0
@eval exp='game.hour = "morning"'
@jump storage="heroine01b.scn" target=*theo_20

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_14
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) > 0 && (develop.blue < 20 || love.theo >= 70 || o.テオ.penis >= 16 || o.テオ.technic >= 50)
;[emit] sex_hard

; 結婚生活・満足
@eval exp='o.リム.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=&'intrandom(1, 3)'
@jump storage="heroine01b.scn" target=*theo_21

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_15
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) == 0 && (develop.blue < 20 || love.theo >= 70)
;[emit] sex_soft

; 結婚生活・不満
@eval exp='o.リム.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@jump storage="heroine01b.scn" target=*theo_22

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_16
;[exp] beSeduced(o.テオ) && love.theo < 20
;[emit] word

; 結婚生活・拒絶
@eval exp='o.リム.strip.theo = "裸・不満"'
@jump storage="heroine01b.scn" target=*theo_23

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_17
;[exp] beSeduced(o.テオ) && develop.blue >= 20 && love.theo < 70 && o.テオ.penis < 16 && o.テオ.technic < 50
;[emit] sex_soft

; 結婚生活・浮気後
@eval exp='o.リム.strip.theo = "裸・不満"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@eval exp='game.wife.moveHeart(o.テオ, 4)'
; ↑ 一度もイケないと好感度が３も下がるので４以上にする必要がある
@jump storage="heroine01b.scn" target=*theo_24

[hoteloff]
;------------------------------------------------------------------------------

; マックス関連
;------------------------------------------------------------------------------
*event_リム_20
;[exp] beSeduced(o.マックス) && guard.max <= 4
;[emit] word

@delevent
@addevent name=リム num=21 cond='! game.isFreeMode'
@addevent name=リム num=23 cond='game.isFreeMode'
@jump storage="heroine01a.scn" target=*max_01

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_21
;[exp] beSeduced(o.マックス) && guard.max <= 3
;[emit] word

@delevent
@addevent name=リム num=22
@jump storage="heroine01a.scn" target=*max_02

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_22
;[exp] SUNSET

; 自然な感じを出すため１日空ける
@delevent
@addevent name=全般 num=81
@eval exp='o.リム.eventInfos.add(%[name: "全般", num: 81])'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_23
;[exp] beSeduced(o.マックス) && guard.max <= 1
;[emit] word_love

@delevent
@addevent name=リム num=24 cond='! isDemoVersion'
@addevent name=リム num=26 cond='isDemoVersion'
@addevent name=リム num=27 cond='isDemoVersion'
@eval exp='o.リム.strip.max = "下着"'
@jump storage="heroine01a.scn" target=*max_04

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_24
;[exp] beSeduced(o.マックス) && guard.max == 0
;[emit] love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=リム num=25
@eval exp='o.リム.strip.max = "裸・恥辱"'
@eval exp='o.リム.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=1 orgasm=0
@jump storage="heroine01a.scn" target=*max_05

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_25
;[exp] beSeduced(o.マックス) && guard.max <= 1
;[emit] sex_hard

@delevent
@addevent name=リム num=26 cond='! game.isFreeMode'
@addevent name=リム num=27
@addevent name=マックス num=1 cond='! game.isFreeMode'
@eval exp='o.リム.strip.max = "汗だく"'
@recordsex guy=マックス sex=3 orgasm=2
@call storage="stay.ks" target=*clear_heroes_event
@jump storage="heroine01a.scn" target=*max_06

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_26
;[exp] NIGHT && inSameRoomOnly(o.マックス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=マックス num=1
@eval exp='o.リム.develop.max += 20'
@recordsex guy=マックス sex=3 orgasm=5
@jump storage="heroine01a.scn" target=*max_07

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_27
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.リム.strip.max = "汗だく"'
@eval exp='o.リム.moveHeart(o.マックス, 9)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_30
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=リム num=31
@eval exp='o.リム.strip.theo = "裸・不満"'
@eval exp='o.リム.strip.max = "汗だく"'
@eval exp='o.リム.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=3 orgasm=5
@jump storage="heroine01b.scn" target=*adultery_max

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_31
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.リム.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_32
;[exp] beSeduced(o.マックス) && guard.max <= 4
;[emit] word

@delevent
@addevent name=リム num=33
@jump storage="heroine01a.scn" target=*max_01_free

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_33
;[exp] beSeduced(o.マックス) && guard.max <= 1 && game.guest.members.has(o.マリア)
;[emit] word_love

@delevent
@addevent name=リム num=34
@eval exp='o.リム.strip.max = "下着"'
@jump storage="heroine01a.scn" target=*max_02_free

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_34
;[exp] beSeduced(o.マックス) && guard.max == 0
;[emit] love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=リム num=35
@eval exp='o.リム.strip.max = "裸・恥辱"'
@eval exp='o.リム.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=1 orgasm=0
@jump storage="heroine01a.scn" target=*max_03_free

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_35
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

@delevent
@addevent name=リム num=27
@addevent name=マックス num=1
@eval exp='o.リム.strip.max = "汗だく"'
@recordsex guy=マックス sex=3 orgasm=2
@jump storage="heroine01a.scn" target=*max_04_free

[hoteloff]
;------------------------------------------------------------------------------

; ライナス関連
;------------------------------------------------------------------------------
*event_リム_40
;[exp] beSeduced(o.ライナス) && guard.linus <= 3
;[emit] word

@delevent
@addevent name=リム num=41
@jump storage="heroine01a.scn" target=*linus_01

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_41
;[exp] beSeduced(o.ライナス) && guard.linus <= 0
;[emit] word_love

@delevent
@addevent name=リム num=42 cond='! isDemoVersion'
@addevent name=リム num=43 cond='isDemoVersion'
@addevent name=リム num=44 cond='isDemoVersion'
@eval exp='o.リム.strip.linus = "裸・恥辱"'
; セックスの記録はシナリオの都合で後でやる
@eval exp='o.リム.moveHeart(o.ライナス, 2)'
@jump storage="heroine01a.scn" target=*linus_02

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_42
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

@delevent
@addevent name=リム num=43 cond='! game.isFreeMode'
@addevent name=リム num=44
@addevent name=ライナス num=1 cond='! game.isFreeMode'
@eval exp='o.リム.strip.linus = "汗だく"'
@recordsex guy=ライナス sex=3 orgasm=4
@call storage="stay.ks" target=*clear_heroes_event
@jump storage="heroine01a.scn" target=*linus_03

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_43
;[exp] NIGHT && inSameRoomOnly(o.ライナス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=ライナス num=1
@eval exp='o.リム.develop.linus += 20'
@jump storage="heroine01a.scn" target=*linus_04

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_44
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.リム.strip.linus = "汗だく"'
@eval exp='o.リム.moveHeart(o.ライナス, 9)'
@recordsex guy=ライナス sex=&'intrandom(2, 3)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_50
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=リム num=51
@eval exp='o.リム.strip.theo = "裸・不満"'
@eval exp='o.リム.strip.linus = "汗だく"'
@eval exp='o.リム.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=2 orgasm=2
@jump storage="heroine01b.scn" target=*adultery_linus

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_51
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.リム.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ブルー関連
;------------------------------------------------------------------------------
*event_リム_60
;[exp] beSeduced(o.ブルー, true)
;[emit] word

; ブルーがヒロインの部屋に移動する or 主人公と２人きりの時にブルーが部屋に入ってくる
@delevent
@addevent name=リム num=61
@eval exp='o.リム.strip.blue = "裸・恥辱"'
@eval exp='o.リム.guard.blue = 0'
@jump storage="heroine01b.scn" target=*blue_01
; セックスの記録はシナリオの最後で行う

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_61
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=リム num=62
@eval exp='game.curChara.booking.remove(3)'
@eval exp='o.リム.moveHeart(o.ブルー, 3)'
@recordsex guy=ブルー sex=3 orgasm=3
@jump storage="heroine01b.scn" target=*blue_02

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_62
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=リム num=63 cond='! game.isFreeMode'
@addevent name=リム num=65
@eval exp='o.リム.strip.blue = "汗だく"'
@eval exp='o.リム.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=3 orgasm=4
@jump storage="heroine01b.scn" target=*blue_03

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_63
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 着せ替えイベントの前の晩
@delevent
@addevent name=リム num=64
@eval exp='o.リム.removeEquipmentsByForce(["waist"])' cond='o.リム.equip.waist !== void'
@eval exp='o.リム.dressEquipment(o.中立の胸当て,,, true)'
@eval exp='o.リム.dressEquipment(o.ひものパンツ,,, true)'
@eval exp='o.リム.makeBustups()'
@eval exp='o.リム.expose = cap(o.リム.expose + 10, 100)'
@eval exp='o.リム.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_64
;[exp] MORNING

; 着せ替えイベント
@delevent
@jump storage="heroine01b.scn" target=*blue_04

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_65
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 継続イベント
@eval exp='o.リム.moveHeart(o.ブルー, 7)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_70
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 結婚後に同室・初日
@delevent
@addevent name=リム num=71
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=3 orgasm=3
@eval exp='o.リム.strip.blue = "汗だく"'
@jump storage="heroine01b.scn" target=*married_01

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_71
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 結婚後に同室・２日目
@delevent
@addevent name=リム num=72
@addevent name=リム num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=3 orgasm=5
@jump storage="heroine01b.scn" target=*married_02

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_72
;[exp] beSeduced(o.ブルー, true) && o.テオ.stayAlone()
;[emit] word

; ブルーが一時的に外出・主人公が１人でいることが条件
@delevent
@delevent name=リム num=79
@addevent name=リム num=73
@eval exp='o.リム.dressEquipment(o.鋼鉄の貞操帯（ブルーの所持品）,,,true)'
@eval exp='o.リム.dressEquipment(o.布のスカート,,,true)' cond='game.curChara.getAppearedPanties() !== void'
@jump storage="heroine01b.scn" target=*married_03

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_73
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 結婚後・４日目
@delevent
@addevent name=リム num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=&'intrandom(3, 4)' orgasm=&'intrandom(4, 5)'
@jump storage="heroine01b.scn" target=*married_04

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_79
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 結婚後・継続イベント
@eval exp='o.リム.moveHeart(o.ブルー, 5)'
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=&'intrandom(3, 4)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ワイルド・ブル関連
;------------------------------------------------------------------------------
*event_リム_80
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 加入直後の夜。イベント１が発生
@delevent
@addevent num=81
@addevent num=82
@eval exp='o.リム.strip.alex = "パンツ"'
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_81
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント１を見る。ここだけイベントを見ることで一気に進む
; ※昼間のうちに guard を 1 にしておくとその日の夜の SLAVE イベントチェック直前に 0 になる
@delevent
@eval exp='o.リム.guard.alex = 1'
@jump storage="heroine01a.scn" target=*wildbull_01

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_82
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex == 0

; 陵辱開始。イベント１は消滅
@delevent
@delevent num=81
@addevent num=83
@addevent num=97
@eval exp='o.リム.strip.alex = "裸・恥辱"'
@recordsex guy=アレックス sex=3 orgasm=0

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_83
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && develop.alex >= 10

; イベント２が発生
@delevent
@addevent num=84
@addevent num=85
@eval exp='o.リム.strip.alex = "汗だく"'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_84
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント２を見る
@delevent
@recordsex guy=アレックス sex=1 orgasm=1
@recordsex guy=どこかの男 sex=3 orgasm=2
@jump storage="heroine01a.scn" target=*wildbull_02

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_85
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && develop.alex >= 30

; イベント３が発生。イベント２は消滅
@delevent
@delevent num=84
@addevent num=86

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_86
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント３を見る。継続イベントの発生条件となる
@delevent
@addevent num=87
@recordsex guy=取った客 sex=2 orgasm=0
@jump storage="heroine01a.scn" target=*wildbull_03

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_87
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 継続イベントが発生
@delevent
@addevent num=88

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_88
;[exp] inHideout(o.ワイルド・ブル, 2)

; 継続イベントを見る
@eval exp='o.リム.strip.alex = "汗だく"'
@recordsex guy=取った客 sex=3 orgasm=1 cond='! o.ワイルド・ブル.sawRepeatableEventToday'
@eval exp='o.ワイルド・ブル.sawRepeatableEventToday = true'
@jump storage="heroine01a.scn" target=*wildbull_04

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_97
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isPregnant()

; ワイルド・ブルで妊娠。それまでのイベントは消滅
@delevent
@delevent num=83
@delevent num=84
@delevent num=85
@delevent num=86
@delevent num=87
@delevent num=88
@addevent num=98
@eval exp='o.リム.strip.alex = "妊娠"' cond='o.リム.strip.alex != "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_98
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isBigBelly()

; ワイルド・ブルでボテ腹。返却イベントが発生する
@delevent
@addevent name=全般 num=3
@eval exp='o.リム.strip.alex = "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_リム_99
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; ２回目以降
@delevent
@addevent num=88
@addevent num=97
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;==============================================================================




;■エルフ
;==============================================================================

; 主人公関連
;------------------------------------------------------------------------------
*event_クレア_0
;[exp] beSeduced(o.テオ) && love.theo >= 0
;[emit] word

@delevent
@addevent name=クレア num=1
@jump storage="heroine02a.scn" target=*theo_01

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_1
;[exp] beSeduced(o.テオ) && love.theo >= 10
;[emit] word

@delevent
@addevent name=クレア num=2
@jump storage="heroine02a.scn" target=*theo_02

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_2
;[exp] beSeduced(o.テオ) && love.theo >= 20 && f.heroineEventProgress && f.datingElfID === void
;[emit] word

; デートイベント
; 他の同種キャラがこのイベント起こしていたら発生しない（ボタンの位置が被るので）
@delevent
@addeventbtn map=サファイアシティ label=クレア_1 img=&'o.クレア.img + "_" + o.クレア.color' x=150 y=160 name=&'o.クレア.displayName + " Date"'
@eval exp='f.datingElfID = game.curChara.id'
@eval exp='o.クレア.eventInfos.add(%[map: "サファイアシティ", label: "クレア_1"])'
@eval exp='o.クレア.eventInfos.add(%[exp: "f.datingElfID = void"])'
@jump storage="heroine02a.scn" target=*theo_03

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_3
;[exp] beSeduced(o.テオ) && love.theo >= 30 && ! isDemoVersion
;[emit] word

@delevent
@addevent name=クレア num=4
@jump storage="heroine02b.scn" target=*theo_05

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_4
;[exp] MORNING && love.theo >= 50 && game.getNumOfJewels() >= 7

; すぐ次のイベントが起こると不自然なので一晩おく
@delevent
@addevent name=クレア num=5

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_5
;[exp] MORNING && game.map == o.冒険者の宿 && love.theo >= 50 && ! f.policeChiefIsOut

@delevent
@addevent name=サファイアシティ num=13
@hideeventbtns map=サファイアシティ
@eval exp='f.kidnappedElfID = game.curChara.id'
@eval exp='game.removeMemberTemporary(o.クレア)'
@eval exp='game.curChara = game.chara[f.kidnappedElfID]'
@jump storage="heroine02b.scn" target=*theo_06

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_6
;[exp] beSeduced(o.テオ) && love.theo >= 50
;[emit] word

@delevent
@addevent name=クレア num=7
@jump storage="heroine02b.scn" target=*theo_09

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_7
;[exp] beSeduced(o.テオ) && love.theo >= 60
;[emit] word

; 告白（のような）イベント
@delevent
@addevent name=クレア num=8
@addevent name=クレア num=9
@addevent name=クレア num=10
@jump storage="heroine02b.scn" target=*theo_10

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_8
;[exp] beSeduced(o.テオ) && love.theo >= 60
;[emit] word_love

; 仲良くなった後の会話
@jump storage="heroine02b.scn" target=*theo_11

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_9
;[exp] MORNING && love.theo < 20

; 告白後にふられる
@delevent
@delevent name=クレア num=8
@delevent name=クレア num=10
@jump storage="heroine02b.scn" target=*theo_12

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_10
;[exp] beSeduced(o.テオ) && love.theo >= 50 && game.getNumOfJewels() >= 9
;[emit] word

; 婚約イベント
@jump storage="heroine02b.scn" target=*theo_13

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_13
;[exp] married
;[emit] sex_soft

; 結婚後最初のイベント
@delevent
@recordsex guy=テオ sex=4 orgasm=2
@eval exp='game.hour = "morning"'
@jump storage="heroine02b.scn" target=*theo_20

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_14
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) > 0 && (develop.blue < 20 || love.theo >= 70 || o.テオ.penis >= 17 || o.テオ.technic >= 50)
;[emit] sex_hard

; 結婚生活・満足
@eval exp='o.クレア.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=&'intrandom(1, 3)'
@jump storage="heroine02b.scn" target=*theo_21

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_15
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) == 0 && (develop.blue < 20 || love.theo >= 70)
;[emit] sex_soft

; 結婚生活・不満
@eval exp='o.クレア.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@jump storage="heroine02b.scn" target=*theo_22

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_16
;[exp] beSeduced(o.テオ) && love.theo < 20
;[emit] word

; 結婚生活・拒絶
@eval exp='o.クレア.strip.theo = "裸・不満"'
@jump storage="heroine02b.scn" target=*theo_23

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_17
;[exp] beSeduced(o.テオ) && develop.blue >= 20 && love.theo < 70 && o.テオ.penis < 17 && o.テオ.technic < 50
;[emit] sex_soft

; 結婚生活・浮気後
@eval exp='o.クレア.strip.theo = "裸・不満"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@eval exp='game.wife.moveHeart(o.テオ, 4)'
; ↑ 一度もイケないと好感度が３も下がるので４以上にする必要がある
@jump storage="heroine02b.scn" target=*theo_24

[hoteloff]
;------------------------------------------------------------------------------

; マックス関連
;------------------------------------------------------------------------------
*event_クレア_20
;[exp] beSeduced(o.マックス) && guard.max <= 4
;[emit] word

@delevent
@addevent name=クレア num=21
@jump storage="heroine02a.scn" target=*max_01

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_21
;[exp] beSeduced(o.マックス) && guard.max <= 2
;[emit] word_love

@delevent
@addevent name=クレア num=22
@jump storage="heroine02a.scn" target=*max_02

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_22
;[exp] beSeduced(o.マックス) && guard.max <= 1
;[emit] word_love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=クレア num=23 cond='! game.isFreeMode'
@addevent name=クレア num=24
@addevent name=マックス num=2 cond='! game.isFreeMode'
@eval exp='o.クレア.strip.max = "裸・恥辱"'
@eval exp='o.クレア.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=3 orgasm=2 acts=正常位,対面座位,３Ｐ
@jump storage="heroine02a.scn" target=*max_03

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_23
;[exp] NIGHT && inSameRoomOnly(o.マックス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=マックス num=2
@eval exp='o.クレア.develop.max += 20'
@eval exp='o.クレア.strip.max = "汗だく"'
@jump storage="heroine02a.scn" target=*max_04

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_24
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.クレア.strip.max = "汗だく"'
@eval exp='o.クレア.moveHeart(o.マックス, 12)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_30
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=クレア num=31
@eval exp='o.クレア.strip.theo = "裸・不満"'
@eval exp='o.クレア.strip.max = "汗だく"'
@eval exp='o.クレア.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=3 orgasm=5
@jump storage="heroine02b.scn" target=*adultery_max

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_31
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.クレア.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ライナス関連
;------------------------------------------------------------------------------
*event_クレア_40
;[exp] beSeduced(o.ライナス) && guard.linus <= 3
;[emit] word_love

@delevent
@addevent name=クレア num=41
@eval exp='o.クレア.strip.linus = "下着"'
@jump storage="heroine02a.scn" target=*linus_01

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_41
;[exp] beSeduced(o.ライナス) && guard.linus <= 2
;[emit] word_love

@delevent
@addevent name=クレア num=42 cond='! isDemoVersion'
@addevent name=クレア num=43 cond='isDemoVersion'
@addevent name=クレア num=44 cond='isDemoVersion'
@jump storage="heroine02a.scn" target=*linus_02

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_42
;[exp] beSeduced(o.ライナス) && guard.linus <= 0
;[emit] word_love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=クレア num=43 cond='! game.isFreeMode'
@addevent name=クレア num=44
@addevent name=ライナス num=2 cond='! game.isFreeMode'
@eval exp='o.クレア.strip.linus = "裸・恥辱"'
@eval exp='o.クレア.moveHeart(o.ライナス, 5)'
@recordsex guy=ライナス sex=1 orgasm=1
@jump storage="heroine02a.scn" target=*linus_03

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_43
;[exp] NIGHT && inSameRoomOnly(o.ライナス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=ライナス num=2
@eval exp='o.クレア.develop.linus += 20'
@jump storage="heroine02a.scn" target=*linus_04

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_44
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.クレア.strip.linus = "汗だく"'
@eval exp='o.クレア.moveHeart(o.ライナス, 12)'
@recordsex guy=ライナス sex=&'intrandom(2, 4)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_50
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=クレア num=51
@eval exp='o.クレア.strip.theo = "裸・不満"'
@eval exp='o.クレア.strip.linus = "汗だく"'
@eval exp='o.クレア.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=2 orgasm=2
@jump storage="heroine02b.scn" target=*adultery_linus

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_51
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.クレア.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ブルー関連
;------------------------------------------------------------------------------
*event_クレア_60
;[exp] beSeduced(o.ブルー, true)
;[emit] word

; ブルーがヒロインの部屋に移動する or 主人公と２人きりの時にブルーが部屋に入ってくる
@delevent
@addevent name=クレア num=61
@eval exp='o.クレア.strip.blue = "裸・恥辱"'
@eval exp='o.クレア.guard.blue = 0'
@recordsex guy=ブルー sex=1 orgasm=0 acts=乳揉み,クリ責め,正常位
@jump storage="heroine02b.scn" target=*blue_01

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_61
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=クレア num=62
@eval exp='game.curChara.booking.remove(3)'
@eval exp='o.クレア.moveHeart(o.ブルー, 3)'
@recordsex guy=ブルー sex=1 orgasm=1 acts=乳揉み,クリ責め,正常位
@jump storage="heroine02b.scn" target=*blue_02

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_62
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=クレア num=63 cond='! game.isFreeMode'
@addevent name=クレア num=65
@eval exp='o.クレア.strip.blue = "汗だく"'
@eval exp='o.クレア.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=3 orgasm=4
@jump storage="heroine02b.scn" target=*blue_03

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_63
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 着せ替えイベントの前の晩
@delevent
@addevent name=クレア num=64
@eval exp='o.クレア.removeEquipmentsByForce(["waist"])' cond='o.クレア.equip.waist !== void'
@eval exp='o.クレア.dressEquipment(o.中立の胸当て,,, true)'
@eval exp='o.クレア.dressEquipment(o.ひものパンツ,,, true)'
@eval exp='o.クレア.makeBustups()'
@eval exp='o.クレア.expose = cap(o.クレア.expose + 10, 100)'
@eval exp='o.クレア.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_64
;[exp] MORNING

; 着せ替えイベント
@delevent
@jump storage="heroine02b.scn" target=*blue_04

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_65
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 継続イベント
@eval exp='o.クレア.moveHeart(o.ブルー, 7)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_70
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後に同室・初日
@delevent
@addevent name=クレア num=71
@addevent name=クレア num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=3 orgasm=3
@eval exp='o.クレア.strip.blue = "汗だく"'
@jump storage="heroine02b.scn" target=*married_01

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_71
;[exp] beSeduced(o.ブルー, true) && married && o.テオ.stayAlone()
;[emit] word

; 結婚後に同室・２日目（一度主人公の部屋を訪れる・主人公が１人でいることが条件）
@delevent
@addevent name=クレア num=72
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=3 orgasm=5
@eval exp='o.クレア.dressEquipment(o.鋼鉄の貞操帯（ブルーの所持品）,,,true)'
@eval exp='o.クレア.dressEquipment(o.布のスカート,,,true)' cond='game.curChara.getAppearedPanties() !== void'
@jump storage="heroine02b.scn" target=*married_02

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_72
;[exp] beSeduced(o.ブルー, true) && married && o.テオ.stayAlone()
;[emit] word

; 結婚後に同室・３日目（一度主人公の部屋を訪れる・主人公が１人でいることが条件）
@delevent
@delevent name=クレア num=79
@addevent name=クレア num=73
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=テオ sex=1 orgasm=0
@recordsex guy=ブルー sex=1 orgasm=1
@jump storage="heroine02b.scn" target=*married_03

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_73
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・４日目
@delevent
@addevent name=クレア num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=&'intrandom(3, 4)' orgasm=&'intrandom(4, 5)'
@jump storage="heroine02b.scn" target=*married_04

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_79
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・継続イベント
@eval exp='o.クレア.moveHeart(o.ブルー, 5)'
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=&'intrandom(3, 4)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ワイルド・ブル関連
;------------------------------------------------------------------------------
*event_クレア_80
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 加入直後の夜。イベント１が発生
@delevent
@addevent num=81
@addevent num=82
@eval exp='o.クレア.strip.alex = "パンツ"'
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_81
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント１を見る
@delevent
@jump storage="heroine02a.scn" target=*wildbull_01

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_82
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex == 0

; 陵辱開始。イベント２が発生。イベント１は消滅
@delevent
@delevent num=81
@addevent num=83
@addevent num=84
@addevent num=97
@eval exp='o.クレア.strip.alex = "裸・恥辱"'
@recordsex guy=アレックス sex=3 orgasm=2

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_83
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント２を見る。継続イベントの発生条件となる
@delevent
@addevent num=85
@eval exp='o.クレア.strip.alex = "汗だく"'
@recordsex guy=アレックス sex=2 orgasm=2
@recordsex guy=どこかの男 sex=3 orgasm=1
@jump storage="heroine02a.scn" target=*wildbull_02

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_84
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && develop.alex >= 10

; 開発が進んで画像が変更される
@delevent
@eval exp='o.クレア.strip.alex = "汗だく"'

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_85
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 継続イベントが発生
@delevent
@addevent num=86

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_86
;[exp] inHideout(o.ワイルド・ブル, 2)

; 継続イベントを見る
@eval exp='o.クレア.strip.alex = "汗だく"'
@recordsex guy=どこかの男 sex=3 orgasm=3 cond='! o.ワイルド・ブル.sawRepeatableEventToday'
@eval exp='o.ワイルド・ブル.sawRepeatableEventToday = true'
@jump storage="heroine02a.scn" target=*wildbull_03

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_97
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isPregnant()

; ワイルド・ブルで妊娠。それまでのイベントは消滅
@delevent
@delevent num=83
@delevent num=84
@delevent num=85
@delevent num=86
@addevent num=98
@eval exp='o.クレア.strip.alex = "妊娠"' cond='o.クレア.strip.alex != "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_98
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isBigBelly()

; ワイルド・ブルでボテ腹。返却イベントが発生する
@delevent
@addevent name=全般 num=3
@eval exp='o.クレア.strip.alex = "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_クレア_99
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; ２回目以降
@delevent
@addevent num=86
@addevent num=97
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;==============================================================================




;■ドワーフ
;==============================================================================

; 主人公関連
;------------------------------------------------------------------------------
*event_フレデリカ_0
;[exp] beSeduced(o.テオ) && love.theo >= 0
;[emit] word

@delevent
@addevent name=フレデリカ num=1
@jump storage="heroine03a.scn" target=*theo_01

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_1
;[exp] beSeduced(o.テオ) && love.theo >= 10
;[emit] word

@delevent
@addevent name=フレデリカ num=2
@jump storage="heroine03a.scn" target=*theo_02

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_2
;[exp] MORNING && love.theo >= 20 && f.heroineEventProgress && f.hairbandDwarfID === void

; 道具屋に髪留めが追加される
@delevent
@addevent name=フレデリカ num=3
@addevent name=世界一の道具店 num=4
@eval exp='f.hairbandDwarfID = game.curChara.id'
@eval exp='o.世界一の道具店.specialItem[5] = o.ピンクの髪留め'
@eval exp='o.フレデリカ.eventInfos.add(%[name: "世界一の道具店", num: 4])'
@eval exp='o.フレデリカ.eventInfos.add(%[exp: "f.hairbandDwarfID = void"])'
@eval exp='o.フレデリカ.eventInfos.add(%[exp: "o.世界一の道具店.specialItem.remove(o.ピンクの髪留め)"])'
@eval exp='o.フレデリカ.eventInfos.add(%[exp: "game.party.ejectItem(o.ピンクの髪留め)"])'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_3
;[exp] beSeduced(o.テオ) && game.party.hasItem(o.ピンクの髪留め)
;[emit] word

@delevent
@addevent name=フレデリカ num=4
@eval exp='f.hairbandDwarfID = void'
@eval exp='game.party.ejectItem(o.ピンクの髪留め)'
@jump storage="heroine03a.scn" target=*theo_04

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_4
;[exp] beSeduced(o.テオ) && love.theo >= 30 && game.map == o.冒険者の宿
;[emit] word

@delevent
@addevent name=サファイアシティ・北西門 num=7
@addevent name=サファイアシティ・北東門 num=7
@addevent name=サファイアシティ・南西門 num=6
@addevent name=サファイアシティ・南東門 num=5
@addevent name=下水道入口 num=7
@addevent name=王立ギルド num=11
@addevent name=待合所 num=8
@addevent name=冒険者の宿 num=16
@addevent name=ホテル・クイーン num=4
@addevent name=マリオン武器工房 num=1
@addevent name=鎧屋ドミンゴ num=1
@addevent name=世界一の道具店 num=5
@addevent name=ドロシーの魔法店 num=1
@addevent name=アウラ中央教会 num=3
@addevent name=イーラ中央寺院 num=3
@addevent name=アイテム保管庫 num=2
@addevent name=サファイア城 num=14
@addevent name=アイテム博物館 num=1
@addevent name=公園 num=11
@addevent name=闘技場 num=12
@addevent name=ベトリヌスの酒場 num=21
@hideeventbtns map=サファイアシティ
[iscript]
for(var i = game.party.allMembers.count - 1; i >= 0; i--)
{
	var one = game.party.allMembers[i];
	if(one != o.テオ && one != o.フレデリカ) game.removeMemberTemporary(one);
}
[endscript]
@jump storage="heroine03a.scn" target=*theo_05

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_5
;[exp] beSeduced(o.テオ) && love.theo >= 50 && ! isDemoVersion
;[emit] word

@delevent
@addevent name=フレデリカ num=6
@jump storage="heroine03b.scn" target=*theo_07

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_6
;[exp] beSeduced(o.テオ) && love.theo >= 60 && game.getNumOfJewels() >= 7
;[emit] word

; 一時的に好感度が下がる
@delevent
@addevent name=フレデリカ num=7
@eval exp='o.フレデリカ.love.theo = 40'
@jump storage="heroine03b.scn" target=*theo_08

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_7
;[exp] beSeduced(o.テオ) && love.theo >= 50
;[emit] word

; 告白イベント
@delevent
@jump storage="heroine03b.scn" target=*theo_09

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_8
;[exp] beSeduced(o.テオ)
;[emit] word_love

; 交際中の会話
@delevent
@jump storage="heroine03b.scn" target=*theo_10

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_9
;[exp] MORNING && love.theo < 20

; 交際開始後にふられる
@delevent
@delevent name=フレデリカ num=8
@delevent name=フレデリカ num=10
@delevent name=フレデリカ num=11
@delevent name=サファイアシティ num=14
@jump storage="heroine03b.scn" target=*theo_11

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_10
;[exp] MORNING && love.theo >= 50 && game.getNumOfJewels() >= 9

; 婚約イベント１・町中でマリアと会う
@delevent
@delevent name=フレデリカ num=10
@addevent name=サファイアシティ num=14
@eval exp='o.フレデリカ.eventInfos.add(%[name: "サファイアシティ", num: 14])'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_11
;[exp] beSeduced(o.テオ)
;[emit] word

; 婚約イベント２・このキャラに限り保留という選択はない
@delevent
@delevent name=フレデリカ num=9
@jump storage="heroine03b.scn" target=*theo_13

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_13
;[exp] married
;[emit] sex_soft

; 結婚後最初のイベント
@delevent
@recordsex guy=テオ sex=2 orgasm=0
@eval exp='game.hour = "morning"'
@jump storage="heroine03b.scn" target=*theo_20

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_14
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) > 0 && (develop.blue < 20 || love.theo >= 70 || o.テオ.penis >= 17 || o.テオ.technic >= 50)
;[emit] sex_hard

; 結婚生活・満足
@eval exp='o.フレデリカ.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=&'intrandom(1, 3)'
@jump storage="heroine03b.scn" target=*theo_21

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_15
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) == 0 && (develop.blue < 20 || love.theo >= 70)
;[emit] sex_soft

; 結婚生活・不満
@eval exp='o.フレデリカ.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@jump storage="heroine03b.scn" target=*theo_22

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_16
;[exp] beSeduced(o.テオ) && love.theo < 20
;[emit] word

; 結婚生活・拒絶
@eval exp='o.フレデリカ.strip.theo = "裸・不満"'
@jump storage="heroine03b.scn" target=*theo_23

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_17
;[exp] beSeduced(o.テオ) && develop.blue >= 20 && love.theo < 70 && o.テオ.penis < 17 && o.テオ.technic < 50
;[emit] sex_soft

; 結婚生活・浮気後
@eval exp='o.フレデリカ.strip.theo = "裸・不満"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@eval exp='game.wife.moveHeart(o.テオ, 4)'
; ↑ 一度もイケないと好感度が３も下がるので４以上にする必要がある
@jump storage="heroine03b.scn" target=*theo_24

[hoteloff]
;------------------------------------------------------------------------------

; マックス関連
;------------------------------------------------------------------------------
*event_フレデリカ_20
;[exp] beSeduced(o.マックス) && guard.max <= 4
;[emit] word

@delevent
@addevent name=フレデリカ num=21
@jump storage="heroine03a.scn" target=*max_01

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_21
;[exp] beSeduced(o.マックス) && guard.max <= 3
;[emit] word

@delevent
@addevent name=フレデリカ num=22
@jump storage="heroine03a.scn" target=*max_02

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_22
;[exp] beSeduced(o.マックス) && guard.max <= 1
;[emit] word

@delevent
@addevent name=フレデリカ num=23 cond='! isDemoVersion'
@addevent name=フレデリカ num=25 cond='isDemoVersion'
@addevent name=フレデリカ num=26 cond='isDemoVersion'
@jump storage="heroine03a.scn" target=*max_03

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_23
;[exp] SUNSET && game.map == o.冒険者の宿

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=フレデリカ num=24
@eval exp='o.フレデリカ.strip.max = "裸・恥辱"'
@eval exp='o.フレデリカ.moveHeart(o.マックス, 1)'
@recordsex guy=マックス sex=1 orgasm=0
@eval exp='game.hotelView.eraseCharaMarker(o.フレデリカ)'
@eval exp='game.hotelView.eraseCharaMarker(o.マックス)'
@jump storage="heroine03a.scn" target=*max_04

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_24
;[exp] beSeduced(o.マックス)
;[emit] word_love

@delevent
@addevent name=フレデリカ num=25 cond='! game.isFreeMode'
@addevent name=フレデリカ num=26
@addevent name=マックス num=3 cond='! game.isFreeMode'
@eval exp='o.フレデリカ.strip.max = "汗だく"'
@recordsex guy=マックス sex=3 orgasm=2
@jump storage="heroine03a.scn" target=*max_05

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_25
;[exp] NIGHT && inSameRoomOnly(o.マックス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=マックス num=3
@eval exp='o.フレデリカ.develop.max += 20'
@recordsex guy=マックス sex=3 orgasm=3
@jump storage="heroine03a.scn" target=*max_06

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_26
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.フレデリカ.strip.max = "汗だく"'
@eval exp='o.フレデリカ.moveHeart(o.マックス, 12)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_30
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=フレデリカ num=31
@eval exp='o.フレデリカ.strip.theo = "裸・不満"'
@eval exp='o.フレデリカ.strip.max = "汗だく"'
@eval exp='o.フレデリカ.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=3 orgasm=5
@jump storage="heroine03b.scn" target=*adultery_max

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_31
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.フレデリカ.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ライナス関連
;------------------------------------------------------------------------------
*event_フレデリカ_40
;[exp] beSeduced(o.ライナス) && guard.linus <= 3
;[emit] word

@delevent
@addevent name=フレデリカ num=41
@eval exp='o.フレデリカ.strip.linus = "下着"'
@jump storage="heroine03a.scn" target=*linus_01

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_41
;[exp] beSeduced(o.ライナス) && guard.linus <= 2
;[emit] word

@delevent
@addevent name=フレデリカ num=42 cond='! isDemoVersion'
@addevent name=フレデリカ num=44 cond='isDemoVersion'
@addevent name=フレデリカ num=45 cond='isDemoVersion'
@eval exp='o.フレデリカ.strip.linus = "裸・恥辱"'
@jump storage="heroine03a.scn" target=*linus_02

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_42
;[exp] beSeduced(o.ライナス) && guard.linus <= 1
;[emit] word_love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=フレデリカ num=43
@eval exp='o.フレデリカ.moveHeart(o.ライナス, 5)'
@recordsex guy=ライナス sex=1 orgasm=0
@jump storage="heroine03a.scn" target=*linus_03

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_43
;[exp] beSeduced(o.ライナス)
;[emit] sex_soft

@delevent
@addevent name=フレデリカ num=44 cond='! game.isFreeMode'
@addevent name=フレデリカ num=45
@addevent name=ライナス num=3 cond='! game.isFreeMode'
@eval exp='o.フレデリカ.strip.linus = "汗だく"'
@recordsex guy=ライナス sex=3 orgasm=1
@jump storage="heroine03a.scn" target=*linus_04

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_44
;[exp] NIGHT && inSameRoomOnly(o.ライナス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=ライナス num=3
@eval exp='o.フレデリカ.develop.linus += 20'
@jump storage="heroine03a.scn" target=*linus_05

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_45
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.フレデリカ.strip.linus = "汗だく"'
@eval exp='o.フレデリカ.moveHeart(o.ライナス, 12)'
@recordsex guy=ライナス sex=&'intrandom(2, 4)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_50
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=フレデリカ num=51
@eval exp='o.フレデリカ.strip.theo = "裸・不満"'
@eval exp='o.フレデリカ.strip.linus = "汗だく"'
@eval exp='o.フレデリカ.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=2 orgasm=2
@jump storage="heroine03b.scn" target=*adultery_linus

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_51
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.フレデリカ.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ブルー関連
;------------------------------------------------------------------------------
*event_フレデリカ_60
;[exp] beSeduced(o.ブルー, true)
;[emit] word

; ブルーがヒロインの部屋に移動する or 主人公と２人きりの時にブルーが部屋に入ってくる
@delevent
@addevent name=フレデリカ num=61
@eval exp='o.フレデリカ.strip.blue = "裸・恥辱"'
@eval exp='o.フレデリカ.guard.blue = 0'
@jump storage="heroine03b.scn" target=*blue_01
; セックスの記録はシナリオの最後で行う

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_61
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=フレデリカ num=62
@eval exp='game.curChara.booking.remove(3)'
@recordsex guy=ブルー sex=1 orgasm=1 acts=乳揉み,クリ責め,正常位
@jump storage="heroine03b.scn" target=*blue_02

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_62
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=フレデリカ num=63 cond='! game.isFreeMode'
@addevent name=フレデリカ num=65
@eval exp='o.フレデリカ.strip.blue = "汗だく"'
@recordsex guy=ブルー sex=3 orgasm=3 acts=パイズリ,対面座位,騎乗位
@jump storage="heroine03b.scn" target=*blue_03

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_63
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 着せ替えイベントの前の晩
@delevent
@addevent name=フレデリカ num=64
@eval exp='o.フレデリカ.removeEquipmentsByForce(["waist"])' cond='o.フレデリカ.equip.waist !== void'
@eval exp='o.フレデリカ.dressEquipment(o.中立の胸当て,,, true)'
@eval exp='o.フレデリカ.dressEquipment(o.ひものパンツ,,, true)'
@eval exp='o.フレデリカ.makeBustups()'
@eval exp='o.フレデリカ.expose = cap(o.フレデリカ.expose + 10, 100)'
@eval exp='o.フレデリカ.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_64
;[exp] MORNING

; 着せ替えイベント
@delevent
@jump storage="heroine03b.scn" target=*blue_04

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_65
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 継続イベント
@eval exp='o.フレデリカ.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_70
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後に同室・初日
@delevent
@addevent name=フレデリカ num=71
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=5 orgasm=5
@eval exp='o.フレデリカ.strip.blue = "汗だく"'
@jump storage="heroine03b.scn" target=*married_01

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_71
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後に同室・２日目
@delevent
@addevent name=フレデリカ num=72
@addevent name=フレデリカ num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=4 orgasm=4 acts=パイズリ,対面座位,騎乗位
@jump storage="heroine03b.scn" target=*married_02

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_72
;[exp] beSeduced(o.ブルー, true) && married && o.テオ.stayAlone()
;[emit] word

; ブルーが一時的に外出・主人公が１人でいることが条件
@delevent
@delevent name=フレデリカ num=79
@addevent name=フレデリカ num=73
@eval exp='o.フレデリカ.dressEquipment(o.鋼鉄の貞操帯（ブルーの所持品）,,,true)'
@eval exp='o.フレデリカ.dressEquipment(o.布のスカート,,,true)' cond='game.curChara.getAppearedPanties() !== void'
@jump storage="heroine03b.scn" target=*married_03

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_73
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・４日目
@delevent
@addevent name=フレデリカ num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=5 orgasm=5
@jump storage="heroine03b.scn" target=*married_04

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_79
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・継続イベント
@eval exp='o.フレデリカ.moveHeart(o.ブルー, 5)'
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=&'intrandom(4, 5)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ワイルド・ブル関連
;------------------------------------------------------------------------------
*event_フレデリカ_80
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 加入直後の夜。イベント１が発生
@delevent
@addevent num=81
@addevent num=82
@eval exp='o.フレデリカ.strip.alex = "パンツ"'
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_81
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント１を見る
@delevent
@jump storage="heroine03a.scn" target=*wildbull_01

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_82
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex <= 2

; イベント２が発生。イベント１は消滅
@delevent
@delevent num=81
@addevent num=83
@addevent num=84

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_83
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント２を見る
@delevent
@recordsex guy=アレックス sex=0 orgasm=0 acts=パイズリ
@jump storage="heroine03a.scn" target=*wildbull_02

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_84
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex == 0

; 陵辱開始。イベント２は消滅
@delevent
@delevent num=83
@addevent num=85
@addevent num=97
@eval exp='o.フレデリカ.strip.alex = "裸・恥辱"'
@recordsex guy=アレックス sex=3 orgasm=0

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_85
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && develop.alex >= 10

; イベント３が発生
@delevent
@addevent num=86 cond='! isDemoVersion'
@addevent num=87 cond='isDemoVersion'
@eval exp='o.フレデリカ.strip.alex = "汗だく"'
@recordsex guy=アレックス sex=3 orgasm=1
@recordsex guy=どこかの男 sex=5 orgasm=2

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_86
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント３を見る。継続イベントの発生条件となる
@delevent
@addevent num=87
@recordsex guy=アレックス sex=1 orgasm=1
@recordsex guy=どこかの男 sex=3 orgasm=2
@jump storage="heroine03a.scn" target=*wildbull_03

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_87
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 継続イベントが発生
@delevent
@addevent num=88

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_88
;[exp] inHideout(o.ワイルド・ブル, 2)

; 継続イベントを見る
@eval exp='o.フレデリカ.strip.alex = "汗だく"'
@recordsex guy=どこかの男 sex=3 orgasm=2 cond='! o.ワイルド・ブル.sawRepeatableEventToday'
@eval exp='o.ワイルド・ブル.sawRepeatableEventToday = true'
@jump storage="heroine03a.scn" target=*wildbull_04

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_97
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isPregnant()

; ワイルド・ブルで妊娠。それまでのイベントは消滅
@delevent
@delevent num=85
@delevent num=86
@delevent num=87
@delevent num=88
@addevent num=98
@eval exp='o.フレデリカ.strip.alex = "妊娠"' cond='o.フレデリカ.strip.alex != "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_98
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isBigBelly()

; ワイルド・ブルでボテ腹。返却イベントが発生する
@delevent
@addevent name=全般 num=3
@eval exp='o.フレデリカ.strip.alex = "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_フレデリカ_99
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; ２回目以降
@delevent
@addevent num=88
@addevent num=97
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;==============================================================================




;■ノーム
;==============================================================================

; 主人公関連
;------------------------------------------------------------------------------
*event_ミューズ_0
;[exp] beSeduced(o.テオ) && love.theo >= 0
;[emit] word

@delevent
@addevent name=ミューズ num=1
@jump storage="heroine04a.scn" target=*theo_01

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_1
;[exp] beSeduced(o.テオ) && love.theo >= 10
;[emit] word

@delevent
@addevent name=ミューズ num=2
@jump storage="heroine04a.scn" target=*theo_02

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_2
;[exp] beSeduced(o.テオ) && love.theo >= 20 && f.heroineEventProgress
;[emit] word

@delevent
@addevent name=ミューズ num=3
@jump storage="heroine04a.scn" target=*theo_03

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_3
;[exp] SUNSET && game.map == o.冒険者の宿 && inSameRoomOnly(o.テオ) && love.theo >= 30

@delevent
@markopt chara=ミューズ visible=false
@addeventbtn map=冒険者の宿 label=宿の外_1 name=宿の外 img=incident x=40 y=550
@eval exp='game.hotelView.stopSleeping = "宿の外_1"'
@eval exp='f.surroundedGnomeID = game.curChara.id'
@jump storage="heroine04a.scn" target=*theo_04

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_4
;[exp] EARLY && game.map != o.ホテル・クイーン && love.theo >= 40 && game.getNumOfJewels() >= 7

@delevent
@addevent name=ミューズ num=5
@jump storage="heroine04b.scn" target=*theo_06

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_5
;[exp] beSeduced(o.テオ) && love.theo >= 50 && ! o.ノームの洞窟.events.has(3)
;[emit] word

; ノームの洞窟のイベント発生
@delevent
@addevent map=ノームの洞窟 num=3
@eval exp='f.returningGnomeID = game.curChara.id'
@eval exp='o.ミューズ.eventInfos.add(%[map: "ノームの洞窟", num: 3])'
@eval exp='o.ミューズ.eventInfos.add(%[exp: "f.returningGnomeID = void"])'
@jump storage="heroine04b.scn" target=*theo_07

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_6
;[exp] beSeduced(o.テオ) && love.theo >= 50
;[emit] word

@delevent
@addevent name=ミューズ num=7
@jump storage="heroine04b.scn" target=*theo_11

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_7
;[exp] beSeduced(o.テオ) && love.theo >= 60
;[emit] word

; 告白イベント
@delevent
@jump storage="heroine04b.scn" target=*theo_12

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_8
;[exp] beSeduced(o.テオ) && love.theo >= 60
;[emit] word_love

; 交際中の会話
@delevent
@jump storage="heroine04b.scn" target=*theo_13

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_9
;[exp] MORNING && love.theo < 20

; 交際開始後にふられる
@delevent
@delevent name=ミューズ num=8
@delevent name=ミューズ num=10
@jump storage="heroine04b.scn" target=*theo_14

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_10
;[exp] beSeduced(o.テオ) && love.theo >= 60 && game.getNumOfJewels() >= 9
;[emit] word

; 婚約イベント
; 婚約したら翌朝イベントが発生し結婚へ
@jump storage="heroine04b.scn" target=*theo_15

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_13
;[exp] married
;[emit] sex_soft

; 結婚後最初のイベント
@delevent
@recordsex guy=テオ sex=2 orgasm=0
@eval exp='game.hour = "morning"'
@jump storage="heroine04b.scn" target=*theo_20

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_14
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) > 0 && (develop.blue < 20 || love.theo >= 70 || o.テオ.penis >= 16 || o.テオ.technic >= 50)
;[emit] sex_hard

; 結婚生活・満足
@eval exp='o.ミューズ.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=&'intrandom(1, 3)'
@jump storage="heroine04b.scn" target=*theo_21

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_15
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) == 0 && (develop.blue < 20 || love.theo >= 70)
;[emit] sex_soft

; 結婚生活・不満
@eval exp='o.ミューズ.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@jump storage="heroine04b.scn" target=*theo_22

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_16
;[exp] beSeduced(o.テオ) && love.theo < 20
;[emit] word

; 結婚生活・拒絶
@eval exp='o.ミューズ.strip.theo = "裸・不満"'
@jump storage="heroine04b.scn" target=*theo_23

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_17
;[exp] beSeduced(o.テオ) && develop.blue >= 20 && love.theo < 70 && o.テオ.penis < 16 && o.テオ.technic < 50
;[emit] sex_soft

; 結婚生活・浮気後
@eval exp='o.ミューズ.strip.theo = "裸・不満"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@eval exp='game.wife.moveHeart(o.テオ, 4)'
; ↑ 一度もイケないと好感度が３も下がるので４以上にする必要がある
@jump storage="heroine04b.scn" target=*theo_24

[hoteloff]
;------------------------------------------------------------------------------

; マックス関連
;------------------------------------------------------------------------------
*event_ミューズ_20
;[exp] beSeduced(o.マックス) && guard.max <= 4
;[emit] word

@delevent
@addevent name=ミューズ num=21
@jump storage="heroine04a.scn" target=*max_01

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_21
;[exp] beSeduced(o.マックス) && guard.max <= 3
;[emit] word

@delevent
@addevent name=ミューズ num=22
@jump storage="heroine04a.scn" target=*max_02

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_22
;[exp] beSeduced(o.マックス) && guard.max <= 2
;[emit] word

@delevent
@addevent name=ミューズ num=23
@jump storage="heroine04a.scn" target=*max_03

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_23
;[exp] beSeduced(o.マックス) && guard.max == 0
;[emit] word_love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=ミューズ num=24 cond='! isDemoVersion'
@addevent name=ミューズ num=25 cond='isDemoVersion'
@addevent name=ミューズ num=26 cond='isDemoVersion'
@eval exp='o.ミューズ.strip.max = "裸・恥辱"'
@eval exp='o.ミューズ.moveHeart(o.マックス, 1)'
@recordsex guy=マックス sex=1 orgasm=0
@jump storage="heroine04a.scn" target=*max_04

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_24
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

@delevent
@addevent name=ミューズ num=25 cond='! game.isFreeMode'
@addevent name=ミューズ num=26 cond='! game.isFreeMode'
@addevent name=ミューズ num=28 cond='game.isFreeMode'
@addevent name=マックス num=4 cond='! game.isFreeMode'
@eval exp='o.ミューズ.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=5 orgasm=3
@jump storage="heroine04a.scn" target=*max_05

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_25
;[exp] NIGHT && inSameRoomOnly(o.マックス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=マックス num=4
@eval exp='o.ミューズ.develop.max += 20'
@addevent name=ミューズ num=26
@jump storage="heroine04a.scn" target=*max_06

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_26
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

@delevent
@addevent name=ミューズ num=27
@recordsex guy=マックス sex=&'intrandom(3, 4)' orgasm=&'intrandom(2, 3)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_27
;[exp] MORNING

@delevent
@addevent name=ミューズ num=28
@eval exp='o.ミューズ.strip.max = "汗だく"'
@eval exp='o.ミューズ.moveHeart(o.マックス, 7)'
@recordsex guy=マックス sex=3 orgasm=3
@jump storage="heroine04a.scn" target=*max_07

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_28
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.ミューズ.moveHeart(o.マックス, 7)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_30
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=ミューズ num=31
@eval exp='o.ミューズ.strip.theo = "裸・不満"'
@eval exp='o.ミューズ.strip.max = "汗だく"'
@eval exp='o.ミューズ.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=3 orgasm=5
@jump storage="heroine04b.scn" target=*adultery_max

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_31
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.ミューズ.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ライナス関連
;------------------------------------------------------------------------------
*event_ミューズ_40
;[exp] beSeduced(o.ライナス) && guard.linus <= 3
;[emit] word

@delevent
@addevent name=ミューズ num=41
@jump storage="heroine04a.scn" target=*linus_01

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_41
;[exp] beSeduced(o.ライナス) && game.map == o.冒険者の宿 && guard.linus <= 2
;[emit] word

@delevent
@addevent name=ミューズ num=42
@jump storage="heroine04a.scn" target=*linus_02

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_42
;[exp] beSeduced(o.ライナス) && guard.linus <= 1
;[emit] word_love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=ミューズ num=43 cond='! isDemoVersion'
@addevent name=ミューズ num=44 cond='isDemoVersion'
@addevent name=ミューズ num=45 cond='isDemoVersion'
@eval exp='o.ミューズ.guard.linus = 0'
@eval exp='o.ミューズ.strip.linus = "裸・恥辱"'
@eval exp='o.ミューズ.moveHeart(o.ライナス, 1)'
@recordsex guy=ライナス sex=1 orgasm=0 acts=バック
@jump storage="heroine04a.scn" target=*linus_03

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_43
;[exp] beSeduced(o.ライナス) && guard.linus == 0
;[emit] sex_hard

@delevent
@addevent name=ミューズ num=44 cond='! game.isFreeMode'
@addevent name=ミューズ num=45
@addevent name=ライナス num=4 cond='! game.isFreeMode'
@eval exp='o.ミューズ.moveHeart(o.ライナス, 5)'
@recordsex guy=ライナス sex=2 orgasm=1 acts=正常位,クリ責め,乳首吸い
@jump storage="heroine04a.scn" target=*linus_04

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_44
;[exp] NIGHT && inSameRoomOnly(o.ライナス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=ライナス num=4
@eval exp='o.ミューズ.develop.linus += 20'
@jump storage="heroine04a.scn" target=*linus_05

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_45
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

@delevent
@addevent name=ミューズ num=46
@eval exp='o.ミューズ.strip.linus = "汗だく"'
@eval exp='o.ミューズ.moveHeart(o.ライナス, 5)'
@recordsex guy=ライナス sex=&'intrandom(3, 4)' orgasm=&'intrandom(2, 3)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_46
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.ミューズ.moveHeart(o.ライナス, 5)'
@recordsex guy=ライナス sex=&'intrandom(3, 4)' orgasm=&'intrandom(2, 3)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_50
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=ミューズ num=51
@eval exp='o.ミューズ.strip.theo = "裸・不満"'
@eval exp='o.ミューズ.strip.linus = "汗だく"'
@eval exp='o.ミューズ.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=2 orgasm=2
@jump storage="heroine04b.scn" target=*adultery_linus

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_51
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.ミューズ.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ブルー関連
;------------------------------------------------------------------------------
*event_ミューズ_60
;[exp] beSeduced(o.ブルー, true)
;[emit] word

; ブルーがヒロインの部屋に移動する or 主人公と２人きりの時にブルーが部屋に入ってくる
@delevent
@addevent name=ミューズ num=61
@eval exp='o.ミューズ.strip.blue = "裸・恥辱"'
@eval exp='o.ミューズ.guard.blue = 0'
@jump storage="heroine04b.scn" target=*blue_01
; セックスの記録はシナリオの最後で行う

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_61
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=ミューズ num=62
@eval exp='game.curChara.booking.remove(3)'
@recordsex guy=ブルー sex=1 orgasm=1 acts=乳揉み,クリ責め,正常位
@jump storage="heroine04b.scn" target=*blue_02

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_62
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=ミューズ num=63 cond='! game.isFreeMode'
@addevent name=ミューズ num=65
@recordsex guy=ブルー sex=3 orgasm=3
@eval exp='o.ミューズ.strip.blue = "汗だく"'
@jump storage="heroine04b.scn" target=*blue_03

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_63
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 着せ替えイベントの前の晩
@delevent
@addevent name=ミューズ num=64
@eval exp='o.ミューズ.removeEquipmentsByForce(["waist"])' cond='o.ミューズ.equip.waist !== void'
@eval exp='o.ミューズ.dressEquipment(o.中立の胸当て,,, true)'
@eval exp='o.ミューズ.dressEquipment(o.ひものパンツ,,, true)'
@eval exp='o.ミューズ.makeBustups()'
@eval exp='o.ミューズ.expose = cap(o.ミューズ.expose + 10, 100)'
@eval exp='o.ミューズ.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_64
;[exp] MORNING

; 着せ替えイベント
@delevent
@jump storage="heroine04b.scn" target=*blue_04

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_65
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 継続イベント
@eval exp='o.ミューズ.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_70
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後に同室・初日
@delevent
@addevent name=ミューズ num=71
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=2 orgasm=2
@eval exp='o.ミューズ.strip.blue = "汗だく"'
@jump storage="heroine04b.scn" target=*married_01

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_71
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後に同室・２日目
@delevent
@addevent name=ミューズ num=72
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=4 orgasm=4
@jump storage="heroine04b.scn" target=*married_02

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_72
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後に同室・３日目
@delevent
@addevent name=ミューズ num=73
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=2 orgasm=2
@eval exp='o.ミューズ.dressEquipment(o.鋼鉄の貞操帯（ブルーの所持品）,,,true)'
@eval exp='o.ミューズ.dressEquipment(o.布のスカート,,,true)' cond='game.curChara.getAppearedPanties() !== void'
@jump storage="heroine04b.scn" target=*married_03

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_73
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・４日目
@delevent
@addevent name=ミューズ num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=3 orgasm=3
@jump storage="heroine04b.scn" target=*married_04

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_79
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・継続イベント
@eval exp='o.ミューズ.moveHeart(o.ブルー, 5)'
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(3, 4)'

[hoteloff]
;------------------------------------------------------------------------------

; ワイルド・ブル関連
;------------------------------------------------------------------------------
*event_ミューズ_80
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 加入直後の夜
@delevent
@addevent num=81
@eval exp='o.ミューズ.strip.alex = "パンツ"'
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_81
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex <= 4

; イベント１が発生
@delevent
@addevent num=82
@addevent num=83
@eval exp='o.ミューズ.strip.alex = "裸・恥辱"'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_82
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント１を見る
@delevent
@jump storage="heroine04a.scn" target=*wildbull_01

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_83
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex <= 2

; イベント２が発生。イベント１は消滅
@delevent
@delevent num=82
@addevent num=84
@addevent num=85

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_84
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント２を見る
@delevent
@jump storage="heroine04a.scn" target=*wildbull_02

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_85
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex == 0

; 陵辱開始。イベント３が発生。イベント２は消滅
@delevent
@delevent num=84
@addevent num=86
@addevent num=97
@eval exp='o.ミューズ.strip.alex = "汗だく"'
@eval exp='o.ミューズ.moveHeart(o.アレックス, 5)'
@recordsex guy=アレックス sex=3 orgasm=1
@recordsex guy=どこかの男 sex=5 orgasm=1
@recordsex guy=エリック sex=2 orgasm=0 cond='o.ワイルド・ブル.members.has(o.エリック)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_86
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント３を見る。継続イベントの発生条件となる
@delevent
@addevent num=87
@recordsex guy=アレックス sex=1 orgasm=1
@jump storage="heroine04a.scn" target=*wildbull_03

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_87
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 継続イベントが発生
@delevent
@addevent num=88

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_88
;[exp] inHideout(o.ワイルド・ブル, 2)

; 継続イベントを見る
@eval exp='o.ミューズ.strip.alex = "汗だく"'
@recordsex guy=どこかの男 sex=3 orgasm=2 cond='! o.ワイルド・ブル.sawRepeatableEventToday'
@eval exp='o.ワイルド・ブル.sawRepeatableEventToday = true'
@jump storage="heroine04a.scn" target=*wildbull_04

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_97
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isPregnant()

; ワイルド・ブルで妊娠。それまでのイベントは消滅
@delevent
@delevent num=86
@delevent num=87
@delevent num=88
@addevent num=98
@eval exp='o.ミューズ.strip.alex = "妊娠"' cond='o.ミューズ.strip.alex != "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_98
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isBigBelly()

; ワイルド・ブルでボテ腹。返却イベントが発生する
@delevent
@addevent name=全般 num=3
@eval exp='o.ミューズ.strip.alex = "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミューズ_99
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; ２回目以降
@delevent
@addevent num=88
@addevent num=97
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;==============================================================================




;■シルフ
;==============================================================================

; 主人公関連
;------------------------------------------------------------------------------
*event_マルエット_0
;[exp] beSeduced(o.テオ) && love.theo >= 0
;[emit] word

@delevent
@addevent name=マルエット num=1
@jump storage="heroine05a.scn" target=*theo_01

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_1
;[exp] beSeduced(o.テオ) && love.theo >= 10
;[emit] word

@delevent
@addevent name=マルエット num=2
@jump storage="heroine05a.scn" target=*theo_02

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_2
;[exp] beSeduced(o.テオ) && love.theo >= 30 && f.searcningSylphID === void
;[emit] word

@delevent
@eval exp='f.searcningSylphID = game.curChara.id'
@eval exp='o.マルエット.eventInfos.add(%[exp: "f.searcningSylphID = void"])'
@jump storage="heroine05a.scn" target=*theo_03

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_3
;[exp] MORNING && game.map == o.冒険者の宿 && love.theo >= 40

@delevent
@addevent name=マルエット num=4
@addevent map=ペンスキー峠・峠道 num=7
@addevent map=ペンスキー峠・峠道 num=8
@addevent map=ペンスキー峠・高台 num=2
@addevent name=サファイアシティ・北西門 num=8
@addevent name=サファイアシティ・北東門 num=8
@addevent name=サファイアシティ・南西門 num=7
@addevent name=下水道入口 num=8
@addevent name=王立ギルド num=12
@addevent name=待合所 num=9
@addevent name=ベトリヌスの酒場 num=22
@addevent name=冒険者の宿 num=17
@addevent name=ホテル・クイーン num=5
@addevent name=サファイア城 num=15
@addevent name=公園 num=12
@addevent name=闘技場 num=13
@hideeventbtns map=サファイアシティ

[iscript]
tf.temp = game.party.findItem(o.マジックラダー);
if(tf.temp !== void) tf.temp.chara.ejectItem(o.マジックラダー);

for(var i = game.party.allMembers.count - 1; i >= 0; i--)
{
	var one = game.party.allMembers[i];
	if(one != o.マルエット && one != o.テオ) game.removeMemberTemporary(one);
}

if(! game.party.insertItem(o.マジックラダー)) game.temporaryBox.storeItemToTrunk(o.マジックラダー);

[endscript]

@eval exp='f.visitingSylphID = game.curChara.id'
@jump storage="heroine05b.scn" target=*theo_05

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_4
;[exp] beSeduced(o.テオ) && love.theo >= 50
;[emit] love

@delevent
@addevent name=マルエット num=5
@jump storage="heroine05b.scn" target=*theo_07

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_5
;[exp] beSeduced(o.テオ) && love.theo >= 60
;[emit] word

; 告白イベント
@delevent
@jump storage="heroine05b.scn" target=*theo_08

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_6
;[exp] beSeduced(o.テオ) && love.theo >= 60
;[emit] word_love

; 交際中の会話
@delevent
@jump storage="heroine05b.scn" target=*theo_09

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_7
;[exp] MORNING && love.theo < 20

; 交際開始後にふられる
@delevent
@delevent name=マルエット num=6
@delevent name=マルエット num=8
@jump storage="heroine05b.scn" target=*theo_10

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_8
;[exp] beSeduced(o.テオ) && love.theo >= 60 && game.getNumOfJewels() >= 9
;[emit] word

; 婚約イベント
; 婚約したら翌朝イベントが発生し結婚へ
@jump storage="heroine05b.scn" target=*theo_11

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_13
;[exp] married
;[emit] sex_soft

; 結婚後最初のイベント
@delevent
@recordsex guy=テオ sex=2 orgasm=0
@eval exp='game.hour = "morning"'
@jump storage="heroine05b.scn" target=*theo_20

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_14
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) > 0 && (develop.blue < 20 || love.theo >= 70 || o.テオ.penis >= 16 || o.テオ.technic >= 50)
;[emit] sex_hard

; 結婚生活・満足
@eval exp='o.マルエット.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=&'intrandom(1, 3)'
@jump storage="heroine05b.scn" target=*theo_21

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_15
;[exp] beSeduced(o.テオ) && love.theo >= 20 && getOrgasmCount(o.テオ, 2) == 0 && (develop.blue < 20 || love.theo >= 70)
;[emit] sex_soft

; 結婚生活・不満
@eval exp='o.マルエット.strip.theo = "裸・幸せ"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@jump storage="heroine05b.scn" target=*theo_22

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_16
;[exp] beSeduced(o.テオ) && love.theo < 20
;[emit] word

; 結婚生活・拒絶
@eval exp='o.マルエット.strip.theo = "裸・不満"'
@jump storage="heroine05b.scn" target=*theo_23

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_17
;[exp] beSeduced(o.テオ) && develop.blue >= 20 && love.theo < 70 && o.テオ.penis < 16 && o.テオ.technic < 50
;[emit] sex_soft

; 結婚生活・浮気後
@eval exp='o.マルエット.strip.theo = "裸・不満"'
@recordsex guy=テオ sex=&'intrandom(2, 3)' orgasm=0
@eval exp='game.wife.moveHeart(o.テオ, 4)'
; ↑ 一度もイケないと好感度が３も下がるので４以上にする必要がある
@jump storage="heroine05b.scn" target=*theo_24

[hoteloff]
;------------------------------------------------------------------------------

; マックス関連
;------------------------------------------------------------------------------
*event_マルエット_20
;[exp] beSeduced(o.マックス) && guard.max <= 4
;[emit] word

@delevent
@addevent name=マルエット num=21
@jump storage="heroine05a.scn" target=*max_01

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_21
;[exp] beSeduced(o.マックス) && guard.max <= 3
;[emit] word_love

@delevent
@addevent name=マルエット num=22

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_22
;[exp] MORNING

@delevent
@addevent name=マルエット num=23
@jump storage="heroine05a.scn" target=*max_02

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_23
;[exp] beSeduced(o.マックス) && guard.max <= 2
;[emit] word_love

@delevent
@addevent name=マルエット num=24 cond='! isDemoVersion'
@addevent name=マルエット num=27 cond='isDemoVersion'
@addevent name=マルエット num=28 cond='isDemoVersion'
@jump storage="heroine05a.scn" target=*max_03

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_24
;[exp] beSeduced(o.マックス) && guard.max <= 1
;[emit] word_love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=マルエット num=25
@eval exp='o.マルエット.strip.max = "裸・恥辱"'
@eval exp='o.マルエット.moveHeart(o.マックス, 1)'
@recordsex guy=マックス sex=1 orgasm=0
@jump storage="heroine05a.scn" target=*max_04

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_25
;[exp] beSeduced(o.マックス)
;[emit] word_love

@delevent
@addevent name=マルエット num=26
@jump storage="heroine05a.scn" target=*max_05

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_26
;[exp] MORNING

@delevent
@addevent name=マルエット num=27 cond='! game.isFreeMode'
@addevent name=マルエット num=28
@addevent name=マックス num=5 cond='! game.isFreeMode'
@eval exp='o.マルエット.strip.max = "汗だく"'
@eval exp='o.マルエット.moveHeart(o.マックス, 3)'
@recordsex guy=マックス sex=2 orgasm=2
@jump storage="heroine05a.scn" target=*max_06

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_27
;[exp] NIGHT && inSameRoomOnly(o.マックス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=マックス num=5
@eval exp='o.マルエット.develop.max += 20'
@jump storage="heroine05a.scn" target=*max_07

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_28
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.マルエット.strip.max = "汗だく"'
@eval exp='o.マルエット.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=&'intrandom(3, 4)' orgasm=&'intrandom(1, 3)'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_30
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=マルエット num=31
@eval exp='o.マルエット.strip.theo = "裸・不満"'
@eval exp='o.マルエット.strip.max = "汗だく"'
@eval exp='o.マルエット.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=3 orgasm=5
@jump storage="heroine05b.scn" target=*adultery_max

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_31
;[exp] beSeduced(o.マックス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.マルエット.moveHeart(o.マックス, 5)'
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ライナス関連
;------------------------------------------------------------------------------
*event_マルエット_40
;[exp] beSeduced(o.ライナス) && guard.linus <= 4
;[emit] word

@delevent
@addevent name=マルエット num=41
@jump storage="heroine05a.scn" target=*linus_01

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_41
;[exp] beSeduced(o.ライナス) && guard.linus <= 3
;[emit] word

@delevent
@addevent name=マルエット num=42
@jump storage="heroine05a.scn" target=*linus_02

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_42
;[exp] beSeduced(o.ライナス) && guard.linus <= 1
;[emit] word_love

; 初めて関係を結ぶときの処理とイベント
@delevent
@addevent name=マルエット num=43 cond='! isDemoVersion'
@addevent name=マルエット num=44 cond='isDemoVersion'
@addevent name=マルエット num=45 cond='isDemoVersion'
@eval exp='o.マルエット.guard.linus = 0'
@eval exp='o.マルエット.strip.linus = "裸・恥辱"'
@eval exp='o.マルエット.moveHeart(o.ライナス, 1)'
@recordsex guy=ライナス sex=1 orgasm=0
@jump storage="heroine05a.scn" target=*linus_03

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_43
;[exp] beSeduced(o.ライナス) && guard.linus <= 0
;[emit] sex_soft

; ２回目のＨイベント
@delevent
@addevent name=マルエット num=44 cond='! game.isFreeMode'
@addevent name=マルエット num=45
@addevent name=ライナス num=5 cond='! game.isFreeMode'
@eval exp='o.マルエット.strip.linus = "汗だく"'
@eval exp='o.マルエット.moveHeart(o.ライナス, 4)'
@recordsex guy=ライナス sex=1 orgasm=1
@jump storage="heroine05a.scn" target=*linus_04

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_44
;[exp] NIGHT && inSameRoomOnly(o.ライナス)

; 会話ボタンからのイベント
; 開発度が20を越えることで以降の通常会話も変わる
@delevent
@delevent name=ライナス num=5
@eval exp='o.マルエット.develop.linus += 20'
@jump storage="heroine05a.scn" target=*linus_05

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_45
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

; 継続イベント
@eval exp='o.マルエット.strip.linus = "汗だく"'
@eval exp='o.マルエット.moveHeart(o.ライナス, 5)'
@recordsex guy=ライナス sex=&'intrandom(2, 3)' orgasm=&'intrandom(1, 2)'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_50
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント
@delevent
@addevent name=マルエット num=51
@eval exp='o.マルエット.strip.theo = "裸・不満"'
@eval exp='o.マルエット.strip.linus = "汗だく"'
@eval exp='o.マルエット.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=2 orgasm=2
@jump storage="heroine05b.scn" target=*adultery_linus

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_51
;[exp] beSeduced(o.ライナス) && married && love.theo < master.loveToAdultery
;[emit] sex_hard

; 不倫イベント・２回目以降
@eval exp='o.マルエット.moveHeart(o.ライナス, 3)'
@recordsex guy=ライナス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ブルー関連
;------------------------------------------------------------------------------
*event_マルエット_60
;[exp] beSeduced(o.ブルー, true)
;[emit] word

; ブルーがヒロインの部屋に移動する or 主人公と２人きりの時にブルーが部屋に入ってくる
@delevent
@addevent name=マルエット num=61
@eval exp='o.マルエット.strip.blue = "パンツ"'
@eval exp='o.マルエット.guard.blue = 0'
@recordsex guy=ブルー sex=0 orgasm=0 acts=フェラチオ
@jump storage="heroine05b.scn" target=*blue_01

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_61
;[exp] beSeduced(o.ブルー, true)
;[emit] love

@delevent
@addevent name=マルエット num=62
@eval exp='o.マルエット.strip.blue = "裸・恥辱"'
@recordsex guy=ブルー sex=0 orgasm=0 acts=フェラチオ,素股
@jump storage="heroine05b.scn" target=*blue_02

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_62
;[exp] beSeduced(o.ブルー, true)
;[emit] love

@delevent
@addevent name=マルエット num=63
@recordsex guy=ブルー sex=1 orgasm=0 acts=素股,正常位
@jump storage="heroine05b.scn" target=*blue_03

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_63
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

@delevent
@addevent name=マルエット num=64 cond='! game.isFreeMode'
@addevent name=マルエット num=66
@eval exp='o.マルエット.strip.blue = "汗だく"'
@eval exp='game.curChara.booking.remove(3)'
@recordsex guy=ブルー sex=2 orgasm=3
@jump storage="heroine05b.scn" target=*blue_04

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_64
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 着せ替えイベントの前の晩
@delevent
@addevent name=マルエット num=65
@eval exp='o.マルエット.removeEquipmentsByForce(["waist"])' cond='o.マルエット.equip.waist !== void'
@eval exp='o.マルエット.dressEquipment(o.中立の胸当て,,, true)'
@eval exp='o.マルエット.dressEquipment(o.ひものパンツ,,, true)'
@eval exp='o.マルエット.makeBustups()'
@eval exp='o.マルエット.expose = cap(o.マルエット.expose + 10, 100)'
@eval exp='o.マルエット.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_65
;[exp] MORNING

; 着せ替えイベント
@delevent
@jump storage="heroine05b.scn" target=*blue_05

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_66
;[exp] beSeduced(o.ブルー, true)
;[emit] sex_hard

; 継続イベント
@eval exp='o.マルエット.moveHeart(o.ブルー, 5)'
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(2, 3)'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_70
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後に同室・初日
@delevent
@addevent name=マルエット num=71
@addevent name=マルエット num=79
@recordsex guy=ブルー sex=0 orgasm=1 acts=クリ責め
@eval exp='o.マルエット.strip.blue = "裸・恥辱"' cond='o.マルエット.strip.blue != "汗だく"'
@eval exp='o.マルエット.dressEquipment(o.鋼鉄の貞操帯（ブルーの所持品）,,,true)'
@eval exp='o.マルエット.dressEquipment(o.布のスカート,,,true)' cond='game.curChara.getAppearedPanties() !== void'
@jump storage="heroine05b.scn" target=*married_01

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_71
;[exp] beSeduced(o.ブルー, true) && married && o.テオ.stayAlone()
;[emit] sex_hard

; 結婚後に同室・２日目
@delevent
@addevent name=マルエット num=72
@delevent name=マルエット num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=1 orgasm=1 acts=正常位
@eval exp='o.マルエット.strip.blue = "汗だく"'
@jump storage="heroine05b.scn" target=*married_02

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_72
;[exp] beSeduced(o.ブルー, true) && married
;[emit] word

; 結婚後に同室・３日目
@delevent
@addevent name=マルエット num=73
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=2 orgasm=2
@jump storage="heroine05b.scn" target=*married_03

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_73
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・４日目
@delevent
@addevent name=マルエット num=79
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=3 orgasm=3
@jump storage="heroine05b.scn" target=*married_04

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_79
;[exp] beSeduced(o.ブルー, true) && married
;[emit] sex_hard

; 結婚後・継続イベント
@eval exp='o.マルエット.moveHeart(o.ブルー, 5)'
@eval exp='f.lastBlueSexDay = game.date'
@recordsex guy=ブルー sex=&'intrandom(4, 5)' orgasm=&'intrandom(4, 5)'

[hoteloff]
;------------------------------------------------------------------------------

; ワイルド・ブル関連
;------------------------------------------------------------------------------
*event_マルエット_80
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 加入直後の夜。イベント１が発生
@delevent
@addevent num=81
@addevent num=82
@eval exp='o.マルエット.strip.alex = "パンツ"'
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_81
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント１を見る
@delevent
@recordsex guy=アレックス sex=0 orgasm=0 acts=フェラチオ
@jump storage="heroine05a.scn" target=*wildbull_01

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_82
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex <= 2

; イベント２が発生。イベント１は消滅
@delevent
@delevent num=81
@addevent num=83 cond='! isDemoVersion'
@addevent num=84 cond='! isDemoVersion'
@addevent num=85 cond='isDemoVersion'
@addevent num=86 cond='isDemoVersion'
@addevent num=97 cond='isDemoVersion'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_83
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント２を見る。ここだけイベントを見ることで一気に進む
@delevent
@eval exp='o.マルエット.guard.alex = 1'
@eval exp='o.マルエット.strip.alex = "裸・恥辱"'
@recordsex guy=アレックス sex=1 orgasm=0 acts=フェラチオ,クリ責め,正常位
@jump storage="heroine05a.scn" target=*wildbull_02

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_84
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex == 0

; 陵辱開始。イベント２は消滅。継続イベントが発生
@delevent
@delevent num=83
@addevent num=85
@addevent num=86
@addevent num=97
@recordsex guy=アレックス sex=1 orgasm=0
@recordsex guy=どこかの男 sex=5 orgasm=0
@eval exp='o.マルエット.strip.alex = "裸・恥辱"'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_85
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && develop.alex >= 10

; 開発が進んで画像が変更される
@delevent
@eval exp='o.マルエット.strip.alex = "汗だく"'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_86
;[exp] inHideout(o.ワイルド・ブル, 2)

; 継続イベントを見る
@eval exp='o.マルエット.strip.alex = "汗だく"'
@recordsex guy=どこかの男 sex=3 orgasm=2 cond='! o.ワイルド・ブル.sawRepeatableEventToday'
@eval exp='o.ワイルド・ブル.sawRepeatableEventToday = true'
@jump storage="heroine05a.scn" target=*wildbull_03

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_97
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isPregnant()

; ワイルド・ブルで妊娠。それまでのイベントは消滅
@delevent
@delevent num=85
@delevent num=86
@addevent num=98
@eval exp='o.マルエット.strip.alex = "妊娠"' cond='o.マルエット.strip.alex != "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_98
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isBigBelly()

; ワイルド・ブルでボテ腹。返却イベントが発生する
@delevent
@addevent name=全般 num=3
@eval exp='o.マルエット.strip.alex = "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_マルエット_99
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; ２回目以降
@delevent
@addevent num=86
@addevent num=97
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;==============================================================================




;■リーゼル
;==============================================================================
*event_リーゼル_0
;[exp] beSeduced(o.テオ) && love.theo >= 10
;[emit] word

@delevent
@addevent name=リーゼル num=1
@jump storage="main05.scn" target=*liesel_1

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_1
;[exp] beSeduced(o.テオ) && love.theo >= 20
;[emit] word

@delevent
@jump storage="main05.scn" target=*liesel_2

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_2
;[exp] beSeduced(o.テオ) && ! isDemoVersion
;[emit] word

@delevent
@eval exp='f.hasSeenLieselBlizzardEvent = true'
@jump storage="main05.scn" target=*liesel_4

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_3
;[exp] SLAVE && develop.blue >= 10

@delevent
@eval exp='o.リーゼル.strip.blue = "汗だく"'

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_4
;[exp] SLAVE

; リーゼルの回想
@delevent
@addevent name=全般 num=51
@jump storage="main08.scn" target=*revenge_4

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_80
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 加入直後の夜
@delevent
@addevent num=81
@addevent num=82
@eval exp='o.リーゼル.strip.alex = "パンツ"'
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_81
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント１を見る
@delevent
@recordsex guy=アレックス sex=0 orgasm=0 acts=フェラチオ
@jump storage="heroine06a.scn" target=*wildbull_01

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_82
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && guard.alex == 0

; 陵辱開始。イベント２が発生。イベント１は消滅
@delevent
@delevent num=81
@addevent num=83 cond='! isDemoVersion'
@addevent num=84 cond='isDemoVersion'
@addevent num=97 cond='isDemoVersion'
@eval exp='o.リーゼル.strip.alex = "裸・恥辱"'
@recordsex guy=アレックス sex=3 orgasm=2

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_83
;[exp] inHideout(o.ワイルド・ブル, 1)

; イベント２を見る。継続イベントの発生条件となる
@delevent
@addevent num=84
@addevent num=97
@recordsex guy=アレックス sex=2 orgasm=2
@recordsex guy=どこかの男 sex=3 orgasm=1
@jump storage="heroine06a.scn" target=*wildbull_02

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_84
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; 継続イベントが発生
@delevent
@addevent num=85

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_85
;[exp] inHideout(o.ワイルド・ブル, 2)

; 継続イベントを見る
@eval exp='o.リーゼル.strip.alex = "汗だく"'
@recordsex guy=どこかの男 sex=3 orgasm=3 cond='! o.ワイルド・ブル.sawRepeatableEventToday'
@eval exp='o.ワイルド・ブル.sawRepeatableEventToday = true'
@jump storage="heroine06a.scn" target=*wildbull_03

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_97
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isPregnant()

; ワイルド・ブルで妊娠。それまでのイベントは消滅
@delevent
@delevent num=83
@delevent num=84
@delevent num=85
@addevent num=98
@eval exp='o.リーゼル.strip.alex = "妊娠"' cond='o.リーゼル.strip.alex != "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_98
;[exp] SLAVE && isSlave(o.ワイルド・ブル) && isBigBelly()

; ワイルド・ブルでボテ腹。返却イベントが発生する
@delevent
@addevent name=全般 num=3
@eval exp='o.リーゼル.strip.alex = "ボテ腹"'

[hoteloff]
;------------------------------------------------------------------------------
*event_リーゼル_99
;[exp] SLAVE && isSlave(o.ワイルド・ブル)

; ２回目以降
@delevent
@addevent num=85
@addevent num=97
@call storage="stay.ks" target=*wildbull_dress_uniform

[hoteloff]
;==============================================================================




;■ミレディ
;==============================================================================
*event_ミレディ_0
;[exp] SUNSET && random < 0.2

[texton]
[ミレディ f=01]「Come on! Let's have some naughty fun!」[k]
[textoff]
@se f=period
@eval exp='game.party.changeHeat(50)'
@notice text="<y>Miredy cast a mysterious spell! Everyone's lust increased by <p>50<y>!"

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_1
;[exp] beSeduced(o.テオ)
;[emit] word

@delevent
@addevent name=ミレディ num=2
@jump storage="others01.scn" target=*miredy_theo

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_2
;[exp] beSeduced(o.テオ)
;[emit] word

@delevent
@fg c=ミレディ e=下着 f=92
[texton w=1]
[ミレディ f=92]「Hey, Captain, do you want to have sex with me?」[k]
[テオ f=13]「Uh... I'll pass... You should put something on.」[k]
[textoff]
@cl

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_3
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 初回Ｈイベント
@delevent
@addevent name=ミレディ num=4 cond='! game.isFreeMode'
@addevent name=ミレディ num=5 cond='game.isFreeMode'
@eval exp='o.マックス.heat -= 20'
@recordsex guy=マックス sex=5
@eval exp='o.ミレディ.strip.max = "汗だく"'
@jump storage="others01.scn" target=*miredy_max cond='! isDemoVersion'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_4
;[exp] MORNING

@delevent
@addevent name=ミレディ num=5
@fg c=ミレディ f=03
[texton w=1]
[ミレディ f=03]「Sex with Max yesterday felt so good! His dick was so big!」[k]
[テオ f=10]「Seriously... Max...」[k]
[textoff]
@cl

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_5
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 継続イベント
@recordsex guy=マックス sex=&'intrandom(3, 5)' orgasm=&'intrandom(3, 5)'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_6
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

; 初回Ｈイベント
@delevent
@addevent name=ミレディ num=7 cond='! game.isFreeMode'
@addevent name=ミレディ num=8 cond='game.isFreeMode'
@eval exp='o.ライナス.heat -= 20'
@recordsex guy=ライナス sex=5
@eval exp='o.ミレディ.strip.linus = "汗だく"'
@jump storage="others01.scn" target=*miredy_linus cond='! isDemoVersion'

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_7
;[exp] MORNING

@delevent
@addevent name=ミレディ num=8
@fg c=ミレディ f=57
[texton w=1]
[ミレディ f=57]「Yesterday, Linus and I had so much fun having sex that I can barely stand up!」[k]
[テオ f=13]「Hahahahaha... 」[k]
[textoff]
@cl

[hoteloff]
;------------------------------------------------------------------------------
*event_ミレディ_8
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

; 継続イベント
@recordsex guy=ライナス sex=&'intrandom(2, 4)' orgasm=&'intrandom(1, 2)'

[hoteloff]
;==============================================================================




;■サンドラ
;==============================================================================
*event_サンドラ_0
;[exp] beSeduced(o.テオ)
;[emit] word

@delevent
@addevent name=サンドラ num=1
@jump storage="others01.scn" target=*sandra_theo

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_1
;[exp] beSeduced(o.テオ)
;[emit] word

@delevent
@bg f=0001
@fg c=サンドラ e=下着 f=15
[texton w=1]
[サンドラ f=15]「Hey, captain, can you get my clothes?」[k]
[テオ f=12]「Yes, okay... Aah, Sandra, y-your... chest...!」[k]
[サンドラ f=15]「Oh, I'm sorry, I didn't mean to startle you.」[k]
[textoff]
@out
@w05

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_2
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

; 初回Ｈイベント
@delevent
@addevent name=サンドラ num=3 cond='! game.isFreeMode'
@eval exp='o.マックス.heat -= 20'
@recordsex guy=マックス sex=3
@eval exp='o.サンドラ.strip.max = "汗だく"'
@jump storage="others01.scn" target=*sandra_max cond='! isDemoVersion'

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_3
;[exp] MORNING

@delevent
@fg c=サンドラ f=09
[texton w=1]
[サンドラ f=09]「Haa... Max was amazing yesterday.」[k]
[テオ f=10]「Seriously... Max...」[k]
[textoff]
@cl

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_4
;[exp] beSeduced(o.ライナス)
;[emit] word

@delevent
@eval exp='o.サンドラ.guard.linus = -1'
@jump storage="others01.scn" target=*sandra_linus cond='! isDemoVersion'

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_5
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard

@delevent
@addevent name=サンドラ num=6
@addevent name=サンドラ num=7 cond='! game.isFreeMode'
@addevent name=サンドラ num=8
@eval exp='o.ブルー.heat -= 20'
@recordsex guy=ブルー sex=3

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_6
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard

; 継続イベント
@recordsex guy=ブルー sex=&'intrandom(2, 3)' orgasm=&'intrandom(3, 4)'

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_7
;[exp] MORNING

@delevent
@fg c=サンドラ f=94
[texton w=1]
[サンドラ f=94]「Oh... Blue was the best yesterday... 」[k]
[テオ f=12]「Uh... Uh... 」[k]
[textoff]
@cl

[hoteloff]
;------------------------------------------------------------------------------
*event_サンドラ_8
;[exp] beSeduced(o.ブルー) && (o.サンドラ.sexCount.blue >= 400 || isFreeMode)
;[emit] sex_hard

@delevent
@eval exp='o.ブルー.heat -= 20'
@recordsex guy=ブルー sex=3
@jump storage="others01.scn" target=*sandra_blue

[hoteloff]
;==============================================================================




;■雇用キャラ
;==============================================================================
*event_ブレイズマン_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_ソードダンサー_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_チャンピオン_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_エンジェルナイト_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_アコライト_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_ハイプリースト_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_スナイパー_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_マスターアーチャー_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_ミスティック_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard
*event_メイガス_0
;[exp] beSeduced(o.マックス)
;[emit] sex_hard

@eval exp='o.マックス.heat -= 20'
@eval exp='game.curChara.love.max = cap(game.curChara.love.max + 20, 100)'
@eval exp='game.curChara.strip.max = "汗だく"'
@recordsex guy=マックス sex=5

[hoteloff]
;------------------------------------------------------------------------------
*event_ブレイズマン_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_ソードダンサー_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_チャンピオン_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_エンジェルナイト_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_アコライト_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_ハイプリースト_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_スナイパー_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_マスターアーチャー_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_ミスティック_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard
*event_メイガス_1
;[exp] beSeduced(o.ライナス)
;[emit] sex_hard

@eval exp='o.ライナス.heat -= 20'
@eval exp='game.curChara.love.linus = cap(game.curChara.love.linus + 20, 100)'
@eval exp='game.curChara.strip.linus = "汗だく"'
@recordsex guy=ライナス sex=5

[hoteloff]
;------------------------------------------------------------------------------
*event_ブレイズマン_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_ソードダンサー_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_チャンピオン_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_エンジェルナイト_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_アコライト_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_ハイプリースト_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_スナイパー_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_マスターアーチャー_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_ミスティック_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard
*event_メイガス_2
;[exp] beSeduced(o.ブルー)
;[emit] sex_hard

@eval exp='o.ブルー.heat -= 20'
@eval exp='game.curChara.love.blue = cap(game.curChara.love.blue + 20, 100)'
@eval exp='game.curChara.strip.blue = "汗だく"'
@recordsex guy=ブルー sex=5

[hoteloff]
;==============================================================================




;■マリア
;==============================================================================
*event_マリア_0
;[exp] beSeduced(o.テオ)
;[emit] word

@delevent
@bg f=0001
@fg c=マリア e=通常 f=15
[texton w=1]
[マリア f=15]「We'll definitely save Riselle!」[k]
[テオ e=通常 f=02]「Yeah, of course.」[k]
[textoff]
@out
@w05

[hoteloff]
;------------------------------------------------------------------------------
*event_マリア_1
;[exp] beSeduced(o.マックス)
;[emit] word

@delevent
@bg f=0001
@fg l=マックス e=通常 f=94 b
@fg r=マリア e=通常 f=07
[texton w=1]
[マックス f=94]「Ehehe... sharing a room with Maria...」[k]
[マリア f=07]「Max! If you lay a hand on me, I'll never forgive you!」[k]
@fgf l=マックス f=12
[マックス f=12]「Huh... No way...」[k]
[textoff]
@out
@w05

[hoteloff]
;------------------------------------------------------------------------------
*event_マリア_2
;[exp] beSeduced(o.ライナス)
;[emit] word

@delevent
@bg f=0001
@fg l=ライナス e=通常 f=22 b
@fg r=マリア e=通常 f=05
[texton w=1]
[ライナス f=22]「H-hey, Maria. It's been a while.」[k]
[マリア f=05]「I think you know that I won't accept your invitation! You're not my leader any more.」[k]
@fgf l=ライナス f=29
[ライナス f=29]「I-I know...」[k]
[textoff]
@out
@w05

[hoteloff]
;==============================================================================




;■主人公
;==============================================================================
*event_テオ_0
;[exp] ! married || game.wife.equip.hip == o.鋼鉄の貞操帯（ブルーの所持品）
;[emit] word

; ラブホテルイベントの就寝時の演出
@delevent
@delevent num=2

[hoteloff]
;------------------------------------------------------------------------------
*event_テオ_1
;[exp] MORNING

; 婚約直後のトロール軍団襲撃イベント
; これをこなしたら結婚成立

[iscript]
//--------------------------------------------------------------------
// イベント設定
o.テオ.events.remove(1);
o.ブレイブタウン.events.add(4);

// ここまでに終わらせられなかった一部のクエストは強制削除する
o.ベトリヌスの酒場.quests.remove(o.売春組織の実体を暴け);
o.ベトリヌスの酒場.events.remove(13);
o.ホテル・クイーン.events.remove(0);
o.売春組織の実体を暴け.accepted = false;

// 他のヒロインの主人公イベントは全消去
for(var i = 3; i < game.chara.count; i++)
{
	var her = game.chara[i];
	her.clearRelativeEvents();
	for(var j = 0; j < 20; j++) her.events.remove(j);	// 0～19番は主人公イベント
}

// 挙式までの期間内は余計なイベントが起きないようにする
game.protectHeroines = true;

//--------------------------------------------------------------------
[endscript]

@jump storage="main11.scn" target=*troll_1

[hoteloff]
;------------------------------------------------------------------------------
*event_テオ_2
;[exp] married && o.テオ.inSameRoomOnly(game.wife) && game.wife.equip.hip != o.鋼鉄の貞操帯（ブルーの所持品）
;[emit] sex_hard

; ラブホテルイベントの就寝時の演出
@delevent
@delevent num=0

[hoteloff]
;==============================================================================




;■マックス
;==============================================================================
*event_マックス_0
;[exp] true
;[emit] sex_hard

; ラブホテルイベントの就寝時の演出
@delevent

[hoteloff]
;------------------------------------------------------------------------------
*event_マックス_1
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(26)

; 会話ボタンからのイベント・ヒューマン
@eval exp='game.curChara = o.マックス.getRoomMates()[0]'
@jump target=*event_リム_26

[hoteloff]
;------------------------------------------------------------------------------
*event_マックス_2
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(23)

; 会話ボタンからのイベント・エルフ
@eval exp='game.curChara = o.マックス.getRoomMates()[0]'
@jump target=*event_クレア_23

[hoteloff]
;------------------------------------------------------------------------------
*event_マックス_3
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(25)

; 会話ボタンからのイベント・ドワーフ
@eval exp='game.curChara = o.マックス.getRoomMates()[0]'
@jump target=*event_フレデリカ_25

[hoteloff]
;------------------------------------------------------------------------------
*event_マックス_4
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(25)

; 会話ボタンからのイベント・ノーム
@eval exp='game.curChara = o.マックス.getRoomMates()[0]'
@jump target=*event_ミューズ_25

[hoteloff]
;------------------------------------------------------------------------------
*event_マックス_5
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(26)

; 会話ボタンからのイベント・シルフ
@eval exp='game.curChara = o.マックス.getRoomMates()[0]'
@jump target=*event_マルエット_27

[hoteloff]
;------------------------------------------------------------------------------
*event_マックス_6
;[exp] MORNING && master.party.isAllHeroinesDeveloped(o.マックス, 30)

; バッドエンド
@jump storage="others02.scn" target=*over_max

[hoteloff]
;==============================================================================




;■ライナス
;==============================================================================
*event_ライナス_0
;[exp] o.ライナス.getRoomMates().count > 0 && o.ライナス.getRoomMates()[0].sexCount.linus > 0
;[emit] sex_hard

; ラブホテルイベントの就寝時の演出
@delevent

[hoteloff]
;------------------------------------------------------------------------------
*event_ライナス_1
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(43)

; 会話ボタンからのイベント・ヒューマン
@eval exp='game.curChara = o.ライナス.getRoomMates()[0]'
@jump target=*event_リム_43

[hoteloff]
;------------------------------------------------------------------------------
*event_ライナス_2
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(43)

; 会話ボタンからのイベント・エルフ
@eval exp='game.curChara = o.ライナス.getRoomMates()[0]'
@jump target=*event_クレア_43

[hoteloff]
;------------------------------------------------------------------------------
*event_ライナス_3
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(44)

; 会話ボタンからのイベント・ドワーフ
@eval exp='game.curChara = o.ライナス.getRoomMates()[0]'
@jump target=*event_フレデリカ_44

[hoteloff]
;------------------------------------------------------------------------------
*event_ライナス_4
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(44)

; 会話ボタンからのイベント・ノーム
@eval exp='game.curChara = o.ライナス.getRoomMates()[0]'
@jump target=*event_ミューズ_44

[hoteloff]
;------------------------------------------------------------------------------
*event_ライナス_5
;[exp] NIGHT && getRoomMates().count == 1 && getRoomMates()[0].events.has(44)

; 会話ボタンからのイベント・シルフ
@eval exp='game.curChara = o.ライナス.getRoomMates()[0]'
@jump target=*event_マルエット_44

[hoteloff]
;------------------------------------------------------------------------------
*event_ライナス_6
;[exp] MORNING && master.party.isAllHeroinesDeveloped(o.ライナス, 30)

; バッドエンド
@jump storage="others02.scn" target=*over_linus

[hoteloff]
;==============================================================================




;■ブルー
;==============================================================================
*event_ブルー_0
;[exp] true
;[emit] sex_hard

; ラブホテルイベントの就寝時の演出
@delevent

[hoteloff]
;------------------------------------------------------------------------------
*event_ブルー_1
;[exp] MORNING && master.party.isAllHeroinesDeveloped(o.ブルー, 10)

; バッドエンド
@jump storage="others02.scn" target=*over_blue

[hoteloff]
;==============================================================================




;■ポラリス
;==============================================================================
*event_ポラリス_0
;[exp] MORNING

@delevent
@jump storage="main13.scn" target=*advent_2

[hoteloff]
;==============================================================================



;■体験版終了
;==============================================================================
*trial_version_end
[textoff]
@out
@w05
[texton w=0]
[b][nw]That's all for the trial version.[k]
[textoff]
@w05
[hoteloff cond='game.hour != "day"']
[townoff cond='game.map.kind == "town"']
[eventoff]
;------------------------------------------------------------------------------
*trial_version_return
[textoff]
@out
@w05
[texton w=0]
[b][nw]Please enjoy the rest in the retail version.[k]
[textoff]
@w05
@return
;==============================================================================
