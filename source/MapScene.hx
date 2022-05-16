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
	var blueFlowerNum:FlxText;
	var inventoryDisplayBox:Wall;

	var hero:character.Hero;
	var walls:FlxTypedGroup<item.Wall>;
	var returnDisplayBox:Wall;

	var SoupScreenGraphic:FlxSprite;
	var CarrotFieldGraphic:FlxSprite;
	var PotatoFieldGraphic:FlxSprite;
	var MilkBarnGraphic:FlxSprite;
	var GeneralStoreGraphic:FlxSprite;
	var FlowerInstructionFieldGraphic:FlxSprite;

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
		walls.add(new Wall(0, 0, 1400, 70)); // top border
		walls.add(new Wall(0, 0, 1, 1000)); // east border
		walls.add(new Wall(1400, 0, 1, 1000)); // bottom border
		walls.add(new Wall(0, 1000, 1400, 1)); // Bottom Border
		add(walls);

		add(new FlxSprite(0, 0, "assets/images/Map.png"));

		SoupScreenGraphic = new FlxSprite(1100, 770);
		SoupScreenGraphic.loadGraphic("assets/images/Pot_Map_Icon.png", false, 150, 150);
		CarrotFieldGraphic = new FlxSprite(850, 350);
		CarrotFieldGraphic.loadGraphic("assets/images/Carrot_Map_Icon.png", false, 150, 150);
		PotatoFieldGraphic = new FlxSprite(570, 650);
		PotatoFieldGraphic.loadGraphic("assets/images/Potato_Map_Icon.png", false, 150, 150);
		MilkBarnGraphic = new FlxSprite(1170, 200);
		MilkBarnGraphic.loadGraphic("assets/images/Milk_Map_Icon.png", false, 150, 150);
		GeneralStoreGraphic = new FlxSprite(370, 120);
		GeneralStoreGraphic.loadGraphic("assets/images/Onion_Map_Icon.png", false, 150, 150);
		FlowerInstructionFieldGraphic = new FlxSprite(100, 450);
		FlowerInstructionFieldGraphic.loadGraphic("assets/images/Flower_Map_Icon.png", false, 150, 150);
		add(SoupScreenGraphic);
		add(CarrotFieldGraphic);
		add(PotatoFieldGraphic);
		add(MilkBarnGraphic);
		add(GeneralStoreGraphic);
		add(FlowerInstructionFieldGraphic);

		returnDisplayBox = new Wall(0, 0, 1400, 70);
		returnDisplayBox.color = FlxColor.GRAY;
		add(returnDisplayBox);
		add(new FlxSprite(425, 10, "assets/images/Carrot.png"));
		add(new FlxSprite(540, 10, "assets/images/Potato.png"));
		add(new FlxSprite(655, 10, "assets/images/milk.png"));
		add(new FlxSprite(770, 10, "assets/images/onion.png"));
		add(new FlxSprite(885, 10, "assets/images/souperSpice.png"));
		add(new FlxSprite(1000, 10, "assets/images/redFlowerIcon.png"));
		add(new FlxSprite(1115, 10, "assets/images/yellowFlowerIcon.png"));
		add(new FlxSprite(1230, 10, "assets/images/blueFlowerIcon.png"));
		carrotNum = new FlxText(475, 20, 0, " " + inventory.carrots, 24, true);
		potatoNum = new FlxText(590, 20, 0, " " + inventory.potatoes, 24, true);
		milkNum = new FlxText(705, 20, 0, " " + inventory.milk, 24, true);
		onionNum = new FlxText(820, 20, 0, " " + inventory.onions, 24, true);
		souperSpiceNum = new FlxText(935, 20, 0, " " + inventory.souperSpice, 24, true);
		redFlowerNum = new FlxText(1050, 20, 0, " " + inventory.redFlower, 24, true);
		yellowFlowerNum = new FlxText(1165, 20, 0, " " + inventory.yellowFlower, 24, true);
		blueFlowerNum = new FlxText(1280, 20, 0, " " + inventory.blueFlower, 24, true);
		add(inventoryDisplayBox);
		add(carrotNum);
		add(potatoNum);
		add(milkNum);
		add(onionNum);
		add(souperSpiceNum);
		add(redFlowerNum);
		add(yellowFlowerNum);
		add(blueFlowerNum);

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

	private function goToFlowerInstructionField(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new FlowerInstructionField(inventory));
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(SoupScreenGraphic, hero, goToSoupScreen);
		FlxG.overlap(CarrotFieldGraphic, hero, goToCarrotField);
		FlxG.overlap(PotatoFieldGraphic, hero, goToPotatoField);
		FlxG.overlap(MilkBarnGraphic, hero, goToMilkBarn);
		FlxG.overlap(GeneralStoreGraphic, hero, goToGeneralStore);
		FlxG.overlap(FlowerInstructionFieldGraphic, hero, goToFlowerInstructionField);
		FlxG.collide(hero, walls);

		super.update(elapsed);
	}
}
