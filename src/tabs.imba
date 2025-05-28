
let	categories_show = true
let dishes_show = false
let order_show = false
let details_show = false


extend tag element
	get categories_show do  categories_show
	get dishes_show do  dishes_show
	get order_show do  order_show
	get details_show do details_show

	def show_categories
		categories_show = true
		dishes_show = false
		order_show = false
		details_show = false

		headerText = "Категории"


	def show_dishes
		categories_show = false
		dishes_show = true
		order_show = false
		details_show = false
		headerText = dish_list.list[dish_list.current].name

	def show_order
		if order_show
			dishes_show = true
			order_show = false
			headerText = dish_list.list[dish_list.current].name
		else
			dishes_show = false
			order_show = true
			headerText = "Ваш заказ"

		categories_show = false
		details_show = false
	
	def show_details
		order_show = false
		details_show = true
		headerText = "Ваши данные для связи"
