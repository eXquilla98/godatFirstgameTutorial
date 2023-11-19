extends Area2D
#the screen size isnt correct when we run the game at the first time the width and height were mixed so keep that in mind
#PLAYER SPEED
@export var speed = 400;
#screen size
var screen_size 

#GETIING Screen size
func _ready():
	screen_size = get_viewport_rect().size
	#fucking hell this language is shit it took me 30 min to type this simple if without errors fking gdscript and python _|_
#update got a hang of it this languagae is noth that hard took a little time to learn the syntax XD
#the below code map the playermovement to the buttens w,a,s,d 
func  _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x+=1       
	if Input.is_action_pressed("move_left"):
		velocity.x-=1
	if Input.is_action_pressed("move_up"):
		velocity.y-=1
	if Input.is_action_pressed("move_down"):
		velocity.y+=1
	
	
	if velocity.length()> 0:
		velocity=velocity.normalized()*speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position+=velocity*delta
	position=position.clamp(Vector2.ZERO,screen_size)
		
	if velocity.x !=0:
		$AnimatedSprite2D.animation ="walk"
		$AnimatedSprite2D.flip_v=false
		$AnimatedSprite2D.flip_h=velocity.x<0
	elif velocity.y!=0:
		$AnimatedSprite2D.animation ="up"
		$AnimatedSprite2D.flip_v = velocity.y>0
		
		
	

 
