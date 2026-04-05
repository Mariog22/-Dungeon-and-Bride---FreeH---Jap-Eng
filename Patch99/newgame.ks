; ゲーム初期化



;■モード選択
*select_play_mode
@eval exp='tf.selectedStoryMode = false'
@command type=short title="Which mode would you like to play?"
@select text="Story Mode" target=*start_story_mode cond='! game.retryMode'
@select text="Story Mode" target=*start_new_game cond='game.retryMode'
@select text="Free Mode" storage="freemode.ks" target=*start_free_mode
[s]


;■強くてニューゲーム（画面を更新する機会がないので読み込みはここで行う）
*retry_game_from_beginning
@wait time=1000
@eval exp='tf.result = game.loadGameDataForReplay(tf.num)'
@eval exp='game.coverScreen.visible = false'
[if exp='! tf.result']
	@eval exp='System.inform("Failed to read save data.\nReturning to title screen.")'
	@gotostart
[endif]
[if exp='! game.gameCleared']
	@eval exp='System.inform("This is not clear data.\nReturning to title screen.")'
	@gotostart
[endif]
@eval exp='game.retryMode = true'
@eval exp='game.nextRoundMode = false'
@jump target=*select_play_mode


;■データ読み込み（画面を更新する機会がないので読み込みはここで行う）
*load_data_from_beginning
@wait time=1000
@eval exp='tf.result = game.loadGameDataForReplay(tf.num)'
@eval exp='game.coverScreen.visible = false'
[if exp='! tf.result']
	@eval exp='System.inform("Failed to read save data.\nReturning to title screen.")'
	@gotostart
[endif]
@jump target=*start_new_game cond='tf.selectedStoryMode'
@jump target=*select_play_mode


;■主人公メイキング
*start_story_mode

; キャラメイキングの前に設定しておくべきこと
@eval exp='o.スライム.contracted = true'
@eval exp='o.モンク.appeared = false'
@eval exp='o.ロード.appeared = false'
@eval exp='o.アサシン.appeared = false'

; 問い合わせ
@layopt layer=0 visible=false
[texton w=0]
[name n=Guide f=keeper_00]「Hi. First, create the main character.」[k]
[textoff]
@command type=long
@select text="Customise character" target=*make_chara_oneself
@select text="Use default character" target=*start_new_game
@select text="Load from trial save data" target=*load_trial_data
[s]

; セーブデータから読み込み
*load_trial_data
@se f=period
[texton w=4]
[nw][b blue]How to load trial version characters[/b][r][r]
You can load the characters you trained in the trial version and use them in this game.[r][r]
To use this function, copy the trial save data (the file named [b]"data○○.bmp"[/b] in the [b]savedata[/b] folder) into the savedata folder of the full version of the game, select that save data on the next screen, and then select [b]Load[/b].[/nw][k]
[textoff]
@layopt layer=0 visible=false
@eval exp='tf.selectedStoryMode = true'
@eval exp='game.retryMode = true'
@eval exp='game.openLoadForTitle()'
[s]

; メイキング開始
*make_chara_oneself
@eval exp='game.charaEdit.notification = false'
@eval exp='game.charaEdit.jobBoard.notification = false'
@eval exp='game.charaEdit.open()'
@eval exp='game.charaEdit.fixModel(o.人間Ｃ)'
@eval exp='game.charaEdit.nameEdit.text = game.defaultNameTranslations[o.人間Ｃ.keyName]'
@eval exp='game.charaEdit.enabled = false'
@eval exp='game.charaEdit.cover.visible = false'
@eval exp='game.charaEdit.nameEdit.hitThreshold = 256'
[texton]
[name n=Guide f=keeper_00]「Do you want to hear the explanation?」[k]
[textoff]
@question title="View tutorial?"
[if exp='tf.result']
	[texton]
	[name n=Guide f=keeper_00]「Please choose a name, race, hair color, and alignment[r]you like.」[k]
	[name n=Guide f=keeper_00]「Attributes are a person's strengths and weaknesses, and[r]a number of points can be allocated to them.」[k]
	[name n=Guide f=keeper_00]「They don't change the story, but determine available jobs, along with other conditions, so consider this before choosing.」[k]
	[name n=Guide f=keeper_00]「For example, when Strength is 11 or more, Fighter appears, when Intelligence is 11 or more, Mage appears, and so on.」[k]
	[name n=Guide f=keeper_00]「Selecting a job completes the creation process.」[k]
	[textoff]
