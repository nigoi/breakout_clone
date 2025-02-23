extends Control

func _ready() -> void:
	if Global.score == Global.high_score:
		$score.text = ("NEW HIGH SCORE\n" + str(Global.high_score))
		for i in range(100):
			await get_tree().create_timer(0.2).timeout
			$score.self_modulate = Color("#fe0000")
			await get_tree().create_timer(0.2).timeout
			$score.self_modulate = Color("51ff00")
	else:
		$score.text = Global.score
		
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
