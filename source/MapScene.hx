package;

import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Wall;

class MapScene extends FlxState
{
	var inventory:Inventory;

	var scene1Button:FlxButtonPlus;
	var scene2Button:FlxButtonPlus;
	var scene3Button:FlxButtonPlus;
	var scene4Button:FlxButtonPlus;
	var scene5Button:FlxButtonPlus;
	var scene6Button:FlxButtonPlus;

	var inventoryDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;

	var scene1Graphic:FlxSprite;
	var scene2Graphic:FlxSprite;
	var scene3Graphic:FlxSprite;
	var scene4Graphic:FlxSprite;
	var scene5Graphic:FlxSprite;
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

		/*scene1Graphic = new FlxSprite(0, 0);
			scene1Graphic.loadGraphic("assets/images/Pot.png");
			scene2Graphic = new FlxSprite(0, 0);
			scene2Graphic.loadGraphic("assets/images/Carrot.png");
			scene3Graphic = new FlxSprite(0, 0);
			scene3Graphic.loadGraphic("assets/images/Potato.png");
			scene4Graphic = new FlxSprite(0, 0);
			scene4Graphic.loadGraphic("assets/images/milk.png");
			scene5Graphic = new FlxSprite(0, 0);
			scene5Graphic.loadGraphic("assets/images/onion.png");
			scene6Graphic = new FlxSprite(0, 0);
			scene6Graphic.loadGraphic("assets/images/redflower.png"); */

		scene1Button = new FlxButtonPlus(100, 600, goToScene1, "Scene 1", 150, 150);
		add(scene1Button);
		scene2Button = new FlxButtonPlus(300, 600, goToScene2, "Scene 2", 150, 150);
		add(scene2Button);
		scene3Button = new FlxButtonPlus(500, 600, goToScene3, "Scene 3", 150, 150);
		add(scene3Button);
		scene4Button = new FlxButtonPlus(700, 600, goToScene4, "Scene 4", 150, 150);
		add(scene4Button);
		scene5Button = new FlxButtonPlus(900, 600, goToScene5, "Scene 5", 150, 150);
		add(scene5Button);
		scene6Button = new FlxButtonPlus(1100, 600, goToScene6, "Scene 6", 150, 150);
		add(scene6Button);

		/*scene1Button.loadButtonGraphic(scene1Graphic, scene1Graphic);
			scene2Button.loadButtonGraphic(scene2Graphic, scene2Graphic);
			scene3Button.loadButtonGraphic(scene3Graphic, scene3Graphic);
			scene4Button.loadButtonGraphic(scene4Graphic, scene4Graphic);
			scene5Button.loadButtonGraphic(scene5Graphic, scene5Graphic);
			scene6Button.loadButtonGraphic(scene6Graphic, scene6Graphic); */

		add(new FlxText(200, 500, 0, "Gather Ingredients, then return to Scene1.", 38));
		add(new FlxText(250, 550, 0, "Click a Scene to go to that location", 38));

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
	}

	private function goToScene1()
	{
		FlxG.switchState(new Scene1(inventory));
	}

	private function goToScene2()
	{
		FlxG.switchState(new Scene2(inventory));
	}

	private function goToScene3()
	{
		FlxG.switchState(new Scene3(inventory));
	}

	private function goToScene4()
	{
		FlxG.switchState(new Scene4(inventory));
	}

	private function goToScene5()
	{
		FlxG.switchState(new Scene5(inventory));
	}

	private function goToScene6()
	{
		FlxG.switchState(new Scene6(inventory));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
