package game.factorys.enemys 
{
	import flash.events.Event;
	import game.factorys.Enemy;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TankEnemy extends Enemy 
	{
		private var tankMove:TankDemonWalk;
		private var tankAtt1:TankDemonAtt1;
		private var tankAtt2:TankDemonAtt2;
		private var tankDeath:TankDemonDeath;
		
		private var randomNumber:int = Math.floor(Math.random() * 2);
		
		
		public function TankEnemy() 
		{
			tankMove = new TankDemonWalk();
			addChild(tankMove);
			tankMove.visible = true;
			tankMove.play();
			
			tankAtt1 = new TankDemonAtt1();
			addChild(tankAtt1);
			tankAtt1.visible = false;
			tankAtt1.stop();
			
			tankAtt2 = new TankDemonAtt2();
			addChild(tankAtt2);
			tankAtt2.visible = false;
			tankAtt2.stop();
			
			tankDeath = new TankDemonDeath();
			addChild(tankDeath);
			tankDeath.visible = false;
			tankDeath.stop();
			
			this.scaleX = 0.8;
			this.scaleY = 0.8;
			
			health = 150;
			damage = 20;
			speed = 4.8;
			mana = 300;
			saveSpeed = 4.8;
			hitCounter = 30;
			shooter = false;
			healer = false;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 0) {
				tankMove.visible = true;
				tankMove.play();
				
				tankAtt1.visible = false;
				tankAtt1.gotoAndStop(0);
				
				tankAtt2.visible = false;
				tankAtt2.gotoAndStop(0);
				
				tankDeath.visible = false;
				tankDeath.stop();
			}
			else if (anim == 1) {
				tankMove.visible = true;
				tankMove.play();
				
				tankAtt1.visible = false;
				tankAtt1.gotoAndStop(0);
				
				tankAtt2.visible = false;
				tankAtt2.gotoAndStop(0);
				
				tankDeath.visible = false;
				tankDeath.stop();
			}
			else if (anim == 2) {
				if (randomNumber == 0) {
					tankMove.visible = false;
					tankMove.stop();
				
					tankAtt1.visible = true;
					tankAtt1.play();
					
					tankAtt2.visible = false;
					tankAtt2.gotoAndStop(0);
					
					tankDeath.visible = false;
					tankDeath.stop();
				
					if (tankAtt1.currentFrame == tankAtt1.totalFrames) {
						randomNumber = Math.floor(Math.random() * 2);
					}
				}
				else if (randomNumber == 1) {
					tankMove.visible = false;
					tankMove.stop();
				
					tankAtt1.visible = false;
					tankAtt1.gotoAndStop(0);
					
					tankAtt2.visible = true;
					tankAtt2.play();
					
					tankDeath.visible = false;
					tankDeath.stop();
					
					if (tankAtt2.currentFrame == tankAtt2.totalFrames) {
						randomNumber = Math.floor(Math.random() * 2);
					}
				}
			}
			else if (anim == 3) {
				tankMove.visible = false;
				tankMove.play();
				
				tankAtt1.visible = false;
				tankAtt1.gotoAndStop(0);
				
				tankAtt2.visible = false;
				tankAtt2.gotoAndStop(0);
				
				tankDeath.visible = true;
				tankDeath.play();
			}
			
		}
		
	}

}