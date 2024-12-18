extends Area3D
class_name Projectile_2
var starting_position:Vector3
var target:Node3D
@export var speed:float = 2 # metres per second
@export var damage:int = 10
var lerp_pos:float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = starting_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target != null and lerp_pos < 1:
		var new_position = starting_position.lerp(target.global_position, lerp_pos)
		var direction = global_position.direction_to(new_position)
		look_at(global_position + direction, Vector3.UP)
		rotate_y(deg_to_rad(180))
		
		global_position = starting_position.lerp(target.global_position, lerp_pos)
		lerp_pos += delta * speed
	else:
		queue_free()
