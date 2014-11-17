package game.factorys.enemys 
{
	import game.factorys.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ScoutEnemy extends Enemy
	{
		
		public function ScoutEnemy() 
		{
			health = 100;
			damage = 10;
			mana = 100;
			hitCounter = 10;
			shooter = false;
			healer = false;
			
		}
		
	}

}