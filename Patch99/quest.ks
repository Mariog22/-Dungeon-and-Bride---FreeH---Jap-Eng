; quest.ks
; クエスト一覧
; １つのクエスト内容は必ず連続していること。 [title] は必ず先頭に書くこと
;  [exp] と [gold] は @complete を実行すると自動的に加算される
;  [prize] はただの説明文なので実際に報酬を与える動作は別途記述すること


;■メインクエスト
;------------------------------------------------------------------------------
;[title]   赤いネックレスを探してほしい
;[displayName] Find a Red Necklace
;[summary] Go to an abandoned house in the woods and recover a red necklace
;[exp]     500
;[gold]    20000
;[detail]  Go to an abandoned house in the woods in Bravetown and retrieve the red necklace from the bandits there.
;------------------------------------------------------------------------------
*赤いネックレスを探してほしい_intro

[texton]
[依頼人]「Please do me a favor. My precious necklace has been stolen by bandits.」[k]
[依頼人]「The bandits are said to be in an abandoned house in the woods. Please go there and retrieve the necklace.」[k]
[textoff]
@eval exp='o.森の中の廃屋入口.visible = o.森の中の廃屋入口.appeared = true'

[baroff]
;------------------------------------------------------------------------------
*赤いネックレスを探してほしい_0

[if exp='game.party.hasItem(o.赤いネックレス)']
	[texton]
	[依頼人]「I was looking for this necklace! Thank you. Please take this.」[k]
	[textoff]
	@ejectitem item=赤いネックレス
	@getitem gold=20000
	@complete name=赤いネックレスを探してほしい
	@addevent name=マルティナの酒場 num=5 cond='game.isFreeMode'
[else]
	[texton]
	[依頼人]「The necklace should be in [b]an abandoned house in the woods[/b]. Please find it!」[k]
	[textoff]
[endif]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   遺跡の財宝
;[displayName] Treasures of the Ruins
;[summary] Unearth a treasure from an archaeological site outside town.
;[exp]     9000
;[gold]    45000
;[detail]  Go to the ruins on the outskirts of Bravetown and bring back items or documents of historical value. You may keep other treasure you find.
;------------------------------------------------------------------------------
*遺跡の財宝_intro
*遺跡の財宝_0

[texton]
[マルティナ]「I, the barkeeper, will explain that request to you.」[k]
[マルティナ]「It is said that in the ruins on the outskirts of town lies a vast treasure said to have been hidden by the king who once ruled this area.」[k]
[マルティナ]「If there are any items or documents there that seem to have historical value, they would like you to bring them back.」[k]
[マルティナ]「By the way, the other gold and silver treasures are yours to do with as you please.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*遺跡の財宝_1

[texton]
[マルティナ]「What the...! The gold, silver and treasures were just an illusion created by the dragon...」[k]
[マルティナ]「I understand. I will inform the client accordingly. Thank you for your investigation. Please accept your reward.」[k]
[textoff]
@getitem gold=45000
@complete name=遺跡の財宝

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   盗賊メンバー派遣の依頼
;[displayName] Experienced Thieves Wanted
;[summary] I would like to hire two Thieves. Contract is expected to last several months.
;[exp]     157000
;[prize]   10,000G per day
;[detail]  Send two Thieves of level 4 or above with at least one year of experience. There is no set finish date.
;------------------------------------------------------------------------------
*盗賊メンバー派遣の依頼_intro

; @jump storage="main02.scn" target=*city_2

[baroff]
;------------------------------------------------------------------------------
*盗賊メンバー派遣の依頼_0

[texton]
[テオ]「Max and Maria are working hard. Let's keep adventuring on our own.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   盗賊メンバー派遣の依頼　
;[displayName] Experienced Thief Wanted
;[summary] I'd like to hire one thief. The contract period is at least 10 days.
;[exp]     157000
;[prize]   10,000G per day
;[detail]  Send one Thief of level 10 or above. There is no set finish date.
;------------------------------------------------------------------------------
*盗賊メンバー派遣の依頼　_intro

@fg c=ライナス f=01
[texton w=1]
[ライナス f=01]「Hey, I'm Linus, the boss of Hawk Wing, the top adventurer party in Sapphire City!」[k]
[ライナス f=01]「Are there any thieves among you who are level 10 or above? If so, I'd like to borrow them for about 10 days. Of course, I'll pay you.」[k]
@fgf c=ライナス f=21
[ライナス f=21]「Once you've decided who to send, please get back to me. Preferably a cute girl... hehe.」[k]
[textoff]
@clf

[baroff]
;------------------------------------------------------------------------------
*盗賊メンバー派遣の依頼　_0

@fg c=ライナス f=01
[texton w=1]
[ライナス f=01]「Hey, have you brought any thieves above level 10?」[k]
[textoff]
@clf

@eval exp='game.curTarget = void'
@waitchoosechara text="Who would you like to introduce?"

[if exp='game.curTarget === void']
	@fgf c=ライナス f=06
	[texton]
	[ライナス f=06]「What, you changed your mind? Come on, decide.」[k]
	[textoff]
	@clf
	[baroff]
[endif]

[if exp='game.curTarget.job != o.盗賊 || game.curTarget.level < 10']
	@fgf c=ライナス f=05
	[texton]
	[ライナス f=05]「Hey, that's not what I said. I asked for a level 10 or higher thief.」[k]
	[textoff]
	@clf
	[baroff]
[endif]

@se f=period
@eval exp='game.curChara = game.curTarget'
[texton]
[if exp='game.curChara.sex == "男"']
	@fg l=ライナス f=06 left=300 b
	@fg r=キャラ f=10
	[キャラ], who was picked for the dispatch quest, greets Linus.[k]
	[ライナス f=06]「Tch... a guy... Oh well, just do your job.」[k]
[else]
	@fg l=ライナス f=22 left=300 b
	@fg r=キャラ f=10
	[キャラ], who was picked for the dispatch quest, greets Linus.[k]
	[ライナス f=22]「Oh, nice... [はーと] I look forward to working with you, [キャラ] [はーと]!」[k]
[endif]
[textoff]
@clf

@eval exp='game.party.removeMember(game.curChara)'
@eval exp='game.curChara.tripEventID = "盗賊メンバー派遣の依頼"'
; @eval exp='f.tempStaffID = game.chara.find(game.curChara)'
@se f=period
@notice text=&'"<y>" + game.curChara.displayName + " has left to join Linus!"'
@eval exp='o.盗賊メンバー派遣の依頼　.flag = 1'
@eval exp='o.盗賊メンバー派遣の依頼　.end = game.date + 10'

[baroff]
;------------------------------------------------------------------------------
*盗賊メンバー派遣の依頼　_1

[if exp='game.date < o.盗賊メンバー派遣の依頼　.end']
	[texton w=0]
	The minimum contract period has not yet expired.[k]
	[textoff]
	[baroff]
[endif]

[iscript]
for(var i = 0; i < game.chara.count; i++)
{
	if(f.tempStaffID !== void)
	{
		// 以前の仕様で派遣した人に対応
		if(game.chara[i].id == f.tempStaffID)
		{
			game.curChara = game.chara[i];
			break;
		}
	}
	else
	{
		// 新仕様
		if(game.chara[i].tripEventID == "盗賊メンバー派遣の依頼")
		{
			game.curChara = game.chara[i];
			game.chara[i].tripEventID = void;
			break;
		}
	}
}

if(game.curChara.sex == "女")
{
	game.curChara.strip.linus = "汗だく";
	game.curChara.guard.linus = 0;
	for(var i = 10; i >= 1; i--)
	{
		var rec = game.curChara.getSexRecord(o.ライナス, intrandom(2, 3),,, game.date - i);
		game.curChara.addSexRecordAndChangeHeart(rec);
	}
}
[endscript]

@fg l=ライナス f=01 left=300 b
@fg r=キャラ f=06 cond='game.curChara.sex == "男"'
@fg r=キャラ f=30 cond='game.curChara.sex == "女"'
[texton w=1]
[ライナス f=01]「Hey, it's been a while. [キャラ] did a pretty good job.」[k]
[ライナス f=01]「That's the end of my request. [キャラ] is all yours again. See you later.」[k]
[textoff]
@clf

@se f=period
[if exp='game.party.members.count < 6']
	@eval exp='game.party.entry(game.curChara)'
	@notice text=&'"<y>" + game.curChara.displayName + " has joined the party!"'
[else]
	@eval exp='o.待合所.entry(game.curChara)'
	@notice text=&'"<y>" + game.curChara.displayName + " has returned! Since the party is full, they can be found at the Waiting Room."'
[endif]
@complete name=盗賊メンバー派遣の依頼　
@getitem gold=&'(game.date - o.盗賊メンバー派遣の依頼　.end + 10) * 10000'

@fg c=ライナス f=01 left=300
[texton w=1]
[ライナス f=01]「Right, right, I'd be happy to join you guys too.」[k]
[ライナス f=01]「I'm in [b]Brave Town[/b], so if you want to recruit me, come visit.」[k]
[textoff]
@cl
@addevent map=ブルーのアジト１Ｆ num=11

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   ポラリス神殿を守ってほしい
;[displayName] Protect the Temple of Polaris
;[summary] I want you to stop those who are destroying the Temple of Polaris.
;[exp]     9800
;[gold]    12500
;[detail]  First, go to <b>Sapphire Castle<k> and meet Princess Fiona, then go to the <b>Temple of Polaris<k> in <b>Dale Coin Forest<k> and kill the monsters that are ravaging the temple.
;------------------------------------------------------------------------------
*ポラリス神殿を守ってほしい_intro

[texton]
[name n=Vetrinus f=vetrinus_00]「The client is none other than our princess. Go to [b]Sapphire Castle[/b] to hear her story in person.」[k]
[textoff]
@getitem item=入城許可証
[texton]
[name n=Vetrinus f=vetrinus_00]「This permit will grant you an audience with the princess.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*ポラリス神殿を守ってほしい_0

[texton]
[name n=Vetrinus f=vetrinus_00]「This permit will grant you an audience with the princess.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*ポラリス神殿を守ってほしい_1

[texton]
[name n=Vetrinus f=vetrinus_00]「Reward, you say? Go to [b]Sapphire Castle[/b] and pick it up in person.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   さらわれた少女たちの救出
;[displayName] Rescue Kidnapped Girls
;[summary] Rescue some kidnapped girls from under Landon Canyon
;[exp]     14500
;[gold]    30000
;[prize]   Emerald Magic Stone
;[detail]  Go to the <b>Ancient Labyrinth<k> under the cliffs of Landon Canyon and rescue the girls of Seagull Village who are trapped there.
;------------------------------------------------------------------------------
*さらわれた少女たちの救出_intro

@eval exp='o.古代の迷宮１Ｆ.unlockDoor(3, 2, "n")'
@eval exp='o.古代の迷宮１Ｆ.events = [1, 2, 3, 4, 5]'
@jump storage="main04.scn" target=*labyrinth_1

[baroff]
;------------------------------------------------------------------------------
*さらわれた少女たちの救出_0

[texton]
[name n="Village Chief" f=mayor_04]「Hurry and help everyone! The Cliff Maze is located [b]below the cliffs[/b] in Landon Canyon, which stretches north of this village.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   コボルド退治
;[displayName] Kobold Extermination
;[summary] Infiltrate the fort where kobolds are gathering and exterminate them.
;[exp]     16800
;[gold]    15600
;[prize]   Silver Key
;[detail]  Seek kobold robbers in a stronghold somewhere in the forest above the Landon Canyon cliffs and exterminate them.
;------------------------------------------------------------------------------
*コボルド退治_intro

[texton]
[警備隊長]「Nice to meet you. I am the Captain of the Sapphire City Guard. I've heard a lot about you guys.」[k]
[警備隊長]「There have been a number of recent incidents of travelers being attacked and robbed by a group of Kobolds on the roads around Sapphire City.」[k]
[警備隊長]「They've been seen near [b]the forest[/b] above the Landon Canyon cliffs, so they must have a stronghold there.」[k]
[警備隊長]「I'd like to ask you adventurers to find it and exterminate them. Thank you.」[k]
[警備隊長]「The leader of the Kobolds is reported to wear a [b]gold headband[/b]. If you bring that to me, I'll recognize it as a job well done.」[k]
[警備隊長]「If you continue south from Sapphire City, you will find a [b]pond with a bridge and a billboard[/b] in the forest. We've heard reports of Kobolds there, so focus your search on that area.」[k]
[if exp='! game.isFreeMode']
	[警備隊長]「Oh, and I already commissioned another party to do this job as well.」[k]
	[警備隊長]「In other words, this quest will be a competition with them. If they beat you to it, unfortunately, your reward will be zero. I know it will be tough, but please do your best.」[k]
[endif]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*コボルド退治_0

[texton]
[警備隊長]「Somewhere in [b]the forest[/b] above the cliffs of [b]Landon Canyon[/b], Kobolds are said to live. Go find them and exterminate them.」[k]
[警備隊長]「As evidence, bring the [b]gold headband[/b] worn by their leader!」[k]
[警備隊長]「If you continue south from Sapphire City, you will find a [b]pond with a bridge and a billboard[/b] in the forest. We've heard reports of Kobolds there, so focus your search on that area.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*コボルド退治_1

[if exp='! game.party.hasItem(o.金のヘッドバンド)']
	[texton]
	[警備隊長]「Have you defeated the Kobolds? As evidence, bring the [b]gold headband[/b] worn by their leader!」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[警備隊長]「Well done! I'm sure this will quiet them down for a while.」[k]
[警備隊長]「I will give you the promised reward. Also, this [b]Silver Key[/b] will grant access to some of the town's warehouses. I hope you will make use of them in your future adventures!」[k]
[textoff]
@eval exp='game.party.ejectItem(o.金のヘッドバンド)'
@complete name=コボルド退治
@treasure item=銀の鍵
@addevent name=サファイアシティ num=5 cond='! game.isFreeMode'
@addevent name=ベトリヌスの酒場 num=23 cond='game.isFreeMode'

[texton]
[nw][b blue]How to use keys[/b][r]
[b]While facing a door, open the item list and use [b red]the appropriate key[b]. If the key is correct, the door will open.
 [k]
