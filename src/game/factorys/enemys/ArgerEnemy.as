package game.factorys.enemys 
{
	import game.factorys.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ArgerEnemy extends Enemy
	{
		
		public function ArgerEnemy() 
		{
			health = 300;
			damage = 25;
			mana = 200;
			hitCounter = 5;
			shooter = true;
			healer = false;
		}
		
	}

}