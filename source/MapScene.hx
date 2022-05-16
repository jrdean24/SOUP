package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Wall;

class MapScene extends FlxState
{
	var inventory:Inventory;

	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var milkNum:FlxText;
	var onionNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;
	var inventoryDisplayBox:Wall;

	var hero:character.Hero;
	var walls:FlxTypedGroup<item.Wall>;

	var SoupScreenGraphic:FlxSprite;
	var CarrotFieldGraphic:FlxSprite;
	var PotatoFieldGraphic:FlxSprite;
	var MilkBarnGraphic:FlxSprite;
	var GeneralStoreGraphic:FlxSprite;
	var scene6Graphic:FlxSprite;

	public function new(?incomingInventory:Inventory)
	{
		super();
		if (incomingInventory == null)
		{
			inventory = new Inventory();
		}
		else
		{
			inventory = incomingInventory;
		}
	}

	override public function create()
	{
		super.create();

		walls = new FlxTypedGroup<item.Wall>();
		walls.add(new Wall(0, 0, 1400, 1)); // top border
		walls.add(new Wall(0, 0, 1, 1000)); // east border
		walls.add(new Wall(1400, 0, 1, 1000)); // bottom border
		walls.add(new Wall(0, 1000, 1400, 1)); // Bottom Border
		add(walls);

		SoupScreenGraphic = new FlxSprite(100, 700);
		SoupScreenGraphic.loadGraphic("assets/images/Pot.png", false, 150, 150);
		CarrotFieldGraphic = new FlxSprite(300, 700);
		CarrotFieldGraphic.loadGraphic("assets/images/Carrot.png", false, 150, 150);
		PotatoFieldGraphic = new FlxSprite(500, 700);
		PotatoFieldGraphic.loadGraphic("assets/images/Potato.png", false, 150, 150);
		MilkBarnGraphic = new FlxSprite(700, 700);
		MilkBarnGraphic.loadGraphic("assets/images/milk.png", false, 150, 150);
		GeneralStoreGraphic = new FlxSprite(900, 700);
		GeneralStoreGraphic.loadGraphic("assets/images/onion.png", false, 150, 150);
		scene6Graphic = new FlxSprite(1100, 700);
		scene6Graphic.loadGraphic("assets/images/redflower.png", false, 150, 150);
		add(SoupScreenGraphic);
		add(CarrotFieldGraphic);
		add(PotatoFieldGraphic);
		add(MilkBarnGraphic);
		add(GeneralStoreGraphic);
		add(scene6Graphic);

		add(new FlxText(200, 500, 0, "Gather Ingredients, then return to Campfire.", 38));
		add(new FlxText(250, 550, 0, "Walk to a Location to go to there", 38));

		inventoryDisplayBox = new Wall(1090, 0, 300, 250);
		inventoryDisplayBox.color = FlxColor.GRAY;
		carrotNum = new FlxText(1100, 20, 0, "Carrots: " + inventory.carrots, 24, true);
		potatoNum = new FlxText(1100, 50, 0, "Potatoes: " + inventory.potatoes, 24, true);
		milkNum = new FlxText(1100, 80, 0, "Milk Bottle: " + inventory.milk, 24, true);
		onionNum = new FlxText(1100, 110, 0, "Onions: " + inventory.onions, 24, true);
		souperSpiceNum = new FlxText(1100, 140, 0, "Souper Spice: " + inventory.souperSpice, 24, true);
		redFlowerNum = new FlxText(1100, 170, 0, "Red Flowers: " + inventory.redFlower, 24, true);
		yellowFlowerNum = new FlxText(1100, 200, 0, "Yellow Flowers: " + inventory.yellowFlower, 24, true);
		add(inventoryDisplayBox);
		add(carrotNum);
		add(potatoNum);
		add(milkNum);
		add(onionNum);
		add(souperSpiceNum);
		add(redFlowerNum);
		add(yellowFlowerNum);

		hero = new Hero(50, 250);
		add(hero);
	}

	private function goToSoupScreen(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new SoupScreen(inventory));
	}

	private function goToCarrotField(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new CarrotField(inventory));
	}

	private function goToPotatoField(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new PotatoField(inventory));
	}

	private function goToMilkBarn(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new MilkBarn(inventory));
	}

	private function goToGeneralStore(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new GeneralStore(inventory));
	}

	private function goToScene6(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene6(inventory));
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(SoupScreenGraphic, hero, goToSoupScreen);
		FlxG.overlap(CarrotFieldGraphic, hero, goToCarrotField);
		FlxG.overlap(PotatoFieldGraphic, hero, goToPotatoField);
		FlxG.overlap(MilkBarnGraphic, hero, goToMilkBarn);
		FlxG.overlap(GeneralStoreGraphic, hero, goToGeneralStore);
		FlxG.overlap(scene6Graphic, hero, goToScene6);
		FlxG.collide(hero, walls);

		super.update(elapsed);
	}
}
