if (distance_to_object(oPlayer) < 80 or permenant)
{
    if image_alpha != 1
    {
    image_alpha += .05;
    alpha += .05;
    }
}else
{
    if image_alpha != 0
    {
    image_alpha -=.05;
    alpha -= .05;
    }
}

if (distance_to_object(oPlayer) < 20 or permenant)
{
    clicked = true;
    image_index = 1;
    text = Localtext;
}