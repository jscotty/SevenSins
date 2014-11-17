package menu 
{
	import assets.PlaceHolderButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class MainMenu extends Sprite
	{
		private var _startGame:String = "startGame";
		private var _button:PlaceHolderButton;
		
		public function MainMenu() 
		{
			_button = new PlaceHolderButton();
			addChild(_button);
			_button.x = 300;
			_button.y = 200;
			
			_button.addEventListener(MouseEvent.CLICK, onClick);
			trace("MAINMENU!");
		}
		
		private function onClick(e:MouseEvent):void 
		{
			dispatchEvent(new Event(_startGame));
		}
		
	}

}