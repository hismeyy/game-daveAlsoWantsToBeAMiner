extends Area2D
signal mind_hid

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	get_parent().remove_child(self)
	self.position.x = 0
	self.position.y = 15
	self.name = "Mind"
	area.add_child(self)
	mind_hid.emit()
