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
import item.Ingredient;
import item.Wall;

// Potato Field
class Scene3 extends FlxState
{
	var inventory:Inventory;

	var hero:character.Hero;
	var potatoes:FlxTypedGroup<item.Ingredient>;
	var potatoCount:Int = 0;
	var walls:FlxTypedGroup<item.Wall>;
	var returntoMap:FlxButtonPlus;
	var inventoryDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;

	// name to put into load graphics
	var potatoIcon:String = "assets/images/Potato.png";

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

		// TODO: Put Potatoes in correct places
		// TODO: Replace pototo.png with one without a background
		// TODO: Add Bushes

		potatoes = new FlxTypedGroup<item.Ingredient>();
		potatoes.add(new Ingredient(350, 450, potatoIcon));
		potatoes.add(new Ingredient(450, 450, potatoIcon));
		add(potatoes);

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

		returntoMap = new FlxButtonPlus(10, 10, backToMap, "Return to Map", 50, 50);
		add(returntoMap);
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
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
