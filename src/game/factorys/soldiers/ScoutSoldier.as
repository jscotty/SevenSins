package game.factorys.soldiers 
{
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ScoutSoldier extends Soldier 
	{
		
		public function ScoutSoldier() 
		{
			health = 100;
			damage = 10;
			hitCounter = 10;
			shooter = false;
			healer = false;
		}
		
	}

}