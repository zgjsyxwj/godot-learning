extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var trigger: Area2D = $Trigger
@onready var original_modulate: Color = player.modulate
@onready var status_label: Label = $HUD/StatusLabel

func _ready() -> void:
	trigger.body_entered.connect(_on_trigger_body_entered)
	trigger.body_exited.connect(_on_trigger_body_exited)

func _on_trigger_body_entered(body: Node2D) -> void:
	if body == player:
		print("角色进入触发区域")
		player.modulate = Color(1.0, 0.45, 0.45, 1.0)
		status_label.text = "区域内"
		
func _on_trigger_body_exited(body: Node2D) -> void:
	if body == player:
		player.modulate = original_modulate
		print("角色离开触发区域")
		status_label.text = "区域外"
