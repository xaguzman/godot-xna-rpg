extends Node2D

onready var owner_character : Character = owner

signal finished(next_state)

class_name State

func enter():
    pass

func exit():
    pass

func tick(delta):
    pass

func _on_animation_finished(anim_name):
    pass
