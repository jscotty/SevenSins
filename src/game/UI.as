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
		public var mana:Number = 300;
		private var _text:TextField;
		private var tf:TextFormat;
		
		public function UI() 
		{
			tf = new TextFormat("Arial", 20, 0xf15822, true);
			_text = new TextField();
			_text.text = "";
			_text.y = 30;
			_text.x = 300;
			_text.selectable = false;
			_text.width = 700;
			addChild(_text);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			_text.text = "mana: " + mana;
			_text.setTextFormat(tf);
			_text.embedFonts;
		}
		
	}

}