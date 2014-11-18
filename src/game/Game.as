package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import game.factorys.Enemy;
	import game.factorys.EnemyFactory;
	import game.factorys.Soldier;
	import game.factorys.SoldierFactory;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite 
	{
		private var _enemyFactory:EnemyFactory;
		public static var enemy:Enemy;
		
		private var _soldierFactory:SoldierFactory;
		public static var soldier:Soldier;
		
		public function Game(s:Stage) 
		{
			_enemyFactory = new EnemyFactory();
			enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
			
			enemy.behaviour();
			enemy.x = 400;
			enemy.y = 300;
			addChild(enemy);
			
			
			_soldierFactory = new SoldierFactory();
			soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_ARGER);
			
			soldier.behaviour();
			soldier.x = 100;
			soldier.y = 300;
			addChild(soldier);
			
			s.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		private function update(e:Event):void 
		{
			
		}
		
		
	}

}