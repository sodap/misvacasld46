package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_series_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy27:assets%2Fdata%2Flevel0.jsony4:sizei1160y4:typey4:TEXTy2:idR1y7:preloadtgoR0y27:assets%2Fdata%2Flevel1.jsonR2i1064R3R4R5R7R6tgoR0y27:assets%2Fdata%2Flevel2.jsonR2i1164R3R4R5R8R6tgoR0y27:assets%2Fdata%2Flevel3.jsonR2i1066R3R4R5R9R6tgoR0y27:assets%2Fdata%2Flevel4.jsonR2i1481R3R4R5R10R6tgoR0y27:assets%2Fdata%2Flevel5.jsonR2i1076R3R4R5R11R6tgoR0y27:assets%2Fdata%2Flevel6.jsonR2i1183R3R4R5R12R6tgoR0y27:assets%2Fdata%2Flevel7.jsonR2i2106R3R4R5R13R6tgoR0y29:assets%2Fdata%2FmisVacas.ogmoR2i3361R3R4R5R14R6tgoR2i23440R3y4:FONTy9:classNamey32:__ASSET__assets_fonts_series_ttfR5y27:assets%2Ffonts%2FSERIES.TTFR6tgoR0y29:assets%2Ffonts%2Fseries12.fntR2i10913R3R4R5R19R6tgoR0y31:assets%2Ffonts%2Fseries12_0.pngR2i4984R3y5:IMAGER5R20R6tgoR0y29:assets%2Ffonts%2Fseries18.fntR2i10843R3R4R5R22R6tgoR0y31:assets%2Ffonts%2Fseries18_0.pngR2i4940R3R21R5R23R6tgoR0y29:assets%2Ffonts%2Fseries32.fntR2i10958R3R4R5R24R6tgoR0y31:assets%2Ffonts%2Fseries32_0.pngR2i7178R3R21R5R25R6tgoR0y36:assets%2Ffonts%2FseriesBitmap32.bmfcR2i771R3R4R5R26R6tgoR0y35:assets%2Ffonts%2FseriesBitmap32.fntR2i10964R3R4R5R27R6tgoR0y37:assets%2Ffonts%2FseriesBitmap32_0.pngR2i141R3R21R5R28R6tgoR0y34:assets%2Fimages%2Fbanditshadow.pngR2i3485R3R21R5R29R6tgoR0y35:assets%2Fimages%2Fbanditstrip48.pngR2i5728R3R21R5R30R6tgoR0y34:assets%2Fimages%2Fbloodstrip24.pngR2i4068R3R21R5R31R6tgoR0y28:assets%2Fimages%2Fbullet.pngR2i3490R3R21R5R32R6tgoR0y35:assets%2Fimages%2Fbulletstrip24.pngR2i3594R3R21R5R33R6tgoR0y31:assets%2Fimages%2Fcowcorpse.pngR2i3829R3R21R5R34R6tgoR0y31:assets%2Fimages%2Fcowshadow.pngR2i3486R3R21R5R35R6tgoR0y32:assets%2Fimages%2Fcowstrip48.pngR2i5562R3R21R5R36R6tgoR0y30:assets%2Fimages%2Femptycow.pngR2i3513R3R21R5R37R6tgoR0y28:assets%2Fimages%2Fending.pngR2i4176R3R21R5R38R6tgoR0y34:assets%2Fimages%2Fexitbutton56.pngR2i4457R3R21R5R39R6tgoR0y26:assets%2Fimages%2Fgame.pngR2i5881R3R21R5R40R6tgoR0y30:assets%2Fimages%2Fgameover.pngR2i6702R3R21R5R41R6tgoR0y25:assets%2Fimages%2Fgun.pngR2i3573R3R21R5R42R6tgoR0y32:assets%2Fimages%2Fgunstrip48.pngR2i4122R3R21R5R43R6tgoR0y34:assets%2Fimages%2FheroPortrait.pngR2i3624R3R21R5R44R6tgoR0y32:assets%2Fimages%2Fheroshadow.pngR2i3534R3R21R5R45R6tgoR0y33:assets%2Fimages%2Fherostrip48.pngR2i5680R3R21R5R46R6tgoR0y31:assets%2Fimages%2Fhowtoplay.pngR2i9313R3R21R5R47R6tgoR0y36:assets%2Fimages%2Fhowtoplaystrip.pngR2i10180R3R21R5R48R6tgoR0y37:assets%2Fimages%2Fletsgobutton107.pngR2i5871R3R21R5R49R6tgoR0y33:assets%2Fimages%2Fmousecursor.pngR2i3618R3R21R5R50R6tgoR0y35:assets%2Fimages%2Fstartbutton76.pngR2i5463R3R21R5R51R6tgoR0y27:assets%2Fimages%2Ftitle.pngR2i9306R3R21R5R52R6tgoR0y32:assets%2Fimages%2Ftitlestrip.pngR2i9440R3R21R5R53R6tgoR0y33:assets%2Fimages%2Ftryagain125.pngR2i6192R3R21R5R54R6tgoR0y25:assets%2Fimages%2Fwin.pngR2i7329R3R21R5R55R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R56R6tgoR2i7500R3y5:SOUNDR5y28:assets%2Fsounds%2FClick1.wavy9:pathGroupaR58hR6tgoR2i1448R3R57R5y28:assets%2Fsounds%2FClick2.wavR59aR60hR6tgoR2i338864R3R57R5y34:assets%2Fsounds%2FComplete%201.wavR59aR61hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%201.wavR59aR62hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%202.wavR59aR63hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%203.wavR59aR64hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%204.wavR59aR65hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%205.wavR59aR66hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%206.wavR59aR67hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%207.wavR59aR68hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%208.wavR59aR69hR6tgoR2i88244R3R57R5y33:assets%2Fsounds%2FDisparo%209.wavR59aR70hR6tgoR2i29444R3R57R5y44:assets%2Fsounds%2FDisparo%20Bandidos%201.wavR59aR71hR6tgoR2i29444R3R57R5y44:assets%2Fsounds%2FDisparo%20Bandidos%202.wavR59aR72hR6tgoR2i29444R3R57R5y44:assets%2Fsounds%2FDisparo%20Bandidos%203.wavR59aR73hR6tgoR2i409708R3R57R5y37:assets%2Fsounds%2FGame%20Over%201.wavR59aR74hR6tgoR2i1218420R3R57R5y37:assets%2Fsounds%2FGame%20Over%202.wavR59aR75hR6tgoR2i30004R3R57R5y26:assets%2Fsounds%2Fhit1.wavR59aR76hR6tgoR2i31382R3R57R5y26:assets%2Fsounds%2Fhit2.wavR59aR77hR6tgoR2i71356R3R57R5y29:assets%2Fsounds%2FLetters.wavR59aR78hR6tgoR2i30926R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_1.wavR59aR79hR6tgoR2i36910R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_10.wavR59aR80hR6tgoR2i36326R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_11.wavR59aR81hR6tgoR2i36024R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_12.wavR59aR82hR6tgoR2i59348R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_13.wavR59aR83hR6tgoR2i45576R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_14.wavR59aR84hR6tgoR2i50424R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_15.wavR59aR85hR6tgoR2i47812R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_16.wavR59aR86hR6tgoR2i35402R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_17.wavR59aR87hR6tgoR2i19648R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_18.wavR59aR88hR6tgoR2i20782R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_19.wavR59aR89hR6tgoR2i34886R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_2.wavR59aR90hR6tgoR2i18384R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_20.wavR59aR91hR6tgoR2i28664R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_21.wavR59aR92hR6tgoR2i14650R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_22.wavR59aR93hR6tgoR2i15630R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_23.wavR59aR94hR6tgoR2i26478R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_24.wavR59aR95hR6tgoR2i26924R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_25.wavR59aR96hR6tgoR2i27456R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_26.wavR59aR97hR6tgoR2i16166R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_27.wavR59aR98hR6tgoR2i25130R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_28.wavR59aR99hR6tgoR2i32964R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_29.wavR59aR100hR6tgoR2i36548R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_3.wavR59aR101hR6tgoR2i30590R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_30.wavR59aR102hR6tgoR2i47650R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_31.wavR59aR103hR6tgoR2i37842R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_32.wavR59aR104hR6tgoR2i27440R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_33.wavR59aR105hR6tgoR2i26560R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_34.wavR59aR106hR6tgoR2i24600R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_35.wavR59aR107hR6tgoR2i21646R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_36.wavR59aR108hR6tgoR2i19586R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_37.wavR59aR109hR6tgoR2i28462R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_38.wavR59aR110hR6tgoR2i23300R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_39.wavR59aR111hR6tgoR2i28296R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_4.wavR59aR112hR6tgoR2i28224R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_40.wavR59aR113hR6tgoR2i19868R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_41.wavR59aR114hR6tgoR2i13182R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_42.wavR59aR115hR6tgoR2i19458R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_43.wavR59aR116hR6tgoR2i20480R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_44.wavR59aR117hR6tgoR2i27992R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_45.wavR59aR118hR6tgoR2i15812R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_46.wavR59aR119hR6tgoR2i18918R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_47.wavR59aR120hR6tgoR2i20192R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_48.wavR59aR121hR6tgoR2i21120R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_49.wavR59aR122hR6tgoR2i30998R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_5.wavR59aR123hR6tgoR2i18896R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_50.wavR59aR124hR6tgoR2i21558R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_51.wavR59aR125hR6tgoR2i17090R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_52.wavR59aR126hR6tgoR2i13138R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_53.wavR59aR127hR6tgoR2i15438R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_54.wavR59aR128hR6tgoR2i19432R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_55.wavR59aR129hR6tgoR2i25912R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_56.wavR59aR130hR6tgoR2i53486R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_57.wavR59aR131hR6tgoR2i40602R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_58.wavR59aR132hR6tgoR2i25302R3R57R5y39:assets%2Fsounds%2Fmuerte_bandido_59.wavR59aR133hR6tgoR2i24806R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_6.wavR59aR134hR6tgoR2i20550R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_7.wavR59aR135hR6tgoR2i20398R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_8.wavR59aR136hR6tgoR2i19876R3R57R5y38:assets%2Fsounds%2Fmuerte_bandido_9.wavR59aR137hR6tgoR2i160846R3R57R5y36:assets%2Fsounds%2Fmuerte_larga_1.wavR59aR138hR6tgoR2i30774R3R57R5y35:assets%2Fsounds%2Fmuerte_vaca_1.wavR59aR139hR6tgoR2i74302R3R57R5y35:assets%2Fsounds%2Fmuerte_vaca_2.wavR59aR140hR6tgoR2i93002R3R57R5y35:assets%2Fsounds%2Fmuerte_vaca_3.wavR59aR141hR6tgoR2i51234R3R57R5y35:assets%2Fsounds%2Fmuerte_vaca_4.wavR59aR142hR6tgoR2i61372R3R57R5y35:assets%2Fsounds%2Fmuerte_vaca_5.wavR59aR143hR6tgoR2i217512R3R57R5y33:assets%2Fsounds%2FPerfect%202.wavR59aR144hR6tgoR2i203052R3R57R5y29:assets%2Fsounds%2FPerfect.wavR59aR145hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R146R6tgoR2i21332R3R57R5y27:assets%2Fsounds%2Fstep1.wavR59aR147hR6tgoR2i16506R3R57R5y27:assets%2Fsounds%2Fstep2.wavR59aR148hR6tgoR2i22146R3R57R5y27:assets%2Fsounds%2Fstep3.wavR59aR149hR6tgoR2i18132R3R57R5y27:assets%2Fsounds%2Fstep4.wavR59aR150hR6tgoR2i14214R3R57R5y27:assets%2Fsounds%2Fstep5.wavR59aR151hR6tgoR2i20298R3R57R5y27:assets%2Fsounds%2Fstep6.wavR59aR152hR6tgoR2i16950R3R57R5y27:assets%2Fsounds%2Fstep7.wavR59aR153hR6tgoR2i18218R3R57R5y27:assets%2Fsounds%2Fstep8.wavR59aR154hR6tgoR2i62702R3R57R5y28:assets%2Fsounds%2Fvaca_1.wavR59aR155hR6tgoR2i55886R3R57R5y28:assets%2Fsounds%2Fvaca_2.wavR59aR156hR6tgoR2i94080R3R57R5y28:assets%2Fsounds%2Fvaca_3.wavR59aR157hR6tgoR2i57056R3R57R5y28:assets%2Fsounds%2Fvaca_4.wavR59aR158hR6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R59aR160y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R159R5y28:flixel%2Fsounds%2Fflixel.mp3R59aR162y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R57R5R161R59aR160R161hgoR2i33629R3R57R5R163R59aR162R163hgoR2i15744R3R15R16y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R15R16y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R21R5R168R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R21R5R169R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level0_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level2_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level3_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level4_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level5_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level6_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level7_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_misvacas_ogmo extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_series_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_series12_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_series12_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_series18_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_series18_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_series32_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_series32_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_seriesbitmap32_bmfc extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_seriesbitmap32_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_seriesbitmap32_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_banditshadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_banditstrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bloodstrip24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bulletstrip24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cowcorpse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cowshadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cowstrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_emptycow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ending_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_exitbutton56_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_game_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gunstrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_heroportrait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_heroshadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_herostrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_howtoplay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_howtoplaystrip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_letsgobutton107_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mousecursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_startbutton76_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_titlestrip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tryagain125_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_win_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_click1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_click2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_complete_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_5_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_6_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_7_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_8_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_9_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_game_over_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_game_over_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_hit1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_hit2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_letters_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_10_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_11_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_12_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_13_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_14_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_15_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_16_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_17_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_18_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_19_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_20_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_21_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_22_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_23_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_24_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_25_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_26_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_27_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_28_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_29_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_30_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_31_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_32_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_33_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_34_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_35_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_36_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_37_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_38_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_39_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_40_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_41_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_42_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_43_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_44_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_45_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_46_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_47_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_48_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_49_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_5_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_50_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_51_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_52_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_53_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_54_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_55_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_56_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_57_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_58_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_59_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_6_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_7_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_8_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_9_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_larga_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_5_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_perfect_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_perfect_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step5_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step6_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step7_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step8_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/level0.json") @:noCompletion #if display private #end class __ASSET__assets_data_level0_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level1.json") @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level2.json") @:noCompletion #if display private #end class __ASSET__assets_data_level2_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level3.json") @:noCompletion #if display private #end class __ASSET__assets_data_level3_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level4.json") @:noCompletion #if display private #end class __ASSET__assets_data_level4_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level5.json") @:noCompletion #if display private #end class __ASSET__assets_data_level5_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level6.json") @:noCompletion #if display private #end class __ASSET__assets_data_level6_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level7.json") @:noCompletion #if display private #end class __ASSET__assets_data_level7_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/misVacas.ogmo") @:noCompletion #if display private #end class __ASSET__assets_data_misvacas_ogmo extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/SERIES.TTF") @:noCompletion #if display private #end class __ASSET__assets_fonts_series_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/series12.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_series12_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/series12_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_series12_0_png extends lime.graphics.Image {}
@:keep @:file("assets/fonts/series18.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_series18_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/series18_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_series18_0_png extends lime.graphics.Image {}
@:keep @:file("assets/fonts/series32.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_series32_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/series32_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_series32_0_png extends lime.graphics.Image {}
@:keep @:file("assets/fonts/seriesBitmap32.bmfc") @:noCompletion #if display private #end class __ASSET__assets_fonts_seriesbitmap32_bmfc extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/seriesBitmap32.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_seriesbitmap32_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/seriesBitmap32_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_seriesbitmap32_0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/banditshadow.png") @:noCompletion #if display private #end class __ASSET__assets_images_banditshadow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/banditstrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_banditstrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bloodstrip24.png") @:noCompletion #if display private #end class __ASSET__assets_images_bloodstrip24_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bulletstrip24.png") @:noCompletion #if display private #end class __ASSET__assets_images_bulletstrip24_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cowcorpse.png") @:noCompletion #if display private #end class __ASSET__assets_images_cowcorpse_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cowshadow.png") @:noCompletion #if display private #end class __ASSET__assets_images_cowshadow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cowstrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_cowstrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/emptycow.png") @:noCompletion #if display private #end class __ASSET__assets_images_emptycow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ending.png") @:noCompletion #if display private #end class __ASSET__assets_images_ending_png extends lime.graphics.Image {}
@:keep @:image("assets/images/exitbutton56.png") @:noCompletion #if display private #end class __ASSET__assets_images_exitbutton56_png extends lime.graphics.Image {}
@:keep @:image("assets/images/game.png") @:noCompletion #if display private #end class __ASSET__assets_images_game_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gameover.png") @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gun.png") @:noCompletion #if display private #end class __ASSET__assets_images_gun_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gunstrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_gunstrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroPortrait.png") @:noCompletion #if display private #end class __ASSET__assets_images_heroportrait_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroshadow.png") @:noCompletion #if display private #end class __ASSET__assets_images_heroshadow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/herostrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_herostrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/howtoplay.png") @:noCompletion #if display private #end class __ASSET__assets_images_howtoplay_png extends lime.graphics.Image {}
@:keep @:image("assets/images/howtoplaystrip.png") @:noCompletion #if display private #end class __ASSET__assets_images_howtoplaystrip_png extends lime.graphics.Image {}
@:keep @:image("assets/images/letsgobutton107.png") @:noCompletion #if display private #end class __ASSET__assets_images_letsgobutton107_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mousecursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_mousecursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/startbutton76.png") @:noCompletion #if display private #end class __ASSET__assets_images_startbutton76_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:keep @:image("assets/images/titlestrip.png") @:noCompletion #if display private #end class __ASSET__assets_images_titlestrip_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tryagain125.png") @:noCompletion #if display private #end class __ASSET__assets_images_tryagain125_png extends lime.graphics.Image {}
@:keep @:image("assets/images/win.png") @:noCompletion #if display private #end class __ASSET__assets_images_win_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Click1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_click1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Click2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_click2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Complete 1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_complete_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 5.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 6.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_6_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 7.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_7_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 8.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_8_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo 9.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_9_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo Bandidos 1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo Bandidos 2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo Bandidos 3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Game Over 1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_game_over_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Game Over 2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_game_over_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hit1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_hit1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hit2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_hit2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Letters.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_letters_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_10.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_10_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_11.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_11_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_12.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_12_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_13.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_13_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_14.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_14_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_15.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_15_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_16.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_16_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_17.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_17_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_18.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_18_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_19.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_19_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_20.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_20_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_21.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_21_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_22.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_22_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_23.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_23_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_24.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_24_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_25.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_25_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_26.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_26_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_27.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_27_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_28.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_28_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_29.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_29_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_30.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_30_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_31.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_31_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_32.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_32_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_33.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_33_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_34.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_34_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_35.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_35_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_36.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_36_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_37.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_37_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_38.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_38_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_39.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_39_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_40.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_40_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_41.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_41_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_42.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_42_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_43.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_43_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_44.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_44_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_45.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_45_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_46.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_46_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_47.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_47_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_48.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_48_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_49.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_49_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_5.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_50.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_50_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_51.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_51_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_52.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_52_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_53.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_53_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_54.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_54_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_55.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_55_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_56.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_56_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_57.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_57_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_58.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_58_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_59.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_59_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_6.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_6_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_7.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_7_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_8.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_8_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_9.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_9_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_larga_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_larga_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_5.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Perfect 2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_perfect_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Perfect.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_perfect_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step5.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step6.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step6_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step7.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step7_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step8.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_step8_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_4_wav extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_series_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_series_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/SERIES"; #else ascender = 833; descender = -177; height = 1010; numGlyphs = 95; underlinePosition = -125; underlineThickness = 17; unitsPerEM = 1000; #end name = "SeriesOrbit"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_series_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_series_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_series_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_series_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_series_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_series_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
