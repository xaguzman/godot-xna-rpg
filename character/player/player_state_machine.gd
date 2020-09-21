extends StateMachine

func _unhandled_input(event):
    current_state.handle_input(event)

# function only used by arms
func _on_player_facing_changed(new_facing):
    if active:
        current_state.on_player_facing_change(new_facing)
