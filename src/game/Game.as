package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
<<<<<<< HEAD
	import flash.events.KeyboardEvent;
=======
	import game.factorys.Enemy;
	import game.factorys.EnemyFactory;
	import game.factorys.Soldier;
	import game.factorys.SoldierFactory;
	import game.factorys.Tower;
	import game.factorys.TowerFactory;
>>>>>>> 4eba6ea8fc065c357cee300479502b34ac38bb38
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite 
<<<<<<< HEAD
	{	
		private var dir:Number;
		private var BG3:BackgroundL3;
		private var BG2:BackgroundL2;
		private var BG1:BackgroundL1;
		private var cameraMov:CameraMovement;
		
		public function Game(s:Stage) 
		{
			BG3 = new BackgroundL3;
			BG2 = new BackgroundL2;
			BG1 = new BackgroundL1;
			cameraMov = new CameraMovement();
			
			trace("GAME!!");
			s.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, update);
			
			
			BG3.scaleX = 3;
			addChild(BG3);
			
			BG2.scaleX = 2;
			addChild(BG2);
			
			BG1.scaleX = 4;
			addChild(BG1);
			
			
			
		}
		
		private function onKeyDown(e:KeyboardEvent)
		{
			cameraMov.onKeyDown(e);
			
		}
		
		private function onKeyUp(e:KeyboardEvent)
		{
			cameraMov.onKeyUp(e);
		}
		
		private function update(e:Event)
		{
			cameraMov.update(BG1, BG2, BG3);
=======
	{
		private var _enemyFactory:EnemyFactory;
		public static var enemy:Array;
		private var _enemy:Enemy;
		
		private var _soldierFactory:SoldierFactory;
		public static var soldier:Soldier;
		
		private var _towerFactory:TowerFactory;
		public static var tower:Array;
		private var _tower:Tower;
		
		public function Game(s:Stage) 
		{
			enemy = new Array();
			for (var e:int = 0; e < 1; e++){
				_enemyFactory = new EnemyFactory();
				_enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 600;
				enemy[e].y = 300;
			}
			
			
			_soldierFactory = new SoldierFactory();
			soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_ARGER);
>>>>>>> 4eba6ea8fc065c357cee300479502b34ac38bb38
			
			soldier.behaviour();
			soldier.x = 100;
			soldier.y = 300;
			addChild(soldier);
			
			tower = new Array();
			for (var i:int = 0; i < 2; i++){
				_towerFactory = new TowerFactory();
				var tCount:int;
				tCount ++;
				if(tCount == 1)_tower = _towerFactory.createTower(TowerFactory.SOLDIER_TOWER);
				if (tCount == 2)_tower = _towerFactory.createTower(TowerFactory.ENEMY_TOWER);
				tower.push(_tower);
				addChild(_tower);
				
				
				tower[i].x = 100 + i * 500;
				tower[i].y = 300;
			}
			
			s.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
<<<<<<< HEAD
		 
=======
		private function update(e:Event):void 
		{
			for (var i:int = enemy.length - 1; i >= 0; i--){
				if (enemy[i].died == true) {
					removeChild(enemy[i]);
					enemy.splice(i, 1);
				}
			}
		}
>>>>>>> 4eba6ea8fc065c357cee300479502b34ac38bb38
	}
}