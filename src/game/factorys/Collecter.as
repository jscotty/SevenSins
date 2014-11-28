package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Collecter extends Sprite 
	{
		
		private var _speed:Number;
		private var deathCount:int;
		public var collectPickup:Boolean;
		public var anim:Number;
		private var counter:int = 0;
		
		public var died:Boolean;
		
		public function behaviour() :void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void 
		{
			this.x += speed;
			
			for (var i:int = 0; i < Game.tower.length;i++){
				var xposTower:int = this.x - Game.tower[1].x;
				var xposTower2:int = this.x - Game.tower[0].x;
			}
			for (var j:int = Game.pickup.length -1; j >= 0 ;j--){
				//var l:int = Game.pickup.length -1;
				var xposPickup:int = this.x - Game.pickup[j].x;
			}
			
			if (xposTower > -20) {
				death();
			}
			if (xposTower2 < -20) {
				speed -= speed * 2;
				scaleX = 0.28;
			}
			else if (xposPickup > 1) {
				counter ++;
				if (counter == 1) {
					collectPickup = true;
				}
				speed -= speed * 2;
				scaleX = -0.28;
			}else if (xposPickup > 30) {
				collectPickup = false;
			}else {
				collectPickup = false;
				counter = 0;
			}
			if (collectPickup == true) {
			}
			
			
		}
		
		private function death():void 
		{
			anim = 3;
			speed = 0;
			deathCount ++;
			if (deathCount == 21) {
				died = true;
				removeEventListener(Event.ENTER_FRAME, update);
			}
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