speedx = 0;		//overall x speed
speedx_multiplier = 1;
resistance = 0.8;
speedy = 0;		//overall y speed
jump_height = -12;	//height of jump
in_air = 4;			//checks if in air
grav = 1;		// sets gravity
frame = 0;
scale = 7;
undash = false;
image_xscale = scale;
image_yscale = scale;

//collision array
collidable = [oGround];

sprite_index = sCat;


//camera following the player

view_enabled[0] = true;
view_visible[0] = true;
// drawing relative to the top left corner of the screen or smth like that
view_xport[0] = 0;		
view_yport[0] = 0;
// geno - width and height of the screen
view_wport[0] = 1500;	
view_hport[0] = 800;
//max speed of camera
cam_speed_x = 5;
cam_speed_y = 5;
//setting the camera
view_camera = camera_create_view(0,0,view_wport[0], view_hport[0], 0, oCat, cam_speed_x, cam_speed_y);
//geno - resizing the screen
surface_resize(application_surface, view_wport[0], view_hport[0]);
//pheno - resizing the screen
window_set_size(view_wport[0], view_hport[0]);

function place_centre_x()
{
	return(view_wport[0]/2 - sprite_get_width(sprite_index)/2 );	
}

function place_centre_y()
{
	return(view_hport[0]/2 - sprite_get_height(sprite_index)/2);
}

x = place_centre_x();
y = place_centre_y();

//step functions
function geno_move() 
	{
	
		speedx += (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * speedx_multiplier;
		speedx *= resistance;
		if (abs(speedx) < 0.3)
			{
			speedx = 0;
			}
		if (speedx > 0)
			{
			image_xscale = scale;
			}
		else if (speedx < 0)
			{
			image_xscale = 0 - scale;
			}
		
		if (in_air == 0 and keyboard_check(ord("W")))
		{
		speedy = jump_height;
		}
		
		speedy += grav;

	}

function pheno_move()
	{
	divisor = ceil(abs(speedx) + abs(speedy));
	repeat(divisor)
		{
		checked_x = true;
		checked_y = true;
			for(var i = 0; i != array_length(collidable); i += 1)
				{
				if(!place_meeting(x+(speedx/divisor), y, collidable[i]) and checked_x == true)
					{
					x += speedx/divisor
					if (x <= 1)
						{
						x = 1
						}
					else if (x >= view_wport - 1)
						{
						x = view_wport - 1
						}
					}
				else
					{
					checked_x = false;
					}
				if(!place_meeting(x, y+(speedy/divisor), collidable[i]) and checked_y == true)
					{
					y += speedy/divisor;
					}
				else
					{
					checked_y = false;
					}
				}
			}
		if (!place_meeting(x, y + 1, oGround))
	    {
			in_air += 1;
	    }
	    else
	    {
			in_air = 0;
			undash = true
		}
		}

function framerate()
	{
	if (speedx = 0)
	{
	frame += 0.01
	if(frame >= 2)
		{
		frame = 0
		}
	}
	else if (abs(speedx) <= 3)
		{
		frame += 0.05
		if (frame >= 9 or frame < 1)
			{
			frame = 1.1
			}
	
		}
	else
		{
		frame += 0.1
		if (frame >= 9 or frame < 1)
			{
			frame = 1.1
			}
	
	}
	}

function dash()
	{
	if(in_air != 0 and undash = true and keyboard_key_press(vk_space))
		{
		speedx *= 10;
		undash = false;
		}
	}