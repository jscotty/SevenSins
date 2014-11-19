package game.factorys.soldiers 
{
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ArgerSoldier extends Soldier 
	{
		private var _soldier:SoldierArger;
		
		public function ArgerSoldier() 
		{
			_soldier = new SoldierArger();
			addChild(_soldier);
			
			health = 100;
			damage = 25;
			speed = 3;
			saveSpeed = 3;
			hitCounter = 60;
			shooter = true;
			healer = false;
		}
		
	}

}