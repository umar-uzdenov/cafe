tag menu-bar
	def submitAndShowMain
		let result = await submit!
		if result then show_categories!
	

	<self> 
		<button @click=(currentTab = "order-list")
			[b:16px]=(order.items.length and currentTab == "category-list")
		> "Сумма: {order.total} ₽"

		<button [d:hcs] [b:16px]=(order.items.length and currentTab == "item-list")>
			<div [w:25%] @click=(currentTab = "category-list")> "Назад"
			<div [h:60% w:1px bg:#505050]>
			<div [w:75%] @click=(currentTab = "order-list")> "Посмотреть заказ: {order.total} ₽"

		<button [d:hcs] [b:16px]=(currentTab == "order-list")>
			<div [w:30%] @click=(currentTab = "item-list")> "Назад"
			<div [h:60% w:1px bg:#505050]>
			<div [w:60%] @click=(currentTab = "customer-data")> "Оформить заказ"
		
		<button [d:hcs] [b:16px]=(currentTab == "customer-data")>
			<div [w:30%] @click=(currentTab = "order-list")> "Назад"
			<div [h:60% w:1px bg:#505050]>
			<div [w:60%] @click=submit> "Заказать"

	# if 
	# 	<button.cart > "Ваш заказ: {order.total} ₽"
	# 	# <button.cart @click=show_categories> "Добавить блюда"
	# elif details_show
	# 	<button.cart @click=show_order> "Ваш заказ: {order.total} ₽"
	# else
			
	# if order_show
	# 	if order.items.length
	# 		<button.menu @click=show_details> "Оформить"
	# elif details_show
	# 	<button.menu @click=submitAndShowMain> "Заказать"
	# else # if categories_show or dishes_show
	# 	<button.menu @click=show_categories> "Меню"
	
	css
		pos:fixed h:64px l:16px r:16px b:0
		button pos:abs h:48px l:0 r:0 b:-112px fs:20px
			bg:#282828 @active:#343434 c:#A0A0A0 bxs: 0 0 0 1px #787878 inset
			d:hcc rd:8px tween:all .3s ease