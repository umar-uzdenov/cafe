tag price
	prop dish = {}
	get item do order.items.find do $1.id === dish..id

	<self [d:hcs w:100% fs:14px]>
		if item
			<div> "{item.price} ₽ \u00D7 {item.quantity} шт"
			<div> "= {item.price * item.quantity} ₽"
		else
			<div> "{dish.price} ₽"
			<div> " "

	css div d:hcc mih:24px