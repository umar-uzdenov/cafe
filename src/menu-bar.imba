tag menu-bar
	def submitAndShowMain
		let result = await submit!
		if result then show_categories!

	<self>
		if order_show
			<button.cart @click=show_categories> "Добавить блюда"
		# elif details_show
		# 	<button.cart @click=show_order> "Ваш заказ: {order.total} ₽"
		else
			<button.cart @click=show_order> "Ваш заказ: {order.total} ₽"
				
		if order_show
			if order.items.length
				<button.menu @click=show_details> "Оформить"
		elif details_show
			<button.menu @click=submitAndShowMain> "Заказать"
		else # if categories_show or dishes_show
			<button.menu @click=show_categories> "Меню"
	
	css pos:fixed h:48px l:16px r:16px b:16px d:hcs fs:20px
		button d:hcc h:48px rd:24px c:gray2 bg:gray8 @active:gray9 bxs: 0 0 0 1px gray4 inset
		.cart w:52vw 
		.menu w:32vw