[textoff]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   精霊の力を宿す石
;[displayName] Spiritual Stone
;[summary] I need you to find a spirit stone in some ruins within a swamp.
;[exp]     24000
;[gold]    18000
;[prize]   Power Bracelet
;[detail]  Go to the <b>ruin<k> in the east of Moise Swamp and bring back the <b>spirit stone<k> said to be found there.
;------------------------------------------------------------------------------
*精霊の力を宿す石_intro

[texton]
[依頼人]「I am a student of spirit magic.」[k]
[依頼人]「Did you know there are ruins in the east of Moise Swamp? It seems to be the remains of an old temple. Now it is the home of the spirits.」[k]
[依頼人]「It is said that a [b]spirit stone[/b], a special stone with very strong spiritual power, is enshrined deep within its ruins. As a researcher, I would love to get my hands on it and do a lot of research!」[k]
[依頼人]「...However, numerous monsters also inhabit the ruins, so I do not have the strength to explore them!」[k]
[依頼人]「...You adventurers are my only hope. Please find the spirit stone. I'm counting on you.」[k]
[依頼人]「The ruins may be partially submerged. If you can't [b]dive[/b] into the water, it might be hard to explore!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*精霊の力を宿す石_0

[if exp='game.findItem(o.精霊の石) === void']
	[texton]
	[依頼人]「Please find the [b]spirit stone[/b] from the ruins in the east of [b]Moise Swamp[/b].」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Oh... that wonderful power...! This is the spirit stone...!」[k]
[依頼人]「Thank you so much. Thanks to you, my research on the power of spirits is about to progress even further.」[k]
[依頼人]「Now let me give you the promised reward. This is a bracelet I created in my research on spirits that bestows formidable strength. With it, you can move even huge blocks of stone. Please use it!」[k]
[textoff]
@eval exp='game.ejectItem(o.精霊の石)'
@complete name=精霊の力を宿す石
@addevent name=かもめ亭 num=8
@treasure item=パワーブレスレット

[texton w=5]
[nw][b]The power bracelet is an item that allows you to move stone blocks scattered around dungeons.[r]
With it [b red]equipped on a party member[b], if you walk towards a stone block, it will be pushed forward.[k]
[nw][b]There are some rules when pushing blocks.[r]
　・They can only be pushed, not pulled[r]
　・If there is a wall or obstacle in front of the stone, it can't be pushed that way[r]
　・A second stone in front of it also counts as an obstacle[k]
[nw][b]Depending on how stones are pushed, you may get stuck on a puzzle, so consider how to move them carefully.[k]
[textoff]
[texton w=0]
[依頼人]「Also, just in case, I'll give you this as well. Use it if you get stuck.」[k]
[textoff]

@getitem item=時のスイッチ

[texton w=5]
[nw]If you use the Time Switch, all rocks and fences on the map will be returned to their initial state, and you will be warped to the area near the entrance of the map. Please use it when you need to restart a block puzzle. Not available on all maps.[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   古代の宝物庫
;[displayName] Ancient Treasury
;[summary] Collect three items from the ancient treasure vault on B6 of the Great Cave.
;[exp]     90000
;[gold]    45000
;[detail]  Bring back three items from the ancient treasure vault on B6 of the Great Cave:<r>Seven-Colored Crown, Golden Staff, King's Diary
;------------------------------------------------------------------------------
*古代の宝物庫_intro

[texton]
[name n="Bar Owner" f=chloe_00]「Ah, I will explain the request.」[k]
[name n="Bar Owner" f=chloe_00]「Did you know that ruins were recently excavated on B6 of this cave?」[k]
[name n="Bar Owner" f=chloe_00]「Recently, it was discovered that the ruins were actually a treasure trove where the ancient royal family hid their treasures. In addition to gold and silver treasures, the treasure vault apparently contains a number of historically valuable items.」[k]
[name n="Bar Owner" f=chloe_00]「However, the area around the ruins is infested with extremely strong monsters, making it difficult to investigate. So the discoverer of the ruins decided to ask adventurers to investigate and recover them.」[k]
[name n="Bar Owner" f=chloe_00]「This request is to recover three items: the Seven-Colored Crown, the Golden Staff, and the King's Diary. If you recover them, the client will buy them for a very high price.」[k]
[name n="Bar Owner" f=chloe_00]「Any remaining treasures seem not to be a concern for them.」[k]
[textoff]
@addevent name=大洞窟Ｂ６ num=2 cond='! game.isFreeMode'
@addevent name=大洞窟Ｂ６ num=4

[baroff]
;------------------------------------------------------------------------------
*古代の宝物庫_0

[texton]
[name n="Bar Owner" f=chloe_00]「The ruins of the ancient treasury are located on B6 of the Great Cave. Within them, find the Seven-Colored Crown, Golden Staff, and King's Diary.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*古代の宝物庫_1

[texton]
[name n="Bar Owner" f=chloe_00]「I heard the story. This request seems to have been fabricated by a demon.」[k]
[name n="Bar Owner" f=chloe_00]「The quest will be marked complete. Please note that there will be no reward.」[k]
[textoff]
@eval exp='o.古代の宝物庫.gold = 0'
@complete name=古代の宝物庫

[baroff]
;------------------------------------------------------------------------------




;■サブクエスト
;------------------------------------------------------------------------------
;[title]   ワイルド・ブルのアジトを探せ
;[displayName] Find Wild Bull's Hideout
;[summary] I need you to locate the three hideouts of the rogue group Wild Bull.
;[exp]     90000
;[gold]    80000
;[detail]  Locate three Wild Bull hideouts and report to the guard captain at the Sapphire City tavern.
;------------------------------------------------------------------------------
*ワイルド・ブルのアジトを探せ_intro

[texton]
[警備隊長]「Hey, thanks for your help last time.」[k]
[警備隊長]「You guys have heard of Wild Bull, right? They are a group of ruffians who torment good citizens. Their behavior is giving us a headache.」[k]
[警備隊長]「We need to find out where they're based. Once we have, we intend to launch a full-scale attack to destroy Wild Bull and stop their misdeeds.」[k]
[警備隊長]「So I'd like to ask for your help. Can you find out where they're hiding?」[k]
[警備隊長]「I believe they have [b]three[/b] hideouts in total. If you find all of them, please report to me. Thank you.」[k]
[textoff]

@eval exp='f.dayDiscoverHideoutsQuestAccepted = game.date'
@addevent name=ベトリヌスの酒場 num=12
@eval exp='f.policeChiefIsOut = true'

[baroff]
;------------------------------------------------------------------------------
*ワイルド・ブルのアジトを探せ_0
*ワイルド・ブルのアジトを探せ_1
*ワイルド・ブルのアジトを探せ_2

[texton]
[if exp='f.policeChiefIsOut']
	[name n="Security Vice Chief" f=guard_00]「I believe there are [b]three[/b] Wild Bull hideouts somewhere in the land. Please find them.」[k]
	[if exp='o.ワイルド・ブルのアジトを探せ.flag == 1']
		[name n="Security Vice Chief" f=guard_00]「You've found [b]one[/b] hideout. Please find two more locations.」[k]
	[elsif exp='o.ワイルド・ブルのアジトを探せ.flag == 2']
		[name n="Security Vice Chief" f=guard_00]「You've found [b]two[/b] hideouts. Please find one more location.」[k]
	[endif]
[else]
	[警備隊長]「I believe there are [b]three[/b] Wild Bull hideouts somewhere in the land. Please find them.」[k]
	[if exp='o.ワイルド・ブルのアジトを探せ.flag == 1']
		[警備隊長]「You've found [b]one[/b] hideout. Please find two more locations.」[k]
	[elsif exp='o.ワイルド・ブルのアジトを探せ.flag == 2']
		[警備隊長]「You've found [b]two[/b] hideouts. Please find one more location.」[k]
	[endif]
[endif]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*ワイルド・ブルのアジトを探せ_3

[texton]
[if exp='f.policeChiefIsOut']
	[name n="Security Vice Chief" f=guard_01]「Oh! You found all the hiding places? Thanks for all your hard work!」[k]
	[name n="Security Vice Chief" f=guard_01]「Now we can start planning in earnest for the destruction of the Wild Bull. You've really done a great job. Please accept your reward.」[k]
[else]
	[警備隊長]「Oh! You found all the hiding places? Thanks for all your hard work!」[k]
	[警備隊長]「Now we can start planning in earnest for the destruction of the Wild Bull. You've really done a great job. Please accept your reward.」[k]
[endif]
[textoff]
@complete name=ワイルド・ブルのアジトを探せ
@addevent name=ベトリヌスの酒場 num=18 cond='game.isFreeMode'

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   ワイルド・ブル壊滅作戦
;[displayName] Destroy Wild Bull
;[summary] Seize Wild Bull's base within 48 hours.
;[exp]     220000
;[gold]    100000
;[detail]  Participate in the operation to destroy Wild Bull. Within <b>48 hours<k> of receiving the quest, you must infiltrate and take control of Wild Bull's fortress in Penske Pass.
;------------------------------------------------------------------------------
*ワイルド・ブル壊滅作戦_intro

[texton]
[警備隊長]「Thank you for coming. I hoped you'd be along.」[k]
[警備隊長]「We in the Guard are now ready to destroy Wild Bull. We will hit their strongholds with all our strength and exterminate them once and for all.」[k]
[警備隊長]「We would like you to be part of our operation. As you know, Wild Bull has several strongholds. We need you to attack one of them.」[k]
[警備隊長]「The strongholds in the Landon Canyon and Emile Plains will be tackled by our security forces. You will travel to the fort at [b]Penske Pass[/b] and take out the leader there.」[k]
[警備隊長]「I'll give you one of their keys that our scouts have obtained. This should allow you to open any door in the fort.」[k]
[textoff]
@getitem item=ワイルド・ブルの鍵
[texton]
[警備隊長]「Let the mission begin! Your mission is to seize their [b]fortress at Penske Pass[/b] by [b]midnight two days from now[/b]. I'm counting on you!」[k]
[textoff]

; 時間制限フラグ
@eval exp='o.ワイルド・ブル壊滅作戦.end = game.date + 2'
@addevent name=全般 num=67

; このクエストを受けるとワイルド・ブル関連イベントがすべて消える
@delevent name=全般 num=3
@delevent map=ランドン渓谷・崖上 num=7
@delevent map=ペンスキー峠・峠道 num=1
@delevent map=ペンスキー峠・峠道 num=2
@delevent map=ワイルドブルのアジト２Ｆ num=2
@delevent map=ワイルドブルのアジト２Ｆ num=7
@delevent map=ワイルド・ブルの隠れ家 num=3
@delevent map=ワイルド・ブルの隠れ家 num=4

[baroff]
;------------------------------------------------------------------------------
*ワイルド・ブル壊滅作戦_0

[texton]
[警備隊長]「Your mission is to seize Wild Bull's stronghold at [b]Penske Pass[/b] by [b]midnight [emb exp='o.ワイルド・ブル壊滅作戦.end - game.date'] days from now[/b]. I'm counting on you!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*ワイルド・ブル壊滅作戦_1

[texton]
[警備隊長]「Hello, guys. You did a great job on this operation. I think it's safe to say that we've almost completely annihilated Wild Bull.」[k]
[警備隊長]「...It's a shame we missed Alex. What a fast runner.」[k]
[警備隊長]「However, the main goal was achieved. Please accept your reward.」[k]
[textoff]
@complete name=ワイルド・ブル壊滅作戦
@call target=*_return_slaves cond='o.ワイルド・ブル.slaves[0] !== void'

[baroff]
;------------------------------------------------------------------------------
*ワイルド・ブル壊滅作戦_2

[texton]
[警備隊長 f=01]「Frankly, you guys have let me down. I thought you'd manage better...」[k]
[警備隊長 f=01]「After that, we asked another party of adventurers. We got some results, but the operation was a mess, and some key Wild Bull members escaped.」[k]
[警備隊長 f=01]「As such, I can't pay you any compensation. Now, if you'll excuse me.」[k]
[textoff]
@complete name=ワイルド・ブル壊滅作戦 failure=true
@call target=*_return_slaves cond='o.ワイルド・ブル.slaves[0] !== void'

[baroff]
;------------------------------------------------------------------------------
*_return_slaves

[texton]
[警備隊長 f=01]「Oh yeah, we rescued your friends who were being held captive.」[k]
[警備隊長 f=01]「[b]They're waiting at the Waiting Room in Sapphire City.[/b] You might want to go there.」[k]
[textoff]

*_return_slaves_loop

[iscript]
tf.temp = o.ワイルド・ブル.slaves[0];
tf.temp.removeEquipmentsByForce();
if(tf.temp.isBigBelly()) tf.temp.dressEquipment(o.マタニティドレス　);
else if(tf.temp.isPregnant()) tf.temp.dressEquipment(o.マタニティドレス);
else tf.temp.setInitialItems();
o.ワイルド・ブル.restoreSlave(tf.temp, game.waitingRoom);
[endscript]

@se f=period
@notice text=&'"<p>" + tf.temp.displayName + "<y> has returned!"'
@jump target=*_return_slaves_loop cond='o.ワイルド・ブル.slaves[0] !== void'

@return
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   墓参り
;[displayName] Grave Visit
;[summary] I want you to go lay flowers on my wife's grave.
;[exp]     1500
;[gold]    1000
;[detail]  Visit <b>Stella's Grave<k> in Yanek Forest and lay some flowers.
;------------------------------------------------------------------------------
*墓参り_intro

[texton]
[依頼人 f=waroth_01]「Hi, you must be the ones who took my request.」[k]
[依頼人 f=waroth_01]「Well, this is something I'd rather do myself, but I'm having terrible back pain... I'd like you to lay some flowers on the grave of my wife, Stella, who died last year.」[k]
[依頼人 f=waroth_01]「My wife's grave is in [b]Yanek Forest[/b], northeast of this town. Please could you go there for me?」[k]
[textoff]
@eval exp='o.墓参り.flag = 1'

[baroff]
;------------------------------------------------------------------------------
*墓参り_1

[texton]
[依頼人 f=waroth_01]「Bring flowers to my wife Stella's grave. It's in [b]Yanek Forest[/b] northeast of this town.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*墓参り_2

[texton]
[依頼人 f=waroth_01]「Bless you, it seems you went to visit the grave. Here's the reward.」[k]
[textoff]
@complete name=墓参り

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   オークの拠点を制圧せよ
;[displayName] Conquer Orc Den
;[summary] Exterminate some orcs in their den within a week.
;[exp]     24500
;[gold]    12000
;[detail]  Go to the orc den in the eastern part of Yanek Forest and kill the orcs by midnight one week after receiving the quest.<r>Also, rescue the Sapphire City Guard Captain who went there first.
;------------------------------------------------------------------------------
*オークの拠点を制圧せよ_intro

[texton]
[name n="Security Vice Chief" f=guard_00]「Hi, I am the deputy commander of the Sapphire City Security Squad. I am currently the acting head of the security squad.」[k]
[name n="Security Vice Chief" f=guard_02]「I have a request for all adventurers! Could you please head to the [b]orc den[/b] in the eastern part of Yanek Forest and exterminate the orcs?」[k]
[name n="Security Vice Chief" f=guard_00]「Orcs are using their dens as bases to attack humans in the surrounding villages. The threat is growing by the day and is beyond the control of our security forces.」[k]
[name n="Security Vice Chief" f=guard_02]「We can no longer ignore the orc situation. Therefore, we need you adventurers to destroy their den. Please help us!」[k]
[name n="Security Vice Chief" f=guard_00]「As a matter of fact, our captain headed there several days ago, but has yet to return!」[k]
[name n="Security Vice Chief" f=guard_00]「...I am also concerned about the captain. So please head to the orc den as soon as possible... at the latest by [b]midnight[/b] a week from now. I'm counting on you.」[k]
[textoff]

@eval exp='o.オークの拠点を制圧せよ.flag = 1'
@eval exp='o.オークの拠点を制圧せよ.end = game.date + 7'
@addevent name=全般 num=66
@addevent map=オークの巣穴 num=1

[baroff]
;------------------------------------------------------------------------------
*オークの拠点を制圧せよ_1

[texton]
[name n="Security Vice Chief" f=guard_00]「Please head to the [b]orc den[/b] in the eastern part of Yanek Forest and destroy their stronghold. Good luck.」[k]
[name n="Security Vice Chief" f=guard_00]「I hope you can complete your mission by midnight in [b][emb exp='o.オークの拠点を制圧せよ.end - game.date'] days[/b]!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*オークの拠点を制圧せよ_2

[texton]
[name n="Security Vice Chief" f=guard_01]「Thank you! You exterminated the orcs! And the captain came back safely!
 」[k]
[name n="Security Vice Chief" f=guard_01]「This will make the orcs much more docile. I am so glad we hired you guys. I look forward to working with you again in the future!」[k]
[textoff]
@complete name=オークの拠点を制圧せよ
@eval exp='f.policeChiefIsOut = false'

[baroff]
;------------------------------------------------------------------------------
*オークの拠点を制圧せよ_3

[texton]
[name n="Security Vice Chief" f=guard_00]「Oh, and if you're referring to the orc den, that's fine.」[k]
[name n="Security Vice Chief" f=guard_00]「I asked another adventurer party to solve the problem for me. The captain has returned. My request to you all is finished.」[k]
[textoff]
@complete name=オークの拠点を制圧せよ failure=true
@eval exp='f.policeChiefIsOut = false'

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   売春組織の実体を暴け
;[displayName] Uncover the Prostitution Ring
;[summary] Get evidence of organized prostitution occurring in a certain hotel.
;[exp]     65000
;[gold]    40000
;[detail]  Infiltrate a love hotel in Sapphire City called <b>Hotel Queen<k> and obtain evidence of organized prostitution believed to be taking place there.
;------------------------------------------------------------------------------
*売春組織の実体を暴け_intro

[texton]
[警備隊長]「Hey, you guys. Sorry for always bothering you.」[k]
[警備隊長]「Did you know that there is a love hotel in this town called [b]Hotel Queen[/b]?」[k]
[警備隊長]「Actually... There are rumors of a big prostitution racket taking place there.」[k]
[警備隊長]「We assume that there is an underworld prostitution ring operating behind the scenes. No doubt they are profiting enormously.」[k]
[警備隊長]「To prevent the deterioration of public safety, we cannot leave the situation unchecked. That is why we need you to investigate.」[k]
[警備隊長]「Could you infiltrate the Hotel Queen and get evidence of organized prostitution?」[k]
[textoff]

@question title="Do you accept?"

[texton]
[if exp='tf.result']
	[警備隊長]「I see! You'll take care of it? You guys are fantastic!」[k]
	[警備隊長]「The [b]Hotel Queen[/b] is on the east street of this town. Take a good look at the town map. Thanks.」[k]
	[b][nw]Now we can go to Hotel Queen![k]
	@eval exp='o.ホテル・クイーン.visible = o.ホテル・クイーン.appeared = true'
	@addevent name=ホテル・クイーン num=0
	@eval exp='f.rescuedGirls = 0'
[else]
	[警備隊長]「Well... If you change your mind, give me another shout.」[k]
	@eval exp='o.売春組織の実体を暴け.accepted = false'
[endif]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*売春組織の実体を暴け_0

[texton]
[警備隊長]「How's it going? Did you sniff out the prostitution ring?」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   教団を壊滅させろ
;[displayName] Destroy the Cult
;[summary] Infiltrate the headquarters of a threatening new cult and capture the guru.
;[exp]     200000
;[gold]    140000
;[detail]  Infiltrate the fortress northeast of Collins Wood and capture the guru of the religious cult based there.
;------------------------------------------------------------------------------
*教団を壊滅させろ_intro

[texton]
[警備隊長]「Hey, it's you guys. Thank you for all your help.」[k]
[警備隊長]「...In fact, a certain new religion is spreading in Sapphire City recently. Members of a cult are apparently doing a lot of recruitment, particularly among young citizens.」[k]
[警備隊長]「Supposedly many of those who become members of this new religion are taken to a huge facility northeast of Collins Wood and never come back.」[k]
[警備隊長]「Rumor has it that they are brainwashed into becoming faithful pawns of its guru, and end up committing fraud, prostitution, and robbery, to gain funding for the cult.」[k]
[警備隊長]「As a security force, we cannot stand by and watch as the youth of this country are preyed upon by such groups!」[k]
[警備隊長]「We are planning to launch an operation to seize their facilities in order to destroy this group. So we are asking for your help in this regard.」[k]
[警備隊長]「Can you infiltrate the cult's facilities, get close to the guru, and take him into custody? That should paralyze their chain of command. We, the security team, will do the rest. What do you think? Will you do it?」[k]
[警備隊長]「As to where they're based, did you know that there is a fortress northeast of Collins Wood? It's a big building, so you should be able to find it. I'm counting on you.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*教団を壊滅させろ_0

[texton]
[警備隊長]「The cult's stronghold, a fortress, is located northeast of Collins Wood. You must infiltrate it and capture the guru.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*教団を壊滅させろ_1

[texton]
[警備隊長]「What? You just can't do the training and get the title to prove it?」[k]
[警備隊長]「Hmm... Then why don't you just take them from the cult members? A member of the Order would have those 5 titles, right?」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*教団を壊滅させろ_2

[texton]
[警備隊長]「You did a great job! We were able to arrest the guru and destroy the cult! Now the town will be at peace.」[k]
[警備隊長]「This is a thank you. You guys are really dependable! I look forward to working with you again.」[k]
[textoff]
@complete name=教団を壊滅させろ

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   若さを維持したい
;[displayName] I Want to Stay Young
;[summary] I want you to find me some Royal Jelly to keep me young.
;[exp]     65000
;[gold]    32000
;[detail]  Seek out <b>Royal Jelly<k> for the client.
;------------------------------------------------------------------------------
*若さを維持したい_intro

[texton]
[name n=Vetrinus f=vetrinus_00]「Well now, this time your client is me.」[k]
Surprisingly, this quest was a request from Vetrinus, the owner of the tavern.[k]
[name n=Vetrinus f=vetrinus_00]「One question first.」[k]
[name n=Vetrinus f=vetrinus_00]「Do you think I'm beautiful?」[k]
[textoff]
@question title=Well?
[texton]
[if exp='tf.result']
	[name n=Vetrinus f=vetrinus_00]「That's right, that's right! As expected, I'm beautiful! Mmm, yes, you're lovely and honest.」[k]
	[name n=Vetrinus f=vetrinus_00]「But... even this rare beauty can't go against the flow of time. This face that is beautiful now will eventually grow old and ugly with countless wrinkles carved into its jade skin.」[k]
	[name n=Vetrinus f=vetrinus_00]「That's why I want to stay young forever in order to maintain this beauty.」[k]
[else]
	[name n=Vetrinus f=vetrinus_00]「Hmm? Did I just mishear you? You think I'm not beautiful? Oh-ho-ho! That can't be true!」[k]
	[name n=Vetrinus f=vetrinus_00]「Ah... You must have been struck dumb by my sheer beauty... Well, it can't be helped, that's only natural.」[k]
	[name n=Vetrinus f=vetrinus_00]「That being so, I want to stay young forever to maintain this beauty.」[k]
[endif]
[name n=Vetrinus f=vetrinus_00]「The secret is to be well nourished. I hear there's a very nutritious substance called [b]Royal Jelly[/b].」[k]
[name n=Vetrinus f=vetrinus_00]「I'd like to take it to keep my youth. But I have no idea where to get it!」[k]
[name n=Vetrinus f=vetrinus_00]「So, can you find this Royal Jelly or whatever it is? I'm willing to pay for it! I don't care what it costs! I want it desperately!」[k]
[name n=Vetrinus f=vetrinus_00]「The request can be fulfilled at any time. If you find it during your adventure, please bring it to me. Please!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*若さを維持したい_0

[if exp='! game.party.hasItem(o.ロイヤルゼリー)']
	[texton]
	[name n=Vetrinus f=vetrinus_00]「Hey, hey, hey, did you get the [b]Royal Jelly[/b] I asked for yet?」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[name n=Vetrinus f=vetrinus_00]「Ohoho! This is it! With this, I can be beautiful forever!」[k]
[name n=Vetrinus f=vetrinus_00]「You've done very, very well! Here's your reward.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.ロイヤルゼリー)'
@complete name=若さを維持したい

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   人身売買の証拠をつかめ
;[displayName] Get Evidence of Human Trafficking
;[summary] I need you to investigate a human trafficking ring.
;[exp]     90000
;[prize]   30,000G & 5,000G per rescue
;[detail]  Infiltrate the <b>Count's Mansion<k>, located just outside the northeast gate of Sapphire City, and uncover the human trafficking that is said to be taking place there.
;------------------------------------------------------------------------------
*人身売買の証拠をつかめ_intro

