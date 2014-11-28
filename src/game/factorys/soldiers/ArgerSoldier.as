package game.factorys.soldiers 
{
	import flash.events.Event;
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ArgerSoldier extends Soldier 
	{
		private var soldierMove:ArgerSoldierMove;
		private var soldierIdle:ArgerSoldierIdle;
		private var soldierAtt:ArgerSoldierAtt;
		private var soldierDeath:ArgerSoldierDeath;
		
		public function ArgerSoldier() 
		{
			soldierMove = new ArgerSoldierMove();
			addChild(soldierMove);
			soldierMove.visible = true;
			soldierMove.play();
			
			soldierIdle = new ArgerSoldierIdle();
			addChild(soldierIdle);
			soldierIdle.visible = false;
			soldierIdle.stop();
			
			soldierAtt = new ArgerSoldierAtt();
			addChild(soldierAtt);
			soldierAtt.visible = false;
			soldierAtt.stop();
			
			soldierDeath = new ArgerSoldierDeath();
			addChild(soldierDeath);
			soldierDeath.visible = false;
			soldierDeath.stop();
			
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			
			trace("arger");
			
			health = 155;
			damage = 5;
			speed = 4;
			saveSpeed = 4;
			hitCounter = 26;
			shooter = true;
			healer = false;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 0) {
				soldierMove.visible = true;
				soldierMove.play();
				
				soldierIdle.visible = false;
				soldierIdle.stop();
				
				soldierAtt.visible = false;
				soldierAtt.gotoAndStop(0);
				
				soldierDeath.visible = false;
				
			}
			
			else if (anim == 1) {
				soldierMove.visible = false;
				soldierMove.stop();
				
				soldierIdle.visible = true;
				soldierIdle.play();
				
				soldierAtt.visible = false;
				soldierAtt.gotoAndStop(0);
				
				soldierDeath.visible = false;
				
			}
			
			else if (anim == 2) {
				soldierMove.visible = false;
				soldierMove.play();
				
				soldierIdle.visible = false;
				soldierIdle.stop();
				
				soldierAtt.visible = true;
				soldierAtt.play();
				
				soldierDeath.visible = false;
				
			}
			
			else if (anim == 3) {
				soldierMove.visible = false;
				soldierMove.play();
				
				soldierIdle.visible = false;
				soldierIdle.stop();
				
				soldierAtt.visible = false;
				soldierAtt.gotoAndStop(0);
				
				soldierDeath.visible = true;
				soldierDeath.play();
				
			}
		}
		
	}

}