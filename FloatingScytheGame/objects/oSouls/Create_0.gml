collected = false;
hit = false;

var start_sp = 8;
var start_dir = random(360);
dx = lengthdir_x(start_sp,start_dir);
dy = lengthdir_y(start_sp,start_dir);
grav = .5;
bounce_factor = .5;
fr = .9;