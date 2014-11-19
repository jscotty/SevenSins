package game.factorys.soldiers 
{
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ScoutSoldier extends Soldier 
	{
		private var soldier:SoldierScout;
		
		public function ScoutSoldier() 
		{
			soldier = new SoldierScout();
			addChild(soldier);
			
			health = 100;
			damage = 10;
			speed = 4;
			saveSpeed = 4;
			hitCounter = 10;
			shooter = false;
			healer = false;
		}
		
	}

}