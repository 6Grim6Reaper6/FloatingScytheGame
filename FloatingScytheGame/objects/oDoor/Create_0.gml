open = false;
finished = false;
image_speed = 0;

emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(emitter, 100, 1000, 1);
audio_emitter_position(emitter, x, y, 0);