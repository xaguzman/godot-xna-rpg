extends Control

onready var info_label := $MainMenuScreen/HBoxLayout/LeftSideContainer/MarginContainer/InfoContainer/Label

func _on_MenuButton_focus_entered():
    var btn = get_focus_owner()
    info_label.text = btn.info
