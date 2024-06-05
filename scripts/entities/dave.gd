extends Area2D


@export var rotational_speed = 1
var direction = -1
var max_degrees = 60
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if $Rope.rotation_degrees > max_degrees:
		direction = -1
	elif $Rope.rotation_degrees < -max_degrees :
		direction = 1
	$Rope.rotation = $Rope.rotation + (rotational_speed * delta * direction) 

