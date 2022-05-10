package;

import character.Hero;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import item.Ingredient;
import item.Wall;

class Scene2 extends FlxState
{
	var hero:character.Hero;
	var potatoes:FlxTypedGroup<item.Ingredient>;
	var potatoCount:Int = 0;
	var potatoNum:FlxText;
	var walls:FlxTypedGroup<item.Wall>;

	// name to put into load graphics
	var potatoIcon:String = "assets/images/Potato.png";

	override public function create()
	{
		super.create();

		/*walls = new FlxTypedGroup<item.Wall>();
			walls.add(new Wall(x, y, width, height));
			add(walls); */

		add(new FlxSprite(0, 0, "assets/images/potatoLocal.png"));

		potatoes = new FlxTypedGroup<item.Ingredient>();
		potatoes.add(new Ingredient(350, 450, potatoIcon));
		potatoes.add(new Ingredient(450, 450, potatoIcon));
		add(potatoes);

		hero = new Hero(50, 50);
		add(hero);

		potatoNum = new flixel.text.FlxText(0, 20, 0, "Potatoes: " + potatoCount, 24, true);
		add(potatoNum);
	}

	public function AddPotato(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		potatoCount += 1;
		potatoNum.text = "Potatoes: " + potatoCount;
		add(potatoNum);
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(potatoes, hero, AddPotato);

		super.update(elapsed);
	}
}
