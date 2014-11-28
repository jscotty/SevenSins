package game.factorys.soldiers 
{
	import flash.events.Event;
	import game.factorys.Collecter;
	import game.factorys.Soldier;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class CollecterSoldier extends Collecter
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
			
			this.scaleX = 0.28;
			this.scaleY = 0.28;
			
			speed = 5;
			
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