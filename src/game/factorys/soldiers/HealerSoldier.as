package game.factorys.soldiers 
{
	import flash.events.Event;
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class HealerSoldier extends Soldier 
	{
		private var healerWalk:SoldierHealerMove;
		private var healerHeal:SoldierHealerHealing;
		private var healerDeath:SoldierHealerDeath;
		
		public function HealerSoldier() 
		{
			healerWalk = new SoldierHealerMove();
			addChild(healerWalk);
			healerWalk.visible = true;
				healerWalk.play();
			
			healerHeal = new SoldierHealerHealing();
			addChild(healerHeal);
			healerHeal.visible = false;
				healerHeal.stop();
			
			healerDeath = new SoldierHealerDeath();
			addChild(healerDeath);
			healerDeath.visible = false;
				healerDeath.stop();
			
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			
			health = 30;
			damage = 0;
			speed = 3;
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