package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.factorys.soldiers.ArgerSoldier;
	import game.Game;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class BulletArgerSoldier extends ArgerSoldier
	{
		private var bullet:BulletAsset;
		
		public function BulletArgerSoldier() 
		{
			bullet = new BulletAsset();
			addChild(bullet);
			bullet.y = -30;
			bullet.scaleX = 0.5;
			bullet.scaleY = 0.5;
			
			addEventListener(Event.ENTER_FRAME, bulletBehaviour);
		}
		
		private function bulletBehaviour(e:Event):void 
		{
			bullet.x += 10;
			
			if (bullet.x >= 400) {
				//trace("dood");
			}
			
			for (var j:int = 0; j < Game.enemy.length; j++){
				if (bullet.hitTestObject(Game.enemy[j])) {
					damageEnemy();
					destroy();
				}
			}
			
			for (var i:int = 0; i < Game.tower.length; i++){
				if (bullet.hitTestObject(Game.tower[1])) {
					damageTower();
					destroy();
				}
			}
		}
		
		private function destroy():void 
		{
			removeEventListener(Event.ENTER_FRAME, update);
			removeChild(bullet);
		}
		
		
	}

}