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

// Carrot Farm
class Scene2 extends FlxState
{
	var inventory:Inventory;

	var inventoryDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;

	var returntoMap:FlxButtonPlus;
	var hero:character.Hero;
	var carrots:FlxTypedGroup<item.Ingredient>;
	var glowcarrots:FlxTypedGroup<item.Ingredient>;
	var carrotCount:Int = 0;

	var walls:FlxTypedGroup<item.Wall>;
	var stageNum:Int = 1;

	// name to put into load graphics
	var carrotPicture:String = "assets/images/Carrot.png";
	var glowingCarrotTopPicture:String = "assets/images/glowingCarrotTop.png";
	var carrotTopPicture:String = "assets/images/carrotTop.png";

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		walls = new FlxTypedGroup<item.Wall>();
		walls.add(new Wall(120, 140, 600, 80)); // top fence
		walls.add(new Wall(0, 0, 130, 200)); // top tree
		walls.add(new Wall(710, 0, FlxG.width - 710, 225)); // house1
		walls.add(new Wall(820, 195, FlxG.width - 770, 80)); // house2
		walls.add(new Wall(970, 250, 500, 200)); // hosue3
		walls.add(new Wall(1350, 750, 50, 150)); // bush
		walls.add(new Wall(130, 360, 30, 600)); // side fence
		walls.add(new Wall(120, FlxG.height - 100, 200, 60)); // bottom west fence
		walls.add(new Wall(400, FlxG.height - 100, 600, 60)); // bottom long fence
		walls.add(new Wall(960, FlxG.height - 150, 30, 110)); // east fence post
		walls.add(new Wall(FlxG.width - 100, 500, 100, 100)); // treestump
		walls.add(new Wall(0, FlxG.height - 450, 100, 350)); // bottom tree
		walls.add(new Wall(0, FlxG.height - 550, 30, 100)); // middle tree
		add(walls);

		add(new FlxSprite(0, 0, "assets/images/carrotFarm.png"));

