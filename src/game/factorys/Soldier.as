package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Soldier extends Sprite
	{
		private var _health:Number;
		private var _damage:Number;
		private var _speed:Number;
		private var _saveSpeed:Number;
		private var _hitCounter:Number;
		private var _shooter:Boolean;
		private var _healer:Boolean;
		
		private var _bullet:BulletArgerSoldier;
		private var _attack:Boolean = false;
		
		public var died:Boolean = false;
		
		private var counter:int;
		
		public function behaviour() :void
		{	
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
			this.x += speed;
			
			trace("HEALTH : " + health);
				
			for (var j:int = Game.enemy.length - 1; j >= 0 ; j--) {
				var xposEnemy:int = this.x - Game.enemy[j].x;
			}
			for (var ii:int = 0; ii < Game.tower.length;ii++){
				var xposTower:int = this.x - Game.tower[1].x;
			}
			//trace("xposEnemy:" + xposEnemy);
			
			if (shooter == true) {
				//hitTest
				// Als de enemy tussen de 0 en 100 zit loopt de soldier niet
				//trace("xposTower" + xposTower);
				
				if (xposEnemy >= -200 || xposTower >= -200) {
					speed = 0;
					_attack = true;
					//trace(counter);
					
					if (xposTower >= -200) {
						saveSpeed = 0;
						speed = 0;
						_attack = true;
					}
					if (xposEnemy == 0 && xposTower <= -200) {
						speed = saveSpeed;
						_attack = false;
					}
					if (xposEnemy == 0 && xposTower >= -200) {
						_attack = true;
					}
					if (_attack == true) {
						counter ++;
						if (counter >= _hitCounter) {
							shoot();
							counter = 0;
						}
					}
				}else {
					//trace("cool");
					speed = saveSpeed;
				}
			}else {
				//melee
				if (xposEnemy >= -30 || xposTower >= -30) {
					speed = 0;
					_attack = true;
					
					counter ++;
					//trace(counter);
					if (counter >= _hitCounter) {
						counter = 0;
					}
					if (xposTower >= -20) {
						saveSpeed = 0;
						speed = 0;
						_attack = true;
					}
					if (xposEnemy == 0) {
						speed = saveSpeed;
						_attack = false;
					}
					if (xposEnemy == 0 && xposTower >= -30) {
						counter ++;
						if (counter >= _hitCounter) {
							damageTower();
							counter = 0;
						}
					}
					if (_attack == true) {
						counter ++;
						if (counter >= _hitCounter) {
							damageEnemy();
							counter = 0;
						}
					}
				}else {
					//trace("cool");
					speed = saveSpeed;
				}
			}
			
			if (health <= 0) {
				death();
			}
		}
		
		private function death():void 
		{
			died = true;
			//trace("DOOD!!!");
		}
		
		private function shoot():void 
		{
			_bullet = new BulletArgerSoldier();
			addChild(_bullet);
		}
		
		public function damageEnemy():void
		{
			for (var i:int = 0; i < Game.enemy.length; i++) {
				Game.enemy[0].health -= damage;
			}
		}
		
		public function damageTower():void
		{
			for (var i:int = 0; i < Game.tower.length; i++) {
				Game.tower[1].health -= damage / 2;
			}
		}
		
		public function get health() :Number
		{
			return _health;
		}
		
		public function set health(health:Number):void
		{
			_health = health;
		}
		
		public function get damage() :Number
		{
			return _damage;
		}
		
		public function set damage(damage:Number):void
		{
			_damage = damage;
		}
		
		public function get speed() :Number
		{
			return _speed;
		}
		
		public function set speed(speed:Number):void
		{
			_speed = speed;
		}
		
		public function get saveSpeed() :Number
		{
			return _saveSpeed;
		}
		
		public function set saveSpeed(saveSpeed:Number):void
		{
			_saveSpeed = saveSpeed;
		}
		
		public function get hitCounter() :Number
		{
			return _hitCounter;
		}
		
		public function set hitCounter(hitCounter:Number):void
		{
			_hitCounter = hitCounter;
		}
		
		public function get shooter() :Boolean
		{
			return _shooter;
		}
		
		public function set shooter(shooter:Boolean):void
		{
			_shooter = shooter;
		}
		
		public function get healer() :Boolean
		{
			return _healer;
		}
		
		public function set healer(healer:Boolean):void
		{
			_healer = healer;
		}
	}

}