[endif]
@eval exp='game.charaEdit.enabled = true'
@eval exp='game.charaEdit.cover.visible = true'
@eval exp='game.charaEdit.nameEdit.hitThreshold = 0'
@eval exp='game.charaEdit.notification = true'
@eval exp='game.charaEdit.jobBoard.notification = true'

*start_making
@eval exp='game.inEvent = true'
@eval exp='game.previewActions = [game.jumpToKagLabel, game.charaEdit.checkBonusPoint, void]'
@eval exp='game.targetKagLabel = "*retry_making"'
@eval exp='kag.inStable = true'
@waittrig name="registerNewCharactor"
@eval exp='game.targetKagLabel = "*end_making"'
@eval exp='game.chara[0] = game.chara.pop()'
@eval exp='game.charaEdit.close()'
[s]

*retry_making
@eval exp='game.charaEdit.close()'
@eval exp='game.yesNoWin.close()'
[texton]
[nw][name n=Guide f=keeper_00]「Didn't you like the bonus points?[r]
Then let's start over.」[/nw][k]
[textoff]
@eval exp='game.charaEdit.open()'
@eval exp='game.charaEdit.fixModel(o.人間Ｃ)'
@eval exp='game.charaEdit.nameEdit.text = game.defaultNameTranslations[o.人間Ｃ.keyName]'
@jump target=*start_making

*end_making
@eval exp='game.resetPrevForKag()'
[texton]
[name n=Guide f=keeper_00]「Good work. Let's get started.」[k]
[textoff]
@se f=up1
@notice text="<y>The hero starts at <p>level 3<y>."
@eval exp='game.chara[0].levelUp()'
@eval exp='game.chara[0].levelUp()'
@jump target=*start_new_game



;■ゲーム開始
*start_new_game

@wait time=1000
[iscript]
//-----------------------------------------------------------------------------
// ストーリーモード・ゲーム初期設定

game.isFreeMode = false;

// 周回プレイ処理
if(game.retryMode)
{
	if(o.テオ === void) game.createCharas("テオ");
	if(o.マックス === void) game.createCharas("マックス");
	if(o.リーゼル === void) game.createCharas("リーゼル");
	f.maxLastJob = o.マックス.job.name;
	f.lieselLastJob = o.リーゼル.job.name;
	game.initializeGameForRepeatPlay(true);
	game.gameCleared = false;
	f.gameClearedFlag = false;
}

// 初期パーティ
game.playerChara = game.chara[0];
game.party.entry(game.chara[0]);	// 主人公
game.party.entry(game.chara[1]);	// マックス
game.playerChara.regular = true;

// 全般イベントフラグ
game.events = [0, 4, 5, 6, 11, 13, 15, 21, 22, 23, 24, 25, 26, 27, 43];
game.bevents = [];

// 男キャラ一覧
game.lovers = [game.chara[0], game.chara[1]];

// ユーザーキャラ（固定キャラの events と booking の上書きを避けるため先に登録）
o.人間Ａ.events = [0, 20, 40, 60, 80];
o.エルフＡ.events = [0, 20, 40, 60, 80];
o.ドワーフＡ.events = [0, 20, 40, 60, 80];
o.ノームＡ.events = [0, 20, 40, 60, 80];
o.シルフＡ.events = [0, 20, 40, 60, 80];
o.人間Ａ.booking = [0, 1, 2, 3];
o.エルフＡ.booking = [0, 1, 2, 3];
o.ドワーフＡ.booking = [0, 1, 2, 3];
o.ノームＡ.booking = [0, 1, 2, 3];
o.シルフＡ.booking = [0, 1, 2, 3];
game.setDefaultCharaEventsByModels();	// 初期ユーザーキャラにイベント情報を適用

