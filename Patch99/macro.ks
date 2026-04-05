; macro.ks
; マクロの登録


;----------------------------------------------------------------------------------------
;■メッセージレイヤー関連

; メッセージ画面を開く
@macro name="texton"
	@wakuset * cond='mp.w !== void || mp.left !== void || mp.top !== void'
	@reduceinfo cond='! +mp.keepinfo'
	@layopt layer=message0 visible=true
	@layopt layer=message0 visible=true page=back
	@sysbtnopt forevisible=true cond='f.wakuType < 5'
	@sysbtnopt backvisible=true cond='f.wakuType < 5'
	@current layer=message0
	@sysbtnopt btn=4 enabled=true
	@resetfont
	@resetstyle
	@clickskip enabled=true
	@history output=true enabled=true cond='f.wakuType < 5'
	@eval exp='game.rightClickEnabled = false' cond='f.wakuType >= 5'
	@call storage="macro.ks" target=*savepoint cond='f.saveEnabled'
	[er]
@endmacro


; メッセージ画面を閉じる
@macro name="textoff"
	@layopt layer=8 visible=false
	@layopt layer=8 visible=false page=back
	@layopt layer=message0 visible=false
	@layopt layer=message0 visible=false page=back
	@sysbtnopt forevisible=false
	@sysbtnopt backvisible=false
	@sysbtnopt btn=2 enabled=true
	@sysbtnopt btn=4 enabled=true
	@clickskip enabled=false
	@history output=false enabled=false
	@restoreinfo cond='! +mp.keepinfo'
	@eval exp='game.rightClickEnabled = true' cond='f.wakuType >= 5'
@endmacro


; テキストウインドウを表示   w=枠の種類  c=クリック待ち
@macro name="wakuset"

	@c cond='+mp.c'
	@eval exp='f.wakuType = +mp.w' cond='mp.w !== void'
	@current layer=message0 page=%page
	@position visible=%visible bopacity=&'sf.backFrameOpacity'
	@glyph fix=false

	; 枠０・１：標準タイプ・名前改行   ４行×３０字
	; 枠０は画面中央、枠１は画面下部に配置
	[if exp='f.wakuType == 0 || f.wakuType == 1']
		@position bgframe="text_back_1" frame="text_frame_1" marginl=20 margint=5 marginr=40 marginb=50
		@position left=%left|154 top=%top|380 cond='f.wakuType == 0'
		@position left=%left|154 top=%top|540 cond='f.wakuType == 1'
		@sysbtnopt btn=0 left=&'kag.current.left + 502' top=&'kag.current.top + 160'
		@sysbtnopt btn=1 left=&'kag.current.left + 585' top=&'kag.current.top + 160'
		@sysbtnopt btn=3 left=&'kag.current.left + 668' top=&'kag.current.top + 160'
		@sysbtnopt btn=4 left=&'kag.current.left + 685' top=&'kag.current.top + 3'

	; 枠２：細長タイプ・名前インデント   ３行×３０字
	[elsif exp='f.wakuType == 2']
		@position bgframe="text_back_2" frame="text_frame_2" marginl=16 margint=5 marginr=40 marginb=0
		@position left=%left|65 top=%top|630
		@sysbtnopt btn=0 left=&'kag.current.left + 682' top=&'kag.current.top + 104'
		@sysbtnopt btn=1 left=&'kag.current.left + 765' top=&'kag.current.top + 104'
		@sysbtnopt btn=3 left=&'kag.current.left + 848' top=&'kag.current.top + 104'
		@sysbtnopt btn=4 left=&'kag.current.left + 865' top=&'kag.current.top + 3'

	; 枠３：小型タイプ・名前改行   ５行×１８字
	[elsif exp='f.wakuType == 3']
		@position bgframe="text_back_3" frame="text_frame_3" marginl=20 margint=5 marginr=40 marginb=0
		@position left=%left|279 top=%top|440
		@sysbtnopt btn=0 left=&'kag.current.left + 252' top=&'kag.current.top + 260'
		@sysbtnopt btn=1 left=&'kag.current.left + 335' top=&'kag.current.top + 260'
		@sysbtnopt btn=3 left=&'kag.current.left + 418' top=&'kag.current.top + 260'
		@sysbtnopt btn=4 left=&'kag.current.left + 435' top=&'kag.current.top + 3'

	; 枠４：大型タイプ・名前改行   １５行×３０字
	[elsif exp='f.wakuType == 4']
		@position bgframe="text_back_4" frame="text_frame_4" marginl=20 margint=5 marginr=40 marginb=0
		@position left=%left|154 top=%top|140
		@glyph fix=true left=677 top=326
		@sysbtnopt btn=0 left=&'kag.current.left + 502' top=&'kag.current.top + 360'
		@sysbtnopt btn=1 left=&'kag.current.left + 585' top=&'kag.current.top + 360'
		@sysbtnopt btn=3 left=&'kag.current.left + 668' top=&'kag.current.top + 360'
		@sysbtnopt btn=4 left=&'kag.current.left + 685' top=&'kag.current.top + 3'

	; 枠５・６：標準・システムボタンと履歴がないタイプ・名前改行   ４行×３０字
	; 枠５は画面中央、枠６は画面下部に配置
	[elsif exp='f.wakuType == 5 || f.wakuType == 6']
		@position bgframe="text_back_1" frame="text_frame_5" marginl=20 margint=5 marginr=40 marginb=0
		@position left=%left|154 top=%top|380 cond='f.wakuType == 5'
		@position left=%left|154 top=%top|540 cond='f.wakuType == 6'

	; 枠７：画面全体に無地の枠・何もない
	[elsif exp='f.wakuType == 7']
		@position frame="" opacity=0 width=1024 height=768 marginl=0 margint=0 marginr=0 marginb=0
		@position left=0 top=0
		@glyph fix=true left=1000 top=744
	[endif]

	@sysbtnopt btn=2 visible=false enabled=false
	@backlay layer=message0

