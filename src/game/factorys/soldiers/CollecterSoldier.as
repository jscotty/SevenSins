package game.factorys.soldiers 
{
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class CollecterSoldier extends Soldier 
	{
		
		public function CollecterSoldier() 
		{
			health = 500;
			damage = 0;
			hitCounter = 0;
			shooter = false;
			healer = false;
		}
		
	}

}