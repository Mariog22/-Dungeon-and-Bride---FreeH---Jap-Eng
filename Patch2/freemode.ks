; フリーモード用シナリオ


;■フリーモード設定
*start_free_mode

[iscript]
//-----------------------------------------------------------------------------
// フリーモード・ゲーム初期設定

game.isFreeMode = true;

// 周回プレイ処理
if(game.retryMode)
{
	game.initializeGameForRepeatPlay(false);
	game.gameCleared = false;
	f.gameClearedFlag = false;
}

// 全般イベントフラグ
game.events = [0, 5, 15, 41, 42];
if(! game.retryMode) game.events.push(4, 6, 21, 22, 23, 24, 25, 26);

// 男キャラ一覧
game.lovers = [o.マックス, o.ライナス, o.アレックス];

// ユーザーキャラ
o.人間Ａ.events = [20, 40, 60, 80];
o.エルフＡ.events = [21, 40, 60, 80];
o.ドワーフＡ.events = [20, 40, 60, 80];
o.ノームＡ.events = [23, 40, 60, 80];
o.シルフＡ.events = [20, 40, 60, 80];
o.人間Ｂ.events = [80];
o.人間Ａ.booking = [0, 1];
o.エルフＡ.booking = [0, 1];
o.ドワーフＡ.booking = [0, 1];
o.ノームＡ.booking = [0, 1];
o.シルフＡ.booking = [0, 1];
o.人間Ｂ.booking = [0, 1];
game.setDefaultCharaEventsByModels();	// 初期ユーザーキャラにイベント情報を適用

o.マックス.desire = 90;
o.マックス.technic = 25;
o.マックス.penis = 20;
o.マックス.sexActs = [
	  "ディープキス", "乳揉み", "正常位", "乳首吸い", "手マン", "バック", "クリ責め", "フェラチオ"
	, "背面座位", "対面座位", "手こき", "騎乗位", "６９", "立ちバック", "パイズリ", "足こき"
];

// ゲストキャラ
o.ミレディ.sexCount.other = 285;
o.ミレディ.desire = 80;
o.ミレディ.moral = 0;	
o.ミレディ.expose = 95;
o.ミレディ.feel = 80;	
o.ミレディ.loversCount = 64;
o.ミレディ.pourCount = 266;
o.ミレディ.firstPartnerKey = "どこかの男";
o.ミレディ.threeSize = [65, 45, 68];

o.サンドラ.sexCount.other = 55;
o.サンドラ.desire = 67;
o.サンドラ.moral = 12;	
o.サンドラ.expose = 70;
o.サンドラ.feel = 88;	
o.サンドラ.loversCount = 34;
o.サンドラ.pourCount = 49;
o.サンドラ.firstPartnerKey = "どこかの男";
o.サンドラ.threeSize = [94, 65, 92];

o.マリア.desire = 7;
o.マリア.moral = 85;	
o.マリア.expose = 35;
o.マリア.feel = 19;	
o.マリア.threeSize = [98, 62, 95];

o.ポラリス.desire = -1;
o.ポラリス.threeSize = [60, 44, 62];

o.アレックス.sexCount.self = 7290;
o.アレックス.technic = 121;
o.アレックス.penis = 17;
o.アレックス.desire = 95;
o.アレックス.moral = 0;
o.アレックス.loversCount = 455;

o.シュバルツ.desire = -1;

// 雇用キャラ
// ストーリーモードと同じなのでそちらのパラメータを読み込む
@endscript
@call storage="newgame.ks" target=*set_hiring_param
@iscript

// サファイアシティ
o.ホテル・クイーン.appeared = false;
o.ドロシーの魔法店.appeared = false;
o.王立ギルド.events = [1];
o.待合所.events = [2];
o.ベトリヌスの酒場.events = [24, 25, 2];
o.冒険者の宿.events = [2];
o.世界一の道具店.events = [0];
o.世界一の道具店.events = [0];
o.アウラ中央教会.events = [0, 1];
o.イーラ中央寺院.events = [0, 1];
o.サファイア城.events = [2, 3];
o.闘技場.events = [0];
// if(isDemoVersion) o.サファイアシティ・南東門.events = [6];
o.冒険者の宿.addEventButton(%[label: "説明", img: "incident", x: 660, y: 420]);
if(sf.lastGameScore !== void) o.サファイア城.links.push2("プレイ記録");
o.サファイアシティ.addEventButton(%[label: "アイテム説明", img: "incident", x: 338, y: 303]);
if(! game.retryMode)
{
	o.王立ギルド.entry(o.テオ, 0);
	o.王立ギルド.entry(o.マックス, 1);
	o.王立ギルド.entry(o.リーゼル, 2);
}

// ブレイブタウン
o.自宅.appeared = false;
o.マルティナの酒場.events = [7, 0];
o.ブレイブタウン教会.events = [0, 1];
o.マルティナの酒場.quests.add(o.遺跡の財宝);
o.マルティナの酒場.quests.add(o.王の短剣);
o.マルティナの酒場.quests.add(o.黄金の人魚像を探してほしい);
o.マルティナの酒場.quests.add(o.妻の浮気調査);

// シーガルの村
o.かもめ亭.events = [11, 12, 0];
o.浜辺の教会.events = [0, 1];

// ノースロップ村
o.山小屋パブ.events = [3, 4, 0];
o.雪国の礼拝堂.events = [0, 1];

// 地下の町ライムストーン
o.地下の町ライムストーン.events = [0];
o.大洞窟バル.events = [3, 0];
o.ホークワロスの魔法店.events = [0];
o.地下教会.events = [0, 1];

// ダストウェルの町
o.町営食堂.events = [1, 0];
o.最果ての教会.events = [0, 1];
o.ダストウェルの町.addEventButton(%[label: "売り子_1", name: "売り子", img: "obsidian", x: 502, y: 371]);

// 町外
o.ドナの行商.events = [0];
o.森の魔法屋.events = [0];
o.スワロスの店.events = [0, 1, 2, 3];
o.大人の魔法店.events = [0];
o.魔法店ベイワロ・スターズ.events = [0];
o.アウラ教会.events = [0];
o.イーラ教団.events = [0];

// ダンジョン
o.町外れの遺跡Ｂ１.events.push2(5);
o.エミール平原.events.push2(4);
o.ブルーのアジト１Ｆ.events.push2(7, 10);
o.大洞窟Ｂ46.events.push2(20);


// ドロップ制限
game.closeItems = [
	  o.魔法の錠前
	, o.マジカルボートの巻物
	, o.ミスティックアイの巻物
	, o.スターバーストの巻物
	, o.戦女神の鎧・上
	, o.戦女神の鎧・下
	, o.パールリング
];

// その他の設定
o.ワイルド・ブル.members.insert(1, m.エリック);

// シナリオ開始
game.retryMode = false;
game.dungeonView.objectLayer.visible = false;
game.gamePlayingTime = 0;
game.gameLoadedTime = (new Date()).getTime();
game.openTownView(o.サファイアシティ, true);
game.view.goToStreet(, true);
game.view.visible = false;	// 一度閉じる必要がある

//-----------------------------------------------------------------------------
[endscript]
[s]
