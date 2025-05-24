tag order-list
	<self> if order.items.length
		<h2> "Ваш заказ"
		<ul.order-list>
			for item in order.items
				<li>
					<span> item.name
					<span> "x"
					<span[fw:700]> item.quantity
					<span> "="
					<span> "{item.price * item.quantity} ₽"
			<li>
				<span> "Итого"
				<span> "{order.total} ₽"

	css
		ul d:vflex g:8px
			li d:flex h:30px jc:space-between ai:center bgc:emerald4
				span p:8px