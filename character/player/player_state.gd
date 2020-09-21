extends State

class_name PlayerState

onready var target : Player = owner

func tick(delta):
    var vel = Graphics.world_to_pixels(target.velocity)
    var motion_remainder = target.move_and_slide(vel)
    target.velocity = Graphics.pixels_to_world(motion_remainder)

func get_input_direction()->Vector2:
    var dir = Vector2()
    dir.x = sign(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))
    dir.y = sign(Input.get_action_strength("move_down")  - Input.get_action_strength("move_up"))
    return dir

func handle_input(event)->void:
    pass
