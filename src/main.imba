
import cafeVasabiDishList from './cafe-vasabi.imba'

import './tabs'

import './global-data'
import './global-css'

import './price'
import './item'

import './header-block'
import './menu-bar'

import './category-list'
import './item-list'
import './order-list'
import './customer-data'
import './submit-form'


import "./cafe"

tag app
	def build
		headerText = "Категории"
	<self[d:vtc g:16px c:white]>
		<cafe route='/cafe-vasabi/' menu=cafeVasabiDishList>
	# "lol"
	# # <img [pos:fixed t:16px w:72px h:40px] src="/img/logo.png">
	# <h1[pos:fixed t:64px c:emerald5]> "ᐯ 卂 丂 卂 乃 丨"
	# <header-block>
	# <category-list>
	# <item-list>
	# <order-view>
	# <details-view>
	# <menu-bar>

imba.mount <app>
	
	