[texton]
[name n="Security Vice Chief" f=guard_01]「Is that you guys? Our guard captain is always at your service.」[k]
[name n="Security Vice Chief" f=guard_00]「I would like to request another job. We are told that there is a human trafficking ring operating underground here in Sapphire City...」[k]
[name n="Security Vice Chief" f=guard_00]「They are said to take girls from local villages and sell them to brothels and aristocrats.」[k]
[name n="Security Vice Chief" f=guard_00]「We cannot allow such misdeeds to go unchecked. Therefore, we need you to investigate these rumors and obtain evidence of human trafficking.」[k]
[name n="Security Vice Chief" f=guard_00]「It is said that a certain Count, a powerful nobleman of this town, is involved in this matter. However, he has been cleverly concealing his true identity, and we have been unable to catch him in the act.」[k]
[name n="Security Vice Chief" f=guard_00]「The Count's residence is just outside the northeast gate of this town. Thanks.」[k]
[textoff]
@eval exp='f.rescuedSlaves = 0'

[baroff]
;------------------------------------------------------------------------------
*人身売買の証拠をつかめ_0

[texton]
[name n="Security Vice Chief" f=guard_00]「The Count's residence is just outside the northeast gate of this town. Thanks.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*人身売買の証拠をつかめ_1

[texton]
[name n="Security Vice Chief" f=guard_01]「You did a great job! Thanks to you, we were able to arrest the Count and all those involved in human trafficking!」[k]
[name n="Security Vice Chief" f=guard_01]「This is a thank you. You are all so dependable! I look forward to working with you again!」[k]
[textoff]
@complete name=人身売買の証拠をつかめ gold=&'30000 + f.rescuedSlaves * 5000'
@delevent map=伯爵の屋敷１Ｆ num=1
@delevent map=伯爵の屋敷１Ｆ num=2
@delevent map=伯爵の屋敷１Ｆ num=3
@delevent map=伯爵の屋敷２Ｆ num=7

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   スライム軍団の討伐
;[displayName] Defeat the Slime Gang
;[summary] Take down the slime gang that is rampaging in Yanek Forest
;[exp]     4000
;[gold]    3000
;[detail]  Triumph against a group of slimes that appear in the eastern part of <b>Yanek Forest<k>.
;------------------------------------------------------------------------------
*スライム軍団の討伐_intro

[texton]
[倉庫の管理人]「Hi, I'm the client.」[k]
[倉庫の管理人]「So, some stray slimes have formed a gang and are attacking people who pass through Yanek Forest.」[k]
[倉庫の管理人]「They attack passing travelers and rob them of food and other items. They're quite ferocious, and it seems the people in charge of security are having a hard time.」[k]
[倉庫の管理人]「On my honor as a slime, I can't let this stand. Adventurers, please punish them!」[k]
[倉庫の管理人]「They haunt the eastern part of [b]Yanek Forest[/b]. You might suddenly be attacked while on the road, so I ask that you don't neglect your preparations.」[k]
[textoff]
@addevent map=ヤネクの森・東 num=5

[baroff]
;------------------------------------------------------------------------------
*スライム軍団の討伐_0

[texton]
[倉庫の管理人]「The stray slimes attack people in the eastern part of [b]Yanek Forest[/b]. Focus on that area.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*スライム軍団の討伐_1

