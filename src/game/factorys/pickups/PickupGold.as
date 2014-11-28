package game.factorys.pickups 
{
	import game.factorys.Pickup;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PickupGold extends Pickup 
	{
		private var pickup:GoldPickup;
		
		public function PickupGold() 
		{
			pickup = new GoldPickup();
			addChild(pickup);
			
			sins = 300;
			
		}
		
	}

}