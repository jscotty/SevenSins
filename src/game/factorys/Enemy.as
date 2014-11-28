package game.factorys 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
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
		public var attack:Boolean = false;
		private var l:int;
		private var deathCount:int;
		
		
		private var _shooting:String = "shoot.mp3";
		private var _deathS:String = "death.mp3";
		private var _hitS:String = "hit.mp3";
		private var shootSound:Sound;
		private var deathSound:Sound;
		private var channel:SoundChannel;
		private var healCount:int;
		private var hitSound:Sound;
		public var healing:Boolean = false;
		
		public var anim:Number;
		
		public function behaviour():void
		{
			shootSound = new Sound();
			deathSound = new Sound();
			hitSound = new Sound();
			channel = new SoundChannel();
			
			shootSound.load(new URLRequest(_shooting));
			deathSound.load(new URLRequest(_deathS));
			hitSound.load(new URLRequest(_hitS));
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
		if(Game.paused == false){
			this.x -= speed;
			
			//trace("Enemy health!" + health);
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
				if (xposSoldier <= 400 || xposTower <= 600) {
					speed = 0;
					attack = true;
					anim = 2;
					//trace(counter);
					
					if (xposTower <= 600) {
						saveSpeed = 0;
						speed = 0;
					}
					if (xposSoldier == 0) {
						speed = saveSpeed;
						attack = false;
						anim = 0;
					}
					if (xposTower <= 600) {
						attack = true;
					}
					if (attack == true) {
						counter ++;
						if (counter >= _hitCounter) {
							shoot();
							anim = 2;
						}
					}
				}else {
					//trace("cool");
					speed = saveSpeed;
						anim = 0;
						attack = false;
				}
			}else if (healer == true) {
				
					counter ++;
					if (counter >= _hitCounter) {
						anim = 2;
						counter ++;
					
						count ++;
						if (count >= 55) {
							anim = 0;
							count = 0;
							counter = 0;
						}
						
						healCount ++;
						if (healCount == 1) heal();
						if (healCount > 1) healing = false;
					}else {
						healCount = 0;
						healing = false;
					}
				if (xposSoldier <= 80 || xposTower <= 260) {
					speed = 0;
					
					if (xposTower <= 260) {
						health -= 20;
					}
					if (xposSoldier == 0) {
						speed = saveSpeed;
					}
					
				} else {
					//trace("cool");
					speed = saveSpeed;
				}
			}else {
				//melee
				if (xposSoldier <= 80 || xposTower <= 260) {
					speed = 0;
					attack = true;
						anim = 2;
						//trace("yo1");
					
					if (xposSoldier == 0) {
						speed = saveSpeed;
						attack = false;
						anim = 0;
					}
					if (xposTower <= 260) {
						saveSpeed = 0;
						speed = 0;
						anim = 2;
						//trace("yo");
					}
					if (xposTower <= 260) {
						counter ++;
						if (counter > _hitCounter) {
							damageTower();
							counter = 0;
							anim = 2;
						}
					}
					if (attack == true) {
						counter ++;
						if (counter > _hitCounter) {
							damageSoldier();
							anim = 2;
							counter = 0;
						}
					}
				}else {
					//trace("cool");
					speed = saveSpeed;
						anim = 0;
				}
			}
			
			if (health <= 0) {
				death();
			}
		}else {
		}
		}
		
		private function heal():void 
		{
			healing = true;
		}
		
		public function death():void 
		{
			anim = 3;
			attack = false;
			deathCount ++;
			health = -100;
			counter = -100;
			count ++;
			speed = 0;
			if(count == 1) channel = deathSound.play(0, 1);
			if (deathCount == 40) died = true;
		}
		
		private function shoot():void 
		{
			//trace(count);
			count ++;
			if (count == hitCounter) {
				_bullet = new BulletArgerEnemy();
				addChild(_bullet);
				channel = shootSound.play(0, 1);
			}
			if (count >= 40) {
				count = 0;
			}
		}
	
		public function damageSoldier():void 
		{
			//trace("ATTACK!");
				var leng:int = Game.soldier.length -1;
				Game.soldier[leng].health -= damage;
				channel = hitSound.play(0, 1);
			
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