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
		private var tower2:GateCeeperAngel;
		
		public function TowerSoldier() 
		{
			tower = new SoldierTower();
			addChild(tower);
			tower2 = new GateCeeperAngel();
			tower2.x = 200;
			tower2.y = -100;
			addChild(tower2);
			
			health = 1000;
			
		}
		
	}

}