; キャラたちのさまざまな発言集
; ラベルは  *(識別名)_(名前)


; 食事
;========================================================================================
*dinner_リム
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[if exp='game.isFreeMode']
		[キャラ f=03]「It's very delicious!」[k]
	[elsif exp='game.curChara == game.wife']
		[キャラ f=03]「Thank you very much. It's very good, dear.」[k]
	[else]
		[キャラ f=03]「Thank you! Very tasty!」[k]
	[endif]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[キャラ f=14]「Let's see... I'll take it...」[k]
[else]
	[if exp='game.isFreeMode']
		[キャラ f=01]「Well, let's eat.」[k]
	[elsif exp='game.curChara == game.wife']
		[キャラ f=01]「Bon appetit, dear.」[k]
	[else]
		[キャラ f=01]「Thanks for the food, Captain!」[k]
	[endif]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*dinner_クレア
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[if exp='game.isFreeMode']
		[キャラ f=16]「Ah, it's delicious!」[k]
	[else]
		[キャラ f=16]「It's delicious. Good choice.」[k]
	[endif]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[キャラ f=08]「Didn't I say before that I didn't like this?」[k]
[else]
	[if exp='game.isFreeMode']
		[キャラ f=02]「Oh, that looks delicious. I'll have some then.」[k]
	[elsif exp='game.curChara == game.wife']
		[キャラ f=02]「Oh, you're gonna feed me? You're so thoughtful, you know that?」[k]
	[else]
		[キャラ f=02]「Oh, you're buying? Thanks.」[k]
	[endif]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*dinner_フレデリカ
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[if exp='game.isFreeMode']
		[キャラ f=04]「It's so delicious!」[k]
	[else]
		[キャラ f=04]「Thank you so much. It's very delicious～!」[k]
	[endif]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[if exp='game.isFreeMode']
		[キャラ f=13]「Yes... I'll take it...」[k]
	[else]
		[キャラ f=13]「Yes... Thank you for the food...」[k]
	[endif]
[else]
	[if exp='game.isFreeMode']
		[キャラ f=01]「Thank you for the meal～」[k]
	[elsif exp='game.curChara == game.wife']
		[キャラ f=01]「I'll take it. How about you?」[k]
	[else]
		[キャラ f=01]「Thanks for the food～. Would you like to eat too, captain?」[k]
	[endif]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*dinner_ミューズ
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[キャラ f=22]「It is very delicious... I'm happy...」[k]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[if exp='game.isFreeMode']
		[キャラ f=10]「I don't have much of an appetite...」[k]
	[elsif exp='game.curChara == game.wife']
		[キャラ f=10]「I'm sorry... I don't have much of an appetite right now...」[k]
	[else]
		[キャラ f=10]「Sorry... I don't have much of an appetite...」[k]
	[endif]
[else]
	[if exp='game.isFreeMode || game.curChara == game.wife']
		[キャラ f=05]「You have some first...」[k]
	[else]
		[キャラ f=05]「Sorry... Thank you for the food...」[k]
	[endif]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*dinner_マルエット
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[if exp='game.isFreeMode']
		[キャラ f=01]「This is delicious!」[k]
	[elsif exp='game.curChara == game.wife']
		[キャラ f=01]「This is delicious! Why don't you try some?」[k]
	[else]
		[キャラ f=01]「This is delicious! Do you want some, captain?」[k]
	[endif]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[キャラ f=96]「I don't really like this. It would be a waste not to eat it though!」[k]
[else]
	[if exp='game.isFreeMode']
		[キャラ f=02]「I'll have some. Ah, I'm hungry.」[k]
	[elsif exp='game.curChara == game.wife']
		[キャラ f=02]「Can I eat it? I'm sorry, honey.」[k]
	[else]
		[キャラ f=02]「You're treating me? Thanks, Captain.」[k]
	[endif]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*dinner_リーゼル
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[if exp='game.isFreeMode']
		[キャラ]「Ah, this is delicious...!」[k]
	[else]
		[キャラ]「Oh, this is delicious... Thank you, Captain.」[k]
	[endif]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[キャラ]「I don't really like this kind of thing...」[k]
[else]
	[if exp='game.isFreeMode']
		[キャラ]「Let's eat.」[k]
	[else]
		[キャラ]「Thanks for treating me, Captain.」[k]
	[endif]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*dinner_マックス
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[キャラ f=03]「Woo hoo! This is my favorite!」[k]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[キャラ f=09]「Hmmm... I don't really like this one.」[k]
[else]
	[if exp='game.isFreeMode']
		[キャラ]「Oh, that looks delicious. I'll have some.」[k]
	[else]
		[キャラ f=01]「Oh, sorry.」[k]
	[endif]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*dinner_テオ
[texton]
[if exp='game.curChara.model.favoriteFood == game.curItem.detail']
	[キャラ f=01]「Oh, this is delicious.」[k]
[elsif exp='game.curChara.model.dislikedFood == game.curItem.detail']
	[キャラ f=14]「Hmm, not so good...」[k]
[else]
	[キャラ f=02]「Sorry, I'll take it first.」[k]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_リム
[texton]
[if exp='game.isFreeMode']
	[キャラ f=13]「I'm so full...」[k]
[elsif exp='game.curChara == game.wife']
	[キャラ f=13]「I'm sorry, I'm just so full...」[k]
[else]
	[キャラ f=13]「Sorry, I'm full...」[k]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_クレア
[texton]
[キャラ f=19]「Phew, I can't eat anymore.」[k]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_フレデリカ
[texton]
[キャラ f=17]「I'm so full～!」[k]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_ミューズ
[texton]
[キャラ f=09]「Can't eat any more...」[k]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_マルエット
[texton]
[if exp='game.isFreeMode']
	[キャラ f=07]「I'm full already!」[k]
[else]
	[キャラ f=07]「I'm full! Are you still going to feed me?」[k]
[endif]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_リーゼル
[texton]
[キャラ f=10]「I can't eat anymore...」[k]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_マックス
[texton]
[キャラ f=09]「I can't eat anymore～! Give me a break!」[k]
[textoff]
[baroff]
;----------------------------------------------------------------------------------------
*fullness_テオ
[texton]
[キャラ f=05]「Phew, I'm really full now.」[k]
[textoff]
[baroff]
;========================================================================================


; 酒場の会話
;========================================================================================
*people_ベトリヌスの酒場

[texton]
[if exp='game.curBar.curTalk == 1']
	[客]「You can get anywhere from this town rather quickly, but remember to be cautious while you're at a low level.」[k]
	[客]「The area around the town is relatively safe, but there is no guarantee that only weak enemies will appear. Enemies of unexpected strength can be found in nearby dungeons.」[k]
	[客]「If you accidentally step into such a place, your first priority should be to get out of there!」[k]
[elsif exp='game.curBar.curTalk == 2']
	[客]「If you want to learn magic, go to a magic shop and buy a spellbook!」[k]
[elsif exp='game.curBar.curTalk == 3']
	[客]「I've seen some shady looking guys going in and out of the sewers. I wonder what they're doing?」[k]
[elsif exp='game.curBar.curTalk == 4']
	[客]「When out on the road, you may suddenly be challenged to a duel by a rival party.」[k]
	[客]「You can pay to avoid it, but the important thing is to always be prepared for any encounter!」[k]
[elsif exp='game.curBar.curTalk == 5']
	[客]「This world is a mixture of areas where enemies are strong and areas where they are weak. Just because the enemy in the area you are in is weak doesn't mean the area next to you is safe.」[k]
	[客]「If you feel that the enemies are too strong, it means that you are not ready to explore that area yet. It is okay to explore another area first and try again when you are stronger.」[k]
	[客]「Which area or dungeon you go to is up to you. There are no directions. You must decide how to proceed by yourself.」[k]
