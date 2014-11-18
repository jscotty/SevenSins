package game.factorys.soldiers 
{
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TankSoldier extends Soldier 
	{
		
		public function TankSoldier() 
		{
			health = 750;
			damage = 125;
			hitCounter = 10;
			shooter = false;
			healer = false;
			
		}
		
	}

}