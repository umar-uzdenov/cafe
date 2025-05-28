export default class Order
	_tel = ""
	get telIsValid do _tel.length == 12
	get tel
		if _tel == "" then ""
		elif _tel == "+" then "+"
		elif _tel == "+7" then "+7 ("
		elif _tel.length == 3 or _tel.length == 4 then "+7 ({_tel.slice 2, 5}"
		elif _tel.length == 5 then "+7 ({_tel.slice 2, 5}) "
		elif _tel.length == 6 then "+7 ({_tel.slice 2, 5}) {_tel[5]}"
		elif _tel.length == 7 then "+7 ({_tel.slice 2, 5}) {_tel.slice 5, 7}"
		elif _tel.length == 8 then "+7 ({_tel.slice 2, 5}) {_tel.slice 5, 8} - "
		elif _tel.length == 9 then "+7 ({_tel.slice 2, 5}) {_tel.slice 5, 8} - {_tel[8]}"
		elif _tel.length == 10
			"+7 ({_tel.slice 2, 5}) {_tel.slice 5, 8} - {_tel.slice 8, 10} - "
		elif _tel.length == 11 or _tel.length == 12
			"+7 ({_tel.slice 2, 5}) {_tel.slice 5, 8} - {_tel.slice 8, 10} - {_tel.slice 10}"
	set tel value
		let last = value[value.length - 1]

		if value.length == 0 then _tel = ""
		elif value.length == 1
			if value == "+" then _tel = "+"
			elif value == "7" or value == "8" then _tel = "+7"
			elif value == "9" then _tel = "+79"
			elif ["0", "1", "2", "3", "4", "5", "6"].indexOf(value) != -1
				_tel == ""
			else _tel = value.replaceAll /\D/g, ""
		elif value.length == 2
			if value[1] == "7" then _tel = "+7"
			# elif value[1] == "8" then _tel = "+7"
			else _tel = "+"
		elif value.length == 3 then _tel = ""
		elif value.length == 5 and value[4] != "9" then _tel = "+7"
		else _tel = "+7" + value.slice(2).replaceAll /\D/g, ""

		if last == '-' or last == ')' then _tel = _tel.slice 0, -1
		if _tel.length > 12 then _tel = _tel.slice 0, 12
	
	address = ""
	total = 0
	items = []

	get data do { tel: _tel, items, address, total }
	
	def add item
		total += item.price
		let exist = items.find do $1.id === item.id
		# console.log items
		if exist
			exist.quantity++
		else
			items.push {...item, quantity: 1}

	def rem dish
		let item = items.find do $1.id == dish.id
		# console.log self.items
		return if item === undefined

		# console.log item
		total -= item.price
		if item.quantity == 1
			self.items.splice self.items.findIndex(do $1.id === item.id), 1
		else
			item.quantity--
