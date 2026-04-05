; first.ks
; 初期設定とスクリプト類の読み込み


[iscript]
//-----------------------------------------------------------------------------
// ◆コマンドラインオプション＆デバッグ関連

kag.conductor.debugLevel = tkdlNone;	// デバッグメッセージを控えめに
if(underDevelopment)
{
	// 開発時の設定
	Debug.console.visible = true;	// コンソールを表示する
	Debug.clearLogFileOnError = true;	// エラーログを毎回クリアする
	System.shellExecute(Storages.getLocalName(System.exePath) + "OpenKrkrWatch.js");	// 監視式起動
	Debug.logLocation = desktopPath;	// エラーログの出力先を変更
}
else
{
	// リリース時
	System.setArgument("-debugwin", "no");	// デバッグウインドウを出さないようにする
}

// ◆システム変数の設定
if(sf.mojisuuWait === void) sf.mojisuuWait = 1;	// オートモードの文字数あたりの待ち時間倍率
if(sf.backFrameOpacity === void) sf.backFrameOpacity = 235;	// 枠の不透明度
if(sf.battleFrameOpacity === void) sf.battleFrameOpacity = 255;	// 戦闘枠の不透明度
if(sf.linkRecords === void) sf.linkRecords = %[];	// リンク選択履歴を保存する変数
if(sf.dataPageNum === void) sf.dataPageNum = 0;	// セーブロード画面で開いていたページ
if(sf.thresholdOfBonusNotified === void) sf.thresholdOfBonusNotified = 30;	// BPしきい値
if(sf.askUserLoadData === void) sf.askUserLoadData = true;	// ロードの問い合わせをするか
if(sf.askUserSaveData === void) sf.askUserSaveData = 2;	// セーブの問い合わせをするか
if(sf.askUserEraseData === void) sf.askUserEraseData = true;	// データ削除の問い合わせをするか
if(sf.askExecTrade === void) sf.askExecTrade = true;	// 店での取引の確認をするか
if(sf.askDiscardItem === void) sf.askDiscardItem = true;	// アイテム削除の確認をするか
if(sf.usedJobsByCreating === void) sf.usedJobsByCreating = [];	// 作成した職業の記録（おまけ要素）

// ◆システム変数領域(コア)にこのゲーム専用の領域を作る
if(kag.scflags.game === void) kag.scflags.game = %[];

// ◆その他初回に設定すべきこと
if(! sf.shokaiSettei)
{
	kag.bgm.buf1.volume2 = 10000 * 7;	// BGM音量を7に
	sf.shokaiSettei = true;
}

// ◆セーブされる変数
f.wakuType = 0;	// 現在使用中の枠のタイプ
f.ksmodeRunning = false;	// 回想モード中かどうか
f.saveEnabled = false;	// セーブが有効かどうか
f.lastVoice = void;	// 最後に再生された音声ファイル
f.lastVoiceBuffer = 0;	// 最後に再生された音声ファイルのバッファ

// ◆追加のキーを設定
kag.keyDownHook.add(useSystemButtonByKey);	// 通常シナリオ時の汎用キー
kag.keyDownHook.add(saveScreenShot);	// スクリーンショット（開発用）
kag.keyDownHook.add(testGameByKey);	// ゲームの様々なテスト（開発用）

// ◆音量メニュー
gvolumeObj.createMenu("BGM (&B)", "bgm");
gvolumeObj.createMenu("Sound Effects (&S)", "0,1,2,3");
gvolumeObj.createMenu("Voice・Human (&H)", "4");
gvolumeObj.createMenu("Voice・Elf (&H)", "5");
gvolumeObj.createMenu("Voice・Dwarf (&D)", "6");
gvolumeObj.createMenu("Voice・Gnome (&G)", "7");
gvolumeObj.createMenu("Voice・Sylph (&Y)", "8");
gvolumeObj.createMenu("Voice・Riselle (&L)", "9");
gvolumeObj.createMenu("Voice・Maria (&M)", "10");
gvolumeObj.createMenu("Voice・Sandra (&N)", "11");
gvolumeObj.createMenu("Voice・Polaris (&P)", "12");
gvolumeObj.createMenu("Voice・Other (&O)", "13");

//-----------------------------------------------------------------------------
[endscript]


