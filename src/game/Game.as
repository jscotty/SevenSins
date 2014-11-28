package game 
{
	import assets.PlaceHolderButtonSpawn;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import game.factorys.Enemy;
	import game.factorys.EnemyFactory;
	import game.factorys.Pickup;
	import game.factorys.PickupFactory;
	import game.factorys.Soldier;
	import game.factorys.SoldierFactory;
	import game.factorys.soldiers.CollecterSoldier;
	import game.factorys.Tower;
	import game.factorys.TowerFactory;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * 
	 * Game project DIY
	 * 
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
		
		private var _pickupFactory:PickupFactory;
		public static var pickup:Array;
		private var _pickup:Pickup;
		
		public static var soldierCollecter:Array;
		private var _soldierCollecter:CollecterSoldier;
		
		private var _towerFactory:TowerFactory;
		public static var tower:Array;
		private var _tower:Tower;
		
		private var dir:Number;
		private var BG3:BackgroundLay3;
		private var BG2:BackgroundLay2;
		private var BG1:BackgroundWalking;
		private var cameraMov:CameraMovement;
		
		private var _troopsButton;
		private var _troopArray:Array;
		private var sL:Number;
		private var eL:Number;
		private var l:Number;
		
		public var ui:UI;
		
		private var _heal:HealingAngel;
		
		private var buying:Boolean = true;
		
		private var _buttonCount:int = 0;
		
		public static var paused:Boolean = false;
		private var pauseCharge:int = 1;
		private var _pause:PausedScreen;
		
		private var _healS:String = "healing.mp3";
		private var _collectS:String = "pickup.mp3";
		private var _introS:String = "introGame.mp3";
		private var _gameS:String = "looptrack.mp3";
		
		private var healSound:Sound;
		private var collectSound:Sound;
		private var introSound:Sound;
		private var loopSound:Sound;
		private var channel:SoundChannel;
		private var introChannel:SoundChannel;
		
		private var playcount:int;
		private var buyAble:Boolean = true;
		private var _buff:BuffEffect;
		private var _judge:JudgementEffect;
		
		public static var towerAngel:SoldierTower;
		
		private var waveCount:int;
		private var devilCount:int;
		private var _heal2:HealingDevil;
		
		private var pickupNumber:int;
		private var pickupX:int;
		private var collecterBuy:int;
		private var healerBuy:int;
		
		public function Game(s:Stage) 
		{
			healSound = new Sound();
			collectSound = new Sound();
			introSound = new Sound();
			loopSound = new Sound();
			channel = new SoundChannel();
			introChannel = new SoundChannel();
			
			healSound.load(new URLRequest(_healS));
			collectSound.load(new URLRequest(_collectS));
			introSound.load(new URLRequest(_introS));
			loopSound.load(new URLRequest(_gameS));
			
			introChannel = introSound.play(0, 1);
			
			BG3 = new BackgroundLay3();
			BG2 = new BackgroundLay2();
			BG1 = new BackgroundWalking();
			cameraMov = new CameraMovement();
			
			s.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			_heal = new HealingAngel();
			
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
			
			pickup = new Array();
			for (var p:int = 0; i < 1; i++){
				_pickupFactory = new PickupFactory();
				_pickup = _pickupFactory.createPickup(PickupFactory.BRONZE_PICKUP);
				pickup.push(_pickup);
				addChild(_pickup);
				_pickup.x = Math.random() * 1000 + 600;
				_pickup.y = 490;
				_pickup.pickupBehaviour();
			}
			
			soldier = new Array();
			soldier = [];
			
			soldierCollecter = new Array();
			soldierCollecter = [];
			
			enemy = new Array();
			enemy = [];
			
			towerAngel = new SoldierTower();
			addChild(towerAngel);
			towerAngel.x = 100;
			towerAngel.y = 500;
			
			tower = new Array();
			for (var i:int = 0; i < 2; i++){
				_towerFactory = new TowerFactory();
				var tCount:int;
				tCount ++;
				if(tCount == 1)_tower = _towerFactory.createTower(TowerFactory.SOLDIER_TOWER);
				if (tCount == 2)_tower = _towerFactory.createTower(TowerFactory.ENEMY_TOWER);
				tower.push(_tower);
				addChild(_tower);
				
				
				tower[i].x = 100 + i * 2400;
				tower[i].y = 500;
			}
			
			_troopArray = new Array();
			for (var b:int = 0; b < 8; b++) {
				
				_buttonCount ++;
				if (_buttonCount == 1) _troopsButton = new CollecterButtonAngel();
				if (_buttonCount == 2) _troopsButton = new ScoutButtonAngel();
				if (_buttonCount == 3) _troopsButton = new ArgerButtonAngel();
				if (_buttonCount == 4) _troopsButton = new HealerButtonAngel();
				if (_buttonCount == 5) _troopsButton = new TankButtonAngel();
				
				if (_buttonCount == 6) _troopsButton = new LifeBonus();
				if (_buttonCount == 7) _troopsButton = new AngelBuff();
				if (_buttonCount == 8) _troopsButton = new AngelScreenNuke();
				
				_troopArray.push(_troopsButton);
				addChild(_troopsButton);
				
				_troopArray[b].x = 10 + b * 80;
				_troopArray[b].y = 10;
			}
			
			ui = new UI();
			addChild(ui);
			
			_pause = new PausedScreen();
			addChild(_pause);
			_pause.visible = false;
			
			s.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
			s.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
			s.addEventListener(KeyboardEvent.KEY_DOWN, pressedPause,false, 0, true);
		}
		
		private function pressedPause(e:KeyboardEvent):void 
		{
			if (e.keyCode == 80) {
				paused = true;
				_pause.visible = true;
			} else {
				paused = false;
				_pause.visible = false;
			}
				
		}
		
		private function onClick(e:MouseEvent):void 
		{
		if (paused == false) {
			if (buyAble == true) {
				if(buying == true){
					if (e.target == _troopArray[0]) {
						if (ui.mana >= 200) {
							collecterBuy ++;
							if (collecterBuy == 1) {
								ui.mana -= 200;
								spawnCollecter();
							}else {
								
							}
						}
					}
					else if (e.target == _troopArray[1]) {
						if (ui.mana >= 300) {
							ui.mana -= 300;
							spawnScout();
						}
					}
					else if (e.target == _troopArray[2]) {
						if (ui.mana >= 500) {
							ui.mana -= 500;
							spawnArger();
						}
					}
					else if (e.target == _troopArray[3]) {
						if (ui.mana >= 800) {
							ui.mana -= 800;
							spawnHealer();
						}
					}
					else if (e.target == _troopArray[4]) {
						if (ui.mana >= 1200) {
							ui.mana -= 1200;
							spawnTank();
						}
					}
				}
			}
				if (e.target == _troopArray[5]) {
					if (ui.sins >= 200) {	
						ui.sins -= 200;
						
						healSpec();
					}
				}
				else if (e.target == _troopArray[6]) {
					if (ui.sins >= 300) {	
						ui.sins -= 300;
						
						buffSpec();
					}
				}
				else if (e.target == _troopArray[7]) {
					if (ui.sins >= 500) {	
						ui.sins -= 500;
						
						judgementSpec();
					}
				}
				
		}else {
		}
		}
		
		
		private function healSpec():void 
		{
				channel = healSound.play(0, 1);
			for (var i:int = 0; i < soldier.length; i++) {
				//trace(soldier[i].health);
				soldier[i].health += 50; 
			}
				
					_heal = new HealingAngel();
					addChild(_heal);
					addEventListener(Event.ENTER_FRAME, healPos2);
		}
		
		private function buffSpec():void 
		{
			for (var i:int = 0; i < soldier.length; i++) {
				//trace(soldier[i].health);
				soldier[i].damage += 5; 
			}
					_buff = new BuffEffect();
					addChild(_buff);
					addEventListener(Event.ENTER_FRAME, buffpos);
		}
		
		private function judgementSpec():void 
		{
			for (var i:int = 0; i < soldier.length; i++) {
				//trace(soldier[i].health);
				soldier[i].damage += 5; 
				soldier[i].health += 50;
			}
					_judge = new JudgementEffect();
					addChild(_judge);
					addEventListener(Event.ENTER_FRAME, judgepos);
		}
		
		private function spawnCollecter():void 
		{
			for (var i:int = 0; i <= 0; i++ ) {
				_soldierCollecter = new CollecterSoldier();
				addChild(_soldierCollecter);
				soldierCollecter.push(_soldierCollecter);
				
				_soldierCollecter.behaviour();
				_soldierCollecter.x = tower[0].x;
				_soldierCollecter.y = 520;
			}
		
		}
		
		private function spawnHealer():void 
		{
			for (var i:int = 0; i <= 0; i++ ) {
				_soldierFactory = new SoldierFactory();
				_soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_HEALER);
				addChild(_soldier);
				soldier.push(_soldier);
				
				_soldier.behaviour();
				_soldier.x = tower[0].x;
				_soldier.y = 520;
			}
		}
		
		private function spawnTank():void 
		{
			for (var i:int = 0; i <= 0; i++ ) {
				_soldierFactory = new SoldierFactory();
				_soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_TANK);
				addChild(_soldier);
				soldier.push(_soldier);
				
				_soldier.behaviour();
				_soldier.x = tower[0].x;
				_soldier.y = 520;
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
				_soldier.y = 520;
			}
		}
		
		private function spawnArger():void 
		{
			for (var i:int = 0; i <= 0; i++ ) {
				_soldierFactory = new SoldierFactory();
				_soldier = _soldierFactory.createSoldier(SoldierFactory.SOLDIER_ARGER);
				addChild(_soldier);
				soldier.push(_soldier);
				
				_soldier.behaviour();
				_soldier.x = tower[0].x;
				_soldier.y = 520;
			}
		}
		
		private function update(e:Event):void 
		{
		if(paused == false){
			cameraMov.update(BG1, BG2, BG3);
			soldier.sortOn("x", Array.NUMERIC);
			enemy.sortOn("x", Array.NUMERIC);
			pickup.sortOn("x", Array.NUMERIC);
			
			sL = soldier.length - 1;
			eL = enemy.length - 1;
			//trace(soldier[l]);
			
			for (var i:int = eL; i >= 0; i--) {
					//trace(enemy[i].x - enemy[0].x);
				if (i != 0) {
					if(enemy[i].x - enemy[i - 1].x < 90){
						enemy[i].speed = enemy[0].speed;
						if (enemy[0].anim == 2) {
							enemy[i].anim = 1;
						}
						else if (enemy[0].anim == 1) {
							enemy[i].anim = 1;
						}
					}
				}
			}
			
			//trace(introSound.length + " < " + 53968);
			if (introSound.length >= 53968 ) {
				playcount ++;
				if (playcount == 1600) channel = loopSound.play(0, 999);
			}
			
			
			for (var j:int = sL; j >= 0; j--) {
			
				if (j != 0) {	
					var row:int = soldier[j].x - soldier[j - 1].x;
					//trace(soldier[j-1]);
					if (row < 90) {
						soldier[j - 1].speed = soldier[j].speed;
						if (soldier[j].anim == 2) {
							soldier[j - 1].anim = 1;
						}
						else if (soldier[j].anim == 1) {
							soldier[j - 1].anim = 1;
						}
						
					}else {
						
					}
				}
				
				var xpos:int = soldier[0].x - tower[0].x;
				trace(xpos);
				if (xpos > 120) {
					buyAble = true;
				}else if (soldier[0].x == 0) {
					buyAble = true;
				}else {
					buyAble = false;
				}
			}
			
			
			if (ui.mana <= 0) {
				_troopArray[0].alpha = 0.7;
				_troopArray[1].alpha = 0.7;
				_troopArray[2].alpha = 0.7;
				_troopArray[3].alpha = 0.7;
				_troopArray[4].alpha = 0.7;
			}
			else if (ui.mana <= 199) {
				_troopArray[0].alpha = 0.7;
				_troopArray[1].alpha = 0.7;
				_troopArray[2].alpha = 0.7;
				_troopArray[3].alpha = 0.7;
				_troopArray[4].alpha = 0.7;
			}
			else if (ui.mana <= 299) {
				_troopArray[0].alpha = 1;
				_troopArray[1].alpha = 0.7;
				_troopArray[2].alpha = 0.7;
				_troopArray[3].alpha = 0.7;
				_troopArray[4].alpha = 0.7;
			}
			else if (ui.mana <= 499) {
				_troopArray[0].alpha = 1;
				_troopArray[1].alpha = 1;
				_troopArray[2].alpha = 0.7;
				_troopArray[3].alpha = 0.7;
				_troopArray[4].alpha = 0.7;
			}
			else if (ui.mana <= 799) {
				_troopArray[0].alpha = 1;
				_troopArray[1].alpha = 1;
				_troopArray[2].alpha = 1;
				_troopArray[3].alpha = 0.7;
				_troopArray[4].alpha = 0.7;
			}
			else if (ui.mana <= 1199) {
				_troopArray[0].alpha = 1;
				_troopArray[1].alpha = 1;
				_troopArray[2].alpha = 1;
				_troopArray[3].alpha = 1;
				_troopArray[4].alpha = 0.7;
			}else {
				_troopArray[0].alpha = 1;
				_troopArray[1].alpha = 1;
				_troopArray[2].alpha = 1;
				_troopArray[3].alpha = 1;
				_troopArray[4].alpha = 1;
			}
			
			if (ui.sins <= 0) {
				_troopArray[5].alpha = 0.7;
				_troopArray[6].alpha = 0.7;
				_troopArray[7].alpha = 0.7;
			}
			else if (ui.sins <= 199) {
				_troopArray[5].alpha = 0.7;
				_troopArray[6].alpha = 0.7;
				_troopArray[7].alpha = 0.7;
			}
			else if (ui.sins <= 299) {
				_troopArray[5].alpha = 1;
				_troopArray[6].alpha = 0.7;
				_troopArray[7].alpha = 0.7;
			}
			else if (ui.sins <= 499) {
				_troopArray[5].alpha = 1;
				_troopArray[6].alpha = 1;
				_troopArray[7].alpha = 0.7;
			}else {
				_troopArray[5].alpha = 1;
				_troopArray[6].alpha = 1;
				_troopArray[7].alpha = 1;
			}
			enemyDeath();
			soldierDeath();
			collecterDeath();
			
			damageSoldier();
			
			collect();
			heal();
			healDevil();
			
			waveSystem();
			
		}else {
		}
			
			
		}
		
		private function waveSystem():void 
		{
			
			if (waveCount == 0) {
				waveOne();
				waveCount ++;
			}
			
			else if (waveCount == 5) {
				waveTwo();
				waveCount ++;
			}
			
			else if (waveCount == 10) {
				waveThree();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 15) {
				waveThree();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 20) {
				waveFour();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 25) {
				waveFive();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 30) {
				waveFive();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 35) {
				waveSix();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 43) {
				waveSix();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 51) {
				waveSix();
				waveCount ++;
				devilCount = 0;
			}
			
			else if (waveCount == 59) {
				waveSix();
				waveCount ++;
				devilCount = 0;
			}
		}
		
		private function waveOne():void 
		{
			for (var e:int = 0; e < 4; e++) {
				var _enemy:Enemy;
				_enemyFactory = new EnemyFactory();
				_enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2300 + e * 1200;
				enemy[e].y = 520;
			}
			
		}
		private function waveTwo():void 
		{
			for (var e:int = 0; e < 4; e++) {
				var _enemy:Enemy;
				_enemyFactory = new EnemyFactory();
				devilCount ++;
				if (devilCount == 3) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_ARGER);
				else _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2300 + e * 800;
				enemy[e].y = 520;
			}
			
		}
		
		private function waveThree():void 
		{
			for (var e:int = 0; e < 4; e++) {
				var _enemy:Enemy;
				_enemyFactory = new EnemyFactory();
				devilCount ++;
				if (devilCount == 2) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_ARGER);
				if (devilCount == 3) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_HEALER);
				else _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2300 + e * 500;
				enemy[e].y = 520;
			}
			
		}
		
		private function waveFour():void 
		{
			for (var e:int = 0; e < 4; e++) {
				var _enemy:Enemy;
				_enemyFactory = new EnemyFactory();
				devilCount ++;
				if (devilCount == 2) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_ARGER);
				if (devilCount == 3) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_TANK);
				else _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2300 + e * 500;
				enemy[e].y = 520;
			}
			
		}
		
		private function waveFive():void 
		{
			for (var e:int = 0; e < 4; e++) {
				var _enemy:Enemy;
				_enemyFactory = new EnemyFactory();
				devilCount ++;
				if (devilCount == 2) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_TANK);
				if (devilCount == 3) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_TANK);
				if (devilCount == 4) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_HEALER);
				else _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2300 + e * 400;
				enemy[e].y = 520;
			}
			
		}
		
		private function waveSix():void 
		{
			for (var e:int = 0; e < 7; e++) {
				var _enemy:Enemy;
				_enemyFactory = new EnemyFactory();
				devilCount ++;
				if (devilCount == 2) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_TANK);
				if (devilCount == 3) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_TANK);
				if (devilCount == 4) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_HEALER);
				if (devilCount == 6) _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_ARGER);
				else _enemy = _enemyFactory.createEnemy(EnemyFactory.ENEMY_SCOUT);
				enemy.push(_enemy);
				addChild(_enemy);
				enemy[e].behaviour();
				enemy[e].x = 2200 + e * 900;
				enemy[e].y = 520;
			}
			
		}
		private function heal():void 
		{
			var leng:int = soldier.length -1;
			for (var i:int = soldier.length - 1; i >= 0; i--) {
				if (soldier[i].healing == true) {
					soldier[leng].health += 100;
					_heal = new HealingAngel();
					addChild(_heal);
					addEventListener(Event.ENTER_FRAME, healPos);
					
					channel = healSound.play(0, 1);
				}
			}
		}
		
		private function healDevil():void 
		{
			var leng:int = enemy.length;
			for (var i:int =  0; i < leng; i++) {
				if (enemy[i].healing == true) {
					enemy[0].health += 80;
					_heal2 = new HealingDevil();
					addChild(_heal2);
					addEventListener(Event.ENTER_FRAME, heal2Pos);
					
					channel = healSound.play(0, 1);
				}
			}
		}
		
		private function heal2Pos(e:Event):void 
		{
			_heal2.x = enemy[0].x - 20;
			_heal2.y = soldier[0].y - 20;
			
			if (_heal2.currentFrame >= _heal2.totalFrames) {
				removeChild(_heal2);
				removeEventListener(Event.ENTER_FRAME, heal2Pos);
			}
		}
		
		private function healPos(e:Event):void 
		{
			var leng:int = soldier.length -1;
			_heal.x = soldier[leng].x - 20;
			_heal.y = soldier[leng].y - 20;
			
			if (_heal.currentFrame >= _heal.totalFrames) {
				removeChild(_heal);
				removeEventListener(Event.ENTER_FRAME, healPos);
			}
		}
		private function healPos2(e:Event):void 
		{
				_heal.x = 300;
				_heal.y = 100;
				
				_heal.scaleX = 15;
				_heal.scaleY = 15;
				
			
			
				if (_heal.currentFrame >= _heal.totalFrames) {
					removeEventListener(Event.ENTER_FRAME, healPos2);
					removeChild(_heal);
				}
		}
		
		private function buffpos(e:Event):void 
		{
			_buff.x = 400;
			_buff.y = 300;
				
			_buff.scaleX = 15;
			_buff.scaleY = 15;
				
			
			
			if (_buff.currentFrame >= _buff.totalFrames) {
				removeEventListener(Event.ENTER_FRAME, buffpos);
				removeChild(_buff);
			}
		}
		
		private function judgepos(e:Event):void 
		{
			_judge.x = 400;
			_judge.y = 500;
				
			_judge.scaleX = 5;
			_judge.scaleY = 5;
				
			
			
			if (_judge.currentFrame >= _judge.totalFrames) {
				removeEventListener(Event.ENTER_FRAME, judgepos);
				removeChild(_judge);
			}
		}
		
		private function collect():void 
		{
			for (var i:int = soldierCollecter.length - 1; i >= 0; i--) {
				if (soldierCollecter[i].collectPickup == true) {
					ui.sins += pickup[i].sins;
					pickup[i].removeEventListener(Event.ENTER_FRAME, pickup[i].update);
					removeChild(pickup[i]);
					pickup.splice(i, 1);
					
					soldierCollecter[i].collectPickup = false
					
					channel = collectSound.play(0, 1);
					
				}
			}
		}
		
		private function damageSoldier():void 
		{
			for (var i:int = enemy.length - 1; i >= 0; i--) {
				if (enemy[i].takeDamage == true) {
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
		
		private function collecterDeath():void 
		{
			for (var i:int = soldierCollecter.length - 1; i >= 0; i--) {
				if (soldierCollecter[i].died == true) {
					removeChild(soldierCollecter[i]);
					soldierCollecter.splice(i, 1);
					
					collecterBuy = 0;
				}
			}
		}
		
		private function enemyDeath():void 
		{
			for (var i:int = enemy.length - 1; i >= 0; i--) {
				if (enemy[i].died == true) {
					pickupX = enemy[0].x;
					waveCount ++;
					ui.mana += enemy[i].mana;
					
					enemy[i].removeEventListener(Event.ENTER_FRAME, enemy[i].update);
					removeChild(enemy[i]);
					enemy.splice(i, 1);
					
					spawnPickup();
					pickupNumber = Math.floor(Math.random() * 10);
					trace(pickupNumber);
					
				}
			}
			
		}
		
		private function spawnPickup():void 
		{
			if (pickupNumber <= 5) {
				
				for (var i:int = 0; i < 1; i++){
				_pickupFactory = new PickupFactory();
				_pickup = _pickupFactory.createPickup(PickupFactory.BRONZE_PICKUP);
				pickup.push(_pickup);
				addChild(_pickup);
				_pickup.x = pickupX;
				_pickup.y = 490;
				_pickup.pickupBehaviour();
				
				trace("bronze");
			}
				
			}else if(pickupNumber <= 7) {
				
				for (var j:int = 0; j < 1; j++){
				_pickupFactory = new PickupFactory();
				_pickup = _pickupFactory.createPickup(PickupFactory.SILVER_PICKUP);
				pickup.push(_pickup);
				addChild(_pickup);
				_pickup.x = pickupX;
				_pickup.y = 490;
				_pickup.pickupBehaviour();
			}
				
				
			}else if (pickupNumber <= 9) {
				
				for (var p:int = 0; p < 1; p++){
				_pickupFactory = new PickupFactory();
				_pickup = _pickupFactory.createPickup(PickupFactory.GOLD_PICKUP);
				pickup.push(_pickup);
				addChild(_pickup);
				_pickup.x = pickupX;
				_pickup.y = 490;
				_pickup.pickupBehaviour();
			}
				
				
			}else if (pickupNumber == 0) {
				
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