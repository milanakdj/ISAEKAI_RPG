extends HBoxContainer

signal loot_pressed(value)

func _ready():
	$ItemSlot/TextureButton.connect("button_down",self,"on_item_pressed")

func on_item_pressed():
	emit_signal("loot_pressed", get_index())
	$ItemSlot.queue_free()
	$ItemName.queue_free()
