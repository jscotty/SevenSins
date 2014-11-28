package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class SoldierCollecter extends Sprite 
	{
		private var _speed:Number;
		public var died:Boolean = false;
		
		public function behaviour():void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void 
		{
			this.x += speed;
			
			for (var i:int = 0; i < Game.tower.length;i++){
				var xposTower:int = this.x - Game.tower[1].x;
			}
			
			if (xposTower > -50) {
				death();
			}
			
		}
		
		private function death():void 
		{
		}
		
		public function get speed():Number 
		{
			return _speed;
		}
		
		public function set speed(speed:Number):void 
		{
			_speed = speed;
		}
		
	}

}