// 固定キャラ
o.テオ.events = [];	
if(! game.retryMode) o.テオ.exp = o.テオ.getNeedExp(3);
if(! game.retryMode) o.テオ.skill.push2(o.反撃);
o.テオ.learnSkill(o.ファイア);
o.テオ.learnSkill(o.ヒール);
o.テオ.learnSkill(o.ディテクト);
o.テオ.sexCount.self = 0;
o.テオ.technic = 0;
o.テオ.penis = 12;
o.テオ.sexActs = [
	  "キス", "軽い愛撫", "正常位", "乳揉み", "乳首吸い", "素股", "手マン", "バック", "クリ責め"
	, "フェラチオ", "手こき", "騎乗位", "パイズリ"
];

o.マックス.events = [];	
o.マックス.booking = [0];
o.マックス.sexCount.self = 204;
o.マックス.desire = 90;
o.マックス.technic = 25;
o.マックス.penis = 20;
o.マックス.moral = 35;	
o.マックス.loversCount = 65;
o.マックス.sexActs = [
	  "ディープキス", "乳揉み", "正常位", "乳首吸い", "手マン", "バック", "クリ責め", "フェラチオ"
	, "背面座位", "対面座位", "手こき", "騎乗位", "６９", "立ちバック", "パイズリ", "足こき"
];

o.リーゼル.events = [];	
o.リーゼル.btcmd.remove(o.ブリザード);	
o.リーゼル.btcmd.remove(o.アイスブラスト);	
o.リーゼル.closedSkill = [o.ブリザード, o.アイスブラスト];	
o.リーゼル.noChangeOfJob = true;
o.リーゼル.desire = 40;
o.リーゼル.moral = 85;	
o.リーゼル.expose = 30;
o.リーゼル.feel = 42;	

// ゲストキャラ
o.ミレディ.events = [0, 1, 3, 6];
o.ミレディ.love.blue = 90;
o.ミレディ.sexCount.blue = 124;
o.ミレディ.sexCount.other = 285;
o.ミレディ.strip.blue = "汗だく";
o.ミレディ.develop.blue = 65;
o.ミレディ.desire = 80;
o.ミレディ.moral = 0;	
o.ミレディ.expose = 95;
o.ミレディ.feel = 75;	
o.ミレディ.loversCount = 64;
o.ミレディ.pourCount = 266;
o.ミレディ.firstPartnerKey = "どこかの男";

o.サンドラ.events = [0, 2, 4, 5];
o.サンドラ.love.blue = 100;
o.サンドラ.sexCount.blue = 381;
o.サンドラ.sexCount.other = 55;
o.サンドラ.strip.blue = "汗だく";
o.サンドラ.develop.blue = 95;
o.サンドラ.guard.linus = 3;
o.サンドラ.desire = 67;
o.サンドラ.moral = 12;	
o.サンドラ.expose = 70;
o.サンドラ.feel = 88;	
o.サンドラ.loversCount = 34;
o.サンドラ.pourCount = 49;
o.サンドラ.firstPartnerKey = "どこかの男";

o.マリア.events = [];
o.マリア.guard.max = 4;
o.マリア.guard.linus = 3;
o.マリア.desire = 7;
o.マリア.moral = 85;	
o.マリア.expose = 35;
o.マリア.feel = 19;	

o.ポラリス.events = [0];
o.ポラリス.desire = -1;

o.ライナス.events = [];
o.ライナス.booking = [0, 1];
o.ライナス.sexCount.self = 434;
o.ライナス.technic = 25;
o.ライナス.penis = 16;
o.ライナス.desire = 90;
o.ライナス.moral = 20;
o.ライナス.loversCount = 75;

o.ブルー.events = [];
o.ブルー.booking = [0];
o.ブルー.moveType = "forced";
o.ブルー.sexCount.self = 4520;
o.ブルー.technic = 120;
o.ブルー.penis = 19;
o.ブルー.desire = 90;
o.ブルー.moral = 0;
o.ブルー.loversCount = 289;

o.エリック.sexCount.self = 2026;
o.エリック.technic = 10;
o.エリック.penis = 15;
o.エリック.desire = 90;
o.エリック.moral = 0;
o.エリック.loversCount = 107;

o.アレックス.sexCount.self = 7290;
o.アレックス.technic = 121;
o.アレックス.penis = 17;
o.アレックス.desire = 95;
o.アレックス.moral = 0;
o.アレックス.loversCount = 455;

