extends TextureRect

func _ready():
	$CoinAmountLabel.text = str(PlayerStats.coin)	
	PlayerStats.connect("coin_updated", self, "on_coin_updated")
	
func on_coin_updated(value):
	$CoinAmountLabel.text = str(value)
