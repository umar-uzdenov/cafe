tag order-view
	<self.main [l:calc(16px - 100vw) r:calc(16px + 100vw)]=!order_show>
		for dish, index in order.items
			<div [w:calc(100vw - 16px) mih:1px bg:gray4]>
			<item dish=dish index=index>
		if order.items.length
			<div [w:calc(100vw - 16px) mih:1px bg:gray4]>
		else
			<h3 [d:hcc w:100% h:96px fs:24px]> "Вы ничего пока не выбрали"