o.シュバルツ.desire = -1;

@endscript
*set_hiring_param
@iscript

// 雇用キャラ
o.ブレイズマン.desire = 26;
o.ブレイズマン.moral = 64;	
o.ブレイズマン.expose = 27;
o.ブレイズマン.feel = 50;	

o.ソードダンサー.love.alex = 24;
o.ソードダンサー.sexCount.alex = 74;
o.ソードダンサー.sexCount.other = 285;
o.ソードダンサー.strip.alex = "汗だく";
o.ソードダンサー.develop.alex = 64;
o.ソードダンサー.desire = 31;
o.ソードダンサー.moral = 17;	
o.ソードダンサー.expose = 33;
o.ソードダンサー.feel = 72;	
o.ソードダンサー.loversCount = 54;
o.ソードダンサー.pourCount = 378;
o.ソードダンサー.sellCount = 167;
o.ソードダンサー.firstPartnerKey = "アレックス";

o.チャンピオン.love.alex = 30;
o.チャンピオン.sexCount.alex = 65;
o.チャンピオン.sexCount.other = 198;
o.チャンピオン.strip.alex = "汗だく";
o.チャンピオン.develop.alex = 70;
o.チャンピオン.desire = 32;
o.チャンピオン.moral = 43;	
o.チャンピオン.expose = 37;
o.チャンピオン.feel = 84;	
o.チャンピオン.loversCount = 78;
o.チャンピオン.pourCount = 247;
o.チャンピオン.sellCount = 114;
o.チャンピオン.firstPartnerKey = "アレックス";

o.エンジェルナイト.desire = 30;
o.エンジェルナイト.moral = 62;	
o.エンジェルナイト.expose = 29;
o.エンジェルナイト.feel = 37;	

o.アコライト.love.alex = 14;
o.アコライト.sexCount.alex = 36;
o.アコライト.sexCount.other = 95;
o.アコライト.strip.alex = "汗だく";
o.アコライト.develop.alex = 56;
o.アコライト.desire = 24;
o.アコライト.moral = 21;	
o.アコライト.expose = 24;
o.アコライト.feel = 60;	
o.アコライト.loversCount = 24;
o.アコライト.pourCount = 146;
o.アコライト.sellCount = 50;
o.アコライト.firstPartnerKey = "アレックス";

o.ハイプリースト.desire = 19;
o.ハイプリースト.moral = 68;	
o.ハイプリースト.expose = 40;
o.ハイプリースト.feel = 39;	

o.スナイパー.love.alex = 22;
o.スナイパー.sexCount.alex = 47;
o.スナイパー.sexCount.other = 133;
o.スナイパー.strip.alex = "汗だく";
o.スナイパー.develop.alex = 64;
o.スナイパー.desire = 22;
o.スナイパー.moral = 15;	
o.スナイパー.expose = 43;
o.スナイパー.feel = 68;	
o.スナイパー.loversCount = 39;
o.スナイパー.pourCount = 181;
o.スナイパー.sellCount = 75;
o.スナイパー.firstPartnerKey = "アレックス";

o.マスターアーチャー.desire = 35;
o.マスターアーチャー.moral = 38;	
o.マスターアーチャー.expose = 46;
o.マスターアーチャー.feel = 65;	

o.ミスティック.desire = 26;
o.ミスティック.moral = 44;	
o.ミスティック.expose = 28;
o.ミスティック.feel = 54;	

o.メイガス.love.alex = 40;
o.メイガス.sexCount.alex = 103;
o.メイガス.sexCount.other = 384;
o.メイガス.strip.alex = "汗だく";
o.メイガス.develop.alex = 80;
o.メイガス.desire = 44;
o.メイガス.moral = 6;	
o.メイガス.expose = 42;
o.メイガス.feel = 69;	
o.メイガス.loversCount = 78;
o.メイガス.pourCount = 455;
o.メイガス.sellCount = 227;
o.メイガス.firstPartnerKey = "どこかの男";

@endscript
@return cond='game.isFreeMode'
@iscript

