
import Order from './Order.imba'
import './data'
import './tabs'

import './price'
import './item'

import './header-block'
import './menu-bar'

import './category-list'
import './item-list'
import './order-view'
import './details-view'
import './submit-form'

let order = new Order()
let currentCategory = 'hot_dishes'

extend tag element
	get order do order
	get current do currentCategory
	set current value do currentCategory = value

tag app
	def build
		headerText = "Категории"
	<self[d:vtc g:16px]>
		<img [pos:fixed t:16px w:72px h:40px] src="/img/logo.jpg">
		<header-block>
		<category-list>
		<item-list>
		<order-view>
		<details-view>
		<menu-bar>

imba.mount <app>

# navigator.wakeLock.request('screen')

# console.log window.innerHeight
document.documentElement.style.setProperty "--bh", "{window.innerHeight}px"

global css body $bottom:80px $top:120px

global css
	*  m:0 p:0 box-sizing:border-box
	body ff:Arial,sans-serif bg:gray75
	button
		ol:none bd:none cursor:pointer bgc:transparent
		user-select:none -webkit-user-select:none -moz-user-select:none -ms-user-select:none
		-webkit-tap-highlight-color:transparent -webkit-touch-callout:none

	
	# h - display: flex v - display:flex flex-direction:column
	# s - justify-content:space-between c - justify-content:center
	.fsc d:flex jc:space-between ai:center
	.flc d:flex jc:flex-start ai:center
	.fcc d:flex jc:center ai:center
	.vtc d:flex fld:column jc:flex-start ai:center
	.main
		mask-image: linear-gradient(to bottom, transparent 0%, white 16px, white calc(100% - 16px), transparent 100%)
		d:vtc pos:fixed l:0 r:0 h:calc($bh - $bottom - $top) b:$bottom py:16px c:white ofy:scroll