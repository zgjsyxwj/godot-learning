extends Node2D
var entry_count: int = 0
@export_range(1, 10, 1) var target_entries: int = 3

@onready var player: CharacterBody2D = $Player
@onready var trigger: Area2D = $Trigger
@onready var original_modulate: Color = player.modulate
@onready var status_label: Label = $HUD/StatusLabel


func _ready() -> void:
	trigger.body_entered.connect(_on_trigger_body_entered)
	trigger.body_exited.connect(_on_trigger_body_exited)
	_update_status("区域外")


func _on_trigger_body_entered(body: Node2D) -> void:
	if body == player:
		entry_count += 1
		print("角色进入触发区域")
		player.modulate = Color(1.0, 0.45, 0.45, 1.0)
		if entry_count >= target_entries:
			player.velocity = Vector2.ZERO
			player.set_physics_process(false)

		_update_status("区域内")


func _update_status(area_status: String) -> void:
	var goal_status: String = "目标未达成！"
	if entry_count >= target_entries:
		goal_status = "目标达成！按R重新开始"
	status_label.text = "%s · 进入次数：%d / %d · %s" % [
		area_status,
		entry_count,
		target_entries,
		goal_status,
	]


func _on_trigger_body_exited(body: Node2D) -> void:
	if body == player:
		player.modulate = original_modulate
		print("角色离开触发区域")
		_update_status("区域外")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		var error: Error = get_tree().reload_current_scene()
		if error != OK:
			push_error("重新开始失败: %s" % error_string(error))
