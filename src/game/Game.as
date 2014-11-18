package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite 
	{	
		private var dir:Number;
		private var BG3:BackgroundL3;
		private var BG2:BackgroundL2;
		private var BG1:BackgroundL1;
		private var cameraMov:CameraMovement;
		
		public function Game(s:Stage) 
		{
			BG3 = new BackgroundL3;
			BG2 = new BackgroundL2;
			BG1 = new BackgroundL1;
			cameraMov = new CameraMovement();
			
			trace("GAME!!");
			s.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, update);
			
			
			BG3.scaleX = 3;
			addChild(BG3);
			
			BG2.scaleX = 2;
			addChild(BG2);
			
			BG1.scaleX = 4;
			addChild(BG1);
			
			
			
		}
		
		private function onKeyDown(e:KeyboardEvent)
		{
			cameraMov.onKeyDown(e);
			
		}
		
		private function onKeyUp(e:KeyboardEvent)
		{
			cameraMov.onKeyUp(e);
		}
		
		private function update(e:Event)
		{
			cameraMov.update(BG1, BG2, BG3);
			
		}
		
		 
	}

}