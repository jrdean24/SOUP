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
	var milkCount:Int = 0;
	var milkNum:FlxText;
	var walls:FlxTypedGroup<item.Wall>;

	// name to put into load graphics
	var emptyPail:String = "assets/images/milkPail.png";
	var fullPail:String = "assets/images/fullMilkPail.png";

	override public function create()
	{
		super.create();

		// TODO: Add Walls Correctly
		/*walls = new FlxTypedGroup<item.Wall>();
			walls.add(new Wall(x, y, width, height));
			add(walls); */

		add(new FlxSprite(0, 0, "assets/images/Cows.png"));

		// TODO: Add Cows for interaction
		// TODO: Mouse capabilites
		// TODO: Location for putting pails when finished
		// TODO: Logic for getting milk

		hero = new Hero(50, 50);
		add(hero);

		milkNum = new flixel.text.FlxText(0, 20, 0, "Milk Bottles: " + milkCount, 24, true);
		add(milkNum);
	}

	public function AddCarrot(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		milkCount += 1;
		milkNum.text = "Milk Bottles: " + milkCount;
		add(milkNum);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
