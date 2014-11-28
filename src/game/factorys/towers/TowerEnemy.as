package game.factorys.towers 
{
	import flash.events.Event;
	import game.factorys.Tower;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TowerEnemy extends Tower 
	{
		private var tower:EnemyTower;
		
		private var idle:GateKeeperDevilIdle;
		private var att:GateKeeperDevilAtt;
		private var death:GateKeeperDevilDeath;
		
		public function TowerEnemy() 
		{
			tower = new EnemyTower();
			addChild(tower);
			
			idle = new GateKeeperDevilIdle();
			addChild(idle);
			idle.x = -140;
			idle.y = 10;
			idle.scaleX = 0.3;
			idle.scaleY = 0.3;
			
			att = new GateKeeperDevilAtt();
			att.x = -140;
			att.y = 10;
			att.scaleX = 0.3;
			att.scaleY = 0.3;
			addChild(att);
			att.visible = false;
			att.stop();
			
			death = new GateKeeperDevilDeath();
			death.x = 140;
			death.y = 10;
			death.scaleX = 0.3;
			death.scaleY = 0.3;
			addChild(death);
			death.visible = false;
			death.stop();
			
			health = 1000;
			hitCounter = 20;
			damage = 10;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			var l:int = Game.soldier.length;
			for (var j:int = 0; j < l ; j++) {
			var leng:int = Game.soldier.length - 1;
				var xposSoldier:int = this.x - Game.soldier[leng].x;
				//trace(xposSoldier);
			}
			//trace(xposSoldier);
			
			if (xposSoldier <= 260) {
				if (xposSoldier == 0) {
					anim = 0;
					attack2 = false;
				}else {
					anim = 1;
					attack2 = true;
				}
			}else {
				anim = 0;
				attack2 = false;
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