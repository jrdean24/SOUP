package character;

class Inventory 
{
    public var carrots(default, null):Int;
    public var potatoes(default, null):Int;

    public function new() {
        carrots = 0;
        potatoes = 0;
    }

    public function addCarrots(changeBy:Int):Int {
        return carrots += changeBy;
    }

    public function consumeCarrots(changeBy:Int):Int {
        return carrots -= changeBy;
    }
}