package game.factorys 
{
	import game.factorys.enemys.ArgerEnemy;
	import game.factorys.enemys.CollecterEnemy;
	import game.factorys.enemys.HealerEnemy;
	import game.factorys.enemys.ScoutEnemy;
	import game.factorys.enemys.TankEnemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyFactory 
	{
		public static const ENEMY_SCOUT:String = "scout";
		public static const ENEMY_COLLECTER:String = "collecter";
		public static const ENEMY_TANK:String = "tank";
		public static const ENEMY_HEALER:String = "healer";
		public static const ENEMY_ARGER:String = "arger";
		
		private var enemy:Enemy;
		
		public function createEnemy(enemyType:String):Enemy
		{
			if (enemyType == ENEMY_SCOUT)
			{
				enemy = new ScoutEnemy();
			}
			else if (enemyType == ENEMY_COLLECTER)
			{
				enemy = new CollecterEnemy();
			}
			else if (enemyType == ENEMY_TANK)
			{
				enemy = new TankEnemy();
			}
			else if (enemyType == ENEMY_HEALER)
			{
				enemy = new HealerEnemy();
			}
			else if (enemyType == ENEMY_ARGER)
			{
				enemy = new ArgerEnemy();
			}
			else {
				enemy = new Enemy();
			}
			
			return enemy;
		}
		
	}

}