@endmacro


; 発言者名表示（９文字まで）
@macro name="name"

	; 数値を表す文字列の先頭に "0" を書いてしまった場合、
	; 吉里吉里の自動変換を使うと８進数と解釈され正しく変換されないので
	; 表情番号の "08" と "09" は手動で変換する
	@eval exp='mp.f = mp.f.charAt(1)' cond='mp.f == "08" || mp.f == "09"'

	; ボイス
	[if exp='mp.v !== void && Storages.isExistentStorage(mp.v + ".ogg")']
		@hact exp=&'createHistoryActionExp(+mp.buf, mp.v)'
		@eval exp='playVoice(mp.v, +mp.buf)'
		@eval exp='f.lastVoice = mp.v, f.lastVoiceBuffer = +mp.buf'
		@sysbtnopt btn=4 enabled=true
	[endif]

	; 発言者ウインドウ表示
	[if exp='! +mp.noface && f.wakuType != 2 && f.wakuType != 3']
		@image layer=8 storage=text_face_frame
		@layopt layer=8 left=&'kag.current.left - 60' top=&'kag.current.top - 225'
		@layopt layer=8 visible=true autohide=true index=1800000
		[if exp='mp.f !== void && +mp.f == 0 && mp.f != "" && mp.f != "0" && mp.f != "00"']
			@pimage layer=8 dx=10 dy=9 storage=%f
		[elsif exp='mp.key !== void']
			@eval exp='mp.img = o[mp.key].getTalkerImage(mp.f, mp.e)'
			@eval exp='kag.fore.layers[8].operateRect(10, 9, mp.img, 0, 0, 200, 200)'
		[elsif exp='mp.pre !== void']
			@pimage layer=8 dx=10 dy=9 storage=&'mp.pre + "_" + "%02d".sprintf(+mp.f)'
		[else]
			@layopt layer=8 visible=false
		[endif]
	[endif]

	; 名前表示
	[if exp='mp.n !== void']
		@font color=0xD0FFFF
		@nowait
		[if exp='f.wakuType <= 1']
			@ch text=%n
			@locate x=0 y=31
		[elsif exp='f.wakuType == 2']
			@ch text=%n
			@indent
		[elsif exp='f.wakuType >= 3']
			@locate x=4 y=0
			@ch text=%n
			@locate x=0 y=27
		[endif]
		@endnowait cond='kag.skipMode != 2'
		@font color="default"

		; ※会話文は１文字分インデントする
		@eval exp='kag.current.indentxpos += kag.current.fontSize + kag.current.pitch' cond='! +mp.noindent'
	[endif]

