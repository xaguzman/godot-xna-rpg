tool
extends Area2D

export (Texture) var texture setget set_texture
export (int) var gold
export (Array, Resource) var entries

onready var sprite := $Sprite
onready var collision := $CollisionShape2D

func set_texture(var value):
    if sprite:
        texture = value
        sprite.texture = texture
    else:
        call_deferred("set_texture", value)
