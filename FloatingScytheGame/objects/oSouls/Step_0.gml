if (fading > 0) { fading--; }
if (fading == 0) { collected = true; }

if (not place_free (x + dx, y))
{
	if (abs(dx) >= 2)
	{
		dx = -dx * bounce_factor;
	}
	else
	{
		move_contact_solid((dx > 0) ? 0 : 100, abs(dx));
		dx = 0;
	}
}

var moveDir = round(dx / 5);
if (not place_free(x, y + 1)) { dx *= fr; }

dy += grav;
if (not place_free(x, y + dy))
{
	if (abs(dy) >= 2)
	{
		dy = -dy * bounce_factor;
	}
	else 
	{
		move_contact_solid((dy > 0) ? 270 : 90, abs(dy));
		dy = 0;
	}
}

x += dx;
y += dy;