extends CanvasLayer

var holding_item = null
var isGame = false

func _input(event):
	if isGame:
		if event.is_action_pressed("inventory"):
			$open.play()
			$Inventory.visible = !$Inventory.visible
			$Inventory.initialize_inventory()
		
		if event.is_action_pressed("scroll_up"):
			PlayerInventory.active_item_scroll_down()
		elif event.is_action_pressed("scroll_down"):
			PlayerInventory.active_item_scroll_up()

func _ready():
	$Inventory.visible = false

func game_load():
	isGame = true

func _process(_delta):
	if not isGame:
		$Inventory.visible = false
