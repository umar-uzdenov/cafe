
import cafeVasabiDishList from './cafe-vasabi.imba'

import './tabs'

import './global-data'
import './global-css'

import './tags/price'
import './tags/item'
import './tags/category'

import './header-block'
import './tags/cafe-header'
import './tags/menu-bar'
import './tags/back-button'
import './tags/order-button'

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

# tag test
# 	<self[d:hcc w:100vw h:100vh bg:gray7 c:white fs:48px]> "testing https"

# imba.mount <test>
imba.mount <app>

	
	