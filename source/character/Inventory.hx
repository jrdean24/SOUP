package character;

class Inventory
{
	public var carrots(default, null):Int;
	public var potatoes(default, null):Int;
	public var milk(default, null):Int;
	public var onions(default, null):Int;
	public var souperSpice(default, null):Int;
	public var redFlower(default, null):Int;
	public var yellowFlower(default, null):Int;

	public function new()
	{
		carrots = 0;
		potatoes = 0;
		milk = 0;
		onions = 0;
		souperSpice = 0;
		redFlower = 0;
		yellowFlower = 0;
	}

	public function addCarrots(changeBy:Int):Int
	{
		return carrots += changeBy;
	}

	public function consumeCarrots(changeBy:Int):Int
	{
		return carrots -= changeBy;
	}

	public function addPotatoes(changeBy:Int):Int
	{
		return potatoes += changeBy;
	}

	public function consumePotatoes(changeBy:Int):Int
	{
		return potatoes -= changeBy;
	}

	public function addMilk(changeBy:Int):Int
	{
		return milk += changeBy;
	}

	public function consumeMilk(changeBy:Int):Int
	{
		return milk -= changeBy;
	}

	public function addOnions(changeBy:Int):Int
	{
		return onions += changeBy;
	}

	public function consumeOnions(changeBy:Int):Int
	{
		return onions -= changeBy;
	}

	public function addSouperSpice(changeBy:Int):Int
	{
		return souperSpice += changeBy;
	}

	public function consumeSouperSpice(changeBy:Int):Int
	{
		return souperSpice -= changeBy;
	}

	public function addRedFlowers(changeBy:Int):Int
	{
		return redFlower += changeBy;
	}

	public function consumeRedFlowers(changeBy:Int):Int
	{
		return redFlower -= changeBy;
	}

	public function addYellowFlowers(changeBy:Int):Int
	{
		return yellowFlower += changeBy;
	}

	public function consumeYellowFlowers(changeBy:Int):Int
	{
		return yellowFlower -= changeBy;
	}
}
