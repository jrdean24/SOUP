package;

import character.Hero;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import item.Wall;

class Scene4 extends FlxState
{
	var hero:character.Hero;
	var carrotCount:Int = 0;
	var carrotNum:FlxText;
	var walls:FlxTypedGroup<item.Wall>;

	// name to put into load graphics
	var carrotPicture:String = "assets/images/Carrot.png";

	override public function create()
	{
		super.create();

		/*walls = new FlxTypedGroup<item.Wall>();
			walls.add(new Wall(x, y, width, height));
			add(walls); */

		add(new FlxSprite(0, 0, "assets/images/Cows.png"));

		hero = new Hero(50, 50);
		add(hero);

		carrotNum = new flixel.text.FlxText(0, 20, 0, "Carrots: " + carrotCount, 24, true);
		add(carrotNum);
	}

	public function AddCarrot(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		carrotCount += 1;
		carrotNum.text = "Carrots: " + carrotCount;
		add(carrotNum);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
