package game.factorys.towers 
{
	import flash.events.Event;
	import game.factorys.Tower;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TowerSoldier extends Tower 
	{
		private var tower:SoldierTower;
		private var idle:GateCeeperAngelIdle;
		private var att:GateCeeperAngelAtt;
		private var death:GateCeeperAngelDeath;
		
		public function TowerSoldier() 
		{
			tower = new SoldierTower();
			addChild(tower);
			
			idle = new GateCeeperAngelIdle();
			idle.x = 100;
			idle.y = -100;
			addChild(idle);
			idle.visible = true
			idle.play();
			
			att = new GateCeeperAngelAtt();
			att.x = 100;
			att.y = -100;
			addChild(att);
			att.visible = false;
			att.stop();
			
			death = new GateCeeperAngelDeath();
			death.x = 100;
			death.y = -100;
			addChild(death);
			death.visible = false;
			death.stop();
			
			health = 1000;
			hitCounter = 20;
			damage = 20;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			for (var j:int = Game.enemy.length - 1; j >= 0 ; j--) {
				var xposEnemy:int = this.x - Game.enemy[j].x;
			}
			//trace(xposEnemy);
			
			if (xposEnemy >= -260) {
				if (xposEnemy == 0) {
					anim = 0;
					attack = false;
				}else {
					anim = 1;
					attack = true;
				}
			}else {
				anim = 0;
				attack = false;
			}
			
			if (anim == 0) {
				idle.visible = true
				idle.play();
				
				att.visible = false;
				att.gotoAndStop(0);
				
				death.visible = false;
			}
			else if (anim == 1) {
				idle.visible = false
				idle.stop();
				
				att.visible = true;
				att.play();
				
				death.visible = false;
			}
			else if (anim == 2) {
				idle.visible = false
				idle.stop();
				
				att.visible = false;
				att.gotoAndStop(0);
				
				death.visible = true;
				death.play();
			}
			
			if (att.currentFrame == att.totalFrames) {
				anim = 0;
			}
		}
		
	}

}