[texton]
[倉庫の管理人]「You upheld the honor of slimedom. Thanks to you guys, the case is closed. Thank you so much.」[k]
[倉庫の管理人]「I should give you a bonus. As well as the promised 10,000G, I've included some of our finest cheese. Please accept it.」[k]
[textoff]
@complete name=スライム軍団の討伐
@treasure item=チーズ
@eval exp='o.闘技場.events = []'
@addevent name=ベトリヌスの酒場 num=10
@addevent name=ベトリヌスの酒場 num=14

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   オーケストラを作りたい
;[displayName] Orchestra Creation
;[summary] Provide the necessary instruments to form an orchestra.
;[exp]     67000
;[gold]    24000
;[detail]  Collect all <b>11 types of instrument<k> and deliver them to the client.
;------------------------------------------------------------------------------
*オーケストラを作りたい_intro

[texton]
[倉庫の管理人]「Hi, I'm the client once again.」[k]
[倉庫の管理人]「The stray slimes that you chased away are now all grown up and on their way to rehabilitation.」[k]
[倉庫の管理人]「...But there are still many temptations in the world. I can't rule out the possibility they'll return to their former wild ways. So I decided I wanted to help them find something they could devote themselves to.」[k]
[倉庫の管理人]「Then I had an idea. If they become devoted to music, they won't be distracted by the temptation of evil. So I want them to form an orchestra and work on music together.」[k]
[倉庫の管理人]「Unfortunately, an orchestra needs instruments. So, that's where you come in. Would you be willing to collect instruments for their rehabilitation?」[k]
[倉庫の管理人]「There are 11 of them, so I want you to collect all [b]11 different instruments[/b]. Well, I'll leave it to you.」[k]
[textoff]
@eval exp='f.collectedInstruments = []'

[baroff]
;------------------------------------------------------------------------------
*オーケストラを作りたい_0

[texton]
[倉庫の管理人]「Hey, how's the instrument collection going?」[k]
[textoff]

@question title="Do you want to give me an instrument?"
*_retry_give_instrument
@jump target=*_collected_instruments cond='! tf.result'
@selectitem
[texton]

[if exp='game.curItem === void']
	[倉庫の管理人]「Have you changed your mind? Sure, take your time.」[k]
	@jump target=*_collected_instruments
[endif]

[if exp='game.curItemStat < 0']
	[倉庫の管理人]「What item is this? Please identify it before giving it to me.」[k]
	[textoff]
	@question title="Do you want to re-select the instrument?"
	@jump target=*_retry_give_instrument
[endif]

[if exp='! game.curItem.instrument']
	[倉庫の管理人]「Sorry, I can't accept this one, as it's not an instrument.」[k]
	[textoff]
	@question title="Do you want to re-select the instrument?"
	@jump target=*_retry_give_instrument
[endif]

[if exp='game.curItemStat <= BROKEN']
	[倉庫の管理人]「The instrument is broken, so can't be played.」[k]
	[textoff]
	@question title="Do you want to re-select the instrument?"
	@jump target=*_retry_give_instrument
[endif]

[if exp='f.collectedInstruments.find(game.curItem.name) != -1']
	[倉庫の管理人]「Oh, I already have this instrument. Sorry.」[k]
	[textoff]
	@question title="Do you want to re-select the instrument?"
	@jump target=*_retry_give_instrument
[endif]

@eval exp='f.collectedInstruments.add(game.curItem.name)'
@eval exp='game.itemWin.curChara.ejectItem(game.curItem, game.itemWin.curChara.reservedGrid)'
[if exp='f.collectedInstruments.count < 11']
	[倉庫の管理人]「Thank you. Well, I'll keep hold of it.」[k]
	@jump target=*_collected_instruments
[endif]

[倉庫の管理人]「Thank you! I finally have all the instruments!」[k]
[倉庫の管理人]「Now I can put together the orchestra I've always wanted. I can imagine the joy on everyone's faces. It's all thanks to you guys. Thank you so much!」[k]
[倉庫の管理人]「Well, I should thank you. This time, I also added a special green apple. It's my style to add a little color to my rewards. Please accept it.」[k]
[textoff]

@complete name=オーケストラを作りたい
@treasure item=青りんご
@addevent name=ベトリヌスの酒場 num=15

[texton]
[倉庫の管理人]「I'm going to gather everyone together and start practicing for the orchestra as soon as possible. The goal is to give a concert together.」[k]
[倉庫の管理人]「Maybe one day we will be able to unveil it to you. If so, please come and listen!」[k]
[倉庫の管理人]「Oops, can't take it easy now. I have to start practicing right away. Oh, I'm busy, busy, busy!」[k]
[textoff]
[baroff]

*_collected_instruments
[iscript]
tf.arr = [];
for (var i = 0; i < f.collectedInstruments.count; i++) {
	tf.arr.add(o[f.collectedInstruments[i]].displayName);
}
[endscript]
[texton]
[倉庫の管理人]「I currently have [b][emb exp='f.collectedInstruments.count'] types[/b] of instrument. All I need is [b][emb exp='11 - f.collectedInstruments.count'] more[/b].」[k]
[倉庫の管理人]「By the way, here are the instruments I've collected so far.」[r]
[b][nw][emb exp='tf.arr.join(", ")'][/b][/nw][k]
[textoff]
[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   飛び入り参加求む！
;[displayName] Make Music with Us!
;[summary] I would like to be introduced to a bard who will join the orchestra.
;[exp]     12000
;[gold]    15000
;[detail]  Introduce a party member with the <b>Bard<k> job to the client.
;------------------------------------------------------------------------------
*飛び入り参加求む！_intro

[texton]
[倉庫の管理人]「Hey, good to see you again. How are you?」[k]
[倉庫の管理人]「Since last time, I've been practicing with the orchestra, and we're almost ready to play for everyone.」[k]
[倉庫の管理人]「However, just as we were about to start the concert, one of the members had to take care of his family. He had no choice but to leave the band. It's not my lucky day at all.」[k]
[倉庫の管理人]「We need to fill the hole he left so we can do the concert, but it's hard to find a replacement. Not many people are willing to play with slimes.」[k]
[倉庫の管理人]「So I'm asking you guys for advice again. Do you know any bards? If so, I'd like you to introduce them to us.」[k]
[倉庫の管理人]「We really want to fulfill our dream of having a concert. We are waiting for good news.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*飛び入り参加求む！_0

[texton]
[倉庫の管理人]「Hi, did you bring the bard with you?」[k]
[textoff]
@eval exp='game.curTarget = void'
@waitchoosechara text="Who would you like to introduce?"

[if exp='game.curTarget === void']
	[texton]
	[倉庫の管理人]「Have you changed your mind? I don't want you to get your hopes up.」[k]
	[textoff]
	[baroff]
[endif]

[if exp='game.curTarget.job != o.吟遊詩人']
	[texton]
	[倉庫の管理人]「He's not a bard, is he? Why did you decide to introduce him?」[k]
	[textoff]
	[baroff]
[endif]

@eval exp='game.curChara = game.curTarget'
[texton]
[倉庫の管理人]「I'm glad you're joining us! Nice to meet you.」[k]
[倉庫の管理人]「There's a music festival happening at the arena tonight, so I'd like you to participate right away.」[k]
[倉庫の管理人]「You're a bard, so you can handle it right off the bat, right? Your part is percussion. We're going to tune now, so get ready.」[k]
[textoff]
@out
@w05
@se f=cheer
@fg c=concert_slimes b
@fg r=&'"concert_" + game.curChara.img + "_" + game.curChara.color' left=650 top=240 b
@bg f=0025
[texton w=2]
That evening, the orchestra led by the slime supervisor attended a music festival in Sapphire City on short notice.[k]
[倉庫の管理人]「Thank you all for coming to listen to our music! We will deliver our feelings to your hearts!」[k]
[textoff]
@mu f=concert
@w1
[texton w=2]
The performance by the Slime Orchestra has begun. [キャラ] is hard at work on the edge, waving maracas.[k]
Perhaps as a result of their intense practice, their music was on par with that of professionals, and the audience enjoyed it immensely.[k]
After the performance, the audience kept applauding.[k]
[textoff]
@fa
@out
@w05
@gameon
[texton]
[倉庫の管理人]「It was very exciting! All the members are very happy.」[k]
[倉庫の管理人]「I think this performance has changed the way people look at slimes. All the members found joy in music and became very positive. I think they will be fine now.」[k]
[倉庫の管理人]「You guys have been a great help. Thank you so much. I hope you will continue to support us in the future.」[k]
[倉庫の管理人]「So let me hand over the reward. As always, I'll add an extra item. It's a gift from me to you, as a token of my appreciation for all you have done. Please accept it.」[k]
[textoff]

@complete name=飛び入り参加求む！
@treasure item=アルテミスの杖,鏡の盾,女神のドレス

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   怪鳥マッドウイングの羽
;[displayName] Madwing Feather
;[summary] Bring me a Madwing feather.
;[exp]     5500
;[gold]    7000
;[detail]  Defeat the <b>Madwing<k> that haunts <b>Harpy's Mountain<k> in Landon Canyon and get its feathers.
;------------------------------------------------------------------------------
*怪鳥マッドウイングの羽_intro

[texton]
[依頼人]「Have you ever met a [b]Madwing[/b]? With its sharp claws and high magical power, it is the most powerful bird of the Harpy tribe.」[k]
[依頼人]「They're extremely strong. But their feathers are so colorful and beautifully radiant!」[k]
[依頼人]「So, I want you guys to go and get me one. I'll pay you handsomely if you do.」[k]
[依頼人]「Madwings roost on [b]Harpy Mountain[/b], somewhere in[r][b]Landon Canyon[/b]. I'm counting on you.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*怪鳥マッドウイングの羽_0

[if exp='! game.party.hasItem(o.マッドウイングの羽)']
	[texton]
	[依頼人]「I'd like a [b]Madwing Feather[/b]. Madwings roost on [b]Harpy Mountain[/b] somewhere in [b]Landon Canyon[/b]!」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Madwing feathers really are beautiful. Thank you. Here's your reward.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.マッドウイングの羽)'
@complete name=怪鳥マッドウイングの羽
@addevent name=かもめ亭 num=3

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   不死鳥フェニックスの羽
;[displayName] Phoenix Feather
;[summary] Find me a Phoenix Feather.
;[exp]     85000
;[gold]    20000
;[prize]   Special item
;[detail]  Find and defeat a <b>Phoenix<k> and obtain its feather. They're said to appear in very hot places.
;------------------------------------------------------------------------------
*不死鳥フェニックスの羽_intro

[texton]
[依頼人]「Have you ever heard of a legendary bird that comes back to life no matter how many times it dies? Its name is the Phoenix, and it's said to live somewhere in the world.」[k]
[依頼人]「And according to the story, phoenix feathers are dazzlingly beautiful, shining in seven different colors. I really want to get my hands on one.」[k]
[依頼人]「So I want you guys to go out and find a precious [b]Phoenix Feather[/b]. Since you managed to get a feather from a Madwing, I know you can do it.」[k]
[依頼人]「If you do, I'll give you a special item. How does it sound? Would you like to try it?」[k]
[依頼人]「The Phoenix is also known as the firebird. Maybe you can meet one in a very hot place.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*不死鳥フェニックスの羽_0

[if exp='! game.party.hasItem(o.フェニックスの羽)']
	[texton]
	[依頼人]「Go find [b]Phoenix Feather[/b], which is said to be somewhere in the world. You might find one in a hot spot.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Oh! Is this the feather of the phoenix? This beauty and magic... It's wonderful...!」[k]
[依頼人]「The rumors were true. It's wonderful, thanks so much. You guys are true adventurers.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.フェニックスの羽)'
@complete name=不死鳥フェニックスの羽
@treasure item=回復の指輪

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   モデル募集
;[displayName] Model Wanted
;[summary] A beautiful woman dressed like a goddess to model for a picture
;[exp]     7400
;[gold]    3800
;[detail]  Have a party member wear the <b>Goddess Dress<k> and return to the client.
;------------------------------------------------------------------------------
*モデル募集_intro

[texton]
[依頼人]「I am looking for a model for a painting. Any [b]beautiful woman[/b] in a [b]Goddess Dress[/b] would be fine! Thanks!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*モデル募集_0

@eval exp='game.curChara = game.party.findEquipedItems(o.女神のドレス)'
[if exp='game.curChara === void']
	[texton]
	[依頼人]「I'm looking for a [b]a beautiful woman[/b] wearing a Goddess Dress! Thank you!」[k]
	[textoff]
	[baroff]
[endif]

@call storage="main10.scn" target=*model_1
@complete name=モデル募集
@clf
@addevent name=かもめ亭 num=4

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   モデル募集その２
;[displayName] Model Wanted 2
;[summary] A beautiful woman wearing sexy red underwear wanted to model for a painting
;[exp]     15000
;[gold]    12000
;[detail]  Have a party member wear <b>a matching red bra and panties<k> and return to the client.
;------------------------------------------------------------------------------
*モデル募集その２_intro

[texton]
[依頼人]「Umm... I'm looking for a model for a painting again.」[k]
[依頼人]「[b]A beautiful woman wearing sexy red underwear[/b]. Anyone is fine! Thank you!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*モデル募集その２_0

@eval exp='game.curChara = game.party.findEquipedItems(o.赤いブラ, o.赤いパンツ)'
[if exp='game.curChara === void']
	[texton]
	[依頼人]「[b]A beautiful woman wearing sexy red underwear.[/b][r]Anyone is fine! Thank you!」[k]
	[textoff]
	[baroff]
[endif]

@call storage="main10.scn" target=*model_2
@complete name=モデル募集その２
@clf
@addevent name=かもめ亭 num=5

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   モデル募集その３
;[displayName] Model Wanted 3
;[summary] Beautiful ladies, please be my nude model!
;[exp]     37500
;[gold]    40000
;[detail]  Ask a party member to be a nude model.
;------------------------------------------------------------------------------
*モデル募集その３_intro

[texton]
[依頼人]「I have another request. This time, it's for a nude model!」[k]
[依頼人]「Please, any woman who is willing to be nude, please help me!」[k]
[textoff]

