package game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class CameraMovement 
	{
		private var moveSpeed:Number = 0;
		private var keyDown:Boolean;
		
		
		public function CameraMovement() 
		{
			
		}
		
		public function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 37)
			{
				moveSpeed = -5;
				keyDown = true;
			}
			
			if (e.keyCode == 39)
			{
				moveSpeed = 5;
				keyDown = true
			}
		}
		
		public function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 37)
			{
				keyDown = false;
			}
			
			if (e.keyCode == 39)
			{
				keyDown = false;
			}
		}
		
		public function update(BG1:BackgroundL1, BG2:BackgroundL2, BG3:BackgroundL3):void
		{
			BG1.x += moveSpeed * 2;
			BG2.x += moveSpeed * 1.5;
			BG3.x += moveSpeed * 1;
			
			if (moveSpeed > 0 && keyDown == false)
			{
				moveSpeed -= 0.25;
			}
			else if (moveSpeed < 0 && keyDown == false)
			{
				moveSpeed += 0.25;
			}
		}
	}

}