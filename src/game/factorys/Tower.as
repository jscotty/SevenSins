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
		private var _damage:Number;
		private var tf:TextFormat;
		private var text:TextField;
		
		public var anim:Number;
		
		private var counter:int = 0;
		
		public function Tower()
		{
			tf = new TextFormat("Arial", 25, 0xf15822, false);
			text = new TextField();
			text.text = "";
			text.y = 30;
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
				anim = 2;
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
		
		public function get damage():Number 
		{
			return _damage;
		}
		
		public function set damage(damage:Number):void 
		{
			_damage = damage;
		}
		
	}

}