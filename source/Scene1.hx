package;

import character.Inventory;
import character.Hero;
import flixel.FlxSprite;
import flixel.FlxState;
import item.Ingredient;

// Soup Location
class Scene1 extends FlxState
{
	var inventory:Inventory;
	var hero:character.Hero;
	var pot:item.Ingredient;

	public function new(incomingInventory:Inventory) {
		super();
		inventory = incomingInventory;
	}
	
	override public function create()
	{
		super.create();

		// TODO: Add Walls

		add(new FlxSprite(0, 0, AssetPaths.SoupLocation__png));

		pot = new Ingredient(655, 400, AssetPaths.Pot__png);
		add(pot);

		// TODO: Add Recipee Card to give instructions

		hero = new Hero(50, 50);
		add(hero);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
