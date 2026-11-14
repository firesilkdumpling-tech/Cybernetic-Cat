draw_self();

if (flash > 0)
{
	gpu_set_fog(true, c_white, 0, 1);   // turns every opaque pixel white
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, flash);
	gpu_set_fog(false, c_white, 0, 0);  // always reset fog afterwards
}