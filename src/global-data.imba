import Order from './Order.imba'
import { gsap } from 'gsap'




let order = new Order()
# let currentCategory = 'hot_dishes'

let currentTab = "category-list"
let categoriesTag = null
let scrolled8px = no
let categoriesPaddingTop = 16

extend tag element
	get headerHeight do headerCompact ? 96 : 264
	get headerCompact do
		# console.log {currentTab}
		if currentTab == "category-list"
			return scrolled8px
		else
			return true
	
	get categoriesPaddingTop do categoriesPaddingTop
	
	def scrollCategories e
		if e.target.scrollTop > 8
			scrolled8px = yes if scrolled8px == no
				
		# categoriesTag = e.target unless categoriesTag
		# 	headerCompact = e.target.scrollTop > 8
		# else headerCompact = true


	get order do order

	# get current do currentCategory
	# set current do currentCategory = $1

	get currentTab do currentTab
	set currentTab tab do
		if currentTab != "category-list" and tab == "category-list" and categoriesTag..scrollTop > 8
			try categoriesTag.scrollTop = categoriesTag..scrollTop + 272
		currentTab = tab
		scrolled8px = yes if tab != "category-list"
		# Сделать переход лучше, чтобы учитывалась текущая категория,
		# а также верхняя или нижняя категория
		# сделать красиво, в общем