;------------------------------------------------------------------------------
*モデル募集その３_0

[texton]
[依頼人]「What do you think? Would anyone be willing to pose nude?」[k]
[textoff]

*_select_nude_model
@eval exp='game.curTarget = void'
@waitchoosechara text="Who will be the model?" guest=true

[if exp='game.curTarget === void']
	[texton]
	[依頼人]「I see... If you ever feel like going nude in the future, give me a shout again!」[k]
	[textoff]
	[baroff]
[endif]

@eval exp='game.curChara = game.curTarget'

[if exp='game.curChara.sex == "男" || game.curChara.moral > 95']
	@call storage="main10.scn" target=*model_3_reject
	@jump target=*_select_nude_model
[endif]

@jump storage="main10.scn" target=*model_3_accept

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   夫の捜索
;[displayName] Searching For My Husband
;[summary] Please find my husband who disappeared while heading to the Water Palace.
;[exp]     120000
;[gold]    45000
;[prize]   Shell Necklace
;[detail]  Enter the <b>Mater Palace<k> in the western part of Moise Swamp and search for clues to the whereabouts of the client's husband <b>Jean<k>.
;------------------------------------------------------------------------------
*夫の捜索_intro

[texton]
[依頼人]「Oh... are you the people who accepted my request? My name is Ortena.」[k]
[name n=Ortena]「My request is none other than... I need you to find my husband.」[k]
[name n=Ortena]「Actually... my husband, Jean, said he was going to the [b]Water Palace[/b] a few years ago and just disappeared. I've not seen him since.」[k]
[name n=Ortena]「I looked into it myself, but all I found out was that he probably reached it.」[k]
[name n=Ortena]「So I have a request for you adventurers. Could you go to the [b]Water Palace[/b] and search for my husband?」[k]
[name n=Ortena]「...That man longed to meet the mermaids who live there. Something must have happened with them.」[k]
[name n=Ortena]「My husband wore a [b]Shell Amulet[/b] to the water palace. It is a mysterious amulet that protects a person's body from water. It will surely provide some clues. Thank you in advance!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*夫の捜索_0

[if exp='! game.party.hasItem(o.ジャンの手紙)']
	[texton]
	[name n=Ortena]「Have you found any clues to the whereabouts of my husband, Jean? He must have gone to the [b]Water Palace[/b]!」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[name n=Ortena]「Oh...! This is the shell amulet my husband had...! I knew he went to the Water Palace...!」[k]
We gave her a letter that we thought was written by her husband, which was in the treasure chest along with the shell amulet.[k]
[name n=Ortena]「...I see. So my husband shared his fate with his beloved mermaids...」[k]
[name n=Ortena]「I am saddened by my husband's death, but this clears my mind.[r]I will finally be able to forget about him and move on!」[k]
[name n=Ortena]「Thank you so much. This is for you.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.ジャンの手紙)'
@eval exp='game.party.ejectItem(o.貝のお守り（ジャンの所持品）)'
@complete name=夫の捜索
@treasure item=貝のネックレス
@addevent name=かもめ亭 num=7

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   黄金のリンゴを届けてくれ
;[displayName] Deliver Golden Apple
;[summary] Pick a golden apple from the orchard and deliver it to the Princess.
;[exp]     26000
;[gold]    5000
;[detail]  Pick a golden apple from somewhere in Moise Swamp orchard and deliver it to Princess Fiona at Sapphire Castle.
;------------------------------------------------------------------------------
*黄金のリンゴを届けてくれ_intro

[texton]
[依頼人]「I run an orchard in Moise Swamp east of this village.」[k]
[依頼人]「In this orchard, there is a very special apple tree. Every year I offer the golden apples it produces to Her Royal Highness Princess Fiona of Sapphire City.」[k]
[依頼人]「...The golden apple, as the name implies, is famed for its color, which shines like gold. It's a top quality variety of apple that tastes and looks exquisite!」[k]
[依頼人]「I used to harvest the golden apples myself and deliver them to none other than Her Royal Highness, the Princess. But recently, I can no longer go to the orchard to pick them because ferocious killer bees swarm there... 」[k]
[依頼人]「So I ask you adventurers to pick the golden apples. And once you have, would you be so good as to deliver them to [b]Princess Fiona[/b]?」[k]
[依頼人]「The Golden Apple tree is in the [b]Moise Swamp Orchard[/b]. It's slightly hidden, so look carefully.」[k]
[依頼人]「By the way, please help yourself to apples from the other trees. I'm sure you'll enjoy the taste!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*黄金のリンゴを届けてくれ_0

[texton]
[依頼人]「The Golden Apple tree is in the [b]Moise Swamp Orchard[/b]. It's slightly hidden, so look carefully.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*黄金のリンゴを届けてくれ_1

[texton]
[依頼人]「Have you picked the Golden Apples? [r]If you did, deliver them to [b]Her Royal Highness the Princess of Sapphire City[/b].」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   殺人バチの根絶
;[displayName] Killer Bee Extermination
;[summary] I want you to eliminate the source of the killer bees infesting the orchard.
;[exp]     98000
;[gold]    27000
;[detail]  Exterminate a killer bee hive in an orchard somewhere in Moise Swamp.
;------------------------------------------------------------------------------
*殺人バチの根絶_intro

[texton]
[依頼人]「It's me again, from the orchard. Thank you for taking care of my last job.」[k]
[依頼人]「Since then, the number of killer bees occupying the orchard has only increased. If something isn't done, I'll never be able to harvest again.」[k]
[依頼人]「So it's time to take radical measures against them.」[k]
[依頼人]「There must be a hive somewhere in the orchard. I want you to take care of it. If you do that, the number of bees should decrease dramatically.」[k]
[依頼人]「I hope this will be the end of it. Please, put an end to the war against the killer bees!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*殺人バチの根絶_0

[texton]
[依頼人]「The killer bees are still swarming. The only way to reclaim the orchard is to find and destroy their nest!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*殺人バチの根絶_1

[texton]
[依頼人]「Well done! Now we can pick apples in peace!」[k]
[依頼人]「I can't thank you guys enough. This is just a small token of my appreciation. Please accept it!」[k]
[textoff]
@complete name=殺人バチの根絶
@treasure item=破邪の指輪

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   倉庫整理のお仕事
;[displayName] Warehouse Organization
;[summary] I need to organize the stones in the warehouse.
;[exp]     410000
;[gold]    68000
;[prize]   Shell Charm
;[detail]  Go to <b>Fool's Warehouse<k> in Collins Wood and follow the instructions to organize the stones in all the rooms.
;------------------------------------------------------------------------------
*倉庫整理のお仕事_intro

[texton]
[name n=Fernando f=shaman_01]「My name is Fernando, and I own a stone store.」[k]
[name n=Fernando f=shaman_01]「Actually, my warehouse is full of stones. I'd like to organize it properly, but the aisles are too narrow.」[k]
[name n=Fernando f=shaman_01]「So I need you guys to organize my warehouse. I need to move the stones to a designated area to free up some space.」[k]
[name n=Fernando f=shaman_01]「For now, go to the warehouse. The warehouse is in Collins Wood, just outside the south gate, across from the pond. Use this key to open the door. Well then, I'll leave it to you.」[k]
[textoff]
@getitem item=倉庫の鍵
@eval exp='o.倉庫整理のお仕事.flag = 1'

[baroff]
;------------------------------------------------------------------------------
*倉庫整理のお仕事_1

[texton]
[name n=Fernando f=shaman_01]「For now, please go to the warehouse. It's on the opposite side of the pond just outside the south gate. I'm counting on you.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*倉庫整理のお仕事_2

[texton]
[name n=Fernando f=shaman_00]「You did well. Are you tired?」[k]
[name n=Fernando f=shaman_00]「Your reward is in all the warehouse treasure chests. If I need anything else, I'll be counting on you!」[k]
[textoff]
@complete name=倉庫整理のお仕事
@treasure item=貝のお守り
@eval exp='sf.clearedQuestOfWarehouse = true'

[baroff]
;------------------------------------------------------------------------------
*倉庫整理のお仕事_3

[texton]
[name n=Fernando f=shaman_00]「Hmm? You're back quickly. Did you really do it properly?」[k]
[name n=Fernando f=shaman_00]「Well, that's fine. Here's the reward I promised you.」[k]
[textoff]
@complete name=倉庫整理のお仕事 exp=100
@treasure item=貝のお守り

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   世界グルメ紀行
;[displayName] World Gourmet Journey
;[summary] Eat 25 types of food from around the world and report back to me.
;[exp]     100000
;[gold]    30000
;[prize]   Return Spellbook
;[detail]  Visit bars around the world, order at least 25 types of food there, and return to the bar in Seagull Village to report.
;------------------------------------------------------------------------------
*世界グルメ紀行_intro

[texton]
[name n="Magic Store Owner" f=witch_other_00]「I made that request!」[k]
[name n="Magic Store Owner" f=witch_other_00]「I'm interested in dishes from around the world. I really want to try a lot of different food, but I have to work at the store, so don't have time to travel.」[k]
[name n="Magic Store Owner" f=witch_other_00]「You're adventurers, right? You've traveled all over the world, so you've had the chance to eat all kinds of food, right?」[k]
[name n="Magic Store Owner" f=witch_other_00]「I want you to tell me all about it. What kind of food was there, how it tasted, how much it cost, what it was like...」[k]
[name n="Magic Store Owner" f=witch_other_00]「If you can order [b]25[/b] kinds of food from various bars and report back to me, I'll consider the request complete.」[k]
[name n="Magic Store Owner" f=witch_other_00]「If we reach our goal, I'll stock up on Return spellbooks and make them available here in the store. Good luck～!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*世界グルメ紀行_0

[if exp='game.eatenDishes.count < 25']
	[texton]
	[name n="Magic Store Owner" f=witch_other_00]「Eat 25 dishes at various bars and report back to me!」[k]
	[name n="Magic Store Owner" f=witch_other_00]「So, you've eaten [b][emb exp='game.eatenDishes.count'][/b] dishes so far?[r]I'd like to hear about [b][emb exp='25 - game.eatenDishes.count'][/b] more, so bon appetit!」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[name n="Magic Store Owner" f=witch_other_00]「You really ate at least 25 different kinds of food! Seriously?!」[k]
[name n="Magic Store Owner" f=witch_other_00]「You guys are kinda terrifying! Seriously, tell me all about it! How was it? Did you have a favorite?」[k]
We gave our impressions of all the food we've eaten.[k]
[name n="Magic Store Owner" f=witch_other_00]「I'm so tempted to go eat at those places! You guys were very helpful! I'm really glad I asked you guys to help me out～!」[k]
[name n="Magic Store Owner" f=witch_other_00]「Seriously, good job. I'll stock up on Return spellbooks as promised. And here's a freebie!」[k]
[textoff]

@complete name=世界グルメ紀行
@treasure item=リターンの魔法書
@eval exp='o.魔法の店うみねこ.selection = [o.ミスリルの砂, o.ミスリルの砂, o.修理の巻物, o.リターンの巻物, o.トーチの魔法書, o.リカバリーの魔法書, o.ライトストリームの魔法書, o.リターンの魔法書]'
@eval exp='o.魔法の店うみねこ.restockItems()'
@eval exp='game.closeItems.remove(o.リターンの巻物)'

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   娘を助け出してほしい
;[displayName] Rescue my Daughter

;[summary] Help my daughter Carolina, abducted to the Castle of Everlasting Darkness.
;[exp]     45000
;[gold]    28000
;[detail]  Rescue Carolina, who is imprisoned in the <b>Castle of Everlasting Darkness<k>, which is said to be located in the Dead Forest in Moise Swamp.
;------------------------------------------------------------------------------
*娘を助け出してほしい_intro

[texton]
[依頼人]「Oh, wow! You guys, you're the ones who took my request!」[k]
[依頼人]「In fact, my [b]daughter Carolina[/b] has been kidnapped by a vampire![r]I need you guys to rescue my daughter!」[k]
[依頼人]「It's already been six months since my daughter was taken from me... I wonder how she is doing now... My heart breaks when I think of her... 」[k]
[依頼人]「Please! Please rescue my daughter from the vampires! The [b]Castle of Everlasting Darkness[/b], where vampires are said to live, is located in the [b]Dead Forest[/b], southeast of Moise Swamp. My daughter must be there!」[k]
[textoff]
@addevent map=常闇の城１Ｆ num=1

[baroff]
;------------------------------------------------------------------------------
*娘を助け出してほしい_0

[texton]
[依頼人]「Please rescue my daughter, [b]Carolina[/b], from the hands of vampires![r]
She should be at the [b]Castle of Everlasting Darkness[/b] in the [b]Dead Forest[/b], southeast of Moise Swamp!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*娘を助け出してほしい_1

[texton]
[依頼人]「Thank you! My daughter is home! I can't thank you enough...」[k]
[name n=Carolina f=priest_pink_00]「Thank you, adventurers!」[k]
[依頼人]「Oh, you need the reward! Come on, take it!」[k]
[textoff]
@complete name=娘を助け出してほしい

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   王の短剣
;[displayName] King's Dagger
;[summary] I want you to get the golden dagger that is in the King's Tomb.
;[exp]     136000
;[gold]    98000
;[detail]  Enter the <b>King's Tomb<k> in the Talha Desert and obtain the golden dagger somewhere inside.
;------------------------------------------------------------------------------
*王の短剣_intro

[texton]
[依頼人]「The [b]Golden Dagger[/b] was placed in the tomb of Marcus XIV, the king who once ruled this region, as his burial accessory upon his death. The dagger, made entirely of gold, is said to have been dazzlingly beautiful.」[k]
[依頼人]「As a collector, I am in desperate need of that dagger. So I would like to ask you adventurers to obtain it. How about it? Will you take care of it?」[k]
[依頼人]「The Golden Dagger is said to still be in the [b]King's Tomb[/b] in the [b]Talha Desert[/b].」[k]
[依頼人]「Many adventurers have tried to infiltrated the King's Tomb, but none have returned. It is said it is lined with numerous formidable traps to prevent intruders. Take care of yourself.」[k]
[依頼人]「Incidentally, during his lifetime, the king collected many treasures from various places in addition to the golden dagger. Many of them are said to be stored in the tomb. I am sure finding them will be worth your while as well.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*王の短剣_0

