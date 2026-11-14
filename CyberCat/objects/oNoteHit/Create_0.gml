scale = 6;
image_alpha = 1;
image_xscale = scale;
image_yscale = scale;
flash = 0;

function keypress(_x, key){
	if (x == _x and keyboard_check(ord(key)))
		{
		image_alpha = 0.7;
		flash = 0.4;
		}
	else if(x == _x)
		{
		image_alpha = 1
		flash = 0;
		}
}