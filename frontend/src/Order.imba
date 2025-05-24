export default class Order
	_tel = ""
	get telIsValid do _tel.length == 10
	get tel
		if _tel == "" then ""
		elif _tel.length == 1 or _tel.length == 2 then "+7 ({_tel}"
		elif _tel.length == 3 then "+7 ({_tel}) "
		elif _tel.length == 4 then "+7 ({_tel.slice 0, 3}) {_tel[3]}"
		elif _tel.length == 5 then "+7 ({_tel.slice 0, 3}) {_tel.slice 3, 5}"
		elif _tel.length == 6 then "+7 ({_tel.slice 0, 3}) {_tel.slice 3, 6} - "
		elif _tel.length == 7 then "+7 ({_tel.slice 0, 3}) {_tel.slice 3, 6} - {_tel[6]}"
		elif _tel.length == 8 then "+7 ({_tel.slice 0, 3}) {_tel.slice 3, 6} - {_tel.slice 6, 8} - "
		elif _tel.length == 9 or _tel.length == 10
			"+7 ({_tel.slice 0, 3}) {_tel.slice 3, 6} - {_tel.slice 6, 8} - {_tel.slice 8}"
	set tel value
		let last = value[value.length - 1]

		if value.length == 0 then _tel = ""
		elif value.length == 1 then _tel = value.replaceAll /\D/g, ""
		else _tel = value.slice(2).replaceAll /\D/g, ""

		if last == '-' or last == ')' then _tel = _tel.slice 0, -1
		if _tel.length > 10 then _tel = _tel.slice 0, 10
	
	address = ""
	total = 0
	items = []

	get data do { tel: "+7{_tel}", items, address, total }
	
	def add item
		total += item.price
		let exist = items.find do $1.id === item.id
		# console.log items
		if exist
			exist.quantity++
		else
			items.push {...item, quantity: 1}

