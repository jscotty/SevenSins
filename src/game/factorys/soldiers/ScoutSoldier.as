package game.factorys.soldiers 
{
	import flash.events.Event;
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ScoutSoldier extends Soldier 
	{
		private var soldierWalk:SoldierScoutWalking;
		private var soldierIdle:SoldierScoutIdle;
		private var soldierAttack1:SoldierScoutAttack1;
		private var soldierAttack2:SoldierScoutAttack2;
		private var soldierDeath:SoldierScoutDeath;
		private var randomNumber:int;
		
		public function ScoutSoldier() 
		{
			soldierWalk = new SoldierScoutWalking();
			addChild(soldierWalk);
			soldierWalk.visible = true;
			
			soldierIdle = new SoldierScoutIdle();
			addChild(soldierIdle);
			soldierIdle.visible = false;
			
			soldierAttack1 = new SoldierScoutAttack1();
			addChild(soldierAttack1);
			soldierAttack1.visible = false;
			
			soldierAttack2 = new SoldierScoutAttack2();
			addChild(soldierAttack2);
			soldierAttack2.visible = false;
			
			soldierDeath = new SoldierScoutDeath();
			addChild(soldierDeath);
			soldierDeath.visible = false;
			
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			
			
			health = 100;
			damage = 10;
			speed = 4;
			saveSpeed = 4;
			hitCounter = 20;
			shooter = false;
			healer = false;
			
			
			randomNumber = Math.floor(Math.random() * 2);
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		public function animation(e:Event):void
		{
			if (anim == 0) {						// Walking
				soldierWalk.play();
				soldierWalk.visible = true;
				
				soldierIdle.stop();
				soldierIdle.visible = false;
				
				soldierAttack1.stop();
				soldierAttack1.gotoAndStop(0);
				soldierAttack1.visible = false;
				
				soldierAttack2.stop();
				soldierAttack2.gotoAndStop(0);
				soldierAttack2.visible = false;
				
				soldierDeath.stop();
				soldierDeath.visible = false;
			} else if (anim == 1) {					// IDLE
				soldierWalk.stop();
				soldierWalk.visible = false;
				
				soldierIdle.play();
				soldierIdle.visible = true;
				
				soldierAttack1.stop();
				soldierAttack1.gotoAndStop(0);
				soldierAttack1.visible = false;
				
				soldierAttack2.stop();
				soldierAttack2.gotoAndStop(0);
				soldierAttack2.visible = false;
				
				soldierDeath.stop();
				soldierDeath.visible = false;
				
			} else if (anim == 2) {					// Atacking
				trace(randomNumber);
				
				if (randomNumber == 0) {			//Attacking 1
					soldierWalk.stop();
					soldierWalk.visible = false;
					
					soldierIdle.stop();
					soldierIdle.visible = false;
					
					soldierAttack1.play();
					soldierAttack1.visible = true;
						if (soldierAttack1.currentFrame == soldierAttack1.totalFrames) {
							randomNumber = Math.floor(Math.random() * 2);
						}
					
					soldierAttack2.stop();
					soldierAttack2.gotoAndStop(0);
					soldierAttack2.visible = false;
					
					soldierDeath.stop();
					soldierDeath.visible = false;
					
				} else if (randomNumber == 1) {			//Attacking 2
					soldierWalk.stop();
					soldierWalk.visible = false;
					
					soldierIdle.stop();
					soldierIdle.visible = false;
					
					soldierAttack1.stop();
					soldierAttack1.gotoAndStop(0);
					soldierAttack1.visible = false;
					
					soldierAttack2.play();
					soldierAttack2.visible = true;
						if (soldierAttack2.currentFrame == soldierAttack2.totalFrames) {
								randomNumber = Math.floor(Math.random() * 2);
						}
					
					soldierDeath.stop();
					soldierDeath.visible = false;
					
				}
				
			} else if (anim == 3) {					// Death
				soldierWalk.stop();
				soldierWalk.visible = false;
					
				soldierIdle.stop();
				soldierIdle.visible = false;
					
				soldierAttack1.stop();
				soldierAttack1.gotoAndStop(0);
				soldierAttack1.visible = false;
					
				soldierAttack2.stop();
				soldierAttack2.gotoAndStop(0);
				soldierAttack2.visible = false;
					
				soldierDeath.play();
				soldierDeath.visible = true;
				
			}
		}
		
	}

}