o.ブレイズマン.events = [0, 1, 2];
o.ソードダンサー.events = [0, 1, 2];
o.チャンピオン.events = [0, 1, 2];
o.エンジェルナイト.events = [0, 1, 2];
o.アコライト.events = [0, 1, 2];
o.ハイプリースト.events = [0, 1, 2];
o.スナイパー.events = [0, 1, 2];
o.マスターアーチャー.events = [0, 1, 2];
o.ミスティック.events = [0, 1, 2];
o.メイガス.events = [0, 1, 2];

// サファイアシティ
o.ホテル・クイーン.appeared = false;
o.ドロシーの魔法店.appeared = false;
o.闘技場.appeared = false;
o.サファイアシティ.events = [0];
o.王立ギルド.events = [0];
o.待合所.events = [0];
o.ベトリヌスの酒場.events = [25, 0];
o.冒険者の宿.events = [0];
o.世界一の道具店.events = [0];
o.アウラ中央教会.events = [0, 1];
o.イーラ中央寺院.events = [0, 1];
o.アイテム保管庫.events = [0];
o.サファイアシティ・北西門.events = [0];
o.サファイアシティ・北東門.events = [0];
o.サファイアシティ・南西門.events = [0];
o.サファイアシティ・南東門.events = [0];
o.下水道入口.events = [0];
o.サファイア城.events = [0];
o.公園.events = [0];
o.闘技場.events = [0];
o.ベトリヌスの酒場.quests.unshift(o.盗賊メンバー派遣の依頼);
o.サファイアシティ・北西門.requireMembers = false;
o.サファイアシティ・北東門.requireMembers = false;
o.サファイアシティ・南西門.requireMembers = false;
o.サファイアシティ・南東門.requireMembers = false;
o.下水道入口.requireMembers = false;
o.サファイアシティ.addEventButton(%[label: "アイテム説明", img: "incident", x: 338, y: 303]);
o.冒険者の宿.addEventButton(%[label: "説明", img: "incident", x: 660, y: 420]);
o.冒険者の宿.addEventButton(%[label: "指南１", img: "incident", x: 463, y: 590]);
if(sf.lastGameScore !== void) o.サファイア城.links.push2("プレイ記録");

// ブレイブタウン
o.冒険者ギルド.appeared = false;
o.ホテル琥珀.appeared = false;
o.冒険者の保管庫.appeared = false;
o.ブレイブタウン・北門.appeared = false;
o.ブレイブタウン・西門.appeared = false;
o.町外れの遺跡入口.appeared = false;
o.ブルーのアジト.appeared = false;
o.マルティナの酒場.events = [7, 0];
o.剣の店リーネ.events = [0];
o.アイザック防具店.events = [0];
o.ドナの道具屋.events = [0];
o.ブレイブタウン教会.events = [0, 1];
o.ブレイブタウン・北門.events = [0];
o.赤いネックレスを探してほしい.accepted = true;
o.森の中の廃屋入口.requireMembers = false;
o.町外れの遺跡入口.requireMembers = false;
o.ホテル琥珀.addEventButton(%[label: "指南３", img: "incident", x: 80, y: 400]);

// シーガルの村
o.シーガルの村.img = "town_seagull_sunset";
o.海岸ギルド.appeared = false;
o.潮風のペンション.appeared = false;
o.かもめ亭.appeared = false;
o.魔法の店うみねこ.appeared = false;
o.シーサイド保管庫.appeared = false;
o.マーメイドビューティ.appeared = false;
o.シーガルの村.events = [0];
o.かもめ亭.events = [11, 0];
o.海の男の武器店.events = [0];
o.浜辺の教会.events = [0, 1];
o.シーガルの村・東門.events = [0];
o.シーガルの村・南門.events = [0];
o.シーガルの村・北門.requireMembers = false;
o.シーガルの村・東門.requireMembers = false;
o.シーガルの村・南門.requireMembers = false;
o.潮風のペンション.addEventButton(%[label: "指南２", img: "incident", x: 850, y: 480]);

// ノースロップ村
o.山小屋パブ.events = [3, 0];
o.マジカル☆ウェンディ.events = [0];
o.雪国の礼拝堂.events = [0, 1];
o.雪の宿.addEventButton(%[label: "指南４", img: "incident", x: 800, y: 480]);

