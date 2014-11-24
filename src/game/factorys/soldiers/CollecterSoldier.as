package game.factorys.soldiers 
{
	import flash.events.Event;
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class CollecterSoldier extends Soldier 
	{
		private var colMove:CollecterSoldierMove;
		private var colDeath:CollecterSoldierDeath;
		
		public function CollecterSoldier() 
		{
			colMove = new CollecterSoldierMove();
			addChild(colMove);
			colMove.visible = true;
			
			colDeath = new CollecterSoldierDeath();
			addChild(colDeath);
			colDeath.visible = false;
			colDeath.stop();
			colDeath.cacheAsBitmap = true;
			/*
			this.scaleX = 1.28;
			this.scaleY = 1.28;*/
			
			health = 200;
			damage = 0;
			speed = 4;
			hitCounter = 0;
			shooter = false;
			healer = false;
			collecter = true;
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 0) {
				colMove.visible = true;
				
				colDeath.visible = false;
			}else if (anim == 3) {
				colMove.visible = false;
				
				colDeath.visible = true;
				colDeath.play();
			}
		}
		
	}

}