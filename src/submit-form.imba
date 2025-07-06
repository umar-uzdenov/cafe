# let post = window.post
let telInvalid = false
extend tag element
	def post url, data
		return new Promise do(resolve, reject) # @ts-ignore
			try
				let xhr = new XMLHttpRequest()
				xhr.open "POST", url # "/api{url}"
				xhr.setRequestHeader "Content-Type", "application/json"
				xhr.onload = do resolve(JSON.parse xhr.responseText) # @ts-ignore
				xhr.send JSON.stringify { chatId: tg..initDataUnsafe..user..id ?? 0, ...data}
			catch e
				window.alert e

	def submit
		# window.alert "1"
		unless order.telIsValid
			telInvalid = true
			return false
		# window.alert "2"
		return false if order.items.length == 0

		# window.alert "3"

		telInvalid = false
		let data = order.data
		order.items = []

		# window.alert "4"

		# @ts-expect-error
		let result
		try
			result = await post "/cafe-vasabi/order", data # Сделать выбор динамическим
		catch e
			window.alert e

		# window.alert "5"

		if result.success
			# window.alert "6"
			window.alert "Ваш заказ принят, вам позвонит оператор для подтверждения заказа"
			order.total = 0
			return true
		else
			# window.alert "7"
			order.items = data.items
			return false

tag submit-form
	prop delivery = false

	<self>
		<h3> "Введите ваши данные для оформления заказа"
		<div>
			<label>	"Ваш номер"
			<input .invalid=telInvalid bind=order.tel @input=(telInvalid = false)
				placeholder="Ваш номер">
		<div>
			<label [d:hcl g:16px]>
				<input type='checkbox' bind=delivery>
				"Хочу доставку"
			<textarea rows=3 placeholder="Ваш адрес" bind=order.address> if delivery
		# <button @click=submit> show ? "Заказать" : "Оформить заказ"
	css d:vflex g:16px w:100%
		div d:vflex g:8px w:100%
			input p:12px h:56px fs: 24px bg:rgba(0, 0, 0, 0.5) c:white
				::placeholder c:white
			textarea p:12px h:128px fs:24px bg:rgba(0, 0, 0, 0.5) c:white
				::placeholder c:white
			.invalid bxs: 0 0 2px 2px red5
		button p:8px 20px b:none fw:bold bg:yellow3 @active:yellow