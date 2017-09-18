package;

import flixel.FlxSprite;
import flixel.FlxState;

/**
 * ...
 * @author ninjaMuffin
 */
class SlotState extends FlxState 
{
	private var _slots:FlxSprite;
	
	override public function create():Void 
	{
		_slots = new FlxSprite(0, 0);
		_slots.loadGraphic("assets/images/slots.png", true, 640, 480);
		add(_slots);
		
		_slots.animation.add("spin", [0, 1, 2], 16);
		_slots.animation.play("spin");
		
		super.create();
	}
}