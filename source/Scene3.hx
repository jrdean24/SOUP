package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Bush;
import item.Ingredient;
import item.Wall;

// Potato Field
class Scene3 extends FlxState
{
	var inventory:Inventory;

	var hero:character.Hero;
	var potatoes:FlxTypedGroup<item.Ingredient>;
	var bushes:FlxTypedGroup<item.Bush>;
	var potatoCount:Int = 0;
	var walls:FlxTypedGroup<item.Wall>;
	var returntoMap:FlxButtonPlus;
	var inventoryDisplayBox:Wall;
	var returnDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;

	// name to put into load graphics
	var potatoIcon:String = "assets/images/Potato.png";
	var bushPicture:String = "assets/images/bush.png";

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		// TODO: Add Walls Correctly
		/*walls = new FlxTypedGroup<item.Wall>();
			walls.add(new Wall(x, y, width, height));
			add(walls); */

		add(new FlxSprite(0, 0, "assets/images/potatoLocal.png"));

		potatoes = new FlxTypedGroup<item.Ingredient>();
		potatoes.add(new Ingredient(613, 719, potatoIcon));
		potatoes.add(new Ingredient(216, 664, potatoIcon));
		potatoes.add(new Ingredient(462, 765, potatoIcon));
		potatoes.add(new Ingredient(349, 423, potatoIcon));
		potatoes.add(new Ingredient(319, 550, potatoIcon));
		potatoes.add(new Ingredient(302, 269, potatoIcon));
		potatoes.add(new Ingredient(885, 371, potatoIcon));
		potatoes.add(new Ingredient(398, 345, potatoIcon));
		potatoes.add(new Ingredient(895, 695, potatoIcon));
		potatoes.add(new Ingredient(1113, 637, potatoIcon));
		potatoes.add(new Ingredient(340, 581, potatoIcon));
		potatoes.add(new Ingredient(855, 757, potatoIcon));
		potatoes.add(new Ingredient(280, 255, potatoIcon));
		potatoes.add(new Ingredient(448, 328, potatoIcon));
		potatoes.add(new Ingredient(666, 244, potatoIcon));
		potatoes.add(new Ingredient(323, 714, potatoIcon));
		potatoes.add(new Ingredient(313, 301, potatoIcon));
		potatoes.add(new Ingredient(1041, 340, potatoIcon));
		potatoes.add(new Ingredient(622, 568, potatoIcon));
		potatoes.add(new Ingredient(998, 558, potatoIcon));
		add(potatoes);

		bushes = new FlxTypedGroup<item.Bush>();
		bushes.add(new Bush(200, 250, bushPicture));
		bushes.add(new Bush(900, 600, bushPicture));
		bushes.add(new Bush(250, 400, bushPicture));
		bushes.add(new Bush(325, 600, bushPicture));
		bushes.add(new Bush(625, 550, bushPicture));
		bushes.add(new Bush(675, 350, bushPicture));
		add(bushes);

		hero = new Hero(50, 50);
		add(hero);

		inventoryDisplayBox = new Wall(1100, 0, 300, 300);
		inventoryDisplayBox.color = FlxColor.GRAY;
		carrotNum = new FlxText(1100, 20, 0, "Carrots: " + inventory.carrots, 24, true);
		potatoNum = new FlxText(1100, 50, 0, "Potatoes: " + inventory.potatoes, 24, true);
		onionNum = new FlxText(1100, 80, 0, "Milk: " + inventory.milk, 24, true);
		milkNum = new FlxText(1100, 110, 0, "Onions: " + inventory.onions, 24, true);
		souperSpiceNum = new FlxText(1100, 140, 0, "Souper Spice: " + inventory.souperSpice, 24, true);
		redFlowerNum = new FlxText(1100, 170, 0, "Red Flowers: " + inventory.redFlower, 24, true);
		yellowFlowerNum = new FlxText(1100, 200, 0, "Yellow Flowers: " + inventory.yellowFlower, 24, true);
		add(inventoryDisplayBox);
		add(potatoNum);
		add(onionNum);
		add(milkNum);
		add(souperSpiceNum);
		add(redFlowerNum);
		add(yellowFlowerNum);
		add(carrotNum);

		returnDisplayBox = new Wall(0, 0, 400, 70);
		returnDisplayBox.color = FlxColor.GRAY;
		add(returnDisplayBox);
		add(new FlxText(20, 20, 0, "Use 'R' to return to Map.", 24));
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	public function AddPotato(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		potatoCount++;
		inventory.addPotatoes(1);
		potatoNum.text = "Potatoes: " + inventory.potatoes;
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(potatoes, hero, AddPotato);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