@endmacro


; 文中にあるかどうかで振る舞いが変わる名前表示
; 発言者名になる条件は
; ・行頭であること（タブは無視される）
; ・このマクロの終了位置の直後に発言を示す括弧文字があること
; 以上の条件でマクロが展開されると kag.conductor.curLineStr に正規表現で指定した内容が現れるのでそこで判定する
; なお、マクロはそのマクロに到達した時点で初めて kag.conductor.curLineStr に展開されるので、
; 後の文中に別のマクロ＋括弧が入っていても誤動作を起こす心配はない
@macro name="swname"
	@eval exp='mp.reg = new RegExp("\\][「『（]");'
	[if exp='kag.current.x == kag.current.marginL && kag.current.y == kag.current.marginT && mp.reg.test(kag.conductor.curLineStr)']
		@name *
	[else]
		@emb exp='mp.n'
	[endif]
@endmacro


; メッセージウインドウを隠す
@macro name="hide"
	@layopt layer=message0 visible=false
	@layopt layer=message1 visible=false
	@sysbtnopt forevisible=false
@endmacro


;----------------------------------------------------------------------------------------
;■レイヤー関連

; 背景・イベントＣＧを表示
; t = 切り替え時間  b: 裏で表示するだけ
; p* = 追加画像
; chara 属性を指定すると髪の色や装備をその部位名で指定できるようになる
@macro name="bg"
	@eval exp='sf["pic" + mp.f] = true'
	[if exp='Storages.isExistentStorage(mp.f + ".png") || Storages.isExistentStorage(mp.f + ".jpg")']
		@image layer=0 page=back storage=%f visible=true mode=%mode left=%left top=%top
	[else]
		@image layer=0 page=back storage=0000 visible=true left=%left top=%top
	[endif]
	@eval exp='kag.conductor.macroParams.layer = "0"'
	@eval exp='kag.conductor.macroParams.page = "back"'
	@eval exp='game.addPartialImagesByTag(mp)'
	[if exp='! +mp.b']
		@eval exp='kag.conductor.macroParams.layer = void'
		@eval exp='mp.t = 0' cond='kag.skipMode > 0'
		@trans * method=%method|crossfade time=%t|1000
		@wt
		@call storage="macro.ks" target=*savepoint cond='f.saveEnabled'
		@eval exp='game.gameVisible = false' cond='game.gameVisible'
	[endif]
@endmacro


; 背景瞬時表示
@macro name="bgf"
	@bg * t=0
@endmacro


; ＣＧをアルバム表示
@macro name="album"
	@eval exp='game.curChara = o[mp.chara]' cond='mp.chara !== void'
	@bg * t=200 left=%left|0 top=%top|0
	@eval exp='kag.conductor.macroParams.layer = "0"'
	@eval exp='(Dictionary.assign incontextof game.cgModeWin.macroParams)(mp)'
	[c]
@endmacro


; アルバム表示を終えて一覧に戻る
@macro name="albumoff"
	@bg f=0000 t=200 left=0 top=0
	@eval exp='game.openCGMode()'
	[s]
@endmacro


