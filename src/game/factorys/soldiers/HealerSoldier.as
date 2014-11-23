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
			
			healerHeal = new SoldierHealerHealing();
			addChild(healerHeal);
			healerHeal.visible = false;
			
			healerDeath = new SoldierHealerDeath();
			addChild(healerDeath);
			healerDeath.visible = false;
			
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			
			health = 500;
			damage = 0;
			hitCounter = 20;
			shooter = false;
			healer = true;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 0) {
				
			} else if (anim == 1) {
				
			} else if (anim == 2) {
				
			}
		}
		
	}

}