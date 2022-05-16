package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Ingredient;
import item.Wall;

// Instruction Flower Field
class FlowerInstructionField extends FlxState
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
	var returnDisplayBox:Wall;
	var walls:FlxTypedGroup<Wall>;

	var hero:Hero;
	var redFlowers:FlxTypedGroup<Ingredient>;
	var yellowFlowers:FlxTypedGroup<Ingredient>;
	var randomXLocation:Float = 0;
	var randomYLocation:Float = 0;
	var recipeeIcon:Wall;

	var recipeeText:FlxText;
	var recipeeTextBox:Wall;

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		walls = new FlxTypedGroup<item.Wall>();
		walls.add(new Wall(0, 0, 1400, 100)); // top border
		walls.add(new Wall(0, 0, 100, 1000)); // east border
		walls.add(new Wall(0, 900, 1400, 100)); // bottom border
		walls.add(new Wall(1300, 0, 100, 1000)); // west Border
		walls.add(new Wall(850, 900, 600, 100)); // bottom border pt2
		add(walls);

		add(new FlxSprite(0, 0, "assets/images/Potato_Field.png"));

		for (i in 0...50)
		{
			randomizeLocation();
			add(new Ingredient(randomXLocation, randomYLocation, "assets/images/Red_Flower.png"));
		}
		for (i in 0...50)
		{
			randomizeLocation();
			add(new Ingredient(randomXLocation, randomYLocation, "assets/images/Yellow_Flower.png"));
		}
		for (i in 0...50)
		{
			randomizeLocation();
			add(new Ingredient(randomXLocation, randomYLocation, "assets/images/Blue_Flower.png"));
		}

		recipeeIcon = new Wall(675, 475, 50, 50);
		add(recipeeIcon);

		recipeeTextBox = new Wall(300, 300, 700, 600);
		recipeeTextBox.color = FlxColor.GRAY;

		recipeeText = new FlxText(325, 325, 650, " ", 24);

		hero = new Hero(50, 50);
		add(hero);

		returnDisplayBox = new Wall(0, 0, 1400, 70);
		returnDisplayBox.color = FlxColor.GRAY;
		add(returnDisplayBox);
		add(new FlxText(20, 20, 0, "Use 'R' to return to Map.", 24));

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
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	private function randomizeLocation()
	{
		randomXLocation = FlxG.random.float(100, 1200);
		randomYLocation = FlxG.random.float(100, 800);
	}

	private function DisplayRecipee(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		add(recipeeTextBox);
		add(recipeeText);
		recipeeText.text = "Souper Soup Reicpee:  
							18 Carrots
							17 Potatoes
							4 Bottles of Milk
							9 Onions
							3 Parts Souper Spice
							Gather Ingredients and add to the pot to make the Souper Soup and become a Souper Chef!
							Enter to Exit";
		if (FlxG.keys.justPressed.ENTER)
		{
			recipeeTextBox.kill();
			recipeeText.kill();
		}
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(hero, walls);
		FlxG.overlap(hero, recipeeIcon, DisplayRecipee);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}
		super.update(elapsed);
	}
}