		carrots = new FlxTypedGroup<item.Ingredient>();
		glowcarrots = new FlxTypedGroup<item.Ingredient>();
		carrots.add(new Ingredient(350, 450, carrotTopPicture));
		carrots.add(new Ingredient(450, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(550, 450, glowingCarrotTopPicture));
		glowcarrots.add(new Ingredient(650, 450, glowingCarrotTopPicture));
		carrots.add(new Ingredient(750, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(350, 600, glowingCarrotTopPicture));
		carrots.add(new Ingredient(450, 600, carrotTopPicture));
		carrots.add(new Ingredient(550, 600, carrotTopPicture));
		carrots.add(new Ingredient(650, 600, carrotTopPicture));
		glowcarrots.add(new Ingredient(750, 600, glowingCarrotTopPicture));
		carrots.add(new Ingredient(350, 750, carrotTopPicture));
		carrots.add(new Ingredient(450, 750, carrotTopPicture));
		glowcarrots.add(new Ingredient(550, 750, glowingCarrotTopPicture));
		carrots.add(new Ingredient(650, 750, carrotTopPicture));
		glowcarrots.add(new Ingredient(750, 750, glowingCarrotTopPicture));
		add(carrots);
		add(glowcarrots);

		hero = new Hero(50, 250);
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

	public function CarrotStage1()
	{
		carrots.add(new Ingredient(350, 450, carrotTopPicture));
		carrots.add(new Ingredient(450, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(550, 450, glowingCarrotTopPicture));
		glowcarrots.add(new Ingredient(650, 450, glowingCarrotTopPicture));
		carrots.add(new Ingredient(750, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(350, 600, glowingCarrotTopPicture));
		carrots.add(new Ingredient(450, 600, carrotTopPicture));
		carrots.add(new Ingredient(550, 600, carrotTopPicture));
		carrots.add(new Ingredient(650, 600, carrotTopPicture));
		glowcarrots.add(new Ingredient(750, 600, glowingCarrotTopPicture));
		carrots.add(new Ingredient(350, 750, carrotTopPicture));
		carrots.add(new Ingredient(450, 750, carrotTopPicture));
		glowcarrots.add(new Ingredient(550, 750, glowingCarrotTopPicture));
		carrots.add(new Ingredient(650, 750, carrotTopPicture));
		glowcarrots.add(new Ingredient(750, 750, glowingCarrotTopPicture));
		add(carrots);
		add(glowcarrots);
	}

	public function CarrotStage2()
	{
		glowcarrots.add(new Ingredient(350, 450, glowingCarrotTopPicture));
		carrots.add(new Ingredient(450, 450, carrotTopPicture));
		carrots.add(new Ingredient(550, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(650, 450, glowingCarrotTopPicture));
		carrots.add(new Ingredient(750, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(350, 600, glowingCarrotTopPicture));
		carrots.add(new Ingredient(450, 600, carrotTopPicture));
		carrots.add(new Ingredient(550, 600, carrotTopPicture));
		carrots.add(new Ingredient(650, 600, carrotTopPicture));
		glowcarrots.add(new Ingredient(750, 600, glowingCarrotTopPicture));
		carrots.add(new Ingredient(350, 750, carrotTopPicture));
		glowcarrots.add(new Ingredient(450, 750, glowingCarrotTopPicture));
		carrots.add(new Ingredient(550, 750, carrotTopPicture));
		glowcarrots.add(new Ingredient(650, 750, glowingCarrotTopPicture));
		carrots.add(new Ingredient(750, 750, carrotTopPicture));
		add(carrots);
		add(glowcarrots);
	}

	public function CarrotStage3()
	{
		carrots.add(new Ingredient(350, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(450, 450, glowingCarrotTopPicture));
		carrots.add(new Ingredient(550, 450, carrotTopPicture));
		carrots.add(new Ingredient(650, 450, carrotTopPicture));
		glowcarrots.add(new Ingredient(750, 450, glowingCarrotTopPicture));
		carrots.add(new Ingredient(350, 600, carrotTopPicture));
		glowcarrots.add(new Ingredient(450, 600, glowingCarrotTopPicture));
		glowcarrots.add(new Ingredient(550, 600, glowingCarrotTopPicture));
		glowcarrots.add(new Ingredient(650, 600, glowingCarrotTopPicture));
		carrots.add(new Ingredient(750, 600, carrotTopPicture));
		glowcarrots.add(new Ingredient(350, 750, glowingCarrotTopPicture));
		carrots.add(new Ingredient(450, 750, carrotTopPicture));
		carrots.add(new Ingredient(550, 750, carrotTopPicture));
		carrots.add(new Ingredient(650, 750, carrotTopPicture));
		carrots.add(new Ingredient(750, 750, carrotTopPicture));
		add(carrots);
		add(glowcarrots);
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	public function ResetStage()
	{
		carrots.forEach((carrot:Ingredient) -> carrot.kill());
		glowcarrots.forEach((carrot:Ingredient) -> carrot.kill());
	}

	public function AddCarrot(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		carrotCount++;
		inventory.addCarrots(1);
		carrotNum.text = "Carrots: " + inventory.carrots;
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(glowcarrots, hero, AddCarrot);
		FlxG.collide(hero, walls);

		if (carrotCount == 0 && stageNum == 1)
		{
			ResetStage();
			CarrotStage1();
			stageNum = 2;
		}
		else if (carrotCount == 6 && stageNum == 2)
		{
			ResetStage();
			CarrotStage2();
			stageNum = 3;
		}
		else if (carrotCount == 12 && stageNum == 3)
		{
			ResetStage();
			CarrotStage3();
			stageNum == 4;
		}
		else if (carrotCount == 18)
		{
			ResetStage();
		}

		super.update(elapsed);
	}
}
