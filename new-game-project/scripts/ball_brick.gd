extends RigidBody2D
var lives = 3
signal brick_broken(type, brick_position)
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
var track_1 = preload("res://sound_effects/crack.wav")
var track_2 = preload("res://sound_effects/breaking_sound.wav")

func play_track(track_selc):
	if track_selc == 1:
		var selected_track = track_1
		audio_player.stream = selected_track
		audio_player.play()
	if track_selc == 2:
		var selected_track = track_2
		audio_player.stream = selected_track
		audio_player.play()
		print("working")

func _on_area_2d_body_entered(body: Node2D) -> void:
	lives -= 1
	if lives == 2:
		play_track(1)
		$Sprite2D.texture = preload("res://assets/blue_brick_break1.png")
	if lives == 1:
		$Sprite2D.texture = preload("res://assets/blue_brick_break2.png")
		play_track(1)
	if lives == 0:
		self.queue_free()
		emit_signal("brick_broken", "blue", position)
