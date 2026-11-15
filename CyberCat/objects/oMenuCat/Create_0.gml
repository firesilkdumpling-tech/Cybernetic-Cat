frame = 0
function animate(incr,sIncr)
{
	if (frame < 1) {frame += sIncr} else if (frame > 3 and frame < 4) {frame += sIncr} else{
	frame += incr}
	
	image_index = floor(frame)
	if (frame >= 5)
	{
		frame = 0
	}
}