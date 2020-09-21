tool
extends Resource
class_name GameUtils

const _DIRS = ["e", "se", "s", "sw", "w", "nw", "n", "ne"]
#const _DIRS = ["e", "e", "s", "w", "w", "w", "n", "e"]
    
static func get_direction_name(vector:Vector2)->String:
    return _vector_2_dir(vector)

static func _vector_2_dir(vector:Vector2)->String:
    var angle = vector.angle()
    if angle < 0:
        angle += 2 * PI
    var dir_index = round(angle / PI*4)
    return _DIRS[dir_index]

static func facing_to_vector(facing:String)->Vector2:
    match facing:
        'e':
            return Vector2.RIGHT
        's':
            return Vector2.DOWN
        'w':
            return Vector2.LEFT
        'n':
            return Vector2.UP
        _:
            return Vector2.ZERO
    
static func random_boolean()->bool:
    randomize()
    return randf() >= 0.5
