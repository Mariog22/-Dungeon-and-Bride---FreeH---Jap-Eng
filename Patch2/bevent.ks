; 戦闘中イベント
; ラベルは  *event_数字    発生条件は  ;[exp] 式
; ターン開始時とキャラ行動前にそれぞれチェックする


;------------------------------------------------------------------------------
*event_1
;[exp] true

@delevent
@jump storage="main01.scn" target=*tutorial_2

[beventoff]
;------------------------------------------------------------------------------
*event_2
;[exp] turnCount == 0

@delevent
@wait time=500
[texton]
[悪魔 f=01]「Dieeee! Breath of Death!」[k]
[テオ f=10]「Damn...!」[k]
[textoff]

[beventoff]
;------------------------------------------------------------------------------
*event_3
;[exp] turnCount == 1

@delevent
@wait time=500
[texton]
[テオ f=12]「Eh...? Nothing happened...」[k]
We were all showered with horribly evil and cold energy by the devil, yet nobody in the party was affected.[k]
[テオ f=05]「Could it be my power as a demon hunter that triggered before...?」[k]
[悪魔 f=12]「Are you kidding...?! Why doesn't my Breath of Death work on these guys...?!」[k]
[悪魔 f=08]「Uuuuuuuuuuuuu! What the hell! I don't get it!」[k]
[textoff]

[beventoff]
;------------------------------------------------------------------------------
*event_4
;[exp] turnCount == 1 && enemy.members[3].life == enemy.members[3].maxLife

@delevent
[texton]
[テオ]「Damn...! It didn't even budge...!」[k]
Normal attacks don't seem to affect the metal golem. My attack didn't even scratch it.
 [k]
Apparently you can't beat it in the normal way. Is there any way to damage the metal golem...?
 [k]
If we can't find one, it may be best to escape.[k]
[textoff]

[beventoff]
;------------------------------------------------------------------------------
*event_5
;[exp] true

@delevent
@eval exp='game.enemy.members[1].setStatus(o.凍結, true), game.enemy.members[1].life -= 150'
@eval exp='game.enemy.members[2].setStatus(o.凍結, true), game.enemy.members[2].life -= 150'
@eval exp='game.enemy.members[4].setStatus(o.凍結, true), game.enemy.members[4].life -= 150'
@eval exp='game.enemy.members[5].setStatus(o.凍結, true), game.enemy.members[5].life -= 150'

[beventoff]
;------------------------------------------------------------------------------
*event_6
;[exp] turnCount == 0 && ! turnStarted

; 戦闘開始時に試作品の鎧２を誰かが着ていたら
; そのキャラが攻撃を受けた時に必ず鎧が破壊されるようにしておく
@eval exp='tf.charaWearingTestArmor = game.party.findEquipedItems(o.試作品の鎧２)'
[if exp='tf.charaWearingTestArmor !== void']
	@eval exp='o.試作品の鎧２.event = false'
	; ここで event = false にしないと破壊されない
	@eval exp='tf.charaWearingTestArmor.brokenPartsList = ["main", "sub", "arm", "leg"]'
	@addevent name=全般 num=64
[endif]

[beventoff skipevent]
;------------------------------------------------------------------------------
*event_7
;[exp] turnCount == 0 && ! turnStarted && party.findEquipedItems(o.試作品の鎧３・上) !== void && party.findEquipedItems(o.試作品の鎧３・下) !== void

; 戦闘開始時に試作品の鎧３の上下を誰かが着ていれば回数をカウント
@eval exp='f.battleCountByTestingArmor ++'

[beventoff skipevent]
;------------------------------------------------------------------------------
*event_8
;[exp] enemy.members[2].dead

; エリックが死亡
@delevent
@btmes off
@wait time=1000
[texton]
[エリック f=08]「D-damn...! When did that [テオ] guy get so strong?!」[k]
[textoff]
@jump target=*_event_8_9 cond='! game.bevents.has(9)'
@wait time=500
@btmes show

[beventoff]
;------------------------------------------------------------------------------
*event_9
;[exp] enemy.members[4].dead

; ミレディが死亡
@delevent
@btmes off
@wait time=1000
[texton]
[ミレディ f=17]「Seriously?! What a pain in the ass!」[k]
[textoff]
@jump target=*_event_8_9 cond='! game.bevents.has(8)'
@wait time=500
@btmes show

[beventoff]
;------------------------------------------------------------------------------
*_event_8_9

; エリック、ミレディが両方死亡
@addevent name=戦闘 num=10
@eval exp='tf.turnVanguardDefeated = game.turnCount'
@wait time=1000
[texton]
[テオ f=13]「We did it...!」[k]
We beat Eric and Miredy! I knew we were getting stronger! We're not what we used to be![k]
[ブルー f=02]「...Hmph, you useless bastards.」[k]
[ブルー f=15]「I'll be your next opponent. Come at me, [テオ]!」[k]
[textoff]
@wait time=500
@btmes show

[beventoff]
;------------------------------------------------------------------------------
*event_10
;[exp] turnStarted

@delevent
@addevent name=戦闘 num=11
@addevent name=戦闘 num=14

[beventoff]
;------------------------------------------------------------------------------
*event_11
;[exp] ! turnStarted && ! o.テオ.knockOut && o.テオ.act == o.攻撃 && turnCount >= tf.turnVanguardDefeated + 3

; 攻撃を３ターン以上行い、まだテオが生きている
@delevent
@eval exp='game.enemy.members[3].attack = [o.テオ.maxLife \ 6, o.テオ.maxLife \ 4]'
@eval exp='game.enemy.members[3].btcmd.remove(o.見物)'
[texton]
[ブルー f=02]「Heh. What's the matter, [テオ]?」[k]
[テオ f=09]「Damn...!」[k]
Attacks aren't hitting...! I can't believe Blue was really so strong...![k]
[ブルー f=15]「Well... it's time to get serious, [テオ]!」[k]
[textoff]

[beventoff]
;------------------------------------------------------------------------------
*event_12
;[exp] party.status.has(o.禁止)

; ミレディがアンチマジックを使う直前
@delevent
@addevent name=戦闘 num=13

[beventoff]
;------------------------------------------------------------------------------
*event_13
;[exp] ! party.status.has(o.禁止)

; アンチマジックが消された直後
@delevent
@btmes off
@wait time=500
[texton w=0]
[ミレディ f=11]「No way?! The anti-magic field has been erased!」[k]
[textoff]
@wait time=500
@btmes show

[beventoff]
;------------------------------------------------------------------------------
*event_14
;[exp] o.テオ.knockOut && ! o.リーゼル.knockOut

; テオがリーゼルより先に死んだ
@delevent
@eval exp='game.enemy.members[3].attack = [o.リーゼル.maxLife \ 2, o.リーゼル.maxLife \ 1]'
@eval exp='game.enemy.members[3].btcmd.remove(o.見物)'
[texton]
[ブルー f=02]「Hmph, you're all talk, [テオ].」[k]
[テオ f=09]「Damn...!」[k]
[ブルー f=15]「Now then... let's get this over with!」[k]
[textoff]

[beventoff]
;------------------------------------------------------------------------------
