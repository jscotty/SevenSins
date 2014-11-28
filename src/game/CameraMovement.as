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
		
		public var speed1:Number = 3.5;
		public var speed2:Number = 3.2;
		public var speed3:Number = 2.5;
		
		private var saveSpeed1:Number;
		private var saveSpeed2:Number;
		private var saveSpeed3:Number;
		
		
		public function CameraMovement() 
		{
			saveSpeed1 = speed1;
			saveSpeed2 = speed2;
			saveSpeed3 = speed3;
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
		
		public function update(BG1:BackgroundWalking, BG2:BackgroundLay2, BG3:BackgroundLay3):void
		{
			for (var i:int = 0; i < Game.tower.length; i++) {
				Game.tower[i].x += moveSpeed * speed1;
			}
			for (var j:int = 0; j < Game.enemy.length; j++) {
				Game.enemy[j].x += moveSpeed * speed1;
			}
			for (var ii:int = 0; ii < Game.soldier.length; ii++) {
				Game.soldier[ii].x += moveSpeed * speed1;
			}
			for (var jj:int = 0; jj < Game.soldierCollecter.length; jj++) {
				Game.soldierCollecter[jj].x += moveSpeed * speed1;
			}
			for (var ij:int = 0; ij < Game.pickup.length; ij++) {
				Game.pickup[ij].x += moveSpeed * speed1;
			}
			
			BG1.x += moveSpeed * speed1;
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
			
			
			if (BG1.x >= 120) {
				
			} else if (BG1.x <= -1850) {
				
			} else {
				
				speed1 = saveSpeed1;
				speed2 = saveSpeed2;
				speed3 = saveSpeed3;
			}
		}
	}

}