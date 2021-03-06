//	Draw lights onto surface
if !surface_exists(surface) {
	surface = create_surface(room_width,room_height)
	surface_set_target(surface)
	draw_set_color(c_black)
	draw_set_alpha(worldDark)
	draw_rectangle(0,0,room_width,room_height,false)
	surface_reset_target()
}

if surface_exists(surface) {
	surface_set_target(surface)
	
	draw_clear_alpha(c_white, 0)
	draw_set_color(c_black)
	draw_set_alpha(worldDark)
	if gunFired {
		draw_set_alpha(worldDark-0.3)
		gunFired = false
	}
	draw_rectangle(0,0,room_width,room_height,false)
	draw_rectangle(0,0,room_width,room_height,false)
	
		//	Floor fog of war
	draw_set_alpha(1)
	if instance_exists(collisionFloor) with collisionFloor {
		if player.bbox_top <= bbox_top {
	
			//	Draw black box
			var height = 128
			draw_set_color(c_black)
			draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+height,false)
	
		}

		else {
	
			//	Draw black box above ceiling
			var height = 128
			draw_set_color(c_black)
			draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_top-height,false)
	
		}	
	}
	
	gpu_set_blendmode(bm_subtract)
	if instance_exists(class_light) with class_light {
		var scatterX = irandom_range(-5,5)
		var scatterY = irandom_range(-5,5)
		draw_sprite_ext(sprite_index,0,x+scatterX,y+scatterY,1.5,1.5,image_angle,c_black,brightness)
		//draw_set_alpha(brightness)
		//draw_circle(x+scatterX,y+scatterY,128,false)
	}
	
	//	Flashlight
	if instance_exists(player) {
		if player.flashlightOn and player.inventory[player.inventoryIndex].item == item.flashlight {
			var rawDirection = point_direction(player.x + (player.arm0_offsetX*player.image_xscale),player.y+player.arm0_offsetY, player.x + (-3 * player.image_xscale),player.y-16)
			var rawDist = point_distance(player.x + (player.arm0_offsetX*player.image_xscale),player.y+player.arm0_offsetY, player.x + (-3 * player.image_xscale),player.y-16)
			if player.image_xscale rawDirection += player.gunRotation
			else rawDirection += player.gunRotation - 180
			var X = player.x + (player.arm0_offsetX*player.image_xscale) + lengthdir_x(rawDist, rawDirection)
			var Y = player.y+player.arm0_offsetY + lengthdir_y(rawDist, rawDirection)
			draw_sprite_ext(s_light_flashlight,0,X,Y,1,1,player.gunRotation,c_black,0.5)	
			
			//	Lighten the players body sprite
			var Scale = 0.25
			X += lengthdir_x(8, player.gunRotation)
			Y += lengthdir_y(8, player.gunRotation)
			//draw_sprite_ext(player.sprite_index,player.image_index,player.x,player.y,player.image_xscale,player.image_yscale,player.image_angle,c_black,0.5)
			draw_sprite_ext(s_light_gradient,0,X,Y,Scale,Scale,0,c_black,0.5)
			
			//debug.log("FLASHLIGHT DEBUG player.gunRotation: "+string(player.gunRotation))
		}
	}
	
	gpu_set_blendmode(bm_normal)
	

	
	surface_reset_target()
}