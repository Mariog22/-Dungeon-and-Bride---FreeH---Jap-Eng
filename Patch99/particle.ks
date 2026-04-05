@if exp="typeof(global.particle_object) == 'undefined'"
@iscript
const numParticles = 13;

class ParticleController extends Particle
{
	var moving = false; // タイマーが始動しているかどうか
	var lastTick;
	var slot;
	var offset_x = [];	// エミッターごとのオフセット値Ｘの配列
	var offset_y = [];	// エミッターごとのオフセット値Ｙの配列
	var curParticle;		// 現在読み込まれているパーティクルファイル名
	var loop = false;	// 繰り返すかどうか。繰り返す場合、必ず duration を指定する
	var duration = 0;	// 放出時間  なお loop = true の時は必ず指定する

	function ParticleController(index) {
		this.moving = false;
		this.slot = index;
	}

	function finalize() {
		stop(true);
	}

	function additionalLoad(filename)
	{
		// デフォルトでは読み込まれない設定値（オフセット）を .pee ファイルから読み込み
		offset_x = [];
		offset_y = [];
		var temp = [];
		temp.load(filename);
		var num = -1;
		for(var i = 0; i < temp.count; i++)
		{
			var str = temp[i];
			if(/\"name\"/.test(str)) num++;
			if(/\"offset_x\"/.test(str))
			{
				offset_x[num] = str.substring(str.indexOf(":") + 2, str.length - str.indexOf(":") - 3);
			}
			if(/\"offset_y\"/.test(str))
			{
				offset_y[num] = str.substring(str.indexOf(":") + 2, str.length - str.indexOf(":") - 3);
			}
		}
	}

	function load( filename ) {
		if( super.load( filename ) ) {
			additionalLoad(filename);	// 追加
			var c = super.count;
			for( var i = 0; i < c; i++ ) {
				var emitter = getEmitter(i);
				var tex = new Layer(kag, kag.primaryLayer);
				tex.loadImages(emitter.textureFileName);
				emitter.textureLayer = tex;
				invalidate tex;

				// オフセット値が設定ファイルに書かれていたら適用する
				// なぜかこの機能がなかったので自分で書いた…
				// 本当は duration も個別に設定したいんだけど
				// そもそもアクセスできないんじゃあきらめるしかないよね
				if(offset_x[i] !== void || offset_y[i] !== void)
				{
					emitter.setOffset(+offset_x[i], +offset_y[i]);
					dm("パーティクル " + slot + "  エミッター " + i + " のオフセットを ( "
					 + (+offset_x[i]) + " , " + (+offset_y[i]) + " ) に設定しました");
				}
			}
			return true;
		}
		return false;
	}

	function start(duration, loop = false) {
		if( moving ) { stop(true); }
		this.duration = duration;
		this.loop = loop;
		super.start(...);
		// ↑ これも間違ってますねｗ とりあえず直した
		// duration の単位は秒（ミリ秒じゃないので注意。少数は扱える）
		if( moving == false ) {
			lastTick = System.getTickCount();
			System.addContinuousHandler(handler);
			moving = true;
		}
	}

	function stop(force) {
		super.stop(force);
		if( moving && force ) {
			System.removeContinuousHandler(handler);
			moving = false;
			loop = false;
			onCompliteParticle();
		}
	}

	function onCompliteParticle() {
		if(loop) start(duration, true);
		else kag.trigger( "finish_particle_" + slot );
	}

	function handler(tick) {
		// ここがたまにパーティクル開始に失敗する原因になっていた
		// ハンドラを削除しないようにすれば失敗しないようになるが、その代わり終了時に
		// EAccessViolation がタイミングにより出てしまうことがあるのでできない
		// 対策として tick が０から進むまでハンドラを呼ばれても何もしないようにしてみた
		// さらに吉里吉里を閉じるときの対策も念のためやっといた ← これはやめるかも？
		// 以下推測
		// start が呼ばれて、パーティクルを開始させようとし、タイミングにより active == true になる前に
		// handler が呼ばれることがあって、その場合パーティクルが開始しないまま終了してしまう
		var interval = tick - lastTick;
		advanceTime(interval/1000.0);
		if( active != true && interval > 0) {
			System.removeContinuousHandler(handler);
			moving = false;
			onCompliteParticle();
		}
		lastTick = tick;
	}

	function setOffset(x, y)
	{
		// 後からオフセットを設定するとき設定ファイルのオフセット値も反映させる
		// スーパークラスは…もういいや 呼び出してもしょうがないし
		// super.setOffset(...);

		for(var i = 0; i < super.count; i++)
		{
			getEmitter(i).setOffset(+offset_x[i] + x, +offset_y[i] + y);
			dm("パーティクル " + slot + "  エミッター " + i + " のオフセットを ( "
				 + (+offset_x[i] + x) + " , " + (+offset_y[i] + y) + " ) に再設定しました");
		}
	}
}

// パーティクルプラグイン
class ParticlePlugin extends KAGPlugin
{
	var emitters;
	var curEmitElm;

	function ParticlePlugin()
	{
		super.KAGPlugin();
		emitters = new Array();
		for( var i = 0; i < numParticles; i++ ) {
			emitters[i] = new ParticleController(i);
		}
	}

	function finalize()
	{
		for( var i = 0; i < emitters.count; i++ ) {
			invalidate emitters[i];
		}
		super.finalize(...);
	}

	function start( layer, slot, storage, duration, loop )
	{
		if(! Storages.isExistentStorage(storage))
		{
			throw new Exception("パーティクル設定ファイル " + storage + " が見つかりません");
			return false;
		}
		try {
			if( emitters[slot].load( storage ) ) {
				if( duration > 0 ) {
					emitters[slot].start(duration, loop);	// 修正。…もしかしてわざとトラップを仕込んでる？
				} else {
					emitters[slot].start();
				}
				emitters[slot].opaque = layer.type == ltOpaque || layer.type == ltCoverRect;
				emitters[slot].targetLayer = layer;
			}
		} catch(e) {
			dm( e.message );
			return false;
		}
		return true;
	}

	function startparticle( elm )
	{
		if( elm.storage !== void ) {
			var layer = kag.getLayerFromElm(elm);
			var slot = 0;
			if( elm.slot !== void ) slot = +elm.slot;
			var duration = -1;
			if( elm.time !== void ) {
				duration = +elm.time / 1000;	// ＫＡＧでの属性値を time に変更
					// KAG との統一のためミリ秒で記述できるように変更
					// duration が０以下のときは永遠に続く
			}
			start( layer, slot, elm.storage + ".pee", duration, +elm.loop );
				// peeファイルを拡張子なしで読み込めるように変更

			// セーブロードに対応するため直近のパーティクル設定を記録しておく
			curEmitElm = %[];
			(Dictionary.assign incontextof curEmitElm)(elm);
		}
	}

	function stopparticle( elm )
	{
		var slot = 0;
		if( elm.slot !== void ) slot = +elm.slot;
		var force = false;
		if( elm.force !== void ) force = +elm.force;
			// ↑ 修正ｗ ここが間違ってたせいで謎の描画乱れにずっと悩まされ続けたｗｗｗｗ
			// いろいろ対策やったけど全部無駄だったｗｗｗｗｗｗｗ
		emitters[slot].stop(force);
		curEmitElm = void;
	}

	function waitstop( elm )
	{
		var slot = 0;
		if( elm.slot !== void ) slot = +elm.slot;
		elm["name"] = "finish_particle_" + slot;
		kag.waitTrigger( elm );
	}

	function isactive( elm )
	{
		var slot = 0;
		if( elm.slot !== void ) slot = +elm.slot;
		return emitters[slot].active;
	}

	function setoption( elm )
	{
		var slot = 0;
		if( elm.slot !== void ) slot = +elm.slot;

		if( elm.x !== void || elm.y !== void ) {
			emitters[slot].setOffset( +elm.x , +elm.y );
		}
		if( elm.seed !== void ) {
			emitters[slot].seed = +elm.seed;
		}
	}

	function clearEmit()
	{
		// パーティクルを全部止める
		for(var i = 0; i < emitters.count - 1; i++)
		{
			emitters[i].stop(true);
			emitters[i].curParticle = void;
		}
		curEmitElm = void;
	}

	function onStore(f, elm)
	{
		if(curEmitElm === void) return;
		f.emit = %[];
		(Dictionary.assign incontextof f.emit)(curEmitElm);
		dm("★パーティクル " + curEmitElm.storage + " を保存しました");
	}

	function onRestore(f, clear, elm)
	{
		clearEmit();
		if(f.emit === void) return;
		if(f.emit.storage == "PE_freeze")
		{
			dm("★エラー回避のためパーティクルを止めました   " + f.emit.storage);
			return;
		}
		startparticle(f.emit);
		dm("★パーティクル " + f.emit.storage + " を読み出しました");
	}
}

// プラグインオブジェクトを作成し、登録する
kag.addPlugin(global.particle_object = new ParticlePlugin());

@endscript
@endif


; マクロ

; パーティクル開始
; storage, slot, layer, page, time, skip, x, y  +  imageタグの属性値
@macro name="startemit"

	; いろいろやってみたけど duration は効果がよくわからない…
	; ↑ 解決した。元の particle.ks が間違ってただけ

	; 読み込むレイヤーを別にしてスロットも別にすれば同時に別々のパーティクルを表示できる

	; エミッターファイルのオフセット値は吉里吉里プラグインでは反映されないっぽい（すべて ( 0, 0 ) になる）
	; エミッターファイルを読み込んだ「後」でマクロを使ってオフセット値を変更することにする
	;（先にオフセットを変更してもエミッターを読み込んだときに ( 0, 0 ) にされてしまうので必ず後で）
	; 複数のオフセット値の違うエミッターを持つファイルを読み込んでも全部中央に集まってしまうので
	; その場合はエミッターごとに別ファイルに保存して別々に再生しなくてはならない
	; ↑ そもそも設定ファイルの各エミッターのオフセット値が反映されてないのが原因？
	; 現状ではエミッターにしてもパーティクルにしても setOffset を後から使う以外に
	; 設定する方法がないので以上の対策を取ることにする

	; ↑ ……という話だったが結局 particle.ks をいじって対策した
	; ディレイ以外は全部反映されるので pee エディタでじっくり調整しよう

	; 実行前にベース画像を読み込んでおくのを忘れないこと。
	; 画像サイズ等々を変更してもダメ。塗りつぶしてもダメ。とにかくベースになる画像を読み込まねばならない

	; なお公式によると、テクスチャサイズ(幅と高さ)は 2 の累乗値(2,4,8,16,32,64,128,256,512……)の時
	; 高速に処理されるようになっているらしい

	; パーティクルの内容によって（法則不明）一定時間以上放出を続けると吉里吉里本体もろとも落ちることがある
	; 色々試した結果、どうもパーティクルの「生存期間」と関連がある模様
	; duration に対し生存期間が多くなるように設定すると不具合を回避できる
	;（これも大体の目安であり、上回っていれば必ず回避できるわけではない。安全を見て若干多めに設定しておくこと）

	; なお、エディタでは設定できないが速度は 1000 くらいまでにはできる模様
	; .pee ファイルを直接編集して設定する

	;【重要】
	; .pee ファイル内のエミッター名に全角文字を使うと吉里吉里ではエラーが出て動かないので絶対に使わないこと
	; 単独なら emitter01 でなんら問題ないが、複数のエミッターを使うときはわかりやすくするため
	; 自分で名前を付けたくなるがその場合必ず半角英数字で。全角でも保存は出来てしまうがそれはＮＧ

	;【新たな不具合？】
	; エミッターすべてに delay を設定するとパーティクルが立ち上がらなくなる
	; 最低１つは delay を０にすること

	; 開始
	@eval exp='particle_object.startparticle(mp)'

	; あとから設定するオフセット。元のオフセット値に加算される
	@emitopt slot=%slot x=%x y=%y

	; 時間スキップの設定。立ち上がりが遅いパーティクルに適用する
	; でも、なんかよく分かんないけどスキップは効くときと効かないときがある
	@eval exp='particle_object.emitters[+mp.slot].advanceTime(+mp.skip / 1000)'

@endmacro


; シナリオ上での簡易パーティクル開始（トランジションは上手く機能しないので表ページだけ）
@macro name="emit"
	@image layer=%layer pos=%pos storage=PE_base visible=true left=0 top=0 opacity=255
	@particle *
@endmacro


; オフセット値などを変更
; slot, x, y, seed
@macro name="emitopt"
	@eval exp='particle_object.setoption(mp)'
@endmacro


; パーティクル終了
; slot, force
@macro name="stopemit"
	@eval exp='particle_object.stopparticle(mp)'
@endmacro


; パーティクルリセット
; layer
@macro name="clearemit"
	; パーティクルの内容によって同じレイヤーでの後の描画に不具合が残り続けることがある
	; パーティクル → パーティクル だと問題が起きない
	; パーティクル → ＫＡＧアニメーション だと問題が起きる
	; パーティクルを完全に終わらせる前にレイヤーに画像を読み込むと問題が起きる模様
	; 一見画面に何も見えなくてもまだ粒が生き残っていたりする事があるので
	; 同じレイヤーでＫＡＧアニメなどをするときは
	; stopparticle force=true などを用いて確実にパーティクルを終わらせておくようにすること
	@layopt layer=%layer visible=false left=0 top=0 opacity=255
	@stopemit slot=%slot force=true
	@freeimage layer=%layer
@endmacro


; パーティクル終了待ち
; slot, canskip
; ＫＡＧっぽく簡単に @wp とかにしようと思ったらすでにそういうタグがあったｗ
@macro name=we
	@wait time=1
	; ↑ パーティクルが始まってから最低でも１ミリ秒くらい経過しないとアクティブとみなされないっぽいので
	[if exp='particle_object.isactive(mp)']
		@waittrig name=&'"finish_particle_" + (mp.slot !== void ? mp.slot : "0")' canskip=%canskip|true
	[endif]
@endmacro

@return


＜メモ・反転パーティクルを作る際の修正項目＞

角度を左右反転
"emitter_angle": 放出角度
"start_rot": 初期回転量

符号を反転
"hor_amplitude": 水平振幅
"x_gravity": 横方向重力
"offset_x": オフセットＸ
"deg_per_sec": 角速度
"tan_acc": 接線加速度
