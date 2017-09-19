package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class SlotState extends FlxState 
{
	private var _slots:FlxSprite;
	
	private var slot0:Array<String> = ["You", "I hope you"];
	private var slot1:Array<String> = ["Are", "Do"];
	private var slot2:Array<String> = Text._adjText;
	
	private var _slot0Text:FlxText;
	private var _slot1Text:FlxText;
	private var _slot2Text:FlxText;
	
	private var _spinning:Bool = false;
	
	
	override public function create():Void 
	{
		var fontSize:Int = 20;
		var yPos:Float = 295;
		var TextColor:FlxColor = FlxColor.BLACK;
		
		_slots = new FlxSprite(0, 0);
		_slots.loadGraphic("assets/images/slots.png", true, 640, 480);
		add(_slots);
		
		_slots.animation.add("spin", [0, 1, 2], 16);
		_slots.animation.play("spin");
		
		
		_slot0Text = new FlxText(0, yPos, 0, "Press", fontSize);
		_slot1Text = new FlxText(0, yPos + fontSize, 0, "", fontSize);
		_slot2Text = new FlxText(0, yPos + fontSize * 2, 0, "Space", fontSize);
		
		_slot0Text.color = TextColor;
		_slot1Text.color = TextColor;
		_slot2Text.color = TextColor;
		
		_slot0Text.screenCenter(X);
		_slot1Text.screenCenter(X);
		_slot2Text.screenCenter(X);
		
		
		
		add(_slot0Text);
		add(_slot1Text);
		add(_slot2Text);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		if (FlxG.keys.justPressed.SPACE)
		{
			_spinning = !_spinning;
		}
		
		if (_spinning)
		{
			_slot0Text.text = FlxG.random.getObject(slot0);
			_slot1Text.text = FlxG.random.getObject(slot1);
			_slot2Text.text = FlxG.random.getObject(slot2);
			
			_slot0Text.screenCenter(X);
			_slot1Text.screenCenter(X);
			_slot2Text.screenCenter(X);
		}
		
		
		super.update(elapsed);
	}
}