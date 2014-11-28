package game.factorys.enemys 
{
	import game.factorys.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ScoutEnemy extends Enemy
	{
		private var _enemy:EnemyScout;
		
		public function ScoutEnemy() 
		{
			_enemy = new EnemyScout();
			addChild(_enemy);
			_enemy.scaleX = -1;
			
			
			health = 100;
			damage = 10;
			mana = 600;
			speed = 4.1;
			saveSpeed = 4.1;
			hitCounter = 28;
			shooter = false;
			healer = false;
			
		}
		
	}

}