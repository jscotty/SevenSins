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
		
		public var died:Boolean = false;
		
		public function behaviour():void
		{
			trace("enemy hit " + damage + " and got an health of: " + health + " he hits every " + hitCounter + " seconds  Shooter = " + shooter + " Gives " + mana + " mana");
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
			this.x -= speed;
			
			trace("Enemy death!" + died);
			
			var soldier:Soldier = Game.soldier;
				if (this.hitTestPoint(soldier.x + 20, soldier.y)) {
					speed = 0;
				}else {
					speed = saveSpeed;
				}
			
			if (shooter == true) {
				if (this.hitTestPoint(soldier.x - 100, soldier.y) || this.hitTestPoint(soldier.x - 60, soldier.y) || this.hitTestPoint(soldier.x - 20, soldier.y) || this.hitTestPoint(soldier.x, soldier.y)) {
					speed = 0;
				}else {
					speed = saveSpeed;
				}
			}
			
			if (health <= 0) {
				death();
			}
		}
		
		public function death():void 
		{
			removeEventListener(Event.ENTER_FRAME, update);
			died = true;
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