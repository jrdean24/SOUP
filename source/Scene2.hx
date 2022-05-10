package;

import character.Inventory;
import character.Hero;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import item.Ingredient;
import item.Wall;

// Carrot Farm
class Scene2 extends FlxState
{
	var inventory:Inventory;
	
	var hero:character.Hero;
	var carrots:FlxTypedGroup<item.Ingredient>;
	var glowcarrots:FlxTypedGroup<item.Ingredient>;
	var carrotCount:Int = 0;
	var carrotNum:FlxText;
	var currentStage:Int = 0;
	var walls:FlxTypedGroup<item.Wall>;

	// name to put into load graphics
	var carrotPicture:String = "assets/images/Carrot.png";
	var glowingCarrotTopPicture:String = "assets/images/glowingCarrotTop.png";
	var carrotTopPicture:String = "assets/images/carrotTop.png";

	public function new(incomingInventory:Inventory) {
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		/*walls = new FlxTypedGroup<item.Wall>();
			walls.add(new Wall(120, 140, 600, 80)); //top fence
			walls.add(new Wall(0, 0, 130, 200)); //top tree
			walls.add(new Wall(710, 0, FlxG.width - 710, 225)); //house1
			walls.add(new Wall(820, 195, FlxG.width - 770, 80)); //house2
			walls.add(new Wall(970, 250, 500, 200)); // hosue3
			walls.add(new Wall(1350, 750, 50, 150)); // bush
			walls.add(new Wall(130, 360, 30, 600)); // side fence
			walls.add(new Wall(120, FlxG.height - 100, 200, 60)); // bottom west fence
			walls.add(new Wall(400, FlxG.height - 100, 600, 60)); // bottom long fence
			walls.add(new Wall(960, FlxG.height - 150, 30, 110)); // east fence post
			walls.add(new Wall(FlxG.width - 100, 500, 100, 100)); // treestump
			walls.add(new Wall(0, FlxG.height - 450, 100, 350)); // bottom tree
			walls.add(new Wall(0, FlxG.height - 550, 30, 100)); // middle tree
			add(walls); */

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

		hero = new Hero(50, 50);
		add(hero);

		carrotNum = new flixel.text.FlxText(0, 20, 0, "Carrots: " + inventory.carrots, 24, true);
		add(carrotNum);
	}

	public function CarrotStage1()
	{
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
	}

	public function CarrotStage2()
	{
		carrots = new FlxTypedGroup<item.Ingredient>();
		glowcarrots = new FlxTypedGroup<item.Ingredient>();
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
		carrots = new FlxTypedGroup<item.Ingredient>();
		glowcarrots = new FlxTypedGroup<item.Ingredient>();
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

	public function ResetStage()
	{
		carrots.kill();
		glowcarrots.kill();
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

		// start the next stage when carrot count increases by 6.
		// causing issues because it is creating so many on top of each other. I am not sure how to avoid this... need to ask.
		// does the ResetStage function work here? It seems to...
		// how do i save the carrot count for a different state to use?
		// my glowing carrots aren't working...?

		if (carrotCount == 0 && currentStage == 0)
		{
			ResetStage();
			CarrotStage1();
			currentStage = 1;
		}
		else if (carrotCount == 6 && currentStage == 1)
		{
			ResetStage();
			CarrotStage2();
			currentStage = 2;
		}
		else if (carrotCount == 12)
		{
			ResetStage();
			CarrotStage3();
			currentStage = 3;
		}
		else if (carrotCount == 18)
		{
			ResetStage();
			currentStage = 4;
		}

		// TEMP code to return to map:
		if (FlxG.keys.justPressed.R) {
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
