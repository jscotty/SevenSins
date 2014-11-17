package game.factorys.soldiers 
{
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class HealerSoldier extends Soldier 
	{
		
		public function HealerSoldier() 
		{
			health = 500;
			damage = 0;
			hitCounter = 20;
			shooter = false;
			healer = true;
		}
		
	}

}