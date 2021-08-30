extends Panel

var ItemClass = preload("res://Inventory/Item.tscn")
var tooltip
var item = null
var slot_index
var slot_type
enum SlotType {
	INVENTORY = 0,
	ONHAND,
	OFFHAND,
	HEAD,
	BODY,
	LEGS
}

func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("UserInterface")
	inventoryNode.add_child(item)
	item = null
	
func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0,0)
	var inventoryNode = find_parent("UserInterface")
	inventoryNode.remove_child(item)
	add_child(item)

func initialize_item(item_name, item_quantity):
	if item == null:
		item = ItemClass.instance()
		add_child(item)
		item.set_item(item_name, item_quantity)
	else:
		item.set_item(item_name, item_quantity)
