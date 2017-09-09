package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _bot:FlxSprite;
	
	
	private var slot0:Array<String> = ["You", "I hope you"];
	private var slot1:Array<String> = ["Are", "Do"];
	private var slot2:Array<String> = ["Great", "Lovely", "Nice", "Neato", "Excellent", "Pleasant"];
	
	private var _slot0Text:FlxText;
	private var _slot1Text:FlxText;
	private var _slot2Text:FlxText;
	
	private var _spinning:Bool = false;
	
	override public function create():Void
	{
		init();
		
		super.create();
	}

	private function init():Void
	{
		var fontSize:Int = 20;
		var yPos:Float = 295;
		
		_bot = new FlxSprite(0, 0);
		_bot.loadGraphic("assets/images/bot.png", false, 489, 489);
		
		_slot0Text = new FlxText(0, yPos, 0, "Press", fontSize);
		_slot1Text = new FlxText(0, yPos + fontSize, 0, "", fontSize);
		_slot2Text = new FlxText(0, yPos + fontSize * 2, 0, "Space", fontSize);
		
		_slot0Text.screenCenter(X);
		_slot1Text.screenCenter(X);
		_slot2Text.screenCenter(X);
		
		
		
		add(_bot);
		
		add(_slot0Text);
		add(_slot1Text);
		add(_slot2Text);
	}
	
	override public function update(elapsed:Float):Void
	{
		FlxG.watch.addMouse();
		
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