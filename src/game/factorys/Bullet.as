package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Bullet extends Sprite
	{
		private var bullet:BulletAsset;
		
		public function Bullet() 
		{
			bullet = new BulletAsset();
			addChild(bullet);
			bullet.y = -30;
			bullet.scaleX = 0.5;
			bullet.scaleY = 0.5;
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			bullet.x += 10;
			
			if (bullet.x >= 2000) {
				//trace("dood");
				death();
			}
			
			var enemy:Enemy = Game.enemy;
			if (bullet.hitTestObject(enemy)) {
				death();
				trace("yow");
			}
		}
		
		private function death():void 
		{
			removeEventListener(Event.ENTER_FRAME, update);
			removeChild(bullet);
		}
		
		
	}

}