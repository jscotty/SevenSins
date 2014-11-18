package game.factorys.towers 
{
	import game.factorys.Tower;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TowerSoldier extends Tower 
	{
		private var tower:SoldierTower;
		
		public function TowerSoldier() 
		{
			tower = new SoldierTower();
			addChild(tower);
			
			health = 1000;
			
		}
		
	}

}