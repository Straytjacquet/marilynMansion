event_inherited()

rotateAngle = 0
dead = false
myDoor = -1

function die() {
	if !dead {
		myDoor._lock(false)
		onGround = false
		thrust = 4
		dead = true
	
		rotateAngle = choose(-90,90)
	}
}