;-----------------------------------------------------------------------------
;キャプション
;-----------------------------------------------------------------------------
@call storage="about.ks"
@title name=&'gameTitle'


;-----------------------------------------------------------------------------
; システム用スクリプトの読み込み
;-----------------------------------------------------------------------------
@eval exp='KAGLoadScript("gamepad.tjs")'
@eval exp='KAGLoadScript("keyname.txt")'
@call storage="systembutton.ks"
@call storage="frameLayer.ks"
@call storage="ExHistoryLayer.ks"
@call storage="particle.ks"
@call storage="macro.ks"
@call storage="effectLayer.ks"
@call storage="name.ks"


;-----------------------------------------------------------------------------
; 巨大アニメファイルを先行読み込み  このレイヤーはもう動かさない  e6 e7 e8
;-----------------------------------------------------------------------------
[if exp='! isDemoVersion']
	@eval exp='var startTick = System.getTickCount()'
	@image layer=e6 storage=BE_inferno4 clipwidth=1024 clipheight=768 mode=addalpha
	@layopt layer=e6 index=-1
	@eval exp='kag.effects[6].notStore = true'
	@eval exp='dm("BE_inferno4 の読み込みに " + (System.getTickCount() - startTick) + " ms かかりました")'

	@eval exp='var startTick = System.getTickCount()'
	@image layer=e7 storage=BE_potion6 clipwidth=1000 clipheight=400 mode=dodge
	@layopt layer=e7 index=300
	@eval exp='kag.effects[7].notStore = true'
	@eval exp='dm("BE_potion6 の読み込みに " + (System.getTickCount() - startTick) + " ms かかりました")'

	@eval exp='var startTick = System.getTickCount()'
	@image layer=e10 storage=BE_inferno1 clipwidth=800 clipheight=600 mode=addalpha
	@layopt layer=e10 index=300
	@eval exp='kag.effects[10].notStore = true'
	@eval exp='dm("BE_inferno1 の読み込みに " + (System.getTickCount() - startTick) + " ms かかりました")'
[endif]

@eval exp='var startTick = System.getTickCount()'
@image layer=e8 storage=BE_inferno3 clipwidth=900 clipheight=540 mode=addalpha
@layopt layer=e8 index=300
@eval exp='kag.effects[8].notStore = true'
@eval exp='dm("BE_inferno3 の読み込みに " + (System.getTickCount() - startTick) + " ms かかりました")'

@eval exp='var startTick = System.getTickCount()'
@image layer=e9 storage=BE_fire_ring clipwidth=600 clipheight=280 mode=addalpha
@layopt layer=e9 index=300
@eval exp='kag.effects[9].notStore = true'
@eval exp='dm("BE_fire_ring の読み込みに " + (System.getTickCount() - startTick) + " ms かかりました")'

;-----------------------------------------------------------------------------
;タイトル前演出
;-----------------------------------------------------------------------------
; まくらカバーソフト
@image storage=blank page=back layer=base
[if exp='underDevelopment']
	; 開発中はロゴを出さない
	@trans method=crossfade time=0
[else]
	@wait time=500
	@image storage=makuracover page=back layer=base
	@trans method=crossfade time=2000
	@wt
	@wait time=2000
	@image storage=blank page=back layer=base
	@trans method=crossfade time=1000
[endif]
@wt
; ここでの処理で base の両面に黒画像が読み込まれた 以後 base レイヤーは一切使用しない

; 読み込み警告の表示
@image storage=nowLoading layer=0 visible=true left=600 top=680
@wait time=1
; せっかく警告を出したいのに描画のタイミングが得られないからなのか
; なかなか出てこないのでここに wait をちょっとだけ