[elsif exp='game.curBar.curTalk == 6']
	[客]「Wild Bull is a notorious group of villainous adventurers.」[k]
	[客]「Their deeds are extremely vicious, including extortion and kidnapping women for prostitution. However, since they are all very strong, particularly Alex, the head of the group, even the guards have difficulty dealing with them.」[k]
	[客]「Their hideout is in the northwest of Landon Canyon. The road is hidden, so you can't find them easily. Look carefully around the area where they appear.」[k]
[elsif exp='game.curBar.curTalk == 7']
	[客]「Don't give up, even in parties where you can't use magic. Instead, use an item with magic.」[k]
	[客]「Where are those items? Find out yourself.」[k]
[elsif exp='game.curBar.curTalk == 8']
	[客]「There are times when I go to the trouble of getting an item, but it's unappraised. That's a problem, isn't it? I can't equip it or anything.」[k]
	[客]「So I like to have one member in the party who is good at appraising, like a Bishop or an Alchemist. You can get an appraisal at a store, but it's expensive.」[k]
[elsif exp='game.curBar.curTalk == 9']
	[客]「Members who have just joined the party still have a low level of trust in the party, and it's hard to get to know them.」[k]
	[客]「If you want to increase your trust level, you have to fight together. By fighting together and winning together, you will win trust.」[k]
[elsif exp='game.curBar.curTalk == 10']
	[客]「Bombs are very useful items that can break cracked floors and walls, but that's not all. They also have unexpected uses.」[k]
[elsif exp='game.curBar.curTalk == 11']
	[客]「I know a bit about the underworld. A famous slave trader frequents this town.」[k]
	[客]「Apparently he has some connections to a certain Count in this town, but no one has ever seen a slave trader going into the Count's mansion.」[k]
	[客]「I suspect there might be a secret entrance somewhere, but I wonder where?」[k]
[elsif exp='game.curBar.curTalk == 12']
	[客]「The Jump spell lets you move two spaces ahead. It's not just for jumping over holes.
	 」[k]
[elsif exp='game.curBar.curTalk == 13']
	[客]「It seems that regular products in the store are[r]restocked once a week. Even if something sells out, it will be back after a while.」[k]
[elsif exp='game.curBar.curTalk == 14']
	[客]「They say ordinary weapons don't work on spiritual enemies. The only way to attack them is with magic or with a magic weapon.
	 」[k]
[elsif exp='game.curBar.curTalk == 15']
	[客]「Donate at church, and someday something good will come of it... perhaps.」[k]
[elsif exp='game.curBar.curTalk == 16']
	[客]「There seems to be a job whose business is assassination. All I know is that its requirements are strict.」[k]
[elsif exp='game.curBar.curTalk == 17']
	[客]「I want to go to Northrop Village, but I can't go through the cave on the way because the ground near the water sunk.」[k]
	[客]「I guess if I had a Magic Floating Bridge it would be possible to pass it.」[k]
[elsif exp='game.curBar.curTalk == 18']
	[客]「If equipment is damaged by enemy attacks during a battle, it can't be destroyed in the same battle!」[k]
	[客]「So, if you make sure to repair your broken equipment frequently after battle, you can avoid losing valuable weapons and armor.」[k]
[elsif exp='game.curBar.curTalk == 19']
	[客]「Elves don't like to squeeze lemon on fried chicken. When I ate a meal with an elf the other day, they got angry when I did.」[k]
[elsif exp='game.curBar.curTalk == 20']
	[客]「The Dale Coin Forest, which stretches to the northwest of the town, is also known as the "Forest of the Lost". Many people have entered the forest and disappeared, so rumors say.」[k]
[elsif exp='game.curBar.curTalk == 21']
	[客]「It's rumored that the Item Warehouse has an entrance to the sewers. But where could it be?」[k]
	[客]「I feel like that brown slime janitor is hiding something... he's kind of suspicious.」[k]
	@eval exp='game.curBar.curTalk = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*mind_ベトリヌスの酒場

[texton]
[if exp='game.curBar.curMind == 1']
	[客][b]（I went west of the sign and found a kobold fortress. It was hidden by trees.）[k]
[elsif exp='game.curBar.curMind == 2']
	[客][b]（If you jump far off the sharp cliffs of Harpy Mountain, you'll be able to go to places you've never been before.）[k]
[elsif exp='game.curBar.curMind == 3']
	[客][b]（The Wild Bull guys always carry around tons of bombs. If you need one, it's probably quicker to steal it from them.）[k]
	@eval exp='game.curBar.curMind = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*people_マルティナの酒場

[texton]
[if exp='game.curBar.curTalk == 1']
	[客]「Quests must be reported at the Tavern once completed.」[k]
	[客]「How? From the quest list just click it again.」[k]
	[客]「If that does nothing, the requirements probably haven't been met.」[k]
[elsif exp='game.curBar.curTalk == 2']
	[客]「Daggers can be dual wielded. If you get another, give it a try.」[k]
[elsif exp='game.curBar.curTalk == 3']
	[客]「Disarming a correctly identified chest trap may fail if the thief isn't skilled enough. You might have to give up and walk away if you're not confident.」[k]
	@eval exp='game.curBar.curTalk = 0' cond='! o.遺跡の財宝.completed && ! game.isFreeMode'
[elsif exp='game.curBar.curTalk == 4']
	[客]「Have you ever heard of a Magic Floating Bridge? It is said it lets you cross one tile even if it is in the air.」[k]
	[if exp='! game.party.hasItem(o.魔法の浮き橋)']
		[客]「On the way here, you know that shed on the road in Collins Wood? I think there was one left there.」[k]
	[endif]
[elsif exp='game.curBar.curTalk == 5']
	[客]「You can avoid crumbling ground and pitfalls by going into a floating state.」[k]
[elsif exp='game.curBar.curTalk == 6']
	[客]「Have you ever heard of the Great Cave? It's a natural cave along the coast.」[k]
	[客]「I heard that it's a huge cavity inside, and it's incredibly spacious!」[k]
[elsif exp='game.curBar.curTalk == 7']
	[客]「Apparently the captivity period for a member captured in a duel varies depending on the party.」[k]
	[客]「Normally it's [emb exp='o.スライム軍団.slaveTerm'] days, but if a party steals too many members from other parties or behaves particularly badly, the Duel God may decide to shorten it.」[k]
	[客]「The infamous Wild Bull group behaved so badly that it's only [emb exp='o.ワイルド・ブル.slaveTerm'] days! Hahaha!」[k]
[elsif exp='game.curBar.curTalk == 8']
	[客]「There's a vast desert to the east of the southern coast. There's a huge ruin there called the King's Tomb!
	 」[k]
[elsif exp='game.curBar.curTalk == 9']
	[客]「Have you been to the Great Cave yet? They say there is an underground town there!」[k]
[elsif exp='game.curBar.curTalk == 10']
	[客]「There's a beach just past the plains south of this town.」[k]
[elsif exp='game.curBar.curTalk == 11']
	[客]「The King's Tomb in the Talha Desert is dedicated to the High King Marcus XIV, who once ruled this area.」[k]
	[客]「He was a very powerful king, and I heard that many grave goods were placed in his tomb, including a water bracelet.」[k]
[elsif exp='game.curBar.curTalk == 12']
	[客]「The Magic Floating Bridge can be used in various ways. If you combine it with some magic, you can even cross a gap of two tiles!」[k]
