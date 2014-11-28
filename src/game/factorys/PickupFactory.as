package game.factorys 
{
	import game.factorys.pickups.PickupBronze;
	import game.factorys.pickups.PickupGold;
	import game.factorys.pickups.PickupSilver;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PickupFactory 
	{
		public static const BRONZE_PICKUP:String = "Bronze Pickup";
		public static const SILVER_PICKUP:String = "Silver Pickup";
		public static const GOLD_PICKUP:String = "Gold Pickup";
		
		public function createPickup(pickupType:String) :Pickup
		{
			var pickup:Pickup;
			
			if (pickupType == BRONZE_PICKUP) {
				pickup = new PickupBronze();
			}
			else if (pickupType == SILVER_PICKUP) {
				pickup = new PickupSilver();
			}
			else if (pickupType == GOLD_PICKUP) {
				pickup = new PickupGold();
			}
			else {
				pickup = new Pickup();
			}
			
			return pickup;
			
		}
		
	}

}