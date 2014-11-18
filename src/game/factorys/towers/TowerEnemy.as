package game.factorys.towers 
{
	import game.factorys.Tower;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TowerEnemy extends Tower 
	{
		private var tower:EnemyTower;
		
		public function TowerEnemy() 
		{
			tower = new EnemyTower();
			addChild(tower);
			
			health = 1500;
		}
		
	}

}