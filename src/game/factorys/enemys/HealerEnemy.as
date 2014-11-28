package game.factorys.enemys 
{
	import flash.events.Event;
	import game.factorys.Enemy;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class HealerEnemy extends Enemy 
	{
		private var healerDeath:DevilHealerDeath;
		private var healerHeal:DevilHealerHealing;
		private var healerWalk:DevilHealerMove;
		
		public function HealerEnemy() 
		{
			healerWalk = new DevilHealerMove();
			addChild(healerWalk);
			healerWalk.visible = true;
				healerWalk.play();
			
			healerHeal = new DevilHealerHealing();
			addChild(healerHeal);
			healerHeal.visible = false;
				healerHeal.stop();
			
			healerDeath = new DevilHealerDeath();
			addChild(healerDeath);
			healerDeath.visible = false;
				healerDeath.stop();
			
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			
			health = 30;
			damage = 0;
			speed = 3;
			mana = 275;
			saveSpeed = 3
			hitCounter = 240;
			shooter = false;
			healer = true;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 0 || anim == 1) {
				healerWalk.play();
				healerWalk.visible = true;
				
				healerHeal.gotoAndStop(0);
				healerHeal.stop();
				healerHeal.visible = false;
				
				healerDeath.visible = false;
			} else if (anim == 2) {
				healerWalk.stop();
				healerWalk.visible = false;
				
				healerHeal.play();
				healerHeal.visible = true;
				
				healerDeath.visible = false;
			}
			 else if (anim == 3) {
				healerWalk.stop();
				healerWalk.visible = false;
				
				healerHeal.gotoAndStop(0);
				healerHeal.stop();
				healerHeal.visible = false;
				
				healerDeath.play();
				healerDeath.visible = true;
			}
		}
		
	}

}