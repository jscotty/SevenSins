package game 
{
	import assets.PlaceHolderButtonSpawn;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
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
		//private var _enemy:Enemy;
		
		private var _soldierFactory:SoldierFactory;
		public static var soldier:Array;
		private var _soldier:Soldier;
		
		private var _towerFactory:TowerFactory;
		public static var tower:Array;
		private var _tower:Tower;
		
		private var dir:Number;
		private var BG3:BackgroundLay3;
		private var BG2:BackgroundLay2;
		private var BG1:BackgroundWalking;
		private var cameraMov:CameraMovement;
		
		private var _troopsButton:PlaceHolderButtonSpawn;
		private var _troopsButton2:PlaceHolderButtonSpawn;
		private var sL:Number;
		private var eL:Number;
		private var l:Number;
		
		public var ui:UI;
		
		public function Game(s:Stage) 
		{
			
			BG3 = new BackgroundLay3();
			BG2 = new BackgroundLay2();
			BG1 = new BackgroundWalking();
			cameraMov = new CameraMovement();
			
			s.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			
			addChild(BG3);
			
			BG2.scaleX = 1.3;
			BG2.scaleY = 1.3;
			BG2.x = -200;
			addChild(BG2);
			
			BG1.x = -200;
			BG1.y = 500;
			BG1.scaleX = 1.5;
			BG1.scaleY = 1.5;
			addChild(BG1);
			
			enemy = new Array();
			for (var e:int = 0; e < 15; e++) {
				var _enemy:Enemy;
				_enemyFactory = new EnemyFactory();
				_enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2000 + e * 1500;
				enemy[e].y = 500;
			}
			
			soldier = new Array();
			soldier = [];
			
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
			
			_troopsButton = new PlaceHolderButtonSpawn();
			_troopsButton.x = 20;
			_troopsButton.y = 20;
			addChild(_troopsButton);
			s.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
			
			_troopsButton2 = new PlaceHolderButtonSpawn();
			_troopsButton2.x = 20;
			_troopsButton2.y = 150;
			addChild(_troopsButton2);
			
			ui = new UI();
			addChild(ui);
			
			s.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == _troopsButton) {
				ui.mana -= 100;
					spawnArger();
			}
			if (e.target == _troopsButton2) {
				ui.mana -= 50;
					spawnScout();
			}
		}
		
		private function spawnScout():void 
		{
			for (var i:int = 0; i <= 0; i++ ) {
				_soldierFactory = new SoldierFactory();
				_soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_SCOUT);
				addChild(_soldier);
				soldier.push(_soldier);
				
				_soldier.behaviour();
				_soldier.x = tower[0].x;
				_soldier.y = 500;
				
				/*soldier[i].behaviour();
				soldier[i].x = tower[0].x;
				soldier[i].y = 500;*/
			}
		}
		
		private function spawnArger():void 
		{
			for (var i:int = 0; i <= 0; i++ ) {
				var _soldier:Soldier;
				_soldierFactory = new SoldierFactory();
				_soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_ARGER);
				addChild(_soldier);
				soldier.push(_soldier);
				
				_soldier.behaviour();
				_soldier.x = tower[0].x;
				_soldier.y = 500;
			}
		}
		
		private function update(e:Event):void 
		{
			cameraMov.update(BG1, BG2, BG3);
			soldier.sortOn("x", Array.NUMERIC);
			enemy.sortOn("x", Array.NUMERIC);
			
			sL = soldier.length - 1;
			eL = enemy.length - 1;
			//trace(soldier[l]);
			
			for (var i:int = eL; i >= 0; i--) {
					//trace(enemy[i].x - enemy[0].x);
				if (i != 0) {
					if(enemy[i].x - enemy[i - 1].x < 60){
						enemy[i].speed = enemy[0].speed;
					}
				}
			}
			
			
			for (var j:int = sL; j >= 0; j--) {
			
				if (j != 0) {	
					var row:int = soldier[j].x - soldier[j - 1].x;
					trace(row);
					if(row < 60){
						soldier[j].speed = soldier[0].speed;
					}
				}
			}
			
			
			enemyDeath();
			soldierDeath();
			
			damageSoldier();
			
		}
		
		private function damageSoldier():void 
		{
			for (var i:int = enemy.length - 1; i >= 0; i--) {
				if (enemy[i].takeDamage == true) {
					trace(soldier[l].health);
					soldier[l].health -= enemy[i].damage;
				}
			}
		}
		
		private function soldierDeath():void 
		{
			for (var i:int = soldier.length - 1; i >= 0; i--) {
				if (soldier[i].died == true) {
					soldier[i].removeEventListener(Event.ENTER_FRAME, soldier[i].update);
					removeChild(soldier[i]);
					soldier.splice(i, 1);
				}
			}
		}
		
		private function enemyDeath():void 
		{
			for (var i:int = enemy.length - 1; i >= 0; i--) {
				if (enemy[i].died == true) {
					enemy[i].removeEventListener(Event.ENTER_FRAME, enemy[i].update);
					removeChild(enemy[i]);
					enemy.splice(i, 1);
				}
			}
			
		}
		
		
		private function onKeyDown(e:KeyboardEvent) :void
		{
			cameraMov.onKeyDown(e);
			
		}
		
		private function onKeyUp(e:KeyboardEvent) :void
		{
			cameraMov.onKeyUp(e);
		}
	}
}