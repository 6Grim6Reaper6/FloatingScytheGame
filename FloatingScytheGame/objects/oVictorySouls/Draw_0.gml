with (oPlayer)
{
	switch (souls)
	{
		case (117):
			other.text = "You have collected all 117 souls!";
			break;
		case (1):
			other.text = "You have only collected 1 soul? that's a talent!";
			break;
		default:
			other.text = "You have collected " + string(souls) + " souls!";
		
	}
}



// Inherit the parent event
event_inherited();

