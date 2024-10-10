extends Control


func _on_pooh_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Pooh.tscn")


func _on_help_pressed() -> void:
	get_tree().change_scene_to_file(("res://Scenes/Help.tscn"))


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(("res://Scenes/Play.tscn"))
