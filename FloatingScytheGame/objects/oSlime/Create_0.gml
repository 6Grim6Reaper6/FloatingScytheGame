hit = false;
xDir = 1;
xspd = 0;
yspd = 0;
aggro = false;
onGround = false;
grav = 0.275;
idleMax = 50;
idle = random_range(0, idleMax);
jumpStep = 0;
jumpSequance = [-8, -5, -2, 2, 5, 8];

emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(emitter, 100, 1000, 1);