[elsif exp='game.curBar.curTalk == 13']
	[客]「The caverns are so large that barbarians and intelligent monsters often build dwellings in them.」[k]
	[客]「Well, there are rumors that whole towns even exist!」[k]
[elsif exp='game.curBar.curTalk == 14']
	[客]「Don't go into the King's Tomb! Rumor has it there are tons of undead inside!」[k]
[elsif exp='game.curBar.curTalk == 15']
	[客]「Apparently there is an area in the southern seas where a terrifying giant monster appears.」[k]
[elsif exp='game.curBar.curTalk == 16']
	[客]「In the Great Cave, a tribe of barbarians have established a settlement and are living there.」[k]
	[客]「They are a very strong and violent species. They are also known for their voracious sexual appetite.」[k]
[elsif exp='game.curBar.curTalk == 17']
	[客]「I went to the King's Tomb, but the bridge near the entrance collapsed and I couldn't go any further.」[k]
	[客]「I guess you need magic or something to get across.」[k]
[elsif exp='game.curBar.curTalk == 18']
	[客]「The ruins on the outskirts of town were built by desert people who migrated from the desert long ago.」[k]
	[客]「However, due to the oppression of the king who once ruled this land, the people of the desert were scattered all over the place, and only the buildings were left behind. Now,they're inhabited by monsters.」[k]
	[客]「It is rumored that treasures belonging to the desert people still lie deep underground within the ruins.」[k]
[elsif exp='game.curBar.curTalk == 19']
	[客]「It is said that long ago, a ship carrying a lot of treasure was sunk by a huge monster that lived in the southern sea.」[k]
[elsif exp='game.curBar.curTalk == 20']
	[客]「I've heard that barbarian tribes sometimes come above ground, kidnap young girls in towns and villages, and take them away to underground settlements!」[k]
	[客]「Why would they do that? To make them their wives! They take them by force and marry them!」[k]
	[客]「If you go to the barbarian villages, you may find that the girls who were taken away are still living with them.」[k]
[elsif exp='game.curBar.curTalk == 21']
	[客]「Have you been to the Labyrinth of Trials yet? I heard it's in the eastern part of Collins Wood!」[k]
	[客]「It seems that a famous mage created this dungeon to test adventurers long ago, and no one has ever conquered it because it's too difficult! Amazing!」[k]
	@eval exp='game.curBar.curTalk = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*mind_マルティナの酒場

[texton]
[if exp='game.curBar.curMind == 1']
	[客][b]（I remember there was once an adventurer who went below B4 of the King's Tomb and never came back...）[k]
[elsif exp='game.curBar.curMind == 2']
	[客][b]（I remember the true entrance to the King's Tomb was on the first basement floor... You'd have to walk carefully around to notice it, that one.）[k]
[elsif exp='game.curBar.curMind == 3']
	[客][b]（Usually, when there are two numbers, they indicate coordinates on a map. It's common knowledge for veteran adventurers like me!）[k]
	@eval exp='game.curBar.curMind = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*people_かもめ亭

[texton]
[if exp='game.curBar.curTalk == 1']
	[客]「Have you been to the Water Palace yet?」[k]
	[客]「Well, of course not, since there's no way to reach the entrance! Hahahaha.」[k]
[elsif exp='game.curBar.curTalk == 2']
	[客]「The Water Palace is a sanctuary for those who dwell in the water. Apparently only those who have the blessing of water can see the way to get there.
	 」[k]
[elsif exp='game.curBar.curTalk == 3']
	[客]「Mermaids and water spirits have the blessing of water. It's a special power that only those who dwell in the water possess.」[k]
	[客]「However, I've heard that even ordinary people can get the blessing of water if they have an item called a Water Bracelet!」[k]
[elsif exp='game.curBar.curTalk == 4']
	[客]「If you go north through the eastern swamp, there's an orchard owned by the landowner of this village.」[k]
	[客]「Between you and me, we pick and eat the fruit in the orchard. You can do it in secret and they won't know!」[k]
[elsif exp='game.curBar.curTalk == 5']
	[客]「The broiled moray eel that we serve here, I dive into the sea to catch! Enjoy it!」[k]
	[客]「You think it's amazing that I can dive and fish in the ocean? No, no, there's no big secret. I have two pieces of shell equipment!」[k]
	[客]「As long as you have shell equipment, diving in the sea is a piece of cake!」[k]
[elsif exp='game.curBar.curTalk == 6']
	[客]「I hear the Purple Witch's Lair is somewhere in Collins Wood.」[k]
	[客]「However, the entrance is hidden, and it is said that you can't find it even if you walk around normally. After all, it is a hideout!」[k]
[elsif exp='game.curBar.curTalk == 7']
	[客]「Have you ever heard of shell equipment? They're magical pieces of equipment that allow you to breathe underwater.」[k]
	[客]「They say if you wear two pieces of shell equipment, you'll be able to dive underwater. Amazing!」[k]
[elsif exp='game.curBar.curTalk == 8']
	[客]「There is a man in this village who runs an orchard in the swamp, and he was having a hard time because people were picking the fruit without permission.」[k]
	[客]「He wants to go out there and look around, but it seems there are some vicious bees that have recently settled in that area, so it's too dangerous.」[k]
[elsif exp='game.curBar.curTalk == 9']
	[客]「Apparently even if you wear shell equipment, you can't go underwater where the bottom is too deep.」[k]
[elsif exp='game.curBar.curTalk == 10']
	[客]「Somewhere in Collins Wood, there is a dungeon called the Witch's Lair.」[k]
	[客]「It is said that a once-famous great mage called the Purple Witch lives hidden away in that place, far from the public eye.」[k]
	[客]「I heard that the dungeon is filled with a lot of puzzles to keep people away!」[k]
[elsif exp='game.curBar.curTalk == 11']
	[客]「The bees in the orchard are very violent and really can kill you, so be careful.」[k]
[elsif exp='game.curBar.curTalk == 12']
	[客]「Southeast of the swamp is a place known as the Dead Forest.」[k]
	[客]「...Rumor has it that many ghosts fly around the trees. It's so scary, no one wants to go near.」[k]
[elsif exp='game.curBar.curTalk == 13']
	[客]「The bees that inhabit the orchard are pretty strong. They're clearly a step above the other monsters around here.」[k]
[elsif exp='game.curBar.curTalk == 14']
	[客]「Anyone can dive underwater if they wear shell gear, but the fact that you need two pieces is a pain!」[k]
	[客]「Actually, my girlfriend has some. She sometimes wears a shell bra and panties to go diving. It's pretty sexy. It's my secret pleasure ♪」[k]
	[客]「But I only have one shell necklace, so I can't dive with it. Men can't wear women's bras and panties, so I can't borrow hers. It's boring to just watch my girlfriend dive.」[k]
[elsif exp='game.curBar.curTalk == 15']
	[客]「In the Dead Forest, one eerie castle, known as the Castle of Eternal Darkness, stands tall.」[k]
	[客]「According to a guy who went there, the castle was crawling with undead and no one lived there.」[k]
[elsif exp='game.curBar.curTalk == 16']
	[客]「Oh～! I dropped my golden axe in the eastern swamp～!」[k]
	[客]「It's true! It's a golden, very expensive axe! I'm not lying!」[k]
[elsif exp='game.curBar.curTalk == 17']
	[客]「It is said that at the end of the Dead Forest, there is a large swamp called the Swamp of the Dead.」[k]
	[客]「According to legend, that swamp is connected to the afterlife and the dead wander out. That's scary.」[k]
