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
		
		public var died:Boolean = false;
		public var _attack:Boolean = false;
		
		public function behaviour():void
		{
			trace("enemy hit " + damage + " and got an health of: " + health + " he hits every " + hitCounter + " seconds  Shooter = " + shooter + " Gives " + mana + " mana");
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
			this.x -= speed;
			
			//trace("Enemy death!" + died);
			
			for (var j:int = Game.soldier.length - 1; j > 0 ; j--) {
				var xposSoldier:int = this.x - Game.soldier[j].x;
				//trace(Game.soldier);
			}
			for (var ii:int = 0; ii < Game.tower.length;ii++){
				var xposTower:int = this.x - Game.tower[0].x;
			}
			
			if (shooter == true) {
				//hitTest
				// Als de enemy tussen de 0 en 100 zit loopt de soldier niet
				
				if (xposSoldier <= 200 || xposTower <= 200) {
					speed = 0;
					_attack = true;
					//trace(counter);
					
					if (xposTower >= 200) {
						saveSpeed = 0;
						speed = 0;
						_attack = true;
					}
					if (xposSoldier == 0 && xposTower <= 200) {
						speed = saveSpeed;
						_attack = false;
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
				if (xposSoldier >= 20 || xposTower >= 20) {
					speed = 0;
					_attack = true;
					
					counter ++;
					//trace(counter);
					if (xposTower >= 20) {
						saveSpeed = 0;
						speed = 0;
						_attack = true;
					}
					if (xposSoldier == 0) {
						speed = saveSpeed;
						_attack = false;
					}
					if (_attack == true) {
						counter ++;
						if (counter >= _hitCounter) {
							counter = 0;
							damageSoldier();
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
		
		private function shoot():void 
		{
			trace("SHOOTINH");
		}
	
		private function damageSoldier():void 
		{
			for (var i:int = 0; i < Game.soldier.length; i++) {
				var l:int = Game.soldier.length -1;
				Game.soldier[l].health -= damage;
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