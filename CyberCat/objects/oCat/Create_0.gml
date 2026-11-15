//oCat

speedx = 0;				//overall x speed
speedx_multiplier = 1;
resistance = 0.8;
speedy = 0;				//overall y speed
jump_height = -12;		//height of jump
in_air = 4;				//checks if in air
grav = 1;				//sets gravity
frame = 0;
scale = 7;
undash = 30;
facing = 1;				//1 = right, -1 = left (image_xscale stays positive so the mask never mirrors)
image_xscale = scale;
image_yscale = scale;

//collision array
collidable = [oGround];

sprite_index = sCat;

//camera following the player
view_enabled[0] = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1500;
view_hport[0] = 800;
cam_speed_x = 5;
cam_speed_y = 5;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, oCat, cam_speed_x, cam_speed_y);
surface_resize(application_surface, view_wport[0], view_hport[0]);
window_set_size(view_wport[0], view_hport[0]);

function place_centre_x()
{
	return (view_wport[0] / 2 - sprite_get_width(sprite_index) / 2);
}

function place_centre_y()
{
	return (view_hport[0] / 2 - sprite_get_height(sprite_index) / 2);
}

x = 348;
y = 515;

//step functions
function collides_at(_x, _y)
{
	for (var i = 0; i < array_length(collidable); i++)
	{
		if (place_meeting(_x, _y, collidable[i])) return true;
	}
	return false;
}

//pushes the player out of a wall if it ever ends up inside one
function unstick()
{
	if (!collides_at(x, y)) return;
	for (var i = 1; i <= 200; i++)
	{
		if (!collides_at(x + i, y)) { x += i; return; }
		if (!collides_at(x - i, y)) { x -= i; return; }
	}
}

function geno_move()
{
	speedx += (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * speedx_multiplier;
	speedx *= resistance;
	if (abs(speedx) < 0.3)
	{
		speedx = 0;
	}

	if (speedx > 0) facing = 1;
	else if (speedx < 0) facing = -1;

	/*if (in_air == 0 and keyboard_check(ord("W")))
	{
		speedy = jump_height;
	}*/
	speedy += grav;
}

function pheno_move()
{
	unstick();

	var _hit_x = false;
	var _hit_y = false;
	var _steps = max(1, ceil(abs(speedx) + abs(speedy)));
	var _dx = speedx / _steps;
	var _dy = speedy / _steps;
	repeat (_steps)
	{
		if (!_hit_x)
		{
			if (!collides_at(x + _dx, y)) x += _dx;
			else { _hit_x = true; speedx = 0; }
		}
		if (!_hit_y)
		{
			if (!collides_at(x, y + _dy)) y += _dy;
			else { _hit_y = true; speedy = 0; }
		}
	}

	x = clamp(x, 1, room_width - 1);

	if (collides_at(x, y + 1))
	{
		in_air = 0;
	}
	else
	{
		in_air += 1;
	}
}

function framerate()
{
	if (speedx == 0)
	{
		frame += 0.01;
		if (frame >= 2)
		{
			frame = 0;
		}
	}
	else if (abs(speedx) <= 3)
	{
		frame += 0.05;
		if (frame >= 9 or frame < 1)
		{
			frame = 1.1;
		}
	}
	else
	{
		frame += 0.1;
		if (frame >= 9 or frame < 1)
		{
			frame = 1.1;
		}
	}
}

function dash()
{
	if (undash < 0 and keyboard_check_pressed(vk_space))
	{
		if (in_air == 0)
		{
			speedx = facing * 30;
		}
		else
		{
			speedx = facing * 50;
		}
		undash = 50;
	}
}