[elsif exp='game.curBar.curTalk == 18']
	[客]「Rumor has it that no one lives in the Castle of Eternal Darkness, but there's also a story that one lord lives there.」[k]
	[客]「Another rumor has it that the owner of the castle has one of those magic stones!」[k]
[elsif exp='game.curBar.curTalk == 19']
	[客]「It is said that the Swamp of the Dead is a world between worlds, and those who wander into it can never return.」[k]
[elsif exp='game.curBar.curTalk == 20']
	[客]「I met the Purple Witch when I was young!」[k]
	[客]「She had such stunning magic and beauty that I was already crazy about her. Fifty years have passed since then, so I don't know what she's like now.」[k]
	[客]「Come to think of it, she had a very beautiful gemstone, the Amethyst Magic Stone.」[k]
[elsif exp='game.curBar.curTalk == 21']
	[客]「Collecting all the magic stones? That's impossible!」[k]
	[客]「Why? Because the adventurer who was carrying the Ruby Magic Stone disappeared deep into the Swamp of the Dead with it!」[k]
	[客]「Once in the Swamp of the Dead, neither the Ruby Magic Stone nor its owner will ever return to this world! So the 12 magic stones will never come together!」[k]
	@eval exp='game.curBar.curTalk = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*mind_かもめ亭

[texton]
[if exp='game.curBar.curMind == 1']
	[客][b]（Someone said that the Water Bracelet was hidden in the King's Tomb in Talha Desert...）[k]
	[客][b]（I'd like to enter the water palace so maybe I should go look for it.）[k]
[elsif exp='game.curBar.curMind == 2']
	[客][b]（No one would ever know that the lone tree standing southwest of the orchard is the entrance to a beehive.）[k]
[elsif exp='game.curBar.curMind == 3']
	[客][b]（It's actually pretty easy to get underwater. All you need to do is equip the whole party with two pieces of shell equipment each.）[k]
	[客][b]（And if you're looking for shell equipment, you can defeat the mermaids who live in the Water Palace and they'll drop a lot of it.）[k]
	@eval exp='game.curBar.curMind = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*people_山小屋パブ

[texton]
[if exp='game.curBar.curTalk == 1']
	[客]「As you can see, it's a particularly cold area here. It's so cold that sometimes the rivers and ponds freeze over.」[k]
[elsif exp='game.curBar.curTalk == 2']
	[客]「If you use Levitate magic, you can walk on crumbling floors.」[k]
[elsif exp='game.curBar.curTalk == 3']
	[客]「There is a big river north of this town called the Great River of the North.」[k]
	[客]「The great river of the north is famous for its swift currents.」[k]
[elsif exp='game.curBar.curTalk == 4']
	[客]「This area is famous for being very cold.」[k]
	[客]「Every few days a freezing northerly wind blows down from the mountain range to the north, bringing snow and freezing the rivers. You guys should be careful when you walk around here.」[k]
[elsif exp='game.curBar.curTalk == 5']
	[客]「There's a guy who lives just outside the north gate of the town, and he knows a lot about the weather.」[k]
	[客]「He can even predict the weather a few days ahead. If you're worried about the weather, ask him.」[k]
[elsif exp='game.curBar.curTalk == 6']
	[客]「There used to be two bridges across the great river to the north, but the eastern one was washed away by the flood.」[k]
	[客]「Thanks to this, I can no longer go to the snowy mountains. It's a real pain in the ass.」[k]
[elsif exp='game.curBar.curTalk == 7']
	[客]「The [emb exp='o.レビテイト.displayName'] spell is useful～! I can avoid all the traps on the floor!」[k]
	[客]「Oops, let me tell you before you get it wrong. Floating doesn't mean you can fly. You can only float where there's ground below.」[k]
	[客]「If you're over water or nothing you'll fall. Also if the ground moves, you'll go with it, so be careful.」[k]
[elsif exp='game.curBar.curTalk == 8']
	[客]「The mountains north of this town are dangerous, with constant blizzards and strong monsters!」[k]
	[客]「And there's even a dragon! You definitely don't want to venture into that place.」[k]
[elsif exp='game.curBar.curTalk == 9']
	[客]「Levitation magic won't work on a bed of ice.」[k]
	[客]「With levitation magic, ice is treated as if it were water, and just as you can't float over water, you can't float over ice.」[k]
[elsif exp='game.curBar.curTalk == 10']
	[客]「Living deep in the snowy mountains are said to be ice dragons with cold breath that freezes all things.」[k]
[elsif exp='game.curBar.curTalk == 11']
	[客]「They say there's a magic bracelet that allows you to move heavy things.」[k]
[elsif exp='game.curBar.curTalk == 12']
	[客]「In the deepest part of the mountain, there are enemies called golems.」[k]
	[客]「They're very strong and powerful. If one of its punches hits you, you'll go down in one hit.」[k]
	[客]「However, golems move very slowly. So I think it's best to run away if you encounter one!」[k]
[elsif exp='game.curBar.curTalk == 13']
	[客]「The big river in the north flows so fast that even if you summon a boat, it will be swept away.」[k]
[elsif exp='game.curBar.curTalk == 14']
	[客]「Imps are small and weak looking demons, but are actually quite ferocious and strong. If you underestimate them, you'll regret it!」[k]
[elsif exp='game.curBar.curTalk == 15']
	[客]「The area is covered with snow all year round and crops don't grow well.」[k]
	[客]「So many of the residents make a living off the ore from the mines north of this town.」[k]
[elsif exp='game.curBar.curTalk == 16']
	[客]「The two elevators in the mine are connected by a pulley on the top floor.」[k]
	[客]「If one goes up, the other goes down, and conversely, if one goes down, the other goes up. It is important to fully understand this mechanism before using it.」[k]
[elsif exp='game.curBar.curTalk == 17']
	[客]「There's a mass grave just south of this town.」	[k]
[elsif exp='game.curBar.curTalk == 18']
	[客]「Did you know? The heart of an ice dragon is made of a block of ice!」[k]
	[客]「Moreover, it is said that its heart has the power to freeze anything. Even lava can be frozen!」[k]
[elsif exp='game.curBar.curTalk == 19']
	[客]「You can use Jump magic to jump from high places and get somewhere unexpected. It is important to check the map often and try everything!」[k]
[elsif exp='game.curBar.curTalk == 20']
	[客]「Watch out for black slimes! They pretend to be cute and then bam, you're dead!」	[k]
[elsif exp='game.curBar.curTalk == 21']
	[客]「The elevators in the mine are like boxes. You can walk through them, or use the roof to cross a gap on the floor above.」	[k]
	@eval exp='game.curBar.curTalk = 1'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*mind_山小屋パブ

[texton]
[if exp='game.curBar.curMind == 1']
	[客][b]（If you want to cross over the river, go on a snowy day.）[k]
[elsif exp='game.curBar.curMind == 2']
	[客][b]（If you carefully examine tombstones, you may find something surprising! It's immoral though!）[k]
[elsif exp='game.curBar.curMind == 3']
	[客][b]（If I use a pickaxe, I can get the minerals out of the shiny walls of the mine～! I'll keep quiet about it so I can get them all myself!）[k]
	@eval exp='game.curBar.curMind = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*people_大洞窟バル

