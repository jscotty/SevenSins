package game.factorys.soldiers 
{
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ArgerSoldier extends Soldier 
	{
		
		public function ArgerSoldier() 
		{
			health = 300;
			damage = 25;
			hitCounter = 5;
			shooter = true;
			healer = false;
		}
		
	}

}