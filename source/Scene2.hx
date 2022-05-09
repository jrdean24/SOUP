package;

import character.Hero;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import item.Ingredient;

class Scene2 extends FlxState
{
	var hero:character.Hero;
	var carrots:FlxTypedGroup<item.Ingredient>;
	var carrotTops:FlxTypedGroup<item.Ingredient>;

	// name to put into load graphics
	var carrotPicture:String = "assets/images/Carrot.png";
	var glowingCarrotPicture:String = "assets/images/glowingCarrotTop.png";
	var carrotTopPicture:String = "assets/images/carrotTop.png";

	override public function create()
	{
		super.create();

		add(new FlxSprite(0, 0, "assets/images/carrotFarm.png"));

		hero = new Hero(50, 50);
		add(hero);

		carrots = new FlxTypedGroup<item.Ingredient>();
		carrots.add(new Ingredient(350, 450, carrotTopPicture));
		carrots.add(new Ingredient(450, 450, carrotTopPicture));
		carrots.add(new Ingredient(550, 450, carrotTopPicture));
		carrots.add(new Ingredient(650, 450, carrotTopPicture));
		carrots.add(new Ingredient(750, 450, carrotTopPicture));
		carrots.add(new Ingredient(350, 600, carrotTopPicture));
		carrots.add(new Ingredient(450, 600, carrotTopPicture));
		carrots.add(new Ingredient(550, 600, carrotTopPicture));
		carrots.add(new Ingredient(650, 600, carrotTopPicture));
		carrots.add(new Ingredient(750, 600, carrotTopPicture));
		carrots.add(new Ingredient(350, 750, carrotTopPicture));
		carrots.add(new Ingredient(450, 750, carrotTopPicture));
		carrots.add(new Ingredient(550, 750, carrotTopPicture));
		carrots.add(new Ingredient(650, 750, carrotTopPicture));
		carrots.add(new Ingredient(750, 750, carrotTopPicture));
		add(carrots);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