[texton]
[if exp='game.curBar.curTalk == 1']
	[if exp='o.ホークワロスの魔法店.events.has(0)']
		[客]「Right now, there's a quest to get a great treasure posted on the bulletin board, and it's getting a lot of attention!」[k]
		[客]「The owner of a magic shop in this town was so blinded by money that he closed his store for a while and went on a quest.」[k]
	[else]
		[客]「There used to be a quest posted on the bulletin board in the bar to get a great treasure, but I heard that was a trap set by the devil.」[k]
		[客]「I heard the magic shop owner got into a lot of trouble for it.」[k]
	[endif]
[elsif exp='game.curBar.curTalk == 2']
	[客]「Do you know the [emb exp='o.マジカルボート.displayName'] spell? It's an awesome spell that allows you to create a magical boat on water and move around!」[k]
	[客]「You didn't know? They sell them in the magic store here in town, you should take a look!」[k]
[elsif exp='game.curBar.curTalk == 3']
	[客]「They say there are ancient ruins on B6. But I heard that the door won't open and no one can get inside.」[k]
[elsif exp='game.curBar.curTalk == 4']
	[客]「The effects of smoke and gravity traps can't be undone... 」[k]
	[客]「So you'll need to leave the dungeon, or wait for time to pass.」[k]
[elsif exp='game.curBar.curTalk == 5']
	[客]「B7 is an area of underground water veins with a cold river running through it.」[k]
	[客]「There's nothing there but water, but rumor has it there's an area further down!」[k]
[elsif exp='game.curBar.curTalk == 6']
	[客]「Have you ever heard of the Magic Ladder? It's a handy item that lets you climb up any low earthen wall!」[k]
	[客]「You can find it in storage in the sewers of Sapphire City. I'm a retired adventurer and don't use it anymore.」[k]
[elsif exp='game.curBar.curTalk == 7']
	[客]「It is said that the Great Cavern extends to B7, but the truth is that there is a world below it.」[k]
	[客]「It is said to be the devil's domain, where many terrible demons live.」[k]
[elsif exp='game.curBar.curTalk == 8']
	[客]「There's a way to walk through the dungeon without getting thwarted by a smoke trap! Want to know?」[k]
	[客]「That's using the [emb exp='o.ウィザードアイ.displayName'] spell! With it, you won't be affected by smoke!」[k]
[elsif exp='game.curBar.curTalk == 9']
	[客]「Never set foot in the devil's domain! Those horrible demons will kill you all!」[k]
[elsif exp='game.curBar.curTalk == 10']
	[客]「Even if you use levitation magic, you may not be able to cross a cracked bridge!」[k]
	[客]「Sometimes you can tell one's nearby if there's a magic removal trap set up. Check the map!」[k]
[elsif exp='game.curBar.curTalk == 11']
	[客]「It is said that this world is ruled by the Four Great Gods.」[k]
	[客]「Aura, the god of light and darkness. Radmira, the god of love and hate. Zola, the god of life and death.」[k]
	[客]「And Polaris, the god of harmony, who is the keystone of these three gods and acts as a balancer. Together, they are called the Four Great Gods.」[k]
	[客]「Under the four great gods, there are nine gods called the Nine Pillars, including Duel, the god of war. The world is ruled by these gods.」[k]
	[客]「These gods have been fighting against the demons of the demon world that live deep within the earth since the age of mythology. We humans live our lives under the protection of these gods.」[k]
[elsif exp='game.curBar.curTalk == 12']
	[客]「Demons are scary, but if you have a holy weapon, they're not so tough.」[k]
[elsif exp='game.curBar.curTalk == 13']
	[客]「The [emb exp='o.トーチ.displayName'] spell can even dispel thick fog!」[k]
[elsif exp='game.curBar.curTalk == 14']
	[客]「Have you ever met a succubus? Sex with them is supposedly the best! Although your level is also drained!」[k]
[elsif exp='game.curBar.curTalk == 15']
	[客]「Are you looking for a magic stone? An old sorcerer who lives on a southern island is said to have one.」[k]
[elsif exp='game.curBar.curTalk == 16']
	[客]「Sylphs are born with the ability to levitate. So that can't be taken away by a magic-erasing trap.」[k]
[elsif exp='game.curBar.curTalk == 17']
	[客]「Among the many magic stones, there is one called the Sapphire Magic Stone.」[k]
	[客]「This magic stone has a very strong ice blessing and has a powerful cooling effect on its surroundings.」[k]
	[客]「Even if you throw it into a pond of lava, this magic stone will never melt!」[k]
[elsif exp='game.curBar.curTalk == 18']
	[客]「It is said that deep underground, far beneath this world, there is a world called the demon world.」[k]
	[客]「Supposedly there are many terrifying demons living there, far beyond common sense.」[k]
[elsif exp='game.curBar.curTalk == 19']
	[客]「Some equipment with magical effects will only work if everyone in the party wears it. For example, shell equipment!」[k]
[elsif exp='game.curBar.curTalk == 20']
	[客]「Whenever anyone thinks of crossing a cracked floor, the first thing that comes to mind is to resort to levitation magic.」[k]
	[客]「However, if a magic effect erasing trap is set in the same place, levitation will be canceled, so there is no way to cross.」[k]
	[客]「In that case... I guess you'll just have to find another way.」[k]
[elsif exp='game.curBar.curTalk == 21']
	[客]「It is said that the Great Cave is actually one of the passages that lead to the demon world... 」[k]
	[客]「The true shape of the Great Cave is an incredibly long and narrow shaft. Demons crawl out through it to the surface...!」[k]
	[客]「In fact, in recent years, an increasing number of demons have been appearing on earth through large caverns. It is too horrifying a story to be told out loud.」[k]
	@eval exp='game.curBar.curTalk = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*mind_大洞窟バル

[texton][b]
[if exp='game.curBar.curMind == 1']
	[客][b]（The combination of magical erasure and crumbling floors means that even if you use levitation magic, you'll fall down, so people assume you can't cross... ）[k]
	[客][b]（But if everyone wore angel equipment, they could cross... Many people don't know that...）[k]
[elsif exp='game.curBar.curMind == 2']
	[客][b]（I heard from someone that if you want angel equipment, you should hunt the angel knights at the top of God's Mountain.）[k]
	[客][b]（But those guys are so strong, I can't beat them in the first place～. Aww, I want angel equipment.）[k]
[elsif exp='game.curBar.curMind == 3']
	[客][b]（It is said that if you wander into the Swamp of the Dead, you can never return, but I've met a guy who came back.）[k]
	[客][b]（The guy said he'd done a thorough search of the woods on the south shore of the swamp in his magic boat.）[k]
	@eval exp='game.curBar.curMind = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*people_町営食堂

[texton]
[if exp='game.curBar.curTalk == 1']
	[客]「How did you guys make it here? This town is in the middle of nowhere, so outsiders rarely come here.」[k]
[elsif exp='game.curBar.curTalk == 2']
	[客]「Oh～ I'm getting sick of all the dust and dirt day in and day out! There's nothing to do here! It's such a boring town!」[k]
	[客]「I'd like to get out of here and go to another town soon, but the sandstorms have been so bad lately that I can't cross the desert!」[k]
	[客]「Oh～ I can't do without my bourbon!」[k]
[elsif exp='game.curBar.curTalk == 3']
	[客]「South of the town is a wasteland called the Deadly Wilderness.」[k]
	[客]「Well, when you go there, there's nothing but monsters.」[k]
[elsif exp='game.curBar.curTalk == 4']
	[客]「Snakes are vulnerable to ice attacks.」[k]
[elsif exp='game.curBar.curTalk == 5']
	[客]「There is quicksand south of the Deadly Wilderness, but don't go near it. If you get swept away, you won't be able to come back.」[k]
