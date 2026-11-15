x = oCat.place_centre_x()
y = 0
spe = 5
dead = 1
alive = 0

function bounce() 
{
	if(place_meeting(x, y + hspeed, oGround))
	{
    sety = -100
	setx = oCat.x
	alive += 1
	
	}
	
	if(y + hspeed <= 0)
		{
		sety = oCat.y + 100
		setx = oCat.x
		spe += 2
		}
}

function kill()
{
	if(place_meeting(x, y, oCat))
	{
		dead = 1
	}
}