; 一度見たシナリオのリプレイを表示
@macro name="replay"
; 	[if exp='sf["trail_" + Storages.chopStorageExt(mp.storage) + "_" + mp.target.substr(1)]']
		@textoff
		@call storage=%storage target=%target
; 	[endif]
@endmacro


; リプレイを終えて一覧に戻る
@macro name="replayoff"
	@textoff
	@cl b
	@bg f=0000 t=200
	@cancelskip
	@cancelautomode
	@wakuset w=0
	@eval exp='game.openReplayMode()'
	[s]
@endmacro


; 立ち絵を表示
; f=表情番号  位置=画像ファイル  c:真ん中  l:左  r:右  a:追加  b:バックヤード  left, top: 位置微調整
; e=装備名をカンマで羅列したもの。「裸」と書くと全裸になる。何も書かないと現在の装備を再現
@macro name="fg"
	@eval exp='mp.f = mp.f.charAt(1)' cond='mp.f == "08" || mp.f == "09"'
	[if exp='mp.a !== void']
		[if exp='game.getCharaByTag(mp.a) !== void']
			@eval exp='game.getCharaByTag(mp.a).createFigureByTag(+mp.f, mp.e)'
			@eval exp='game.displayCharactorLayer(4, mp.a)'
			@eval exp='mp.top = game.getCharaByTag(mp.a).figureTop' cond='mp.top === void'
		[else]
			@image layer=4 page=back storage=%a visible=true
			@eval exp='game.charaKeysByKagLayer[4] = void'
		[endif]
		@eval exp='mp.left = 512' cond='mp.left === void'
		@layopt layer=4 page=back left=&'mp.left - kag.back.layers[4].width \ 2' cond='! +mp.fix'
		@layopt layer=4 page=back top=%top|0 index=%index|5000 cond='! +mp.fix'
		@layopt layer=4 page=back visible=true
		@eval exp='mp.left = void'
	[endif]
	[if exp='mp.c !== void']
		[if exp='game.getCharaByTag(mp.c) !== void']
			@eval exp='game.getCharaByTag(mp.c).createFigureByTag(+mp.f, mp.e)'
			@eval exp='game.displayCharactorLayer(3, mp.c)'
			@eval exp='mp.top = game.getCharaByTag(mp.c).figureTop' cond='mp.top === void'
		[else]
			@image layer=3 page=back storage=%c visible=true
			@eval exp='game.charaKeysByKagLayer[3] = void'
		[endif]
		@eval exp='mp.left = 512' cond='mp.left === void'
		@layopt layer=3 page=back left=&'mp.left - kag.back.layers[3].width \ 2' cond='! +mp.fix'
		@layopt layer=3 page=back top=%top|0 index=%index|4000 cond='! +mp.fix'
		@layopt layer=3 page=back visible=true
		@eval exp='mp.left = void'
	[endif]
	[if exp='mp.l !== void']
		[if exp='game.getCharaByTag(mp.l) !== void']
			@eval exp='game.getCharaByTag(mp.l).createFigureByTag(int(mp.f), mp.e)'
			@eval exp='game.displayCharactorLayer(2, mp.l)'
			@eval exp='mp.top = game.getCharaByTag(mp.l).figureTop' cond='mp.top === void'
		[else]
			@image layer=2 page=back storage=%l visible=true
			@eval exp='game.charaKeysByKagLayer[2] = void'
		[endif]
		@eval exp='mp.left = 352 - kag.back.layers[3].visible * 96' cond='mp.left === void'
		@layopt layer=2 page=back left=&'mp.left - kag.back.layers[2].width \ 2' cond='! +mp.fix'
		@layopt layer=2 page=back top=%top|0 index=%index|3000 cond='! +mp.fix'
		@layopt layer=2 page=back visible=true
		@eval exp='mp.left = void'
	[endif]
	[if exp='mp.r !== void']
		[if exp='game.getCharaByTag(mp.r) !== void']
			@eval exp='game.getCharaByTag(mp.r).createFigureByTag(+mp.f, mp.e)'
			@eval exp='game.displayCharactorLayer(1, mp.r)'
			@eval exp='mp.top = game.getCharaByTag(mp.r).figureTop' cond='mp.top === void'
		[else]
			@image layer=1 page=back storage=%r visible=true
			@eval exp='game.charaKeysByKagLayer[1] = void'
		[endif]
		@eval exp='mp.left = 672 + kag.back.layers[3].visible * 96' cond='mp.left === void'
		@layopt layer=1 page=back left=&'mp.left - kag.back.layers[1].width \ 2' cond='! +mp.fix'
		@layopt layer=1 page=back top=%top|0 index=%index|2000 cond='! +mp.fix'
		@layopt layer=1 page=back visible=true
	[endif]
	[if exp='! +mp.b']
		@eval exp='mp.t = 0' cond='kag.skipMode > 0'
		@trans * method=%method|crossfade time=%t|500
		@wt
		@call storage="macro.ks" target=*savepoint cond='f.saveEnabled'
	[endif]
