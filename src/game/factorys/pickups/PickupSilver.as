package game.factorys.pickups 
{
	import game.factorys.Pickup;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PickupSilver extends Pickup
	{
		private var pickup:SilverPickup;
		
		public function PickupSilver()
		{
			pickup = new SilverPickup();
			addChild(pickup);
			
			sins = 250;
		}
		
	}

}