[elsif exp='game.curBar.curTalk == 6']
	[客]「There's nothing for you here in this godforsaken town. You'd better check out what the stores have to offer, then get the hell out of here.」[k]
[elsif exp='game.curBar.curTalk == 7']
	[客]「The Deadly Wilderness is said to be inhabited by a terrifying giant monster known as the Lord of the Desert.」[k]
[elsif exp='game.curBar.curTalk == 8']
	[客]「If you've made it this far, I'm sure you know this, but always carry bombs, a magic ladder, and a magic floating bridge. You never know where you might need them.」[k]
[elsif exp='game.curBar.curTalk == 9']
	[客]「I can't say it too loud, but the food here is all horrible.」[k]
	[客]「It's not the kind of food you treat a girl to. If you want to buy a meal, you'd better go to a restaurant in another town.」[k]
	[name n=Shopkeeper f=wanda_00]「I heard that! This town doesn't get a lot of supplies, so tough! If you complain, I won't serve you food next time!」[k]
[elsif exp='game.curBar.curTalk == 10']
	[客]「The quicksand of the Deadly Wilderness is said to be a human catching trap for a certain giant monster. It is said that they capture and eat humans who have the misfortune to be swept away by the quicksand.」[k]
[elsif exp='game.curBar.curTalk == 11']
	[客]「Just between you and me, the old man who owns the magic shop on the Island of Mist seems to have a hobby of collecting women's freshly removed underwear.」[k]
	[客]「What a pervert! Don't let him see anyone's underwear.」[k]
[elsif exp='game.curBar.curTalk == 12']
	[客]「Cursed equipment not only reduces your abilities, but prevents you taking it off. So it's best to get rid of it as soon as possible.」[k]
	[客]「But it seems there are people who choose to equip it, if they think the benefits outweigh the penalty.」[k]
[elsif exp='game.curBar.curTalk == 13']
	[客]「If you select a neutral alignment, you cannot change to another one. In some ways, it is the most restrictive alignment.」[k]
	[客]「I don't see any point in choosing it unless you want to be a Valkyrie.」[k]
[elsif exp='game.curBar.curTalk == 14']
	[客]「The Lord of the Desert usually lives under the sand.」[k]
	[客]「But when humans approach, it's attracted by their scent and surfaces. So said an adventurer I know who once wandered beyond the quicksand.」[k]
[elsif exp='game.curBar.curTalk == 15']
	[客]「If you're having trouble learning magic or increasing your MP, have you checked your Intelligence and Faith? If they're low, that might be why.」[k]
	[客]「Spirit and alchemy magic are influenced by Intelligence, while holy and summoning magic are influenced by Faith.」[k]
[elsif exp='game.curBar.curTalk == 16']
	[客]「It seems that the Lord of the Desert blocks warp magic to keep captured humans from escaping. He's very cunning for a monster.」[k]
[elsif exp='game.curBar.curTalk == 17']
	[客]「The man who built Radmira Tower said that it was full of mechanisms to fool the eyes of intruders.」[k]
	[客]「Apparently, there are times when you think there is a wall but there isn't, or there is a wall where there's really nothing.」[k]
[elsif exp='game.curBar.curTalk == 18']
	[客]「You can't make a contract with a level 9 monster unless you use a Large Summon Bottle.」[k]
[elsif exp='game.curBar.curTalk == 19']
	[客]「Many high-ranking demons have high HP and resist magic. So a strong weapon attack would be more effective than a spell that can hit them all at once.」[k]
	[客]「Especially an advanced weapon with holy magical effects! If you get your hands on one, you should take good care of it.」[k]
[elsif exp='game.curBar.curTalk == 20']
	[客]「You never know what's going to happen on the other side of a door... That's when clairvoyance magic comes in handy!」[k]
[elsif exp='game.curBar.curTalk == 21']
	[客]「Apparently, due to a mistake during construction, there is a floor in Radmira Tower that no one can enter or leave. Apparently, the groans of workers trapped inside can be heard...!」[k]
	[客]「Apparently, due to a malfunction of the elevator, it was unable to stop at that floor. It would be awful to be trapped for that reason.」[k]
	@eval exp='game.curBar.curTalk = 0'
[endif]
[textoff]

[baroff]
;----------------------------------------------------------------------------------------
*mind_町営食堂

[texton]
[if exp='game.curBar.curMind == 1']
	[客][b]（Apparently the ancient desert people would offer a magic stone to an altar somewhere in the Talha Desert.）[k]
[elsif exp='game.curBar.curMind == 2']
	[客][b]（It seems that the black dragon living in the ruins near Bravetown has the potential to be summoned... Well, I can't defeat it so it doesn't really matter.）[k]
[elsif exp='game.curBar.curMind == 3']
	[客][b]（The guy who built Radmira Tower was talking nonsense.）[k]
	[客][b]（"Put a bomb in the smoke-filled area." What does that mean?）[k]
	@eval exp='game.curBar.curMind = 0'
[endif]
[textoff]

[baroff]
;========================================================================================


; 恥ずかしい格好で施設に入ることを拒否するセリフ
;========================================================================================
*avoid_テオ

[texton]
[テオ f=12]「Hmm... If I went in dressed like this, I'd probably be thought of as a pervert...」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*avoid_リム

[texton]
[リム f=30]「This is too embarrassing... I can't go in like this...」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*avoid_クレア

[texton]
[クレア f=29]「Honestly... I can't in looking like this. Find me something [if exp='! game.curChara.isBustNaked() && ! game.curChara.isHipNaked()']decent [endif]to wear.
 」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*avoid_フレデリカ

[texton]
[フレデリカ f=38]「No～ I can't go in like this～!」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*avoid_ミューズ

[texton]
[ミューズ f=30]「This is too embarrassing... I can't go out in public...」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*avoid_マルエット

[texton]
[マルエット f=31]「Hey! There's no way I can go in in such an embarrassing outfit!」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*avoid_リーゼル

[texton]
[リーゼル f=30]「I can't go in like this... Find me something [if exp='! game.curChara.isBustNaked() && ! game.curChara.isHipNaked()']decent [endif]to wear.」[k]
[textoff]

[townoff]
;----------------------------------------------------------------------------------------
*avoid_マックス

[texton]
[マックス]「Is it okay to walk around with a bare cock?」[k]
[textoff]

[townoff]
;========================================================================================


; 恥ずかしい格好で施設に入ったイベント
;========================================================================================
*_sexy_costumes

@eval exp='game.curChara = game.getCharaBlushing(100)'
@wait time=500
[texton]
[name n=Guest]「... ∗stare∗」[k]
[name n=Guest]「... ∗grin∗」[k]
[if exp='game.curChara.expose >= 90']
	@fgf c=キャラ f=25
	[キャラ f=25]「...」[k]
[else]
	@fgf c=キャラ f=30
	[キャラ f=30]「... (Kyaa)」[k]
[endif]
Once inside, [キャラ]'s indecent appearance attracted the attention of the people around.[k]
[name n=Guest]「Looking great!」[k]
[name n=Guest]「What a lewd woman. Is she a slut?」[k]
[name n=Guest]「I'll burn this into my memory!」[k]
[if exp='game.curChara.expose >= 90']
	[キャラ f=25]「...」[k]
	Even though she is the center of the customers' attention, [キャラ] remains cool and unfazed.[k]
[else]
	[キャラ f=30]「... (Kyaaaaaaaa!)」[k]
	With all the gazes focused on her body, [キャラ]'s face is bright red.[k]
[endif]

[if exp='game.isFreeMode']
	[textoff]
	@clf
	@return
[endif]

