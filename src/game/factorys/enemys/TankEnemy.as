package game.factorys.enemys 
{
	import game.factorys.Enemy;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TankEnemy extends Enemy 
	{
		
		public function TankEnemy() 
		{
			health = 650;
			damage = 125;
			hitCounter = 10;
			shooter = false;
			healer = false;
		}
		
	}

}