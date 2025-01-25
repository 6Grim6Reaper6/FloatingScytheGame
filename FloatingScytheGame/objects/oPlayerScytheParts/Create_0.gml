image_speed = 0;
image_angle = random(360);
gravity = .4;
if instance_exists(oDeath)
{
depth = oDeath.depth-1;
}
iframe = 120;
randomize();
spin = choose(20,-20);