[if exp='game.curChara.expose >= 90']
	[テオ f=12]「H-hey, [キャラ]. Are you okay?」[k]
	[   if exp='isHUM'][リム f=25]「Huh? What?」[k]
	[elsif exp='isELF'][クレア f=25]「What?」[k]
	[elsif exp='isDWA'][フレデリカ f=25]「Huh? What?」[k]
	[elsif exp='isGNO'][ミューズ f=25]「Huh...? What do you mean...?」[k]
	[elsif exp='isSYL'][マルエット f=25]「Huh? What?」[k]
	[elsif exp='isLIS'][リーゼル f=25]「Huh...? What...?」[k]
	[endif]
	[テオ f=10]「...」[k]
	Apparently, she doesn't think anything of it. Maybe [キャラ] doesn't have much sense of embarrassment.[k]
	[textoff]
	@clf
	@w05
	@return
[endif]

[if exp='game.curChara.isBustNaked() || game.curChara.isHipNaked()']
	[   if exp='isHUM'][リム f=29]「Umm... I want to get dressed quickly...」[k]
	[elsif exp='isELF'][クレア f=54]「Hey... please hurry up and put some clothes on me...」[k]
	[elsif exp='isDWA'][フレデリカ f=38]「Ugh... I want some clothes as soon as possible...」[k]
	[elsif exp='isGNO'][ミューズ f=66]「I... don't like this look...」[k]
	[elsif exp='isSYL'][マルエット f=59]「Hey! I don't want to look so embarrassing! Do something!」[k]
	[elsif exp='isLIS'][リーゼル f=30]「I, um... I'd prefer not to be naked... 」[k]
	[endif]
[else]
	[   if exp='isHUM'][リム f=29]「Umm... I want to put on other clothes as soon as possible...」[k]
	[elsif exp='isELF'][クレア f=54]「Hey... hurry up and find me some decent clothes...」[k]
	[elsif exp='isDWA'][フレデリカ f=38]「Ugh... I want other clothes as soon as possible...」[k]
	[elsif exp='isGNO'][ミューズ f=66]「I... don't like this look...」[k]
	[elsif exp='isSYL'][マルエット f=59]「Hey! I don't want to wear such embarrassing clothes! Stop it!」[k]
	[elsif exp='isLIS'][リーゼル f=30]「I, uh... I'd rather not wear this if I don't have to. 」[k]
	[endif]
[endif]
[テオ f=10]「Y-yes, right, I understand.」[k]
I'll feel bad if I don't do something about it soon. [r]
[if exp='game.curChara.isBustNaked() || game.curChara.isHipNaked()']
	Let's find something for [キャラ] to wear.[k]
[else]
	Let's find something else for [キャラ] to wear.[k]
[endif]
[textoff]
@clf
@w05
@return
;========================================================================================


; 産休
;========================================================================================
*maternity_リム

@saveon
@out t=0
@w05
@bg f=0007 b
@eval exp='game.curChara.equip.chest = game.curChara.isBigBelly() ? o.マタニティドレス　 : o.マタニティドレス'
@fg c=リム f=01
[texton w=1]
[if exp='game.isFreeMode']
	[リム f=01]「Both mother and child are in perfect health」[k]
	[リム f=01]「I want to come back soon and adventure with you all.」[k]
[else]
	[リム f=01]「Ah, captain.」[k]
	[テオ f=02]「[リム], how are you feeling?」[k]
	@fgf c=リム f=03
	[リム f=03]「Yes! Both mother and child are healthy!」[k]
	[テオ f=02]「That's good to hear. Keep up the good work and get some rest.」[k]
[endif]
[textoff]
@out
@w05
@gameon
[guildoff]
;----------------------------------------------------------------------------------------
*maternity_クレア

@saveon
@out t=0
@w05
@bg f=0007 b
@eval exp='game.curChara.equip.chest = game.curChara.isBigBelly() ? o.マタニティドレス　 : o.マタニティドレス'
@fg c=クレア f=01
[texton w=1]
[if exp='game.isFreeMode']
	[クレア f=16]「Yes, I'm in good health. The child is growing up just fine.」[k]
	[クレア f=02]「I hope to come back to adventuring with everyone soon.」[k]
[else]
	[クレア f=01]「Oh, Captain, what's wrong?」[k]
	[テオ f=02]「[クレア], how are you feeling?」[k]
	@fg c=クレア f=16
	[クレア f=16]「Yes, no problem. The child is growing up just fine.」[k]
	[テオ f=02]「That's good to hear. Keep up the good work and get some rest.」[k]
[endif]
[textoff]
@out
@w05
@gameon
[guildoff]
;----------------------------------------------------------------------------------------
*maternity_フレデリカ

@saveon
@out t=0
@w05
@bg f=0007 b
@eval exp='game.curChara.equip.chest = game.curChara.isBigBelly() ? o.マタニティドレス　 : o.マタニティドレス'
@fg c=フレデリカ f=01
[texton w=1]
[if exp='game.isFreeMode']
	[フレデリカ f=03]「Yes, I and my baby are in perfect health～!」[k]
	[フレデリカ f=14]「I hope to return soon and adventure with you all...」[k]
[else]
	[フレデリカ f=01]「Oh, captain!」[k]
	[テオ f=02]「[フレデリカ], how are you feeling?」[k]
	@fgf c=フレデリカ f=03
	[フレデリカ f=03]「Yes, I and my baby are in perfect health～!」[k]
	[テオ f=02]「That's good to hear. Keep up the good work and get some rest.」[k]
[endif]
[textoff]
@out
@w05
@gameon
[guildoff]
;----------------------------------------------------------------------------------------
*maternity_ミューズ

@saveon
@out t=0
@w05
@bg f=0007 b
@eval exp='game.curChara.equip.chest = game.curChara.isBigBelly() ? o.マタニティドレス　 : o.マタニティドレス'
@fg c=ミューズ f=05
[texton w=1]
[if exp='game.isFreeMode']
	[ミューズ f=05]「I'm fine... The baby is fine...」[k]
	@fgf c=ミューズ f=22
	[ミューズ f=22]「I hope to return to adventuring soon...」[k]
[else]
	[ミューズ f=05]「Ah... Captain...」[k]
	[テオ f=02]「[ミューズ], how are you feeling?」[k]
	@fgf c=ミューズ f=22
	[ミューズ f=22]「I'm fine... The baby is fine...」[k]
	[テオ f=02]「That's good to hear. Keep up the good work and get some rest.」[k]
[endif]
[textoff]
@out
@w05
@gameon
[guildoff]
;----------------------------------------------------------------------------------------
*maternity_マルエット

@saveon
@out t=0
@w05
@bg f=0007 b
@eval exp='game.curChara.equip.chest = game.curChara.isBigBelly() ? o.マタニティドレス　 : o.マタニティドレス'
@fg c=マルエット f=01
[texton w=1]
[if exp='game.isFreeMode']
	[マルエット f=02]「Yeah, it's okay. Both me and the kid are fine.」[k]
	[マルエット f=01]「I hope to come back to adventuring with everyone soon.」[k]
[else]
	[マルエット f=01]「If it isn't the captain. What's wrong?」[k]
	[テオ f=02]「[マルエット], I was wondering how you were doing...」[k]
	@fg c=マルエット f=02
	[マルエット f=02]「Yeah, it's okay. Both me and the kid are fine.」[k]
	[テオ f=02]「That's good to hear. Keep up the good work and get some rest.」[k]
[endif]
[textoff]
@out
@w05
@gameon
[guildoff]
;----------------------------------------------------------------------------------------
*maternity_リーゼル

