package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Tower extends Sprite
	{
		private var _health:Number;
		private var tf:TextFormat;
		private var text:TextField;
		
		public function Tower()
		{
			tf = new TextFormat("Arial", 25, 0xf15822, false);
			text = new TextField();
			text.text = "";
			text.y = 100;
			text.selectable = false;
			text.width = 700;
			addChild(text);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void 
		{
			if (health >= 0) {
			text.text = "life: " + health;
			text.setTextFormat(tf);
			text.embedFonts;
			}
			
			if (health <= 0) {
				health = 0;
				text.text = "death";
				text.setTextFormat(tf);
			}
		}
		
		public function get health() :Number
		{
			return _health;
		}
		
		public function set health(health:Number) :void
		{
			_health = health;
		}
		
	}

}