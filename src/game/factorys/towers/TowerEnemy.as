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
		
		private var idle:GateKeeperDevilIdle;
		private var att:GateKeeperDevilAtt;
		private var death:GateKeeperDevilDeath;
		
		public function TowerEnemy() 
		{
			idle = new GateKeeperDevilIdle();
			addChild(idle);
			idle.x = -140;
			idle.y = 10;
			idle.scaleX = 0.3;
			idle.scaleY = 0.3;
			
			tower = new EnemyTower();
			addChild(tower);
			
			health = 1500;
		}
		
	}

}