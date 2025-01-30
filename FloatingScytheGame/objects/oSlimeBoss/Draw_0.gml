if (iFrames > 0) { image_alpha = ((iFrames % 10 ) * 0.1); }
else { image_alpha = 1; }

if (isAttacking)
{
	sprite_index = sSlimeAttackBoss;
	mask_index = sSlimeAttackBoss;
}
else
{
	if (not onGround) { sprite_index = sSlimeJumpBoss; mask_index = sSlimeJumpBoss; }
	else { sprite_index = sSlimeIdleBoss; mask_index = sSlimeIdleBoss; }
}


draw_self();