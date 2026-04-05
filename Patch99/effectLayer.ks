; effectLayer.ks
; 演出で使うレイヤー等を作成


@iscript
//==============================================================================

class EffectLayer extends AnimationLayer
{
	// 演出用のレイヤーを作成。move やトランジション、アニメ、パーティクルが使える
	var id;
	var notStore = false;	// 情報をセーブロードするかどうか

	function EffectLayer(par, id)
	{
		super.AnimationLayer(par.window, par);
		name = "演出用レイヤー " + id;
		this.id = id;
		hitThreshold = 256;
	}

	function finalize()
	{
		super.finalize();
	}

	function loadImages(elm)
	{
		// 巨大ファイル読み込み時に起こるエラー対策
		// 画像の読み込みに失敗したら何もしないようにする
		try
		{
			super.loadImages(elm);
		}
		catch(e)
		{
			dm("ファイルの読み込みに失敗しました  " + elm.storage);
			elm.storage = "dummy";
			elm.key = void;
			elm.clipwidth = void;
			elm.clipheight = void;
			super.loadImages(elm);
		}
	}

	function startAnim(elm)
	{
		// 巨大ファイル読み込み時に起こるエラー対策
		// アニメ情報が読み込まれていないならなにもしない
		if(Anim_storageName == "")
		{
			dm("アニメ情報は読み込まれていません");
			return;
		}
		super.startAnim(elm);
	}

	function loadcell(elm)
	{
		// 巨大ファイル読み込み時に起こるエラー対策
		// 画像の読み込みに失敗したら何もしないようにする
		try
		{
			super.loadcell(elm);
		}
		catch(e)
		{
			dm("セル画像の読み込みに失敗しました  " + elm.storage);
			Anim_storageName = "";
		}
		return 0;
	}

	function atEndOfTransition(src, withchildren, exchange)
	{
		// トランジション終了時になにかする時はこれを継承する
		assignImages(src);

		// 情報を入れ替える
		// absolute だけは親レイヤを入れ替えると変な値になるので丁寧に代入する
		var orderTemp = absolute;
		var srcOrderTemp = src.absolute;
		parent <-> src.parent;
		visible <-> src.visible;
		left <-> src.left;
		top <-> src.top;
		absolute = orderTemp;
		src.absolute = srcOrderTemp;
		// absolute だけはトランジションをしても値が入れ替わらない仕様らしい
		// 親レイヤを入れ替える前の値をそのまま代入する
	}

	function clear()
	{
		type = ltAlpha;
		face = dfAlpha;
		setImageSize(width, height);
		clearAnim();
		Anim_loadParams = void;
		Anim_partialImageInfo = void;
		fillRect(0, 0, width, height, 0);
	}
}

class EffectLayerPlugin extends KAGPlugin
{
	// 演出用レイヤープラグインクラス

	var numLayers = 11;	// レイヤー数

	function EffectLayerPlugin()
	{
		super.KAGPlugin();
		kag.effects = [];
		for(var i = 0; i < numLayers; i++)
		{
			kag.effects[i] = new EffectLayer(kag._primaryLayer, i);
			kag.effects[i].clear();
			if(i >= 3) kag.effects[i].absolute = 100 * (i - 1);
		}
		kag.effects[0].absolute = -100;
		kag.effects[1].absolute = -50;
		kag.effects[2].absolute = -1;
	}

	function finalize()
	{
		for(var i = 0; i < numLayers; i++) invalidate kag.effects[i];
		super.finalize();
	}

	function onStore(f, elm)
	{
		f.effectLayers = [];
		for(var i = 0; i < numLayers; i++)
		{
			if(kag.effects[i].notStore) continue;
			f.effectLayers[i] = kag.effects[i].store();
		}
	}

	function onRestore(f, clear, elm)
	{
		if(f.effectLayers === void) return;
		for(var i = 0; i < numLayers; i++)
		{
			if(f.effectLayers[i] === void) continue;
			if(kag.effects[i].notStore) continue;
			kag.effects[i].restore(f.effectLayers[i]);
		}
	}
}

// 作成
kag.addPlugin(global.effectLayer_object = new EffectLayerPlugin());

//==============================================================================
@endscript
@return
