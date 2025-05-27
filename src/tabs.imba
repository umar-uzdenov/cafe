
let	categories_show = false
let dishes_show = true
let details_show = false


extend tag element
	get categories_show do  categories_show
	get dishes_show do  dishes_show
	get details_show do  details_show
		
	def show_categories
		if categories_show or details_show
			categories_show = false
			dishes_show = true
			details_show = false
		else
			categories_show = true
			dishes_show = false
			details_show = false


	def show_dishes
		categories_show = false
		dishes_show = true
		details_show = false

	def show_details
		if details_show
			categories_show = false
			dishes_show = true
			details_show = false
		else
			categories_show = false
			dishes_show = false
			details_show = true