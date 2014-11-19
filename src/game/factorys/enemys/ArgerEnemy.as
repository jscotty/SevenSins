package game.factorys.enemys 
{
	import game.factorys.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ArgerEnemy extends Enemy
	{
		private var enemy:EnemyScout;
		public function ArgerEnemy() 
		{
			enemy = new EnemyScout();
			addChild(enemy);
			
			health = 300;
			damage = 25;
			mana = 200;
			speed = 2.5;
			saveSpeed = 2.5;
			hitCounter = 5;
			shooter = true;
			healer = false;
		}
		
	}

}