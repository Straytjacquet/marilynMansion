switch(states)
{
	#region Free
		case states.free:
			
			if inventory[inventoryIndex].item == item.flashlight {
				if arm1 > -1 draw_sprite_ext(arm1,0,x + (arm1_offsetX*image_xscale), y + arm1_offsetY, image_xscale,1,gunRotation+gunRotation,c_white,1)
			
				draw_self()
			
				if arm0 > -1 draw_sprite_ext(arm0,0,x + (arm0_offsetX*image_xscale), y + arm0_offsetY, 1, image_xscale,gunRotation,c_white,1)	
			}
			else {
				draw_self()	
			}
		
		break
	#endregion
	
	#region Aim
		case states.aim:
		
			if mouse_x > x image_xscale = 1 else image_xscale = -1
		
			if arm1 > -1 draw_sprite_ext(arm1,0,x + (arm1_offsetX*image_xscale), y + arm1_offsetY, image_xscale,1,gunRotation+gunRotation,c_white,1)
		
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,c_white,1)
			
			if arm0 > -1 draw_sprite_ext(arm0,0,x + (arm0_offsetX*image_xscale), y + arm0_offsetY, 1, image_xscale,gunRotation,c_white,1)	
		
		break	
	#endregion
}

if bulletArcDraw > 0 {
	bulletArcDraw--
	draw_set_color(c_yellow)
	var XX = x + (-8*image_xscale)
	var YY = y - 17
	var Direction = point_direction(bulletArray[2],bulletArray[3], bulletArray[0],bulletArray[1])
	XX += lengthdir_x(32, Direction)
	YY += lengthdir_y(32, Direction)
	if debug.on draw_line(XX,YY, bulletArray[0],bulletArray[1])
} else {
	bulletArcDraw = -1	
}

//reticle.firstCalculate()