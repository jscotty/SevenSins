package game.factorys.soldiers 
{
	import flash.events.Event;
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TankSoldier extends Soldier 
	{
	
		private var tankMove:TankSoldierMove;
		private var tankAtt:TankSoldierAtt;
		private var tankAtt2:TankSoldierAtt2;
		private var tankDeath:TankSoldierDeath;
		
		private var randomNumb:int;
		
		public function TankSoldier() 
		{
			tankMove = new TankSoldierMove();
			addChild(tankMove);
			tankMove.visible = true;
			
			tankAtt = new TankSoldierAtt();
			addChild(tankAtt);
			tankAtt.visible = false;
			tankAtt.stop();
			
			tankAtt2 = new TankSoldierAtt2();
			addChild(tankAtt2);
			tankAtt2.visible = false;
			tankAtt2.stop();
			
			tankDeath = new TankSoldierDeath();
			addChild(tankDeath);
			tankDeath.visible = false;
			tankDeath.stop();
			
			
			this.scaleX = 1.4;
			this.scaleY = 1.4;
			
			health = 350;
			damage = 90;
			speed = 2;
			saveSpeed = 2;
			hitCounter = 37;
			shooter = false;
			healer = false;
			
			randomNumb = Math.floor(Math.random() * 2);
			
			addEventListener(Event.ENTER_FRAME, animation);
			
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 0) {
				tankMove.visible = true;
				
				tankAtt.visible = false;
				tankAtt.gotoAndStop(0);
				tankAtt.stop();
				
				tankAtt2.visible = false;
				tankAtt2.gotoAndStop(0);
				tankAtt2.stop();
				
				tankDeath.visible = false;
				tankDeath.stop();
			} else if (anim == 1) {
				trace("attack");
				tankMove.visible = true;
				
				tankAtt.visible = false;
				tankAtt.gotoAndStop(0);
				tankAtt.stop();
				
				tankAtt2.visible = false;
				tankAtt2.gotoAndStop(0);
				tankAtt2.stop();
				
				tankDeath.visible = false;
				tankDeath.stop();
				
			} else if (anim == 2) {
				if (randomNumb == 0) {
					tankMove.visible = false;
				
					tankAtt.visible = true;
					tankAtt.play();
					
					tankAtt2.visible = false;
					tankAtt2.gotoAndStop(0);
					tankAtt2.stop();
					
					tankDeath.visible = false;
					tankDeath.stop();
				} else if (randomNumb == 1) {
					tankMove.visible = false;
				
					tankAtt.visible = false;
					tankAtt.gotoAndStop(0);
					tankAtt.stop();
					
					tankAtt2.visible = true;
					tankAtt2.play();
					
					tankDeath.visible = false;
					tankDeath.stop();
				}
				
			} else if (anim == 3) {
				tankMove.visible = false;
				
				tankAtt.visible = false;
				tankAtt.gotoAndStop(0);
				tankAtt.stop();
					
				tankAtt2.visible = false;
				tankAtt2.gotoAndStop(0);
				tankAtt2.stop();
					
				tankDeath.visible = true;
				tankDeath.play();
			}
		}
		
	}

}