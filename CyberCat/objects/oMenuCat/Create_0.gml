frame = 0
function animate(incr)
{
	frame += incr
	image_index = floor(frame)
	if (frame >= 5)
	{
		frame = 0
	}
}