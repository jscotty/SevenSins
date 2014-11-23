package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Enemy extends Sprite 
	{
		
		private var _health:Number;
		private var _damage:Number;
		private var _mana:Number;
		private var _speed:Number;
		private var _saveSpeed:Number;
		private var _hitCounter:Number;
		private var _shooter:Boolean;
		private var _healer:Boolean;
		
		private var counter:int;
		private var count:int;
		private var _bullet:BulletArgerEnemy;
		
		public var died:Boolean = false;
		public var takeDamage:Boolean = false;
		public var _attack:Boolean = false;
		private var l:int;
		
		public function behaviour():void
		{
			//trace("enemy hit " + damage + " and got an health of: " + health + " he hits every " + hitCounter + " seconds  Shooter = " + shooter + " Gives " + mana + " mana");
			//trace(saveSpeed);
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
			
			this.x -= speed;
			
			//trace("Enemy death!" + died);
			var l:int = Game.soldier.length;
			for (var j:int = 0; j < l ; j++) {
			var leng:int = Game.soldier.length - 1;
				var xposSoldier:int = this.x - Game.soldier[leng].x;
				//trace(xposSoldier);
			}
			for (var ii:int = 0; ii < Game.tower.length;ii++){
				var xposTower:int = this.x - Game.tower[0].x;
			}
			//trace(xposEnemy);
			//trace("xposSoldier:" + xposSoldier);
			
			if (shooter == true) {
				if (xposSoldier > -200 || xposTower > -200) {
					speed = 0;
					_attack = true;
					//trace(counter);
					
					if (xposTower > -200) {
						saveSpeed = 0;
						speed = 0;
					}
					if (xposSoldier == 0 && xposTower < -200) {
						speed = saveSpeed;
						_attack = false;
					}
					if (xposSoldier == 0 && xposTower > -200) {
						_attack = true;
					}
					if (_attack == true) {
						counter ++;
						if (counter > _hitCounter) {
							//shoot();
							counter = 0;
						}
					}
				}else {
					//trace("cool");
					speed = saveSpeed;
				}
			}else {
				//melee
				if (xposSoldier < 30 || xposTower < 60) {
					speed = 0;
					_attack = true;
						//trace("yo1");
					
					counter ++;
					//trace(counter);
					if (counter > _hitCounter) {
						counter = 0;
					}
					if (xposTower < 60) {
						saveSpeed = 0;
						speed = 0;
						//trace("yo");
					}
					if (xposSoldier == 0) {
						speed = saveSpeed;
						_attack = false;
					}
					if (xposSoldier == 0 && xposTower < 60) {
						counter ++;
						if (counter > _hitCounter) {
							damageTower();
							counter = 0;
						}
					}
					if (_attack == true) {
						counter ++;
						if (counter > _hitCounter) {
							damageSoldier();
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
		
		public function death():void 
		{
			died = true;
			//trace("DOOD!!!");
		}
		
		private function shoot():void 
		{
			_bullet = new BulletArgerEnemy();
			addChild(_bullet);
		}
	
		public function damageSoldier():void 
		{
			for (var i:int = 0; i < Game.soldier.length; i++) {
				var leng:int = Game.soldier.length -1;
				Game.soldier[leng].health -= damage;
			}
			
		}
		
		public function damageTower():void
		{
			for (var i:int = 0; i < Game.tower.length; i++) {
				Game.tower[0].health -= damage / 2;
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
		
		public function get mana() :Number
		{
			return _mana;
		}
		
		public function set mana(mana:Number):void
		{
			_mana = mana;
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