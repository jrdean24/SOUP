package;

import character.Hero;
import character.Inventory;
import character.NPC;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Ingredient;
import item.Wall;

// Onion Shop
class Scene5 extends FlxState
{
	var inventory:Inventory;
	var returntoMap:FlxButtonPlus;
	var returnDisplayBox:Wall;
	var inventoryDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;
	var onionGal:NPC;
	var hero:Hero;
	var checkoutCounterBox:Wall;
	var talkBox:Wall;
	var yellowFlowerTrade:Ingredient;
	var redFlowerTrade:Ingredient;
	var beginConversationText:FlxText;
	var dia1:FlxText;
	var dia2:FlxText;
	var endConversation:FlxText;
	var notEnoughRedFlowers:FlxText;
	var notEnoughYellowFlowers:FlxText;

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		checkoutCounterBox = new Wall(600, 0, 500, 400);
		add(checkoutCounterBox);

		talkBox = new Wall(550, 200, 50, 100);
		talkBox.color = FlxColor.GRAY;
		add(talkBox);

		onionGal = new NPC(700, 200, "assets/images/OnionGirl.png");
		add(onionGal);

		yellowFlowerTrade = new Ingredient(900, 600, "assets/images/yellowFlower.png");
		add(yellowFlowerTrade);

		redFlowerTrade = new Ingredient(900, 500, "assets/images/redFlower.png");
		add(redFlowerTrade);

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

		notEnoughRedFlowers = new FlxText(50, 700, 0, "", 24);
		add(notEnoughRedFlowers);
		notEnoughYellowFlowers = new FlxText(50, 750, 0, "", 24);
		add(notEnoughYellowFlowers);

		beginConversationText = new FlxText(50, 800, 0, "", 24);
		add(beginConversationText);
		dia1 = new FlxText(50, 850, 0, "", 24);
		add(dia1);
		dia2 = new FlxText(50, 900, 0, "", 24);
		add(dia2);
		endConversation = new FlxText(50, 950, 0, "", 24);
		add(endConversation);
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	public function BeginDialogue(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		beginConversationText.text = "Hello! Welcome to the General Store!";
		dia1.text = "To trade 27 Red Flowers for 9 Onions, go to the Red Flower";
		dia2.text = "To Trade 81 Yellow Flowers for 3 Souper Spice, go to the Yellow Flower.";
		endConversation.text = "Thanks for your business!";
	}

	public function RedFlowerForOnion(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		if (inventory.redFlower >= 27)
		{
			inventory.consumeRedFlowers(27);
			inventory.addOnions(9);
			onionNum.text = "Onions: " + inventory.onions;
			redFlowerNum.text = "Red Flowers: " + inventory.redFlower;
		}
		else
		{
			notEnoughRedFlowers.text = "Sorry, you don't have enough Red Flowers Yet";
		}
	}

	public function YellowFlowerForSouperSpice(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		if (inventory.yellowFlower >= 81)
		{
			inventory.consumeYellowFlowers(81);
			inventory.addSouperSpice(3);
			souperSpiceNum.text = "Souper Spice: " + inventory.souperSpice;
			yellowFlowerNum.text = "Yellow Flowers: " + inventory.yellowFlower;
		}
		else
		{
			notEnoughYellowFlowers.text = "Sorry, you don't have enough Yellow Flowers Yet";
		}
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(talkBox, hero, BeginDialogue);
		FlxG.collide(hero, checkoutCounterBox);
		FlxG.overlap(redFlowerTrade, hero, RedFlowerForOnion);
		FlxG.overlap(yellowFlowerTrade, hero, YellowFlowerForSouperSpice);

		if (FlxG.keys.justReleased.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
