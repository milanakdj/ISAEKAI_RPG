extends Resource
class_name SaveInfo

# PLAYER INFO
export(int) var level
export(int) var cur_exp
export(int) var next_exp 
export(float) var attack
export(float) var defence

export(int) var coin
export(Dictionary) var inventory 
export(Dictionary) var hotbar 
export(Dictionary) var equips 

export(Vector2) var player_pos
export(String, FILE) var current_scene

# Save Function
