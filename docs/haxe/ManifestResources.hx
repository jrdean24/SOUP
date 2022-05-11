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

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y28:assets%2Fimages%2FCarrot.pngR2i3852R3y5:IMAGER5R7R6tgoR0y32:assets%2Fimages%2FcarrotFarm.pngR2i2295106R3R8R5R9R6tgoR0y31:assets%2Fimages%2FcarrotTop.pngR2i5341R3R8R5R10R6tgoR0y26:assets%2Fimages%2FCows.pngR2i1884252R3R8R5R11R6tgoR0y34:assets%2Fimages%2FfullMilkPail.pngR2i9791R3R8R5R12R6tgoR0y38:assets%2Fimages%2FglowingCarrotTop.pngR2i17553R3R8R5R13R6tgoR0y30:assets%2Fimages%2FheroEast.pngR2i5411R3R8R5R14R6tgoR0y31:assets%2Fimages%2FheroLarge.pngR2i48690R3R8R5R15R6tgoR0y31:assets%2Fimages%2FheroNorth.pngR2i5270R3R8R5R16R6tgoR0y31:assets%2Fimages%2FheroSouth.pngR2i5519R3R8R5R17R6tgoR0y30:assets%2Fimages%2FheroWest.pngR2i5974R3R8R5R18R6tgoR0y26:assets%2Fimages%2Fmilk.pngR2i2925R3R8R5R19R6tgoR0y30:assets%2Fimages%2FmilkPail.pngR2i9800R3R8R5R20R6tgoR0y27:assets%2Fimages%2Fonion.pngR2i4256R3R8R5R21R6tgoR0y31:assets%2Fimages%2FOnionGirl.pngR2i7446R3R8R5R22R6tgoR0y36:assets%2Fimages%2FOnionGirlLarge.pngR2i102925R3R8R5R23R6tgoR0y25:assets%2Fimages%2FPot.pngR2i10537R3R8R5R24R6tgoR0y28:assets%2Fimages%2FPotato.pngR2i4118R3R8R5R25R6tgoR0y36:assets%2Fimages%2FSouper%20Spice.pngR2i3213R3R8R5R26R6tgoR0y34:assets%2Fimages%2FSoupLocation.pngR2i2032991R3R8R5R27R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R28R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R29R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR31y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R30R5y28:flixel%2Fsounds%2Fflixel.mp3R32aR34y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R33R32aR31R33hgoR2i33629R3R36R5R35R32aR34R35hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R37R38y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R8R5R43R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R8R5R44R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_carrot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_carrotfarm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_carrottop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cows_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_fullmilkpail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_glowingcarrottop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_heroeast_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_herolarge_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_heronorth_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_herosouth_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_herowest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_milk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_milkpail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_onion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_oniongirl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_oniongirllarge_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_potato_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_souper_spice_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_souplocation_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
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

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/Carrot.png") @:noCompletion #if display private #end class __ASSET__assets_images_carrot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/carrotFarm.png") @:noCompletion #if display private #end class __ASSET__assets_images_carrotfarm_png extends lime.graphics.Image {}
@:keep @:image("assets/images/carrotTop.png") @:noCompletion #if display private #end class __ASSET__assets_images_carrottop_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Cows.png") @:noCompletion #if display private #end class __ASSET__assets_images_cows_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fullMilkPail.png") @:noCompletion #if display private #end class __ASSET__assets_images_fullmilkpail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/glowingCarrotTop.png") @:noCompletion #if display private #end class __ASSET__assets_images_glowingcarrottop_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroEast.png") @:noCompletion #if display private #end class __ASSET__assets_images_heroeast_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroLarge.png") @:noCompletion #if display private #end class __ASSET__assets_images_herolarge_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroNorth.png") @:noCompletion #if display private #end class __ASSET__assets_images_heronorth_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroSouth.png") @:noCompletion #if display private #end class __ASSET__assets_images_herosouth_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroWest.png") @:noCompletion #if display private #end class __ASSET__assets_images_herowest_png extends lime.graphics.Image {}
@:keep @:image("assets/images/milk.png") @:noCompletion #if display private #end class __ASSET__assets_images_milk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/milkPail.png") @:noCompletion #if display private #end class __ASSET__assets_images_milkpail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/onion.png") @:noCompletion #if display private #end class __ASSET__assets_images_onion_png extends lime.graphics.Image {}
@:keep @:image("assets/images/OnionGirl.png") @:noCompletion #if display private #end class __ASSET__assets_images_oniongirl_png extends lime.graphics.Image {}
@:keep @:image("assets/images/OnionGirlLarge.png") @:noCompletion #if display private #end class __ASSET__assets_images_oniongirllarge_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Pot.png") @:noCompletion #if display private #end class __ASSET__assets_images_pot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Potato.png") @:noCompletion #if display private #end class __ASSET__assets_images_potato_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Souper Spice.png") @:noCompletion #if display private #end class __ASSET__assets_images_souper_spice_png extends lime.graphics.Image {}
@:keep @:image("assets/images/SoupLocation.png") @:noCompletion #if display private #end class __ASSET__assets_images_souplocation_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
