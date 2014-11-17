package game 
{
	import flash.display.Sprite;
	import game.factorys.Enemy;
	import game.factorys.EnemyFactory;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite 
	{
		private var _enemyFactory:EnemyFactory;
		private var _enemy:Enemy;
		
		public function Game() 
		{
			_enemyFactory = new EnemyFactory();
			_enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
			
			doEnemyBehaviour(_enemy);
		}
		
		private function doEnemyBehaviour(enemy:Enemy):void 
		{
			_enemy.test();
		}
		
	}

}