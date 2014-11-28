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
	public class BulletArgerSoldier extends Sprite
	{
		private var bullet:ArrowSoldier;
		private var damage:int = 18;
		private var count:int = 0;
		
		public function BulletArgerSoldier() 
		{
			bullet = new ArrowSoldier();
			addChild(bullet);
			bullet.y = -30;
			bullet.scaleX = 0.5;
			bullet.scaleY = 0.5;
			
			this.rotation = - 5;
			this.scaleX = 2;
			this.scaleY = 2;
			this.y = - 140;
			
			addEventListener(Event.ENTER_FRAME, bulletBehaviour);
		}
		
		private function bulletBehaviour(e:Event):void 
		{
			bullet.x += 20;
			
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
		
		private function damageTower():void 
		{
			for (var i:int = 0; i < Game.tower.length; i++) {
				Game.tower[1].health -= damage / 4;
			}
		}
		
		private function damageEnemy():void 
		{
			for (var i:int = Game.enemy.length - 1; i > 0; i--) {
				
					Game.enemy[0].health -= damage / 3;
			}
		}
		
		private function destroy():void 
		{
			removeEventListener(Event.ENTER_FRAME, bulletBehaviour);
			removeChild(bullet);
		}
		
		
	}

}