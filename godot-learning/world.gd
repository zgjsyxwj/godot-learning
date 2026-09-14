extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var trigger: Area2D = $Trigger

func _ready() -> void:
	trigger.body_entered.connect(_on_trigger_body_entered)

func _on_trigger_body_entered(body: Node2D) -> void:
	if body == player:
		print("角色进入触发区域")
