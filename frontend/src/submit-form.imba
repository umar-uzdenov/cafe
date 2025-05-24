# let post = window.post

tag submit-form
	telInvalid = false
	show = false

	def submit
		return show = true unless show 
		return telInvalid = true unless order.telIsValid
	
		telInvalid = false
		show = false
		let data = order.data
		order.items = []

		let result = await post "/order", data

		if result.success
			window.alert "Ваш заказ принят, вам позвонит оператор для подтверждения заказа"
			order.total = 0
		else
			show = true
			order.items = data.items

	<self> if order.items.length
		if show then <div>
			<h4.jac> "Ваши данные для связи и доставки" 
			<input .invalid=telInvalid bind=order.tel @input=(telInvalid = false)
				placeholder="Ваш номер для подтверждения заказа">
			<input placeholder="Ваш адрес, если хотите доставку" bind=order.address>
		<button @click=submit> show ? "Заказать" : "Оформить заказ"
	css .jac d:flex ja:center
	css d:vflex g:8px w:100%
		div d:vflex g:8px w:100%
			input p:8px h:24px
			.invalid bxs: 0 0 2px 2px red5
		button p:8px 20px b:none fw:bold bg:yellow3 @active:yellow