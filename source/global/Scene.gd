extends CanvasLayer

# Scenes
var TitleScreen := "res://source/interface/menus/TitleScreen.tscn"
var ChooseScenario := "res://source/interface/menus/ChooseScenario.tscn"
var Options := "res://source/interface/menus/Options.tscn"
var Editor := "res://source/editor/Editor.tscn"
var Game := "res://source/core/game/Game.tscn"
var next_scene := ""

onready var anim := $AnimationPlayer as AnimationPlayer

func change(scene: String) -> void:
	next_scene = scene
	anim.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_out":
		if not get_tree().change_scene(next_scene) == OK:
			print("Global: failed to load ", next_scene)
		anim.play("fade_in")
		next_scene = ""
