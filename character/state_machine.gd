extends Node2D

class_name StateMachine

signal state_changed(current_state)

export (bool) var active = false setget set_active
export (String) var start_state

var states_map = {}
var states_stack = []
var current_state = null

func _ready():
    for child in get_children():
        child.connect("finished", self, "change_state")
        states_map[child.name.to_lower()] = child
    states_stack.push_front(get_child(0))
    current_state = start_state if start_state else states_stack[0]   
    if active:
        call_deferred("start")

func start():
    current_state.enter()
    set_active(true)

func set_active(value):
    active = value
    set_physics_process(value)
    set_process_input(value)
#    if not active:
#        states_stack = []
#        current_state = null

func _physics_process(delta):
    current_state.tick(delta)

func _on_animation_finished(anim_name):
    if not active:
        return
    current_state._on_animation_finished(anim_name)

func change_state(state_name : String):
    if not active:
        return
    current_state.exit()
    
    if state_name.empty():
        states_stack.pop_front()
    else:
        states_stack[0] = states_map[state_name]
    
    current_state = states_stack[0]
    emit_signal("state_changed", current_state)
    current_state.enter()
