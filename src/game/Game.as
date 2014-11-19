package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import game.factorys.Enemy;
	import game.factorys.EnemyFactory;
	import game.factorys.Soldier;
	import game.factorys.SoldierFactory;
	import game.factorys.Tower;
	import game.factorys.TowerFactory;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite
	{
	
		private var _enemyFactory:EnemyFactory;
		public static var enemy:Array;
		private var _enemy:Enemy;
		
		private var _soldierFactory:SoldierFactory;
		public static var soldier:Array;
		private var _soldier:Soldier;
		
		private var _towerFactory:TowerFactory;
		public static var tower:Array;
		private var _tower:Tower;
		
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
			
			s.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			
			BG3.scaleX = 3;
			addChild(BG3);
			
			BG2.scaleX = 2;
			addChild(BG2);
			
			BG1.scaleX = 4;
			addChild(BG1);
			
			enemy = new Array();
			for (var e:int = 0; e < 5; e++){
				_enemyFactory = new EnemyFactory();
				_enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2000 + e * 400;
				enemy[e].y = 500;
			}
			
			soldier = new Array();
			for (var j:int = 0; j < 2; j++ ) {
				_soldierFactory = new SoldierFactory();
				var count:int;
				count ++
				if(count == 1) _soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_ARGER);
				if(count == 2) _soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_SCOUT);
				addChild(_soldier);
				soldier.push(_soldier);
				
				soldier[j].behaviour();
				soldier[j].x = 100 + j * -100;
				soldier[j].y = 500;
			}
			
			tower = new Array();
			for (var i:int = 0; i < 2; i++){
				_towerFactory = new TowerFactory();
				var tCount:int;
				tCount ++;
				if(tCount == 1)_tower = _towerFactory.createTower(TowerFactory.SOLDIER_TOWER);
				if (tCount == 2)_tower = _towerFactory.createTower(TowerFactory.ENEMY_TOWER);
				tower.push(_tower);
				addChild(_tower);
				
				
				tower[i].x = 100 + i * 2000;
				tower[i].y = 500;
			}
			
			
			s.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		private function update(e:Event):void 
		{
			cameraMov.update(BG1, BG2, BG3);
			soldier.sortOn("x", Array.NUMERIC);
			enemy.sortOn("x", Array.NUMERIC);
			
			for (var i:int = enemy.length - 1; i >= 0; i--){
				if (enemy[i].died == true) {
					removeChild(enemy[i]);
					enemy.splice(i, 1);
				}
			}
		}
		
		
		private function onKeyDown(e:KeyboardEvent)
		{
			cameraMov.onKeyDown(e);
			
		}
		
		private function onKeyUp(e:KeyboardEvent)
		{
			cameraMov.onKeyUp(e);
		}
	}
}