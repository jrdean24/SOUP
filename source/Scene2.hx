package;

import character.Hero;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import item.Ingredient;

class Scene2 extends FlxState
{
	var hero:character.Hero;
	var carrots:FlxTypedGroup<item.Ingredient>;
	var carrotTops:FlxTypedGroup<item.Ingredient>;

	// name to put into load graphics
	var carrotPicture:String = "carrotPicture";
	var glowingCarrotPicture:String = "glowingCarrotPicture";
	var carrotTopPicture:String = "carrotTopPicture";

	override public function create()
	{
		super.create();

		hero = new Hero(50, 50);
		add(hero);

		carrots = new FlxTypedGroup<item.Ingredient>();
		carrots.add(new Ingredient(100, 100, carrotPicture));
		carrots.add(new Ingredient(200, 100, carrotPicture));
		carrots.add(new Ingredient(300, 100, carrotPicture));
		carrots.add(new Ingredient(400, 100, carrotPicture));
		carrots.add(new Ingredient(500, 100, carrotPicture));
		carrots.add(new Ingredient(100, 200, carrotPicture));
		carrots.add(new Ingredient(200, 200, carrotPicture));
		carrots.add(new Ingredient(300, 200, carrotPicture));
		carrots.add(new Ingredient(400, 200, carrotPicture));
		carrots.add(new Ingredient(500, 200, carrotPicture));
		carrots.add(new Ingredient(100, 300, carrotPicture));
		carrots.add(new Ingredient(200, 300, carrotPicture));
		carrots.add(new Ingredient(300, 300, carrotPicture));
		carrots.add(new Ingredient(400, 300, carrotPicture));
		carrots.add(new Ingredient(500, 300, carrotPicture));
		add(carrots);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
