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
		private var speed1:Number = 1.5;
		private var speed2:Number = 1;
		private var speed3:Number = 0.5;
		
		
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
			BG1.x += moveSpeed * speed1;
			for (var i:int = 0; i < Game.tower.length; i++) {
				Game.tower[i].x += moveSpeed * speed1;
			}
			for (var j:int = 0; j < Game.enemy.length; j++) {
				Game.enemy[j].x += moveSpeed * speed1;
			}
			for (var ii:int = 0; ii < Game.soldier.length; ii++) {
				Game.soldier[ii].x += moveSpeed * speed1;
			}
			BG2.x += moveSpeed * speed2;
			BG3.x += moveSpeed * speed3;
			
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