[if exp='! game.party.hasItem(o.黄金の短剣)']
	[texton]
	[依頼人]「The [b]Golden Dagger[/b] is said to be in the [b]Tomb of the King[/b]. You must head to the [b]Talha Desert[/b] first.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Oh! There is no doubt, this is the Golden Dagger! You did well to bring it back!」[k]
[依頼人]「You have done what many adventurers have failed to do. You are the true adventurers! Here, your reward!」[k]
[textoff]
@eval exp='game.party.ejectItem(o.黄金の短剣)'
@complete name=王の短剣

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   黄金の人魚像を探してほしい
;[displayName] Golden Mermaid Statue
;[summary] I want you to obtain a golden mermaid statue.
;[exp]     102000
;[gold]    58000
;[detail]  Obtain the golden mermaid statue hidden in the cave on Misty Island.
;------------------------------------------------------------------------------
*黄金の人魚像を探してほしい_intro

[texton]
[依頼人]「Across the sea, [b]Misty Island[/b] has a cave where a famous pirate once hid many treasures.」[k]
[依頼人]「Among them, it is said, is a beautiful statue in the shape of a mermaid. However, the pirate's treasure is cleverly hidden, as many adventurers have tried but failed to find it.」[k]
[依頼人]「...I really want that mermaid statue! So I ask you guys. Can you go to the cave on Misty Island and find the golden mermaid statue?」[k]
[依頼人]「It doesn't matter how long it takes. The reward is great, so do your best, I beg you.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*黄金の人魚像を探してほしい_0

[if exp='! game.party.hasItem(o.黄金の人魚像)']
	[texton]
	[依頼人]「The golden mermaid statue is [b]hidden[/b] in a cave on [b]Misty Island, across the sea[/b].」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Oh! That's the legendary golden mermaid statue! You did well to get it!」[k]
[依頼人]「Well done. You are true adventurers.[r]This is your reward.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.黄金の人魚像)'
@complete name=黄金の人魚像を探してほしい
@addevent name=マルティナの酒場 num=6

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   銀のユニコーン像
;[displayName] Silver Unicorn Statue
;[summary] Recover a stolen silver unicorn statue.
;[exp]     236000
;[gold]    190000
;[detail]  Obtain a silver unicorn statue from somewhere in the world.
;------------------------------------------------------------------------------
*銀のユニコーン像_intro

[texton]
[依頼人]「Hey, you helped me out some time ago. I was impressed when you found the golden mermaid statue.」[k]
[依頼人]「I have another request. I had a [b]silver unicorn statue[/b] in my collection, but that beautiful piece of art was stolen by someone.」[k]
[依頼人]「It was one of the best pieces in my collection. After that, I desperately searched for it, but I found nothing.」[k]
[依頼人]「I want that statue back at all costs. I don't care how long it takes. When you find it, please bring it to me.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*銀のユニコーン像_0

[if exp='! game.party.hasItem(o.銀のユニコーン)']
	[texton]
	[依頼人]「Have you found the silver unicorn statue? It must be somewhere in the world.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Oh! This is definitely my silver unicorn statue! Thank you for finding it!」[k]
[依頼人]「You guys are amazing. I'm so lucky to have met adventurers like you. Thank you so much.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.銀のユニコーン)'
@complete name=銀のユニコーン像

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   妻の浮気調査
;[displayName] Investigation of Wife's Affair
;[summary] I want you to investigate whether my wife is cheating.
;[exp]     7400
;[gold]    9000
;[detail]  Find out if Eleanor, who works as a farmer in Grosjean's field in the northwest of Emile Plain, is having an affair and report it to the client. Investigation should be conducted over several days.
;------------------------------------------------------------------------------
*妻の浮気調査_intro

@jump storage="main11.scn" target=*barn_1

[baroff]
;------------------------------------------------------------------------------
*妻の浮気調査_0

[texton]
[name n=Grosjean f=grosjean_00]「Please find out about my wife Eleanor. My wife usually works in a field near our home. The field is located [b]just outside the south gate of this town[/b]」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*妻の浮気調査_1

@jump storage="main11.scn" target=*barn_3

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   兄に手紙を届けてくれ
;[displayName] Deliver Brother a Letter
;[summary] I want you to give a letter to my brother in the Forgotten Town.
;[exp]     12000
;[gold]    6500
;[detail]  Go to a forgotten town in the far south of the Talha Desert and deliver Carlos' letter to Muñoz, who is believed to have headed there.
;------------------------------------------------------------------------------
*兄に手紙を届けてくれ_intro

[texton]
[name n=Carlos f=boy_yellow_01]「My name is Carlos. I'm the client for this job.」[k]
[name n=Carlos f=boy_yellow_01]「What I'm asking is nothing more than a favor. I want you to give my brother Muñoz a letter from me.」[k]
[name n=Carlos f=boy_yellow_01]「A year ago, he set out for a "forgotten town" far south in the Talha Desert... A year later, my brother has not returned.」[k]
[name n=Carlos f=boy_yellow_01]「But I believe that my brother is still alive and living in this forgotten town! He just can't come home for some reason.」[k]
[name n=Carlos f=boy_yellow_01]「So I would like to entrust this letter to you adventurers. When you see my brother Muñoz, give him this letter. I'm counting on you.」[k]
[textoff]
@se f=period
@getitem item=カルロスの手紙 message="<y>Got Carlos' Letter!"

[baroff]
;------------------------------------------------------------------------------
*兄に手紙を届けてくれ_0
*兄に手紙を届けてくれ_1

[if exp='! game.party.hasItem(o.ムニョスの手紙)']
	[texton]
	[name n=Carlos f=boy_yellow_01]「Did you deliver my letter to my brother Muñoz? Muñoz must be still be alive in the [b]The Forgotten City[/b]. It's far to the south, beyond the Talha Desert.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[name n=Carlos f=boy_yellow_01]「You managed to deliver my letter to him?! Thank goodness, my brother is still alive after all!」[k]
Carlos read the letter from Muñoz with tears in his eyes.[k]
[name n=Carlos f=boy_yellow_01]「I have never been so happy. I really owe you guys a debt of gratitude for letting me know that my brother is alive. You really deserve this reward.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.ムニョスの手紙)'
@complete name=兄に手紙を届けてくれ

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   牢獄への潜入作戦
;[displayName] Operation Prison Break
;[summary] Rescue the sisters held captive in the Fura Snowfield prison.
;[exp]     35000
;[prize]   5,000G per rescue
;[detail]  Infiltrate the prison to the south of Fura Snowfield and rescue the sisters imprisoned there.
;------------------------------------------------------------------------------
*牢獄への潜入作戦_intro

[texton]
[依頼人]「Recently, an incident occurred in which a group of sisters from Aura Holy Church who were visiting this village were all abducted by someone.」[k]
[依頼人]「Upon investigation, we found that the missing sisters are being held in [b]a prison[/b] in the Fura Snowfield, south of this town.」[k]
[依頼人]「But we can't infiltrate the prison ourselves. So we need you adventurers to rescue them.」[k]
[依頼人]「...Actually, there are several parties that have accepted this request before you.」[k]
[依頼人]「However, they all went missing while heading for the prison. Perhaps they failed and were captured by the enemy?」[k]
[依頼人]「The enemy must have laid some clever trap. Please be careful when infiltrating.」[k]
[textoff]
@addevent map=牢獄Ｂ１ num=2
@addevent map=牢獄Ｂ１ num=5

[baroff]
;------------------------------------------------------------------------------
*牢獄への潜入作戦_0

[if exp='! o.牢獄Ｂ２.visited']
	[texton]
	[依頼人]「Have you been to the prison yet? Hurry up and help the sisters![r]
	The prison is somewhere in the [b]southern Fura Snowfield[/b].」[k]
	[textoff]
	[baroff]
[endif]

@eval exp='f.allPrisoners.remove("敵", true)'
@eval exp='f.allPrisoners.remove("看守", true)'
@eval exp='f.allPrisoners.remove("なし", true)'
[texton]
[if exp='f.allPrisoners.count == 0']
	[依頼人]「You did a great job! All the missing sisters are back! I've increased your reward. Take it, please!」[k]
	[textoff]
	@eval exp='o.牢獄への潜入作戦.gold = 50000'
[else]
	[依頼人]「Thank you for your efforts. It is unfortunate that all the sisters have not returned, but we will pay you as promised.」[k]
	[textoff]
	@eval exp='o.牢獄への潜入作戦.gold = (5 - f.allPrisoners.count) * 5000'
[endif]
@complete name=牢獄への潜入作戦

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   つるはしを取ってきてくれ
;[displayName] Pick up a Pickaxe
;[summary] Retrieve a pickaxe from the hut in the snowy field to the north.
;[exp]     12000
;[gold]    2500
;[detail]  Get the pickaxe from the hut in the northern Fura snowfield.
;------------------------------------------------------------------------------
*つるはしを取ってきてくれ_intro

[texton]
[依頼人]「I'm a miner, and I forgot the tool of my trade, my pickaxe, in a shack across the [b]big river[/b] north of this town. Can you go get it for me?」[k]
[依頼人]「You think I should do it myself? I would love to, but the eastern bridge over the great northern river was washed away, so I can't cross it!」[k]
[依頼人]「So I'm asking you adventurers to help me. I need you to use your wits to reach the cabin and recover my pickaxe. Please!」[k]
[依頼人]「The hut with the pickaxe is located past the north gate, on the snowy plains, [b]across the large river to the east[/b].」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*つるはしを取ってきてくれ_0

[if exp='! game.party.hasItem(o.つるはし)']
	[texton]
	[依頼人]「Go get the pickaxe quickly! It's in a hut beyond the north gate of the town, out on the snowfield, [b]across the big river in the east[/b]!」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Oh, you got it! That's what I'd expect from an adventurer! Oops, I should thank you guys!」[k]
[textoff]
@eval exp='game.party.ejectItem(o.つるはし)'
@complete name=つるはしを取ってきてくれ

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   鉱山のインプ軍団
;[displayName] Mine Imp Infestation
;[summary] Get rid of the imps infesting the northern snowfield mine.
;[exp]     95000
;[gold]    24000
;[detail]  Go to the mines in the Fura Snowfield in the north, exterminate the imps that have appeared there in large numbers, and stop more appearing.
;------------------------------------------------------------------------------
*鉱山のインプ軍団_intro

[texton]
[依頼人]「You are the adventurers who accepted our request... I am a miner from a nearby mine.」[k]
[依頼人]「And, well, a large number of imps have taken up residence in the mine... We can't even enter or they attack us.」[k]
[依頼人]「If this goes on, we miners won't be able to work at all and we'll dry up! Please! Adventurers, do something about those imps!」[k]
[依頼人]「The mine is in the snowfield north of this village. I'm begging you!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*鉱山のインプ軍団_0

[texton]
[依頼人]「Go and exterminate the large number of imps that are infesting the mine. The mine is in the snowfield north of this village.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*鉱山のインプ軍団_1

[texton]
[依頼人]「The imps are gone from the mine! Thank you! Now we can all work in peace!」[k]
[依頼人]「We owe it all to you. Please accept our thanks!」[k]
[textoff]
@complete name=鉱山のインプ軍団

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   アダマンタイト採集
;[displayName] Adamantite Collection
;[summary] Please collect 5 pieces of adamantite ore.
;[exp]     83000
;[gold]    90000
;[detail]  Collect 5 pieces of <b>Adamantite<k>, a valuable ore. Adamantite is mainly found in caves with high temperatures.
;------------------------------------------------------------------------------
*アダマンタイト採集_intro

[texton]
[依頼人 f=smith_11]「I am a blacksmith.」[k]
[依頼人 f=smith_11]「Do you know what adamantite is? It's a red-colored, incredibly hard, precious ore.」[k]
[依頼人 f=smith_11]「I want you to go and collect it. Adamantite can be found mainly in [b]caves[/b] with high temperatures.」[k]
[依頼人 f=smith_10]「I'd like you to collect about 5 pieces. Thanks!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*アダマンタイト採集_0

[if exp='game.party.countItem(o.アダマンタイト鉱石) < 5']
	[texton]
	[依頼人 f=smith_10]「Go collect about five adamantite ores. You can find it mainly in [b]caves[/b] where the temperature is high.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人 f=smith_10]「Thank you for your hard work. You did a great job collecting adamantite. Now I can make the goods my clients want.」[k]
[依頼人 f=smith_10]「As well as the reward, I'll give you a weapon I made from adamantite. Please use it.」[k]
[textoff]
@eval exp='for(var i = 0; i < 5; i++) game.party.ejectItem(o.アダマンタイト鉱石)'
@complete name=アダマンタイト採集
@treasure item=ムーンブレイド

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   サキュバスに会いたい
;[displayName] I Want to Meet a Succubus!
;[summary] I want to meet a succubus! Please can someone make that dream come true?
;[exp]     56000
;[gold]    20000
;[prize]   Ring of some sort
;[detail]  Allow the client to meet a succubus in some way.
;------------------------------------------------------------------------------
*サキュバスに会いたい_intro

[texton]
[依頼人 f=duroth_00]「I'm gonna get straight to the point! I want to meet a succubus! That's all I want!」[k]
[依頼人 f=duroth_02]「I've always dreamed of meeting them... I'll pay you if you give me the chance. Please!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*サキュバスに会いたい_0

@jump storage="main10.scn" target=*succubus_1

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   全てを見通せる鏡
;[displayName] A Mirror That Sees All
;[summary] If you find the Mirror of 1000 Miles, please give it to me
;[exp]     24000
;[gold]    50000
;[detail]  Seek the <b>Mirror of 1000 Miles<k> and deliver it to the client.
;------------------------------------------------------------------------------
*全てを見通せる鏡_intro