@endmacro


; 立ち絵瞬時表示
@macro name="fgf"
	@fg * t=0
@endmacro


; 立ち絵を消す
@macro name="cl"
	@eval exp='mp.a = mp.c = mp.l = mp.r = true' cond='mp.a === void && mp.c === void && mp.l === void && mp.r === void'
	@eval exp='game.eraseCharactorLayer(4)' cond='+mp.a'
	@eval exp='game.eraseCharactorLayer(3)' cond='+mp.c'
	@eval exp='game.eraseCharactorLayer(2)' cond='+mp.l'
	@eval exp='game.eraseCharactorLayer(1)' cond='+mp.r'
	[if exp='! +mp.b']
		@trans * method=%method|crossfade time=%t|500
		@wt
		@call storage="macro.ks" target=*savepoint cond='f.saveEnabled'
	[endif]
@endmacro


; 立ち絵瞬時消去
@macro name="clf"
	@cl * t=0
@endmacro


; ブラック（ホワイト）アウト  一時的に画面を真っ暗にしたりするのに使う
@macro name="out"
	@stopmove
	@layersopt layer=1,2,3,4,5,6,7,8,9 page=back visible=false opacity=255 left=0 top=0
	@image storage=%f|0000 layer=0 page=back visible=true
	@eval exp='mp.t = 0' cond='kag.skipMode > 0'
	@trans * method=%method|crossfade time=%t|1000
	@wt
	@layopt layer=0 page=back visible=false
	@anireset
	@eval exp='game.gameVisible = false' cond='game.gameVisible'
	@eval exp='game.charaNumsByKagLayer = [,,,]'
@endmacro


; 瞬時にブラック（ホワイト）アウトする
@macro name="outf"
	@out * t=0
@endmacro


; フラッシュ
; f=画像ファイル  time=白い時間  on=表示する  off=消す
; on と off に数値を指定するとその時間をかけてゆっくり変化する
; 他のレイヤーのトランジションに対応するため裏の画像も変化させておく
@macro name="flash"
	[if exp='mp.on !== void || mp.off === void']
		@image layer=9 storage=%f|9999 top=0 left=0 visible=true
		@image layer=9 storage=%f|9999 top=0 left=0 visible=true page=back
	[endif]
	[if exp='+mp.on > 1 || mp.off === void']
		@layopt layer=9 opacity=0
		@move layer=9 path="(0,0,255)" time=%on|0
		@wm
	[endif]
	@wait time=%t|100
	[if exp='+mp.off']
		@move layer=9 path="(0,0,0)" time=%off|0
		@wm
	[endif]
	[if exp='mp.on === void || mp.off !== void']
		@layopt layer=9 visible=false opacity=255
		@layopt layer=9 visible=false opacity=255 page=back
	[endif]
@endmacro


; ブラックアウト
; フラッシュの黒いバージョン
@macro name="black"
	@flash * f=%f|0000 on=&'mp.on === void && mp.off === void ? 500 : mp.on'
