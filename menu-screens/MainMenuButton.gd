tool
extends TextureButton


export (String) var caption setget set_caption
export (String) var info
export (int) var margin = 0

onready var label := $Label
onready var select_sound := $SoundPlayer

var _highlight_color = Color("#f8da7f")
var _normal_color = Color("#3b1206")

func _process(delta):
    margin_left = margin

func set_caption(value: String) -> void:
    if label:
        caption = value
        label.text = value
    else:
        call_deferred("set_caption", value)

func _on_MainMenuButton_focus_entered():
    label.set("custom_colors/font_color", _highlight_color)
    if not Engine.editor_hint:
        select_sound.play()
    
func _on_MainMenuButton_focus_exited():
    label.set("custom_colors/font_color", _normal_color)
