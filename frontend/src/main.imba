import Order from './Order.imba'

import './categories'
import './items'
import './order-list'
import './submit-form'

let order = new Order()
let currentCategory = 'hot_dishes'

extend tag element
	get order do order
	get current do currentCategory
	set current value do currentCategory = value

tag app
	<self[d:vflex g:16px]>
		<categories>
		<div[d:vflex g:16px p:48px 8px]>
			<items>
			<order-list>
			<submit-form>

imba.mount <app>

global css
	*  m:0 p:0 box-sizing:border-box
	body ff:Arial,sans-serif bg:#f8f8f8
	button
		ol:none bd:none cursor:pointer bgc:transparent
		user-select:none -webkit-user-select:none -moz-user-select:none -ms-user-select:none
		-webkit-tap-highlight-color:transparent -webkit-touch-callout:none


