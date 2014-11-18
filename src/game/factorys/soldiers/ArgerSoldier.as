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
			
			health = 300;
			damage = 25;
			speed = 3;
			saveSpeed = 3;
			hitCounter = 35;
			shooter = true;
			healer = false;
		}
		
	}

}