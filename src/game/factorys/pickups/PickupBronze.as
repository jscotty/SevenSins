package game.factorys.pickups 
{
	import game.factorys.Pickup;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PickupBronze extends Pickup
	{
		private var pickup:BronzePickup;
		
		public function PickupBronze()
		{
			pickup = new BronzePickup();
			addChild(pickup);
			
			sins = 100;
		}
		
	}

}