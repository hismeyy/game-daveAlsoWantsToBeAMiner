extends Node2D

# 绳子转速
@export var rotational_speed = 2
# 绳子伸长速度
@export var elongation_speed = 300
# 最大角度
@export var max_degrees = 140
# 绳子最小长度
@export var rope_min_length = 60
# 旋转方向
var direction = -1
# 是否在旋转
var rotating = true
# 是否在伸长
var elongating = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fishing"):
		if rotating:
			rotating = false
			elongating = true
		else :
			elongating = false

func _physics_process(delta):
	if rotating:
		# 旋转
		if $Rope.rotation_degrees > max_degrees:
			direction = -1
		elif $Rope.rotation_degrees < -max_degrees :
			direction = 1
		$Rope.rotation = $Rope.rotation + (rotational_speed * delta * direction) 
	else :
		if elongating:
			# 伸长
			var distance = elongation_speed * delta
			$Rope.points[1].y += distance
			$Rope/Hook.position.y += distance
		else :
			# 缩短
			var distance = elongation_speed * delta
			$Rope.points[1].y -= distance
			$Rope/Hook.position.y -= distance
			if $Rope.points[1].y <= rope_min_length:
				rotating = true
		

