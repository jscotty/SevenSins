package game 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class UI extends Sprite
	{
		public var mana:Number = 4600;
		public var sins:Number = 0;
		private var _text:TextField;
		private var _textSins:TextField;
		private var tf:TextFormat;
		private var hud:Hud;
		private var tf2:TextFormat;
		
		public function UI() 
		{
			hud = new Hud();
			addChild(hud);
			hud.x = 670;
			hud.y = 10;
			
			tf = new TextFormat("Evil Bible", 25, 0xeabc10, true);
			tf2 = new TextFormat("Evil Bible", 25, 0x99ff99, true);
			_text = new TextField();
			_text.text = "";
			_text.y = 20;
			_text.x = 700;
			_text.selectable = false;
			_text.width = 700;
			addChild(_text);
			
			_textSins = new TextField();
			_textSins.text = "";
			_textSins.y = 50;
			_textSins.x = 700;
			_textSins.selectable = false;
			_textSins.width = 700;
			addChild(_textSins);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			_text.text = "" + mana;
			_text.setTextFormat(tf);
			_text.embedFonts;
			
			_textSins.text = "" + sins;
			_textSins.setTextFormat(tf2);
			_textSins.embedFonts;
		}
		
	}

}