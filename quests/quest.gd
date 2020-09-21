extends Resource
class_name Quest

#####  Description
export (String) var name
export (String) var description
export (String) var objective_message
export (String) var completion_message

##### Stage
enum QuestStage { 
    NotStarted, InProgress, RequrementsMet, Completed    
}

var _stage  = QuestStage.NotStarted

##### requirements
export (Array, String) var gear_requirements
export (Array, String) var monster_requirements

func are_requirements_met() -> bool:
    for gear_req in gear_requirements:
        if gear_req.completed_count < gear_req.count:
            return false
    for monster_req in monster_requirements:
        if monster_req.completed_count < monster_req.count:
            return false
    
    return true


##### Quest Content
export (Resource) var fixed_combat_entries
export (Resource) var chest_entries

##### Destination
export (String) var destination_map_name
export (String) var destination_npc_name
export (String) var destination_objective_message

##### Reward
export (int) var experience_reward
export (int) var gold_reward
export (Array, String) var gear_names_reward
