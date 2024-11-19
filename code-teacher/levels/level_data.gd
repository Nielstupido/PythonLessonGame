class_name LevelData
extends Resource


@export_range(0,10) var level_number : int
@export_range(0,2) var quiz_level_number : int = 0
@export var level_scene : PackedScene
@export_multiline var level_title : String
@export_multiline var level_objectives : String
@export_multiline var level_skills : String