@saveon
@out t=0
@w05
@bg f=0007 b
@eval exp='game.curChara.equip.chest = game.curChara.isBigBelly() ? o.マタニティドレス　 : o.マタニティドレス'
@fg c=リーゼル f=01
[texton w=1]
[リーゼル f=01]「Don't worry. Me and the baby are fine.」[k]
[リーゼル f=01]「I want to come back soon and go adventuring with everyone...」[k]
[textoff]
@out
@w05
@gameon
[guildoff]
;========================================================================================


; 手紙
;========================================================================================
*letter_入城許可証

[texton w=4]
@style align=center
[r][r][r][r]Permission is granted to your party to enter the royal castle.[r][r][r][r]
@style align=right
King Sapphire[k]
[textoff]

@return
;----------------------------------------------------------------------------------------
*letter_ギルドへの紹介状

[texton w=4]
[r][r]The following individual is hereby nominated as a special member of the Sapphire City Guild.[r][r][r]
@style align=center
[emb exp='o.テオ.displayName']  [r][r][r]
@style align=right
Oswald Schwarz[k]
[textoff]

@return
;----------------------------------------------------------------------------------------
*letter_精霊の台座のメモ

@image layer=5 visible=true left=304 top=35 storage=map_element
@image layer=4 visible=true left=0 top=0 storage=screen_deepblackfull
[texton w=2]
[nw]The note had four symbols drawn on it. What does this mean?[/nw][k]
[textoff]
@layopt layer=5 visible=false left=0 top=0
@layopt layer=4 visible=false left=0 top=0

@return
;----------------------------------------------------------------------------------------
*letter_ジャンの手紙

[texton w=4]
[nw]The letter reads:[r][b]
[indent]My beloved wife Ortena.[r]
I fell in love with a mermaid named Charol.[r]
I shall rot in this temple with her.[r]
Man cannot live long in a world of water.[r]
By the time this letter reaches you, I will already be dead.[r]
Please forgive me for my selfishness, and forget about me.[r]
   Jean[k]
[textoff]

@return
;----------------------------------------------------------------------------------------
*letter_カルロスの手紙
*letter_ムニョスの手紙

[texton]
Let's not. It's not good to read someone's letter without permission.[k]
[textoff]

@return
;----------------------------------------------------------------------------------------
*letter_朽ち果てた手記

[texton]
It was the journal of an adventurer.[r]
In his memoirs, he clearly described how he wandered through the forest for days, unable to escape from the Forest of the Lost.[k]
[textoff]

[eventoff]
;----------------------------------------------------------------------------------------
*letter_とある冒険者のメモ

[texton w=0]
[nw]The note seemed to have been written by an adventurer:[r]
[b]If you want to solve everything on your own, don't look at the back.[/b][k]
[textoff]

@question title="Would you like to look at the back?"
@eventoff cond='! tf.result'

@image layer=5 visible=true left=304 top=110 storage=map_stones
@image layer=4 visible=true left=0 top=0 storage=screen_deepblackfull
[texton w=2]
[nw]There was some kind of drawing on the back. What could this mean?[/nw][k]
[textoff]
@layopt layer=5 visible=false left=0 top=0
@layopt layer=4 visible=false left=0 top=0

[eventoff]
;----------------------------------------------------------------------------------------
*letter_魔導士ラニガンの手紙

[texton w=4]
[nw]The letter reads:[r][b]
[indent]The fact that you are reading this letter means that you have conquered the labyrinth I created.
[r]
Congratulations. Your wits are superb.[r]
I give you this medal.[r]
I hope you find it useful in your future adventures.[r]
[r]
I'll tell you something good.[r]
Check out the location 9 east and 6 south of the crossroads in Collins Wood.[r]
There's some good stuff buried there.[k]
[textoff]

@return
;----------------------------------------------------------------------------------------
*letter_初級の書

[texton w=4]
[r]The following require these qualifications:[r][r]
 [b blue]Warrior[/b][locate x=120] Alignment: [b]Any [/b][r][locate x=340]Str: [b]11[/b][r]
 [b blue]Mage[/b][locate x=120] Alignment: [b]Any [/b][r][locate x=340]Int: [b]11[/b][r]
 [b blue]Priest[/b][locate x=120]Alignment: [b]Non-Neutral [/b][r][locate x=340]Faith:[b]11[/b][r]
 [b blue]Thief[/b][locate x=120]Alignment: [b]Neutral to Evil[/b][r][locate x=340]Spd: [b]10[/b] Luck: [b]12[/b]
[locate x=615][k]
[textoff]

@return
;----------------------------------------------------------------------------------------
*letter_中級の書

[texton w=4]
[r]The following require these qualifications:[r][r]
 [b blue]Smith[/b][locate x=120]Alignment: [b]Non-Evil[/b][r][locate x=320]Str: [b]10[/b] Vit: [b]10[/b][r]
 [b blue]Hunter[/b][locate x=120]Alignment: [b]Non-Holy[/b][r][locate x=320]Str: [b]10[/b] Spd: [b]12[/b] Luck: [b]8[/b][r]
 [b blue]Bishop[/b][locate x=120]Alignment: [b]Holy/Evil[/b][r][locate x=320]Int: [b]15[/b] Faith: [b]15[/b][r]
 [b blue]Alchemist[/b][locate x=120] Alignment: [b]Good to Bad[/b][r][locate x=320]Int:[b]13[/b] Luck:[b]10[/b]
[locate x=615][k]
[textoff]

@return
;----------------------------------------------------------------------------------------
*letter_召喚士の書
*letter_吟遊詩人の書
*letter_ドルイドの書
*letter_バルキリーの書
*letter_ソーサラーの書
*letter_モンクの書
*letter_曲刀兵の書
*letter_ロードの書
*letter_アサシンの書

@eval exp='tf.temp = o[game.curFighter.act.name.substr(0, game.curFighter.act.name.length - 2)]'
[texton w=4]
[r][b blue][emb exp='tf.temp.displayName'][/b] requires these qualifications:[r][r]
                     [indent]
Alignment: [b]
[if exp='tf.temp.alignment.count == 5']
	Any
[else]
	[emb exp='tf.temp.alignment[0].displayName']
	[if exp='tf.temp.alignment.count >= 2']・[emb exp='tf.temp.alignment[1].displayName'][endif]
	[if exp='tf.temp.alignment.count >= 3']・[emb exp='tf.temp.alignment[2].displayName'][endif]
	[if exp='tf.temp.alignment.count >= 4']・[emb exp='tf.temp.alignment[3].displayName'][endif]
[endif][/b]
[if exp='tf.temp.sex.count == 1'][r]Sex：[b][emb exp='(tf.temp.sex[0] === "女")? "♀" : "♂"'][/b][endif]
[if exp='tf.temp.power > 0'][r]Str: [b][emb exp='tf.temp.power'][/b][endif]
[if exp='tf.temp.intellect > 0'][r]Int: [b][emb exp='tf.temp.intellect'][/b][endif]
[if exp='tf.temp.piety > 0'][r]Faith: [b][emb exp='tf.temp.piety'][/b][endif]
[if exp='tf.temp.vitality > 0'][r]Vit: [b][emb exp='tf.temp.vitality'][/b][endif]
[if exp='tf.temp.speed > 0'][r]Speed: [b][emb exp='tf.temp.speed'][/b][endif]
[if exp='tf.temp.luck > 0'][r]Luck: [b][emb exp='tf.temp.luck'][/b][endif]
[endindent][k]
[textoff]

@return
;========================================================================================
