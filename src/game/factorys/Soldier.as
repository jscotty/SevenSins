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
		
		
		private var counter:int;
		
		public function behaviour() :void
		{	
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
			this.x += speed;
			
			if (shooter == true) {
				//hitTest
				// Als de enemy tussen de 0 en 100 zit loopt de soldier niet
				
				
				for (var j:int = 0; j < Game.enemy.length; j++) {
					var xposEnemy:int = this.x - Game.enemy[j].x;
				}
				for (var i:int = 0; i < Game.tower.length;i++){
					var xposTower:int = this.x - Game.tower[1].x;
				}
				trace("xposenemy" + xposEnemy);
				
				if (xposEnemy >= -200 || xposTower >= -200) {
					speed = 0;
					
					counter ++;
					//trace(counter);
					if (counter >= _hitCounter) {
						shoot();
						counter = 0;
					}
					if (xposEnemy == 0) {
						trace("cool");
						speed = saveSpeed;
					}
				}else {
					trace("cool");
					speed = saveSpeed;
				}
			}
		}
		
		private function shoot():void 
		{
			_bullet = new BulletArgerSoldier();
			addChild(_bullet);
		}
		
		public function damageEnemy():void
		{
			for (var i:int = 0; i < Game.enemy.length; i++) {
				Game.enemy[i].health -= damage;
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