// 地下の町ライムストーン
o.地下の町ライムストーン.events = [0];
o.大洞窟バル.events = [3, 0];
o.ホークワロスの魔法店.events = [0];
o.地下教会.events = [0, 1];
o.大洞窟ホテル.addEventButton(%[label: "指南５", img: "incident", x: 70, y: 270]);

// ダストウェルの町
o.ダストウェルの町.events = [0];
o.町営食堂.events = [1, 0];
o.簡易宿泊所.events = [0];
o.最果ての教会.events = [0, 1];
o.ダストウェルの町.addEventButton(%[label: "売り子_1", name: "売り子", img: "obsidian", x: 502, y: 371]);
o.簡易宿泊所.addEventButton(%[label: "指南６", img: "incident", x: 420, y: 360]);

// 町外
o.ドナの行商.events = [0];
o.森の魔法屋.events = [0];
o.スワロスの店.events = [0, 1, 2, 3];
o.大人の魔法店.events = [0];
o.魔法店ベイワロ・スターズ.events = [0];
o.アウラ教会.events = [0];
o.イーラ教団.events = [0];

// ダンジョン（マップファイルの方はフリーモードでも極力いじらなくて済むようにする）
o.森の中の廃屋１Ｆ.events.push2(1, 2);
o.森の中の廃屋２Ｆ.events.push2(2);
o.コリンズの森.events.push2(2, 3, 6);
o.ランドン渓谷・崖上.events.push2(2, 4);
o.コボルドの砦１Ｆ.events.push2(2);
o.コボルドの砦２Ｆ.events.push2(2);
if(isDemoVersion) o.ヤネクの森・霧の谷.events.push2(5);
else o.ノームの洞窟.events.push2(1);

// 品揃え（ストーリーモード専用）
o.剣の店リーネ.selection = [, o.ショートソード, o.ロングソード, o.カトラス];
o.剣の店リーネ.specialItem = [, o.グラディウス];
o.剣の店リーネ.restockItems();
o.アイザック防具店.selection = [o.バックラー, o.布のズボン,, o.ローブ, o.革鎧, o.鎖かたびら];
o.アイザック防具店.specialItem = [o.鉄の小手, o.鉄のブーツ, o.アイアンシールド];
o.アイザック防具店.restockItems();
o.ドナの道具屋.selection = [o.ふっくらパン, o.ふっくらパン, o.ふっくらパン, o.ふっくらパン, o.毒消しの花, o.毒消しの花, o.気付けの花, o.眠気ざまし, o.冒険者のパンツ,, o.布のズボン];
o.ドナの道具屋.specialItem = [o.ポーション, o.ポーション, o.ポーション, o.麻痺治療薬, o.麻痺治療薬, o.石化解除薬];
o.ドナの道具屋.restockItems();
o.海の男の武器店.selection = [, o.カトラス, o.木の槍, o.ジャベリン];
o.海の男の武器店.specialItem = [, o.パルチザン];
o.海の男の武器店.restockItems();
o.マジカル☆ウェンディ.selection[3] = o.ウィザードアイの巻物;
o.マジカル☆ウェンディ.selection[7] = o.キュアポイズンの魔法書;
o.マジカル☆ウェンディ.restockItems();

// ドロップ制限
game.closeItems = [
	  o.ボム
	, o.ハイパーボム
	, o.魔法の錠前
	, o.ジャンプの巻物
	, o.レビテイトの巻物
	, o.イレースマジックの巻物
	, o.マジカルボートの巻物
	, o.ミスティックアイの巻物
	, o.リターンの巻物
	, o.スターバーストの巻物
	, o.戦女神の鎧・上
	, o.戦女神の鎧・下
	, o.ドルフィンスーツ
	, o.シャークパンツ
	, o.貝のお守り
	, o.疾風の剣
	, o.パールリング
];

// シナリオ開始
game.retryMode = false;
game.gameVisible = true;
game.view.visible = false;	// 一度閉じる必要がある
game.dungeonView.objectLayer.visible = false;
game.gamePlayingTime = 0;
game.gameLoadedTime = (new Date()).getTime();
game.lapse = false;
game.openDungeonView(%[map:"森の中の廃屋１Ｆ", x: 7, y: 0, way: "n"]);
game.view.startExplore();

//-----------------------------------------------------------------------------
[endscript]
[s]