@endmacro


; 範囲内の前景・メッセージレイヤの設定を変える
; layer 属性に複数のレイヤ番号をカンマで区切って指定 あとは @layopt に同じ
@macro name="layersopt"
	@eval exp='setOptionsOfAllLayers(mp)'
@endmacro


;----------------------------------------------------------------------------------------
;■サウンド関連

; 音楽再生
@macro name="mu"
	@playbgm loop=%loop|true storage=%f cond='kag.bgm.currentStorage != mp.f'
@endmacro


; 効果音再生
[macro name="se"][playse buf=2 loop=%loop storage=%f cond='kag.skipMode <= 1'][endmacro]
[macro name="se2"][playse buf=3 loop=%loop storage=%f cond='kag.skipMode <= 1'][endmacro]


; 環境音再生（雨の音など）
@macro name="en"
	@playse buf=3 loop=true storage=%f cond='kag.skipMode <= 1'
@endmacro


; 音楽停止・フェードアウト
[macro name="st"][fadeoutbgm time=%t|200][endmacro]
[macro name="fa"][fadeoutbgm time=%t|1500][endmacro]


; 環境音停止・フェードアウト
[macro name="enst"][fadeoutse buf=3 time=%t|200][endmacro]
[macro name="enfa"][fadeoutse buf=3 time=%t|1500][endmacro]


; すべての音声の終了させる
@macro name="stopvoice"
	@eval exp='stopAllVoices()'
@endmacro


; すべての音声の終了を待つ
@macro name="wv"
	[if exp='mp.loop === void']
		@wv loop=&'+gvolumeObj.volumeMenu.children[2].control[0]'
	[else]
		@ws buf=&'mp.loop' canskip=true
		@wv loop=&'+mp.loop + 1' cond='+mp.loop + 1 < kag.numSEBuffers'
	[endif]
@endmacro


;----------------------------------------------------------------------------------------
;■シナリオ進行関連

; [はーと]  ハート    [汗]  汗
[macro name="汗"][graph storage="char_ase" char=true alt="（汗）"][endmacro]
[macro name="はーと"][graph storage="char_heart" char=true alt="（はーと）"][endmacro]


; 改ページ
@macro name="k"
	@endhact
	@endindent
	@wait time=&'kag.textCounter * sf.mojisuuWait * 50' cond='kag.autoMode'
	[p]
	@call storage="macro.ks" target=*savepoint cond='f.saveEnabled'
	@wv cond='sf.bunshouSusumu'
	[cm]
	@layopt layer=8 visible=false
	@stopvoice cond='! sf.onseiNagasu && ! sf.bunshouSusumu'
@endmacro


; 自動改ページ（イベント用）
@macro name="auto"
	@endhact
	@endindent
	@wait time=%time
	@wv cond='sf.bunshouSusumu'
	[cm]
	@layopt layer=8 visible=false
	@stopvoice cond='! sf.onseiNagasu && ! sf.bunshouSusumu'
@endmacro


; リンクを作る
; f = 飛び先ファイル  l = 飛び先ラベル  exp = 追加で実行する式  n = 選択肢名
@macro name="select"
	@history output=false
	@cancelautomode cond='! sf.yomisusumiJizoku'
	@eval exp='mp.exp = "(" + mp.exp + "),"' cond='mp.exp !== void'
	@eval exp='mp.recName = "lnk_" + kag.currentRecordName + "_" + kag.current.numLinks'
	@eval exp='mp.exp += "sf.linkRecords[\"" + mp.recName + "\"]++, kag.current.clear()"'
	[link * storage=%f target=%l enterse=point clickse=click]
	[if exp='sf.linkRecords[mp.recName] >= 1']
		@font color=0xFFE0A0
	[else]
		@font color=0xE0E0FF
	[endif]
	@nowait
	　[emb exp='mp.n']　
	[endlink]　　
	@font color=default
	@endnowait
	@history output=true
