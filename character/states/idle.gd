extends State


func enter():
    var facing = owner.facing
    owner.play_animation("idle-%s" % facing)
        
