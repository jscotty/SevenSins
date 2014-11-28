package menu 
{
	import assets.PlaceHolderButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class MainMenu extends Sprite
	{
		private var _startGame:String = "startGame";
		private var _gameS:String = "https://dl.dropboxusercontent.com/u/81369273/condemnation/looptrack.mp3";
		
		private var _playButton:PlayButton;
		private var _credButton:CreditsButton;
		private var _introButton:IntroButton;
		private var _backButton:BackButton;
		
		private var instruction1:BG1instru;
		private var instruction2:BG2instru;
		private var _leftArr:LeftArr;
		private var _rightArr:RightArr;
		
		private var bg:BGMenu;
		
		private var _credText:CreditsText;
		
		private var bgAngel:HeadAngel;
		private var bgDemon:HeadDemon;
		
		private var logo:LogoMenu;
		
		private var loopSound:Sound;
		private var channel:SoundChannel;
		
		public function MainMenu() 
		{
			loopSound = new Sound();
			channel = new SoundChannel();
			
			loopSound.load(new URLRequest(_gameS));
			channel = loopSound.play(0, 9999);
			
			bg = new BGMenu();
			addChild(bg);
			
			bgAngel = new HeadAngel();
			bgAngel.y = 265.45;
			addChild(bgAngel);
			bgAngel.visible = true;
			
			bgDemon = new HeadDemon();
			bgDemon.x = 584.25;
			bgDemon.y = 270.6;
			addChild(bgDemon);
			bgDemon.visible = true;
			
			_playButton = new PlayButton();
			addChild(_playButton);
			_playButton.x = 400;
			_playButton.y = 260;
			_playButton.visible = true;
			
			_introButton = new IntroButton();
			addChild(_introButton);
			_introButton.x = 400;
			_introButton.y = 380;
			_introButton.visible = true;
			
			_credButton = new CreditsButton();
			addChild(_credButton);
			_credButton.x = 405;
			_credButton.y = 500;
			_credButton.visible = true;
			
			_credText = new CreditsText();
			addChild(_credText);
			_credText.visible = false;
			
			instruction1 = new BG1instru();
			addChild(instruction1);
			instruction1.visible = false;
			
			instruction2 = new BG2instru();
			addChild(instruction2);
			instruction2.visible = false;
			
			_leftArr = new LeftArr();
			addChild(_leftArr);
			_leftArr.x = 110;
			_leftArr.y = 545;
			_leftArr.scaleX = 0.5;
			_leftArr.scaleY = 0.5;
			_leftArr.visible = false;
			
			_rightArr = new RightArr();
			addChild(_rightArr);
			_rightArr.x = 110;
			_rightArr.y = 545;
			_rightArr.scaleX = 0.5;
			_rightArr.scaleY = 0.5;
			_rightArr.visible = false;
			
			_backButton = new BackButton();
			addChild(_backButton);
			_backButton.x = 20;
			_backButton.y = 545;
			_backButton.scaleX = 0.5;
			_backButton.scaleY = 0.5;
			_backButton.visible = false;
			
			logo = new LogoMenu();
			addChild(logo);
			logo.x = 400;
			logo.y = 120;
			
			addEventListener(MouseEvent.CLICK, onClick);
			trace("MAINMENU!");
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == _playButton) {
				dispatchEvent(new Event(_startGame));
				channel.stop();
			} 
			else if (e.target == _credButton) {
				
				_playButton.visible = false;
				
				_introButton.visible = false;
				
				_credButton.visible = false;
				
				_backButton.visible = true;
				
				_credText.visible = true;
				
				instruction1.visible = false;
				
				instruction2.visible = false;
				
				_leftArr.visible = false;
				
				_rightArr.visible = false;
				
				logo.visible = true;
				
			}
			else if (e.target == _introButton) {
				
				_playButton.visible = false;
				
				_introButton.visible = false;
				
				_credButton.visible = false;
				
				_backButton.visible = true;
				
				_credText.visible = false;
				
				instruction1.visible = true;
				
				instruction2.visible = false;
				
				_leftArr.visible = true;
				
				_rightArr.visible = false;
				
				logo.visible = false;
				
			}
			else if (e.target == _backButton) {
				
				_playButton.visible = true;
				
				_introButton.visible = true;
				
				_credButton.visible = true;
				
				_backButton.visible = false;
				
				_credText.visible = false;
				
				instruction1.visible = false;
				
				instruction2.visible = false;
				
				_leftArr.visible = false;
				
				_rightArr.visible = false;
				
				logo.visible = true;
			}
			else if (e.target == _leftArr) {
				
				_playButton.visible = false;
				
				_introButton.visible = false;
				
				_credButton.visible = false;
				
				_backButton.visible = true;
				
				_credText.visible = false;
				
				instruction1.visible = false;
				
				instruction2.visible = true;
				
				_leftArr.visible = false;
				
				_rightArr.visible = true;
				
				logo.visible = false;
			}
			else if (e.target == _rightArr) {
				
				_playButton.visible = false;
				
				_introButton.visible = false;
				
				_credButton.visible = false;
				
				_backButton.visible = true;
				
				_credText.visible = false;
				
				instruction1.visible = true;
				
				instruction2.visible = false;
				
				_leftArr.visible = true;
				
				_rightArr.visible = false;
				
				logo.visible = false;
			}
		}
		
	}

}