@endmacro


; トラップ（クリックしたら指定のラベルにとぶ）
@macro name="trap"
	@eval exp='f.keyTrapStorage = mp.storage'
	@eval exp='f.keyTrapTarget = mp.target'
	@eval exp='f.keyTrapEnabled = true'
	@eval exp='kag.leftClickHook.add(trapHook), kag.keyDownHook.add(trapHook)'
@endmacro


; トラップ終了（ trap を使ったら必ず打つ）
@macro name="endtrap"
	@eval exp='f.keyTrapEnabled = false'
	@eval exp='kag.leftClickHook.remove(trapHook), kag.keyDownHook.remove(trapHook)'
@endmacro


; tjs 上からのユーザーの入力を待つ
; @waittrig だと kag.inStable = true にしないと入力を受け付けてくれないのでその対処をする
@macro name="waitinput"
	@eval exp='kag.inStable = true'
	@waittrig name=%name
	@eval exp='kag.inStable = false'
@endmacro


; ウェイト
[macro name="w05"][wait time= 500][endmacro]
[macro name="w1"][wait time=1000][endmacro]
[macro name="w2"][wait time=2000][endmacro]


; nowait, endnowait をシンプルに
[macro name="nw"][nowait][endmacro]
[macro name="/nw"][endnowait][endmacro]


; 色を付けて強調表示 yellow(デフォルト), green, red, blue = カラー
@macro name="b"
	@font color=0xFFFFA0
	@font color=0x80FF80 cond='+mp.green'
	@font color=0xFFC0C0 cond='+mp.red'
	@font color=0xC0FFFF cond='+mp.blue'
@endmacro

@macro name="/b"
	@font color=default
@endmacro


; ダッシュ
[macro name="――"]
[r cond='kag.current.relinexpos - kag.current.x < (2 - kag.current.marginRCh) * kag.current.fontSize']
[ch text="――"][endmacro]

[macro name="―――"]
[r cond='kag.current.relinexpos - kag.current.x < (3 - kag.current.marginRCh) * kag.current.fontSize']
[ch text="―――"][endmacro]

[macro name="――――"]
[r cond='kag.current.relinexpos - kag.current.x < (4 - kag.current.marginRCh) * kag.current.fontSize']
[ch text="――――"][endmacro]

[macro name="―――――"]
[r cond='kag.current.relinexpos - kag.current.x < (5 - kag.current.marginRCh) * kag.current.fontSize']
[ch text="―――――"][endmacro]

[macro name="――――――"]
[r cond='kag.current.relinexpos - kag.current.x < (6 - kag.current.marginRCh) * kag.current.fontSize']
[ch text="――――――"][endmacro]


; 簡易アニメスタート・ストップ
[macro name="anime"][animstart layer=%layer page=%page seg=%seg|1 target=*start][endmacro]
[macro name="stopanime"][animstop layer=%layer page=%page seg=%seg|1][endmacro]


; 飛ばせなくする・飛ばせるようにする
[macro name="skipoff"][clickskip enabled=false][endmacro]
[macro name="skipon"][clickskip enabled=true][endmacro]


; セーブ可能・不可能にする
@macro name="saveon"
	[if exp='! f.saveIsForbidden']
		@eval exp='f.saveEnabled = true'
		; @call storage="macro.ks" target=*savepoint cond='f.saveEnabled'
	[endif]
@endmacro

@macro name="saveoff"
	@eval exp='f.saveEnabled = false'
@endmacro


; すべてのレイヤ・設定等を初期化する
@macro name="allclear"
	@clickskip enabled=false
	@history output=false enabled=false
	@cancelskip
	@cancelautomode
	@fa cond='! +mp.keepbgm'
	@enst
	@sysbtnopt backvisible=false
	@layersopt layer=message0,message1,message2 page=back visible=false opacity=255 top=0 left=0
	@layersopt layer=0,1,2,3,4,5,6,7,8,9 page=back visible=false opacity=255 top=0 left=0
	@laycount layers=10
	@image storage=%f|0000 layer=0 page=back visible=true
	@trans method=crossfade time=%t|1000
	@wt
	[cm]
	@stopvoice
	@current layer=message0
	@eval exp='game.charaNumsByKagLayer = [,,,]'
