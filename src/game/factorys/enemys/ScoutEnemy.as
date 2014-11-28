package game.factorys.enemys 
{
	import flash.events.Event;
	import game.factorys.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ScoutEnemy extends Enemy
	{
		private var _enemy:EnemyScout;
		private var devilWalk:DevilScoutMove;
		private var devilIdle:DevilScoutIdle;
		private var devilAttack1:DevilScoutAtt1;
		private var devilAttack2:DevilScoutAtt2;
		private var devilDeath:DevilScoutDeath;
		private var randomNumber:Number = Math.floor(Math.random() * 2);
		
		public function ScoutEnemy() 
		{
			devilWalk = new DevilScoutMove();
			addChild(devilWalk);
			devilWalk.visible = true;
			
			devilIdle = new DevilScoutIdle();
			addChild(devilIdle);
			devilIdle.visible = false;
			
			devilAttack1 = new DevilScoutAtt1();
			addChild(devilAttack1);
			devilAttack1.visible = false;
			
			devilAttack2 = new DevilScoutAtt2();
			addChild(devilAttack2);
			devilAttack2.visible = false;
			
			devilDeath = new DevilScoutDeath();
			addChild(devilDeath);
			devilDeath.visible = false;
			
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			
			
			health = 100;
			damage = 10;
			speed = 4;
			mana = 250;
			saveSpeed = 4;
			hitCounter = 28;
			shooter = false;
			healer = false;
			
			randomNumber = Math.floor(Math.random() * 2);
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		public function animation(e:Event):void
		{
			if (anim == 0) {						// Walking
				devilWalk.play();
				devilWalk.visible = true;
				
				devilIdle.stop();
				devilIdle.visible = false;
				
				devilAttack1.stop();
				devilAttack1.gotoAndStop(0);
				devilAttack1.visible = false;
				
				devilAttack2.stop();
				devilAttack2.gotoAndStop(0);
				devilAttack2.visible = false;
				
				devilDeath.stop();
				devilDeath.visible = false;
			} else if (anim == 1) {					// IDLE
				devilWalk.stop();
				devilWalk.visible = false;
				
				devilIdle.play();
				devilIdle.visible = true;
				
				devilAttack1.stop();
				devilAttack1.gotoAndStop(0);
				devilAttack1.visible = false;
				
				devilAttack2.stop();
				devilAttack2.gotoAndStop(0);
				devilAttack2.visible = false;
				
				devilDeath.stop();
				devilDeath.visible = false;
				
			} else if (anim == 2) {					// Atacking
				
				if (randomNumber == 0) {			//Attacking 1
					devilWalk.stop();
					devilWalk.visible = false;
					
					devilIdle.stop();
					devilIdle.visible = false;
					
					devilAttack1.play();
					devilAttack1.visible = true;
						if (devilAttack1.currentFrame == devilAttack1.totalFrames) {
							randomNumber = Math.floor(Math.random() * 2);
						}
					
					devilAttack2.stop();
					devilAttack2.gotoAndStop(0);
					devilAttack2.visible = false;
					
					devilDeath.stop();
					devilDeath.visible = false;
					
				} else if (randomNumber == 1) {			//Attacking 2
					devilWalk.stop();
					devilWalk.visible = false;
					
					devilIdle.stop();
					devilIdle.visible = false;
					
					devilAttack1.stop();
					devilAttack1.gotoAndStop(0);
					devilAttack1.visible = false;
					
					devilAttack2.play();
					devilAttack2.visible = true;
						if (devilAttack2.currentFrame == devilAttack2.totalFrames) {
								randomNumber = Math.floor(Math.random() * 2);
						}
					
					devilDeath.stop();
					devilDeath.visible = false;
					
				}
				
			} else if (anim == 3) {					// Death
				devilWalk.stop();
				devilWalk.visible = false;
					
				devilIdle.stop();
				devilIdle.visible = false;
					
				devilAttack1.stop();
				devilAttack1.gotoAndStop(0);
				devilAttack1.visible = false;
					
				devilAttack2.stop();
				devilAttack2.gotoAndStop(0);
				devilAttack2.visible = false;
					
				devilDeath.play();
				devilDeath.visible = true;
				
			}
		}
		
	}

}