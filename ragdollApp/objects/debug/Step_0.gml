//	Debug toggling
if input.debugToggle {
	on = !on
	//physics_pause_enable(on)
}

if input.keyWind and input.mouseLeft {
	wind = true
}
else if wind wind = false


//	Select a bodypart
if on {
	if instance_position(mouse_x,mouse_y,class_bodypart) and input.mouseLeftPress {
		selectedBodypart = instance_position(mouse_x,mouse_y,class_bodypart)
	}
}
//	De-select
if input.mouseRightPress and selectedBodypart > -1 {
	selectedBodypart = -1	
}