@endmacro


;----------------------------------------------------------------------------------------
;■オプション関連

; ＣＧモード等に写真のボタンを並べる
@macro name="cgbtn"
	[locate x=&'+mp.x' y=&'+mp.y - 6'][graph storage=cgbox char=false]
	[if exp='mp.cnd !']
		[locate x=&'+mp.x + 9' y=&'+mp.y + 3'][graph storage=%t char=false]
		[locate x=&'+mp.x + 9' y=&'+mp.y + 9']
		[button enterse=point graphic=cgbtn target=%l]
	[endif]
@endmacro


; 回想モードに写真のボタンと説明を並べる
@macro name="repbtn"
	[locate x=&'+mp.x' y=&'+mp.y - 6'][graph storage=ksbox char=false]
	[if exp='mp.cnd !']
		[locate x=&'+mp.x + 4' y=&'+mp.y - 2'][graph storage=%t char=false]
		[locate x=&'+mp.x + 212' y=&'+mp.y +  5'][emb exp='mp.n.substr( 0, 10)']
		[locate x=&'+mp.x + 212' y=&'+mp.y + 27'][emb exp='mp.n.substr(10, 10)']
		[locate x=&'+mp.x + 212' y=&'+mp.y + 49'][emb exp='mp.n.substr(20, 10)']
		[locate x=&'+mp.x + 212' y=&'+mp.y + 71'][emb exp='mp.n.substr(30, 10)']
		[locate x=&'+mp.x + 4' y=&'+mp.y + 4']
		[button enterse=point graphic=cgbtn target=*run exp=&'"tf.kstorage=\"" + mp.f + "\",tf.klabel=\"" + mp.l + "\""']
	[endif]
@endmacro


;----------------------------------------------------------------------------------------
;■システム・デバッグ

; コンソールにメッセージを表示
@macro name="dm"
	@eval exp='dm(mp.n)'
@endmacro


;----------------------------------------------------------------------------------------
;■マクロ登録終了・シナリオへ戻る
@return




;=========================================================================================
; セーブロード実行のためのスクリプト
; ここのラベルを利用してセーブロードを行う

;■ロード実行
*load
@eval exp='tf.afterGameDataLoad = true'
@wait time=1000
@load place=&'tf.num'

;■セーブラベル  (ﾟ∀ﾟ)人(ﾟ∀ﾟ)いいとも～
*savepoint|
[if exp='tf.afterGameDataLoad']
	@eval exp='dm("データをロードしました・シナリオ中")'
	@eval exp='tf.afterGameDataLoad = false'
	@eval exp='game.coverScreen.visible = false'
	@eval exp='game.resetPrevForKag()'
	@eval exp='game.exitTravelMode()'
[endif]
@return


;■セーブ画面へのゲームからの入り口
*saveInGameMode

; セーブ量がさすがに多くなりすぎて画面が切り替わるのが遅くなるようになったので
; 先に背景だけ表示してしまう（ @wait time=1 で画面更新 ）
@wait time=1

; セーブ＆サムネイル作成。ここでウインドウはすでに消えている
*gameSaveFlg|ダンジョン画面セーブ

; セーブロード画面表示
[if exp='! tf.afterGameDataLoad']
	@eval exp='dm("データを一時保存しました")'
	@eval exp='game.saveWin.open()'
	[s]
[endif]

; ロードした後
@eval exp='dm("データをロードしました")'
@eval exp='game.coverScreen.visible = false'
@eval exp='tf.afterGameDataLoad = false'
@eval exp='game.onGameRestart(true)'
[s]
;=========================================================================================
