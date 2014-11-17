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
		private var _enemy:Enemy;
		
		private var _soldierFactory:SoldierFactory;
		private var _soldier:Soldier;
		
		public function Game(s:Stage) 
		{
			_enemyFactory = new EnemyFactory();
			_enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
			
			_enemy.behaviour();
			_enemy.x = 400;
			_enemy.y = 300;
			addChild(_enemy);
			
			
			_soldierFactory = new SoldierFactory();
			_soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_ARGER);
			
			_soldier.behaviour();
			_soldier.x = 100;
			_soldier.y = 300;
			addChild(_soldier);
			
			s.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		private function update(e:Event):void 
		{
			if (_soldier.hitTestPoint(_enemy.x, _enemy.y)) {
				_soldier.speed = 0;
				_enemy.speed = 0;
			}
		}
		
		
	}

}