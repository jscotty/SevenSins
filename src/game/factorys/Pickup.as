package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Pickup extends Sprite 
	{
		private var _sins:Number;
		
		public function pickupBehaviour() :void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void 
		{
			
		}
		
		public function get sins():Number 
		{
			return _sins;
		}
		
		public function set sins(sins:Number):void 
		{
			_sins = sins;
		}
		
	}

}