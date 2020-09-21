extends KinematicBody2D
class_name Character

export (String, "n", "ne", "e", "se", "s", "sw", "w", "nw") var facing = "e"
export (Resource) var data

func play_animation(anim: String) -> void:
    pass
