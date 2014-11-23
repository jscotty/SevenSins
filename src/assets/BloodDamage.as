package assets 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class BloodDamage extends Sprite
	{
		private var blood:BloodSpat;
		
		public function BloodDamage() 
		{
			blood = new BloodSpat();
			addChild(blood);
			
		}
	}

}