[texton]
[name n=Hawkwaros f=waroth_00]「Oh, it's you guys! I owe you a favor from the other day. I'm the client this time.」[k]
[name n=Hawkwaros f=waroth_00]「Are you familiar with [b]Mirror of 1000 Miles[/b]? It is a mystical mirror that can reflect any distant place.」[k]
[name n=Hawkwaros f=waroth_00]「There are certain circumstances that mean I need it, no matter what! Please, if you find [b]The Mirror of a Thousand Miles[/b], will you bring it to me?」[k]
[name n=Hawkwaros f=waroth_00]「What will I use it for? Well, that's a secret! It's for a very noble purpose that you people wouldn't understand! Anyway, that's my request!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*全てを見通せる鏡_0
*全てを見通せる鏡_1

[if exp='! game.party.hasItem(o.千里の鏡)']
	[texton]
	[name n=Hawkwaros f=waroth_00]「Did you find the [b]Mirror of 1000 Miles[/b]? If you find it, bring it to me.」[k]
	[textoff]
	[baroff]
[endif]

@eval exp='game.party.ejectItem(o.千里の鏡)'
@jump storage="main11.scn" target=*mirror_2 cond='o.全てを見通せる鏡.flag == 0'
@jump storage="main11.scn" target=*mirror_3 cond='o.全てを見通せる鏡.flag == 1'

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   鎧のテスター募集
;[displayName] Armor Tester Wanted
;[summary] Put on the new armor I've developed and try it in combat.
;[exp]     43000
;[gold]    7000
;[detail]  Have a <b>Valkyrie<k> member equip the prototype armor given by the client, try it in battle, and report the results.
;------------------------------------------------------------------------------
*鎧のテスター募集_intro

[texton]
[依頼人 f=smith_00]「I am a blacksmith. And right now, I'm trying to recreate a certain fabled armor.」[k]
[依頼人 f=smith_00]「It was a bikini style armor with godlike performance. It was said to be so beautiful that it looked as if a goddess had descended when a female warrior wore it.」[k]
[依頼人 f=smith_00]「I wanted to make that armor with my own hands, for my pride as a blacksmith! After several years of prototyping, I finally have something I think is usable!」[k]
[依頼人 f=smith_01]「...But now I'm faced with a problem. I don't know a single woman who could use this armor I've worked so hard on!」[k]
[依頼人 f=smith_00]「So, I would like to ask you guys a favor! Are there any female adventurers in your group who are [b]Valkyries[/b]? If so, I'd like them to try out this armor and report back to me with the results.」[k]
[依頼人 f=smith_00]「For now, I'll give you my prototype armor. Let a Valkyrie wear it and see how she does.」[k]
[textoff]

@se f=period
@getitem item=試作品の鎧
@addevent name=全般 num=63

[texton]
[依頼人 f=smith_00]「After you've tested the armor in combat, bring it back and give your impressions. I'm counting on you.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*鎧のテスター募集_0

[if exp='game.findItem(o.試作品の鎧, true) === void']
	[texton]
	[依頼人 f=smith_00]「Hmm? Where did the armor I gave you go? Make sure you bring it with you after you've tried it.」[k]
	[textoff]
	[baroff]
[endif]

[if exp='game.events.has(63)']
	[texton]
	[依頼人 f=smith_01]「Have you really tried it? Actually equip it and check its performance. Please.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人 f=smith_01]「Aaaah! The armor broke right away?! That's impossible...!」[k]
[依頼人 f=smith_00]「Hmmm... looks like it needs improvements. I hope you'll help me test again. Here, your reward.」[k]
[textoff]

@eval exp='game.ejectItem(o.試作品の鎧, true)'
@complete name=鎧のテスター募集
@addevent name=大洞窟バル num=1

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   鎧のテスター募集その２
;[displayName] Armor Tester Wanted 2
;[summary] Put on the new armor I've developed and try it in combat.
;[exp]     48000
;[gold]    12000
;[detail]  Have a Valkyrie equip the <b>Prototype Armor 2<k> given to you by the client, try a few battles, and report the results.
;------------------------------------------------------------------------------
*鎧のテスター募集その２_intro

[texton]
[依頼人 f=smith_00]「You guys. Thanks for your help last time.」[k]
[依頼人 f=smith_00]「As I'm sure you can guess, I want you to test the armor again. It's been strengthened considerably, so it shouldn't break immediately.」[k]
[依頼人 f=smith_00]「I would like you to try this improved armor a few times in actual combat. I expect a good report.」[k]
[textoff]

@se f=period
@eval exp='tf.result = game.storeItemSomewhere(%[itemData: o.試作品の鎧２, state: BROKEN + 1])'
@eval exp='tf.temp = "<y>Party obtained <p>Prototype Armor 2<y>!"'
@eval exp='tf.temp += "<r>We have no inventory space, so it will be sent to the <c>temporary storage facility<y> in the town warehouse."' cond='tf.result === void'
@notice text=&'tf.temp'
@addevent name=戦闘 num=6

[texton]
[依頼人]「The testing method is the same as last time. I'm counting on you.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*鎧のテスター募集その２_0

[texton]
[依頼人 f=smith_01]「Go test it a little more. At the very least, I'd like you to go into a few battles wearing it.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*鎧のテスター募集その２_1

[if exp='game.findItem(o.試作品の鎧２, true) === void']
	[texton]
	[依頼人 f=smith_01]「Hmm? Where did the armor I gave you go? Make sure you bring it with you after you've tried it.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人 f=smith_01]「Hmmm... once again the armor broke prematurely... That didn't go so well, did it?」[k]
[依頼人 f=smith_00]「It seems to need further improvement. If you can, please participate in the test again. Well, let me give you your reward for this time.」[k]
[textoff]

@eval exp='game.ejectItem(o.試作品の鎧２, true)'
@complete name=鎧のテスター募集その２
@addevent name=大洞窟バル num=2

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   鎧のテスター募集その３
;[displayName] Armor Tester Wanted 3
;[summary] Put on the new armor I've developed and try it in combat.
;[exp]     64000
;[gold]    14000
;[prize]   Armor used for testing
;[detail]  Have a Valkyrie equip the <b>Prototype Armor 3<k> given to you by the client, try a few battles, and report the results.
;------------------------------------------------------------------------------
*鎧のテスター募集その３_intro

[texton]
[依頼人 f=smith_00]「You guys... Yeah, it's that armor test again.」[k]
[依頼人 f=smith_00]「This time it's going to be okay! I've made a lot of improvements since then. It really should work without breaking this time.」[k]
[依頼人 f=smith_00]「I have spent my entire life developing this armor... so I want to complete it at all costs! This time it is definitely good! 」[k]
[依頼人 f=smith_00]「It's a little different this time. The new prototype has two pieces. Moreover, there are new resistances and additional effects.<r>I think it is a very attractive piece of armor. Please give it a try!」[k]
[textoff]

@se f=period
@getitem item=試作品の鎧３・上
@getitem item=試作品の鎧３・下
@addevent name=戦闘 num=7
@addevent name=全般 num=65
@eval exp='f.battleCountByTestingArmor = 0'

[texton]
[依頼人 f=smith_00]「The testing method is the same as before. Hopefully we'll get a better result this time around.」[k]
[textoff]


[baroff]
;------------------------------------------------------------------------------
*鎧のテスター募集その３_0

[texton]
[依頼人 f=smith_01]「Go test it a little more. At the very least, I'd like you to go into a few battles wearing it.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*鎧のテスター募集その３_1

[if exp='! game.party.hasItem(o.試作品の鎧３・上) || ! game.party.hasItem(o.試作品の鎧３・下)']
	[依頼人 f=smith_01]「Hmm? Where did the armor I gave you go? Make sure you bring it with you after you've tried it.」[k]
	[baroff]
[endif]

[texton]
[依頼人 f=smith_00]「Oh! It didn't break this time? That's great news! I'm so glad I was right after all!」[k]
[依頼人 f=smith_00]「Finally I have my ideal piece of armor...! Okay, let's mass produce this immediately! I'll call it "War Goddess Armor"! I'm sure it will be well received.」[k]
[依頼人 f=smith_00]「Thanks for all your hard work on the tests. I'm sorry for all the trouble I put you through. Here's your reward. Also, please keep the armor you used for the test.」[k]
[textoff]

[iscript]
//--------------------------------------------------------------------
// 差し替え
tf.temp = game.party.findItem(o.試作品の鎧３・上);
if(tf.temp.key == "chest") tf.temp.chara.equip.chest = o.戦女神の鎧・上;
else tf.temp.chara.bag[tf.temp.key] = o.戦女神の鎧・上;
tf.temp = game.party.findItem(o.試作品の鎧３・下);
if(tf.temp.key == "waist") tf.temp.chara.equip.waist = o.戦女神の鎧・下;
else tf.temp.chara.bag[tf.temp.key] = o.戦女神の鎧・下;

// ドロップ制限を解除
game.closeItems.remove(o.戦女神の鎧・上);
game.closeItems.remove(o.戦女神の鎧・下);
//--------------------------------------------------------------------
[endscript]

@complete name=鎧のテスター募集その３

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   奇跡の聖杯
;[displayName] Miraculous Holy Grail
;[summary] Retrieve the Holy Grail of Life from the cave in the south of the Talha Desert.
;[exp]     146000
;[gold]    98000
;[prize]   Star Card: Shield
;[detail]  Find the Holy Grail of Life, which is said to be in a cave in the southern part of the Talha Desert, and deliver it to the client.
;------------------------------------------------------------------------------
*奇跡の聖杯_intro

[texton]
[依頼人 f=shaman_03]「I am a descendant of the people who live in the Talha Desert.」[k]
[依頼人 f=shaman_03]「Our people have a unique treasure that has been treasured since ancient times, the [b]Holy Grail of Life[/b]. It is said to bring about the miracle of curing any disease.」[k]
[依頼人 f=shaman_03]「We built an altar for it in a cave in the desert, placed it there, and passed it down with great care. However, a few years ago, a major earthquake caused the ground near the altar to collapse, and the Holy Grail sank deep underground.」[k]
[依頼人 f=shaman_03]「The Holy Grail is an indispensable treasure for our people. However, the place where the altar collapsed became a huge pit, making it difficult for people to enter.」[k]
[依頼人 f=shaman_03]「So I need your help, adventurers. Can you enter the pit and retrieve the Holy Grail of Life from the altar?」[k]
[依頼人 f=shaman_03]「The pit where the altar is believed to have sunk is located in the southern part of the Talha Desert.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*奇跡の聖杯_0

[if exp='! game.party.hasItem(o.命の聖杯)']
	[texton]
	[依頼人 f=shaman_03]「Have you found the Holy Grail of Life? The altar containing the Holy Grail is in a cave in the southern part of the Talha Desert.」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人 f=shaman_03]「Oh! Our people's precious treasure is back in our hands! Our comrades will surely be delighted.」[k]
[依頼人 f=shaman_04]「Thank you so much. I can't thank you enough. Now, collect your reward.」[k]
[textoff]
@eval exp='game.party.ejectItem(o.命の聖杯)'
@complete name=奇跡の聖杯
@treasure item=スターカード・盾

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   砂漠の主を退治してほしい
;[displayName] Exterminate Lord of the Desert
;[summary] Exterminate the Lord of the Desert which inhabits the Deadly Wilderness.
;[exp]     190000
;[gold]    25000
;[prize]   Resurrection Powder
;[detail]  Exterminate a monster named the <b>Lord of the Desert<k>, which is said to inhabit the southern part of the Deadly Wilderness.
;------------------------------------------------------------------------------
*砂漠の主を退治してほしい_intro

[texton]
[依頼人]「I am the mayor of this town. Actually, I have a problem... 」[k]
[依頼人]「The Deadly Wilderness south of this town is inhabited by a creature called the [b]Lord of the Desert[/b]. It is a monster with huge tentacles that lurks in the sand!」[k]
[依頼人]「This Lord of the Desert sometimes appears near the town and attacks the townspeople who are working on their farms. He appears and disappears like a god, moving through the sand to suddenly appear and attack people. He is truly terrifying!」[k]
[依頼人]「We, the townspeople, are troubled by this terrible monster... Adventurers, please help us get rid of him. We will be more than happy to repay you.」[k]
[依頼人]「...However, the Lord of the Desert is really strong. You probably won't be able to defeat him easily. Please be careful when fighting him!」[k]
[依頼人]「The Lord of the Desert usually frequents the [b]southern part of the [b]Deadly Wilderness[/b]. Well, I look forward to a good report!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*砂漠の主を退治してほしい_0

[texton]
[依頼人]「You have to kill a monster called [b]Lord of the Desert[/b]. It is seen frequently in the [b]southern part[/b] of the [b]Deadly Wilderness[/b]!」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*砂漠の主を退治してほしい_1

[texton]
[依頼人]「Well done for exterminating the Lord of the Desert! It's amazing! I am truly in awe of your strength!」[k]
[依頼人]「This will bring peace to this town. I thank you all from the bottom of my heart. This is my thanks. Please accept it.」[k]
[textoff]
@complete name=砂漠の主を退治してほしい
@treasure item=復活の粉,復活の粉

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   金のフェアリーを探して！
;[displayName] Search for the Gold Faerie!
;[summary] I need you to pick up a golden faerie figure that I dropped in a well.
;[exp]     95000
;[gold]    18000
;[detail]  Enter the <b>well<k> in the town of Dustwell and pick up the <b>gold fairy figure<k> that has fallen in it.
;------------------------------------------------------------------------------
*金のフェアリーを探して！_intro

[texton]
[依頼人 f=fatman_00]「Hey there! I see you are the ones who accepted my request! I have a favor to ask of you!」[k]
[依頼人 f=fatman_00]「Actually, I dropped my cherished gold faerie in a well in town! It's a very precious figure that I finally got after a lot of hard work!」[k]
[依頼人 f=fatman_00]「I'd like to pick her up from the well as soon as possible, but unfortunately, I'm not very good with heights... I'm too scared to go down the well.」[k]
[依頼人 f=fatman_00]「So I'm going to ask you guys. I need you to pick up my faerie for me! I'll pay you handsomely for it!」[k]
[依頼人 f=fatman_00]「Oh, I did manage to hang a rope down the well so that you can go down to the bottom of the well. I'll leave it to you!」[k]
[textoff]
@eval exp='o.井戸.links.add("中に入る")'