;-----------------------------------------------------------------------------
; ゲームスクリプトの読み込み
;-----------------------------------------------------------------------------
@eval exp='KAGLoadScript("component.tjs")'
@eval exp='KAGLoadScript("board.tjs")'
@eval exp='KAGLoadScript("living.tjs")'
@eval exp='KAGLoadScript("model.tjs")'
@eval exp='KAGLoadScript("job.tjs")'
@eval exp='KAGLoadScript("chara.tjs")'
@eval exp='KAGLoadScript("party.tjs")'
@eval exp='KAGLoadScript("enemy.tjs")'
@eval exp='KAGLoadScript("guest.tjs")'
@eval exp='KAGLoadScript("map.tjs")'
@eval exp='KAGLoadScript("dungeon.tjs")'
@eval exp='KAGLoadScript("town.tjs")'
@eval exp='KAGLoadScript("house.tjs")'
@eval exp='KAGLoadScript("inventory.tjs")'
@eval exp='KAGLoadScript("guild.tjs")'
@eval exp='KAGLoadScript("bar.tjs")'
@eval exp='KAGLoadScript("inn.tjs")'
@eval exp='KAGLoadScript("treasure.tjs")'
@eval exp='KAGLoadScript("magic.tjs")'
@eval exp='KAGLoadScript("option.tjs")'
@eval exp='KAGLoadScript("command.tjs")'
@eval exp='KAGLoadScript("status.tjs")'
@eval exp='KAGLoadScript("item.tjs")'
@eval exp='KAGLoadScript("window.tjs")'
@eval exp='KAGLoadScript("master.tjs")'
@eval exp='KAGLoadScript("gamerun.tjs")'
@call storage="xmacro.ks"
@call storage="anime.ks" target=*register_macro
@eval exp='game.gameVisible = false'


;-----------------------------------------------------------------------------
; ゲームリセット地点・初期化
;-----------------------------------------------------------------------------
*start|タイトル
@startanchor
@clearvar
@rclick enabled=false
@eval exp='tf.gameBegining = true'


;-----------------------------------------------------------------------------
; タイトル画面
;-----------------------------------------------------------------------------
*title
@stopbgm
@cancelskip
@cancelautomode
@clickskip enabled=false
@history output=false enabled=false
@layopt layer=0 visible=false
@image layer=0 page=back storage=back_title visible=true left=0 top=0
@trans method=crossfade time=&'tf.gameBegining ? 500 : 0'
@wt
@eval exp='tf.gameBegining = false'
@eval exp='game.retryMode = false'
@eval exp='game.nextRoundMode = false'
@eval exp='game.itemWin.close()'
@eval exp='game.clearWindows()'
@command type=mini top=380 record=false
@select text="New Game" target=*newgame
@select text="Import Play Data" target=*loadchara
@select text=Load target=*loadmenucall
@select text="New Game+" target=*nextround
@select text="CG Gallery" target=*cgmode
@select text=Recollection target=*replay
@select text=Exit target=*endgame
[s]


;-----------------------------------------------------------------------------
; 新規ゲーム
;-----------------------------------------------------------------------------
*newgame
@layopt layer=0 page=back visible=false
@trans method=crossfade time=1000
@wt
@wait time=1000
@jump storage="newgame.ks" target=*select_play_mode

;-----------------------------------------------------------------------------
; キャラ読み込み
;-----------------------------------------------------------------------------
*loadchara
@eval exp='game.retryMode = true'
@image layer=0 storage=0000 visible=true
[texton w=4]
[nw][b blue]How to load the trial version's characters and items[/b][r][r]
You can load the characters and items you have raised in another trial version into this game. [r][r]
To use this function, copy the trial save data (the file named [b]"data○○.bmp"[/b] in the [b]savedata[/b] folder) into the savedata folder of the full version of the game, select that save data on the next screen, and then select [b]Load[/b].[/nw][k]
[textoff]
@layopt layer=0 visible=false
@eval exp='game.openLoadForTitle()'
[s]

;-----------------------------------------------------------------------------
; ロード
;-----------------------------------------------------------------------------
*loadmenucall
@eval exp='game.openLoadForTitle()'
[s]


;-----------------------------------------------------------------------------
; 周回プレイ
;-----------------------------------------------------------------------------
*nextround
@eval exp='game.nextRoundMode = true'
@image layer=0 storage=0000 visible=true
[texton w=5]
[nw]Please select the cleared game you want to continue.[/nw][k]
[textoff]
@layopt layer=0 visible=false
@eval exp='game.openLoadForTitle()'
[s]

;-----------------------------------------------------------------------------
; おまけモード
;-----------------------------------------------------------------------------
*cgmode
@eval exp='game.openCGMode()'
[s]

*replay
@eval exp='game.openReplayMode()'
[s]

;-----------------------------------------------------------------------------
; ゲーム終了
;-----------------------------------------------------------------------------
*endgame
@eval exp='game.clearWindows()'
@close
@jump target=*title
