package game.factorys 
{
	import game.factorys.soldiers.ArgerSoldier;
	import game.factorys.soldiers.CollecterSoldier;
	import game.factorys.soldiers.HealerSoldier;
	import game.factorys.soldiers.ScoutSoldier;
	import game.factorys.soldiers.TankSoldier;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class SoldierFactory 
	{
		public static const SOLDIER_SCOUT:String = "scout";
		public static const SOLDIER_COLLECTER:String = "collecter";
		public static const SOLDIER_TANK:String = "tank";
		public static const SOLDIER_HEALER:String = "healer";
		public static const SOLDIER_ARGER:String = "arger";
		
		private var soldier:Soldier;
		
		public function createSoldier(soldierType:String):Soldier
		{
			if (soldierType == SOLDIER_SCOUT)
			{
				soldier = new ScoutSoldier();
			}
			else if (soldierType == SOLDIER_COLLECTER)
			{
				soldier = new CollecterSoldier();
			}
			else if (soldierType == SOLDIER_TANK)
			{
				soldier = new TankSoldier();
			}
			else if (soldierType == SOLDIER_HEALER)
			{
				soldier = new HealerSoldier();
			}
			else if (soldierType == SOLDIER_ARGER)
			{
				soldier = new ArgerSoldier();
			}
			else {
				soldier = new Soldier();
			}
			
			return soldier;
		}
		
	}

}