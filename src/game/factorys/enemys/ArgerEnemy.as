package game.factorys.enemys 
{
	import flash.events.Event;
	import game.factorys.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ArgerEnemy extends Enemy
	{
		private var enemyMove:DevilArgerWalk;
		private var enemyIdle:DevilArgerIdle;
		private var enemyAtt:DevilArgerShoot;
		private var enemyDeath:DevilArgerDeath;
		
		public function ArgerEnemy() 
		{
			enemyMove = new DevilArgerWalk();
			addChild(enemyMove);
			enemyMove.visible = true;
			enemyMove.play();
			
			enemyIdle = new DevilArgerIdle();
			addChild(enemyIdle);
			enemyIdle.visible = false;
			enemyIdle.stop();
			
			enemyAtt = new DevilArgerShoot();
			addChild(enemyAtt);
			enemyAtt.visible = false;
			enemyAtt.stop();
			
			enemyDeath = new DevilArgerDeath();
			addChild(enemyDeath);
			enemyDeath.visible = false;
			enemyDeath.stop();
			
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			
			
			trace("arger");
			
			health = 145;
			damage = 5;
			speed = 7;
			mana = 300;
			saveSpeed = 7;
			hitCounter = 26;
			shooter = true;
			healer = false;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 0) {
				enemyMove.visible = true;
				enemyMove.play();
				
				enemyIdle.visible = false;
				enemyIdle.stop();
				
				enemyAtt.visible = false;
				enemyAtt.gotoAndStop(0);
				
				enemyDeath.visible = false;
				
			}
			
			else if (anim == 1) {
				enemyMove.visible = false;
				enemyMove.stop();
				
				enemyIdle.visible = true;
				enemyIdle.play();
				
				enemyAtt.visible = false;
				enemyAtt.gotoAndStop(0);
				
				enemyDeath.visible = false;
				
			}
			
			else if (anim == 2) {
				enemyMove.visible = false;
				enemyMove.play();
				
				enemyIdle.visible = false;
				enemyIdle.stop();
				
				enemyAtt.visible = true;
				enemyAtt.play();
				
				enemyDeath.visible = false;
				
			}
			
			else if (anim == 3) {
				enemyMove.visible = false;
				enemyMove.play();
				
				enemyIdle.visible = false;
				enemyIdle.stop();
				
				enemyAtt.visible = false;
				enemyAtt.gotoAndStop(0);
				
				enemyDeath.visible = true;
				enemyDeath.play();
				
			}
		}
		
	}

}