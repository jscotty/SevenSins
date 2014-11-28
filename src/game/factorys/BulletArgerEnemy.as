package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.factorys.enemys.ArgerEnemy;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class BulletArgerEnemy extends Sprite 
	{
		private var bullet:ArrowEnemy;
		private var damage:int = 13;
		private var count:int = 0;
		
		public function BulletArgerEnemy() 
		{
			bullet = new ArrowEnemy();
			addChild(bullet);
			bullet.y = -35;
			bullet.x = -35;
			bullet.scaleX = 0.5;
			bullet.scaleY = 0.5;
			
			this.rotation =  7;
			this.scaleX = 2;
			this.scaleY = 2;
			this.y = - 131;
			
			addEventListener(Event.ENTER_FRAME, bulletBehaviour);
		}
		
		private function bulletBehaviour(e:Event):void 
		{
			this.x -= 20;
			
		if (bullet.x >= 400) {
				//trace("dood");
			}
			
			for (var j:int = 0; j < Game.soldier.length; j++){
				if (bullet.hitTestObject(Game.soldier[j])) {
					damageEnemy();
					destroy();
					trace("hit soldier");
				}
			}
			
			
				if (bullet.hitTestObject(Game.towerAngel)) {
					damageTower();
					destroy();
				}
			
			
			
		}
		
		private function damageTower():void 
		{
			for (var i:int = 0; i < Game.tower.length; i++) {
				Game.tower[0].health -= damage / 4;
			}
		}
		
		private function damageEnemy():void 
		{
			for (var j:int = 0; j < Game.soldier.length; j++){
				var l:int = Game.soldier.length -1;
					Game.soldier[l].health -= damage ;
			}
		}
		
		private function destroy():void 
		{
			/*removeEventListener(Event.ENTER_FRAME, update);*/
			removeChild(bullet);
		}
		
		
	}

}