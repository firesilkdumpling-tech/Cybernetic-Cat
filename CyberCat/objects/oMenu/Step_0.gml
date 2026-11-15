if(oKill.dead == 0)
{
	image_alpha = 0;
	space = 1
}
else
{
	image_alpha = 1;
	if(space == 1 and !keyboard_check(vk_space))
	{space = 0}
	else if(space == 0 and keyboard_check(vk_space))
	{oKill.dead = 0; oKill.x = 0; oKill.y = 0;}	
}