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
		
		private var _bullet:Bullet;
		
		private var counter:int;
		
		public function behaviour() :void
		{
			trace("soldier! hits " + damage + " and got an health of: " + health + " he shoots every " + hitCounter + " seconds  Shooter = " + shooter + " Healer = " + healer);
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
			this.x += speed;
			
			if (shooter == true) {
				//hitTest
				var enemy:Enemy = Game.enemy; // Als de enemy tussen de 0 en 100 zit loopt de soldier niet
				if (this.hitTestPoint(enemy.x - 100, enemy.y) || this.hitTestPoint(enemy.x - 60, enemy.y) || this.hitTestPoint(enemy.x - 20, enemy.y) || this.hitTestPoint(enemy.x, enemy.y)) {
					speed = 0;
					
					counter ++;
					//trace(counter);
					if (counter >= _hitCounter) {
						shoot();
						counter = 0;
					}
					
				}else {
					speed = saveSpeed;
				}
			}
		}
		
		private function shoot():void 
		{
			_bullet = new Bullet();
			addChild(_bullet);
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