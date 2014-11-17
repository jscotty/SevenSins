package game.factorys 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Enemy extends Sprite 
	{
		
		private var _health:Number;
		private var _damage:Number;
		private var _mana:Number;
		private var _hitCounter:Number;
		private var _shooter:Boolean;
		private var _healer:Boolean;
		
		public function test():void
		{
			trace("enemy hit " + damage + " and got an health of: " + health + " he hits every " + hitCounter + " seconds  Shooter = " + shooter + " Gives " + mana + " mana");
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