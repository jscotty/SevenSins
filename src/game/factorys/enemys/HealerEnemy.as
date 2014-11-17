package game.factorys.enemys 
{
	import game.factorys.Enemy;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class HealerEnemy extends Enemy 
	{
		
		public function HealerEnemy() 
		{
			health = 500;
			damage = 0;
			mana = 325;
			speed = 3;
			hitCounter = 20;
			shooter = false;
			healer = true;
		}
		
	}

}