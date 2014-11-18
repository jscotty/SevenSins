package game.factorys 
{
	import game.factorys.towers.TowerEnemy;
	import game.factorys.towers.TowerSoldier;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TowerFactory 
	{
		public static const SOLDIER_TOWER:String = "soldierTower";
		public static const ENEMY_TOWER:String = "EnemyTower";
		
		private var tower:Tower;
		
		public function createTower(towerType:String):Tower 
		{
			if (towerType == SOLDIER_TOWER) {
				tower = new TowerSoldier();
			}
			else if (towerType == ENEMY_TOWER) {
				tower = new TowerEnemy();
			}
			else {
				tower = new Tower();
			}
			
			return tower;
		}
		
	}

}