[baroff]
;------------------------------------------------------------------------------
*金のフェアリーを探して！_0

[if exp='! game.party.hasItem(o.金のフェアリー)']
	[texton]
	[依頼人 f=fatman_00]「I need you to pick up the gold faerie figure that I dropped in the well here in town! If you check the well, you should be able to get inside!」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人 f=fatman_00]「Oh! I'm so glad you picked up Faerie! Thank you so much!」[k]
@eval exp='tf.temp = game.party.findItem(o.金のフェアリー)'
[if exp='tf.temp.chara.bagStat[tf.temp.key] <= BROKEN']
	[依頼人 f=fatman_00]「Ahh! Faerie's feather is broken～! Oh, no... My precious faerie... 」[k]
	[依頼人 f=fatman_00]「...Well, it was me who dropped her down the well, so I can't help it. Anyway, thanks for rescuing her. This is for you, as promised.」[k]
	[textoff]
	@complete name=金のフェアリーを探して！
[else]
	[依頼人 f=fatman_00]「Oh... Faerie... I love it! I love her innocent face, her long limbs, and her cute ass... You're the best!」[k]
	[依頼人 f=fatman_00]「And these beautiful wings! These wings are what make Faerie the best!」[k]
	[依頼人 f=fatman_00]「Thank you so much for bringing Faerie back to me. I don't know how to thank you guys enough. Oh, I've added an extra item to your reward. Please accept it.」[k]
	[textoff]
	@complete name=金のフェアリーを探して！
	@treasure item=復活の粉
[endif]
@eval exp='game.party.ejectItem(o.金のフェアリー)'

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   貞操帯の鍵を探して下さい
;[displayName] Find Chastity Belt Key
;[summary] Retrieve a chastity belt key that I dropped in Talha Desert.
;[exp]     122000
;[gold]    21000
;[prize]   Men's Secret Medicine
;[detail]  Find the key to a chastity belt, hopefully lying somewhere in the southern quicksand area of the Talha Desert, and return it to the client.
;------------------------------------------------------------------------------
*貞操帯の鍵を探して下さい_intro

[texton]
[依頼人]「Ummm... are you the one who accepted my request?」[k]
[依頼人]「This is a very embarrassing story, but I actually make my wife wear a chastity belt all the time to prevent her from cheating on me.」[k]
[依頼人]「However, I ended up losing the key to the chastity belt! I was walking through the northern desert and dropped it in the sand...」[k]
[依頼人]「I lost the key in the middle of the night, so I went back the next morning after it was light out to look for it. However, the key was no longer there. It must have been washed away by the desert's shifting sands.」[k]
[依頼人]「Please! Could you please find the key to the chastity belt? If this continues, I will never be able to have sex with my wife!」[k]
[依頼人]「The key was dropped in the quicksand area in the southern part of the Talha Desert, which is north of town. Thank you in advance.」[k]
[textoff]

[baroff]
;------------------------------------------------------------------------------
*貞操帯の鍵を探して下さい_0

[if exp='! game.party.hasItem(o.貞操帯の鍵)']
	[texton]
	[依頼人]「Please retrieve the key to the chastity belt that was lost in the desert.[r]
	It should be somewhere in the [b]quicksand area in the southern part of the Talha Desert[/b]」[k]
	[textoff]
	[baroff]
[endif]

[texton]
[依頼人]「Wow! That's definitely the key to my wife's chastity belt! Now I can take it off again! Thank you so much for this.
 
 」[k]
[依頼人]「...I've learned my lesson and will never make my wife wear a chastity belt again. This is my thanks.」[k]
[textoff]
@complete name=貞操帯の鍵を探して下さい
@treasure item=鋼鉄の貞操帯,男の秘薬,精力剤,精力剤
@eval exp='game.party.ejectItem(o.貞操帯の鍵)'

[baroff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   パンツコレクション
;[displayName] Collecting Panties
;[summary] I want you to take off all 10 types of underwear on the spot and give it to me.
;[exp]     349000
;[gold]    0
;[prize]   Monster Encyclopedia
;[detail]  Go to Swaros' shop, and have party members take 10 types of panties off right there and give them to Swaros.
;------------------------------------------------------------------------------
*パンツコレクション_intro

@eval exp='game.curChara = game.getMembersWearingPanties([], true)[0]'
@eval exp='f.pantiesCollections = []'

@wait time=500
[texton]
[name n=Swaros f=waroth_01]「Hmmm! This is...!」[k]
I noticed the shopkeeper staring at [emb exp='game.curChara.displayName']'s exposed underwear.[k]
[name n=Swaros f=waroth_01]「Oops, excuse me. I was captivated by the beautiful appearance of that lady...」[k]
[name n=Swaros f=waroth_01]「Actually, I love women's underwear. I especially love underwear that has just been taken off.」[k]
[name n=Swaros f=waroth_01]「...」[k]
[name n=Swaros f=waroth_01]「...Umm ...If you don't mind, could you, the girl over there, take off your panties right here and give them to me?」[k]
[キャラ f=29]「...! (Kyaaa!)」[k]
[キャラ]'s face goes bright red. Of course, there's no way she could do something so embarrassing.[k]
[name n=Swaros f=waroth_01]「Is there no way you could...? I don't mind if you cover up with a skirt or something first. Is that still no good?」[k]
[name n=Swaros f=waroth_01]「You see, my hobby is collecting women's underwear. I often ask girls who come to the store to take off their panties right in front of me and give it to me.」[k]
[name n=Swaros f=waroth_01]「I would like to collect about [b]10[/b] more pairs of panties. If you give me all of those freshly removed panties, you can have a copy of my secret collection. How does that sound?」[k]
[name n=Swaros f=waroth_01]「It doesn't have to be right away. But keep it in mind. I'll be waiting.」[k]
[textoff]
@se f=period
@notice text="<y>Received the quest <p>Collecting Panties<y>!" wait=500
@eval exp='o.パンツコレクション.accepted = true'

[shopoff]
;------------------------------------------------------------------------------
*パンツコレクション_0

@wait time=500
[texton]
[name n=Swaros f=waroth_01]「Are you going to give me some freshly removed panties?」[k]
[textoff]

@command title="Who will give me her panties?" cancel=true
@eval exp='tf.arr = game.getMembersWearingPanties(f.pantiesCollections)'
@eval exp='tf.i = 0'
*_collect_panties_loop
@jump target=*_end_collect_panties_loop cond='tf.i == tf.arr.count'
@select text=&'tf.arr[tf.i].displayName' exp=&'"tf.result = " + tf.i'
@eval exp='tf.i ++'
@jump target=*_collect_panties_loop
*_end_collect_panties_loop
@select text="Don't hand over" exp='tf.result = -1'
[ask]

[texton]
[if exp='tf.result == -1']
	[name n=Swaros f=waroth_01]「Well, that's fine. I'll wait patiently.」[k]
	@jump target=*_collected_panties
[endif]

@eval exp='game.curChara = tf.arr[tf.result]'
@eval exp='game.curChara.switchFaceState("blush")'
@eval exp='tf.temp = game.curChara.equip.hip'
@eval exp='f.pantiesCollections.add(tf.temp.name)'
@eval exp='game.curChara.removeEquipment(tf.temp, "hip", true)'
[キャラ f=29]「...」[k]
[キャラ] begins to take off her panties in front of the store owner.[k]
[if exp='game.curChara.isHipNaked()']
	[name n=Swaros f=waroth_01]「Hmmm?! Is it okay to expose your ass in front of everyone? How bold... it's making my heart pound.」[k]
[endif]
[name n=Swaros f=waroth_01]「Wow! [b][emb exp='tf.temp.displayName'][/b]...! Still nice and warm. Thank you, thank you.」[k]
[if exp='f.pantiesCollections.count < 10']
	[name n=Swaros f=waroth_01]「Thank you. I'll be looking forward to further deliveries.」[k]
	@jump target=*_collected_panties
[endif]

[name n=Swaros f=waroth_01]「Now I have all the pairs of panties I wanted. I'm truly indebted to you. As promised, I'll give you one of my treasured books.」[k]
[textoff]
@complete name=パンツコレクション
@getitem item=モンスター図鑑
@delevent name=スワロスの店 num=4
@eval exp='f.pantiesCollections = void'

[shopoff]
;------------------------------------------------------------------------------
*_collected_panties

[iscript]
tf.arr = [];
for (var i = 0; i < f.pantiesCollections.count; i++) {
	tf.arr.add(o[f.pantiesCollections[i]].displayName);
}
[endscript]
[texton]
[name n=Swaros f=waroth_01]「By the way, the types of panties I've collected so far is [b][emb exp='f.pantiesCollections.count'][/b], and the number of panties I want to collect is [b][emb exp='10 - f.pantiesCollections.count'][/b].」[k]
[if exp='f.pantiesCollections.count > 0']
	[name n=Swaros f=waroth_01]「And this is my current collection:」[r]
	[b][nw][emb exp='tf.arr.join(", ")'][/b][/nw][k]
[endif]
[textoff]

[shopoff]
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;[title]   仲間を助け出してほしい
;[displayName] Please Rescue Our Friends
;[summary] Please rescue our friends who have been captured by Wild Bull.
;[exp]     228000
;[gold]    100000
;[prize]   Holy Breastplate
;[detail]  The five members of Team Amazoness who were enslaved by Wild Bull must be recruited by winning duels: <r><b>Acolyte, Sniper, Champion, Spellblade, and Magus<k>. 
;------------------------------------------------------------------------------
*仲間を助け出してほしい_intro

@jump target=*仲間を助け出してほしい_1 cond='o.仲間を助け出してほしい.completed'
@jump target=*仲間を助け出してほしい_0 cond='o.仲間を助け出してほしい.accepted'

[texton]
[if exp='f.requestedRescuingAmazones']
	[name n=Amazoness f=bladesman_black_01]「What do you think? Were you inspired to help us out?
	 」[k]
[else]
	@eval exp='f.requestedRescuingAmazones = true'
	[name n=Amazoness f=bladesman_black_00]「You guys are strong... so, I have a big request.
	 」[k]
	[name n=Amazoness f=bladesman_black_01]「Several of our members are being held captive by Wild Bull. We lost a few duels, you see.
	 」[k]
	[name n=Amazoness f=bladesman_black_00]「We hear Wild Bull treat girls like slaves and make them perform sexual services and engage in prostitution..
	 」[k]
	[name n=Amazoness f=bladesman_black_00]「We can't leave our people there! But Wild Bull are strong, so every time we challenge them, we lose more people...
	 」[k]
	[name n=Amazoness f=bladesman_black_01]「Please! Will you please fight Wild Bull and rescue all the girls? Of course we will thank you!
	 」[k]
[endif]
[textoff]

@question title="Do you accept?"
[if exp='! tf.result']
	[texton]
	[name n=Amazoness f=bladesman_black_00]「I see... I will be here, so if you change your mind, please call on me again.
	 」[k]
	[textoff]
	[eventoff]
[endif]

@se f=period
[texton]
[name n=Amazoness f=bladesman_black_06]「Would you be willing to take on the quest? Thank you very much!」[k]
[name n=Amazoness f=bladesman_black_01]「Our five members who need rescuing are:[r][b][nw]
[emb exp='o.アコライト.displayName'], [emb exp='o.スナイパー.displayName'], [emb exp='o.スナイパー.displayName'], [emb exp='o.チャンピオン.displayName'], [emb exp='o.メイガス.displayName'][/b]
 」[k]
[name n=Amazoness f=bladesman_black_01]「If you rescue all five of us, I will give you [b]100,000G and armor[/b]. Please help us out!」[k]
[textoff]
@eval exp='o.仲間を助け出してほしい.accepted = true'

[eventoff]
;------------------------------------------------------------------------------
*仲間を助け出してほしい_0

@eval exp='tf.num = 0'
@eval exp='tf.num ++' cond='o.アコライト.contracted'
@eval exp='tf.num ++' cond='o.スナイパー.contracted'
@eval exp='tf.num ++' cond='o.チャンピオン.contracted'
@eval exp='tf.num ++' cond='o.ソードダンサー.contracted'
@eval exp='tf.num ++' cond='o.メイガス.contracted'
[if exp='tf.num < 5']
	[texton]
	[name n=Amazoness f=bladesman_black_01]「Currently, our members rescued from Wild Bull are [r][b][nw]
	[if exp='o.アコライト.contracted'][emb exp='o.アコライト.displayName'] [endif]
	[if exp='o.スナイパー.contracted'][emb exp='o.スナイパー.displayName'] [endif]
	[if exp='o.チャンピオン.contracted'][emb exp='o.チャンピオン.displayName'] [endif]
	[if exp='o.ソードダンサー.contracted'][emb exp='o.ソードダンサー.displayName'] [endif]
	[if exp='o.メイガス.contracted'][emb exp='o.メイガス.displayName'][endif]
	[/b][/nw][r]So [emb exp='tf.num'] in total.」[k]
	[name n=Amazoness f=bladesman_black_01]「Thank you for your rescue efforts so far, and please help the other [emb exp='5 - tf.num']!
	 」[k]
	[textoff]
	[eventoff]
[endif]

[texton]
[name n=Amazoness f=bladesman_black_06]「All our members have returned! I couldn't be happier to see my friends again! How can I thank you all?!
 
 」[k]
[name n=Amazoness f=bladesman_black_06]「I'm not sure how I can ever thank you enough, but here's the reward for a start.
 」[k]
[textoff]

@complete name=仲間を助け出してほしい
@treasure item=聖なる胸当て

[texton]
[name n=Amazoness f=bladesman_black_06]「Oh, and please feel free to take us along on your adventures! The members you rescued can be called on from the Waiting Room in Sapphire City.
 」[k]
[textoff]
@addevent map=アマゾネスの砦１Ｆ num=6

[eventoff]
;------------------------------------------------------------------------------
*仲間を助け出してほしい_1

[texton]
[name n=Amazoness f=bladesman_black_06]「Thank you so much for helping our friends.」[k]
[name n=Amazoness f=bladesman_black_06]「Please make use of these reliable companions in your adventures.」[k]
[textoff]

[eventoff]
;------------------------------------------------------------------------------
