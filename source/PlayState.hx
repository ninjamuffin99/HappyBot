package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxInputText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var _bot:FlxSprite;
	private var _textBox:FlxInputText;
	private var _enterBtn:FlxButton;
	
	override public function create():Void
	{
		init();
		
		super.create();
	}

	private function init():Void
	{
		
		_bot = new FlxSprite(0, 0);
		_bot.loadGraphic("assets/images/bot.png", false, 489, 489);
		_bot.screenCenter(X);
		
		add(_bot);	
		
		_textBox = new FlxInputText(0, 0);
		_textBox.forceCase = FlxInputText.LOWER_CASE;
		add(_textBox);
		
		_enterBtn = new FlxButton(10, 15, "ENTER", textConfirm);
		add(_enterBtn);
		
		
	}
	
	override public function update(elapsed:Float):Void
	{
		FlxG.watch.addMouse();
		
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.5, false, finishFade);
		}
		
		super.update(elapsed);
	}
	
	private function finishFade():Void
	{
		FlxG.switchState(new SlotState());
	}
	
	private function textConfirm():Void
	{
		Text._adjText.push(_textBox.text);
	}
}