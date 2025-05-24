const list =
	hot_dishes: "Горячие блюда"
	cold_dishes: "Холодные блюда"
	desserts: "Десерты"
	hot_drinks: "Горячие напитки"
	cold_drinks: "Холодные напитки"

tag categories
	<self> for own key, category of list
		<button.active=(current == key) @click=(current = key)> category

	css d:flex w:100% h:40px bgc:blue4 pos:fixed
		button w:100% c:white bg@active:blue5 .active:blue6