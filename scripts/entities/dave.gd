extends Node2D

# 绳子转速
@export var rotational_speed = 2
# 最大角度
@export var max_degrees = 140
var direction = -1

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

