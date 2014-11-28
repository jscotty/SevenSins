package game.factorys 
{
	import assets.BloodDamage;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import game.Game;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Soldier extends Sprite
	{
		public var anim:Number = 0;
		
		private var _health:Number;
		private var _damage:Number;
		private var _speed:Number;
		private var _saveSpeed:Number;
		private var _hitCounter:Number;
		private var _shooter:Boolean;
		private var _healer:Boolean;
		private var _collecter:Boolean;
		
		private var _bullet:BulletArgerSoldier;
		public var attack:Boolean = false;
		public var idle:Boolean = false;
		
		public var died:Boolean = false;
		
		private var counter:int;
		private var count:int;
		private var healCount:int;
		private var deathCount:int;
		private var blood:BloodDamage;
		public var healing:Boolean = false;
		
		private var shootSound:Sound;
		private var channel:SoundChannel;
		private var _shooting:String = "shoot.mp3";
		private var _deathS:String = "death.mp3";
		private var deathSound:Sound;
		private var counterTower:int;
		
		
		public function behaviour() :void
		{	
			shootSound = new Sound();
			deathSound = new Sound();
			channel = new SoundChannel();
			
			shootSound.load(new URLRequest(_shooting));
			deathSound.load(new URLRequest(_deathS));
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		public function update(e:Event):void 
		{
			if(Game.paused == false){
			this.x += speed;
			
			//trace("HEALTH : " + health);
			
				
			for (var j:int = Game.enemy.length - 1; j >= 0 ; j--) {
				var xposEnemy:int = this.x - Game.enemy[j].x;
			}
			for (var ii:int = 0; ii < Game.tower.length;ii++){
				var xposTower:int = this.x - Game.tower[1].x;
			}
			//trace("xposEnemy:" + xposEnemy);
			
			if (shooter == true) {
				if (xposEnemy > -400 || xposTower > -600) {
					speed = 0;
					anim = 2;
					attack = true;
					//trace(counter);
					
					if (xposTower >= -600) {
						saveSpeed = 0;
						speed = 0;
						attack = true;
						anim = 2;
					}
					if (xposEnemy == 0 && xposTower < -600) {
						speed = saveSpeed;
						anim = 0;
						attack = false;
						count = 0;
						counter = 0;
						idle = false;
					}
					if (attack == true) {
						anim = 2;
						counter ++;
						attack = true;
						if (counter >= _hitCounter) {
							shoot();
							if (counter >= 40) counter = 0;
						}
					}
				}else {
					//trace("cool");
					speed = saveSpeed;
						count = 0;
						counter = 0;
						anim = 0;
						idle = false;
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
				if (xposEnemy >= -50 || xposTower >= -150) {
					speed = 0;
					
					if (xposTower >= -150) {
						health -= 20;
					}
					if (xposEnemy == 0) {
						speed = saveSpeed;
					}
					
				} else {
					//trace("cool");
					speed = saveSpeed;
				}
			}else {
				//melee
				if (xposEnemy >= -30 || xposTower >= -190) {
					speed = 0;
					anim = 2;
						//trace("yo1");
						
					idle = true;
					attack = true;
					
					counter ++;
					//trace(counter);
					if (counter >= hitCounter) {
						counter = 0;
					}
					if (xposTower >= -190) {
						saveSpeed = 0;
						anim = 2;
						speed = 0;
						counterTower ++;
						if (counterTower >= hitCounter) {
							damageTower();
							anim = 2;
							counterTower = 0;
						}
					}
					if (xposEnemy == 0 && xposTower < -190) {
						speed = saveSpeed;
						anim = 0;
						attack = false;
						idle = false;
						counter = 0;
					}
					if (xposEnemy == 0) {
						attack = false;
						idle = false;
					}
					if (attack == true) {
						counter ++;
						anim = 2;
						attack = true;
						idle = true;
						if (counter >= hitCounter) {
							damageEnemy();
							counter = 0;
						}
					}
				}else {
					//trace("cool");
						speed = saveSpeed;
						attack = false;
						counter = 0;
						anim = 0;
						idle = false;
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
			if(count == 1) channel = deathSound.play(0, 1);
			if (deathCount == 40) died = true;
			//trace("DOOD!!!");
		}
		
		private function shoot():void 
		{
			count ++;
			if (count == 1) {
				_bullet = new BulletArgerSoldier();
				channel = shootSound.play(0, 1);
				addChild(_bullet);
			}
			if (count >= 15) count = 0;
		}
		
		public function damageEnemy():void
		{
					Game.enemy[0].health -= damage;
					//trace("ATTACK!");
			
				
		}
		
		public function damageTower():void
		{
				Game.tower[1].health -= damage;
			
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
		
		public function get collecter() :Boolean
		{
			return _collecter;
		}
		
		public function set collecter(collecter:Boolean):void
		{
			_collecter = collecter;
		}
	}

}