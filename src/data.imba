import { nanoid } from 'nanoid'

const dish_list =
	current: "cold_roll"
	list:
		"salad":
			name: "Салаты"
			items: [
				{ id: nanoid(), name: "Салат Цезарь с курицей", price: 300, size: "250г" }
				{ id: nanoid(), name: "Салат Овощной", price: 320, size: "250г" }
				{ id: nanoid(), name: "Салат Хрустящий Баклажан", price: 420, size: "250г" }
			]
		"soup":
			name: "Супы"
			items: [
				{ id: nanoid(), name: "Лапша куриная", price: 320, size: "250г" }
				{ id: nanoid(), name: "Том Ям с креветками", price: 530, size: "250г" }
			]
		"pasta":
			name: "Паста"
			items: [
				{ id: nanoid(), name: "Фетучини Том Ям", price: 590, desc: "с креветками и черри" }
				{ id: nanoid(), name: "Фетучини с курицей и грибами", price: 530 }
			]
		"dessert":
			name: "Десерты"
			items: [
				{ id: nanoid(), name: "Жареное мороженое", price: 350 }
				{ id: nanoid(), name: "Сладкий ролл Минари", price: 380 }
			]
		# "vok": # Пока под систему не подходит, надо уточнить, как вообще заказывается
		# 	name: "Вок Лапша Удон Фунчоза"
		# 	items: [
		# 	]

		"hot_snack":
			name: "Горячие закуски"
			items: [
				{ id: nanoid(), name: "Картофель фри", price: 180, size: "150г" }
				{ id: nanoid(), name: "Айдахо", price: 150, size: "150г" }
				{ id: nanoid(), name: "Наггетсы", price: 190, size: "100г - 6 шт" }
				{ id: nanoid(), name: "Эби Темпура", price: 580, size: "Креветки 5 шт", desc: "Соус спайси" }
				{ id: nanoid(), name: "Запечённые мидии", price: 580, size: "Мидии 5шт", desc: "Соус Спайси, кунжут, унаги соус" }
			]
		"pizza":
			name: "Пицца"
			items: [
				{ id: nanoid(), name: "Морская пикантная", price: 600, size: "33 см" }
				{ id: nanoid(), name: "Пепперони", price: 560, size: "33 см" }
				{ id: nanoid(), name: "Цезарь с курицей", price: 580, size: "33 см" }
				{ id: nanoid(), name: "Курица - Грибы", price: 550, size: "33 см" }
				{ id: nanoid(), name: "Ветчина - Грибы", price: 720, size: "33 см" }
				{ id: nanoid(), name: "Маргарита", price: 470, size: "33 см" }
				{ id: nanoid(), name: "4 сыра", price: 570, size: "33 см" }
				{ id: nanoid(), name: "Шаурма", price: 600, size: "33 см" }
				{ id: nanoid(), name: "Сладкая", price: 580, size: "33 см" }
			]
		"sauce":
			name: "Соусы и приправы"
			items: [
				{ id: nanoid(), name: "Спайси соус", price: 100, size: "50г" }
				{ id: nanoid(), name: "Соевый соус", price: 60, size: "50г" }
				{ id: nanoid(), name: "Сырный соус", price: 70, size: "50г" }
				{ id: nanoid(), name: "Соус кетчуп", price: 50, size: "50г" }
				{ id: nanoid(), name: "Соус Чили", price: 70, size: "50г" }
				{ id: nanoid(), name: "Имбирь", price: 40, size: "50г" }
				{ id: nanoid(), name: "Васаби", price: 30, size: "20г" }
			]
		"cold_roll":
			name: "Холодные роллы"
			items: [
				{ id: nanoid(), name: "Филадельфия", price: 380, size: "8 шт", desc: "сыр, огурец, авокадо, лосось" }
				{ id: nanoid(), name: "Филадельфия с угрём", price: 390, size: "8 шт", desc: "сыр, огурец, авокадо, угорь" }
				{ id: nanoid(), name: "Филадельфия MIX", price: 380, size: "8 шт", desc: "сыр, огурец, авокадо, лосось, угорь" }
				{ id: nanoid(), name: "Калифорния в кунжуте", price: 290, size: "8 шт", desc: "краб, огурец, авокадо, кунжут" }
				{ id: nanoid(), name: "Нежный лосось", price: 350, size: "8 шт", desc: "лосось, сыр, авокадо, кунжут" }
				{ id: nanoid(), name: "Сочи", price: 460, size: "8 шт", desc: "сливочный сыр, огурец, кунжут" }
				{ id: nanoid(), name: "Калифорния с крабом", price: 330, size: "8 шт", desc: "краб, огурец, авокадо, масаго" }
				{ id: nanoid(), name: "Калифорния с лососем", price: 350, size: "8 шт", desc: "лосось, огурец, авокадо, масаго" }
				{ id: nanoid(), name: "Калифорния Креветка", price: 370, size: "8 шт", desc: "креветка, огурец, авокадо, масаго" }
				{ id: nanoid(), name: "Ролл Киото", price: 370, size: "8 шт", desc: "угорь, авокадо, сыр, спайси соус" }
				{ id: nanoid(), name: "Ролл Азуми", price: 350, size: "8 шт", desc: "краб, креветка, сыр, спайси соус" }
				{ id: nanoid(), name: "Веган ролл", price: 270, size: "8 шт", desc: "огурец, авокадо, салат айсберг, перец болгарский" }
				{ id: nanoid(), name: "Кисловодск", price: 440, size: "8 шт", desc: "угорь, лосось, сыр сливочный, огурец" }
				{ id: nanoid(), name: "Филадельфия Люкс", price: 470, size: "8 шт", desc: "икра лосося, салат айсберг, перец болгарский, сыр сливочный" }
				{ id: nanoid(), name: "Грин ролл", price: 340, size: "8 шт", desc: "лосось копчёный, сыр, огурец, укроп" }
				{ id: nanoid(), name: "Цезарь", price: 370, size: "8 шт", desc: "айсберг, помидоры, курица, соус цезарь, пармезан" } # почему не салат айсберг? почему помидоры а не помидор?
				{ id: nanoid(), name: "Фила гурме", price: 410, size: "8 шт", desc: "лосось копчёный, сыр сливочный, огурец" }
				{ id: nanoid(), name: "Бонито", price: 390, size: "8 шт", desc: "стружка Тунца, сливочный сыр, огурец, лосось копчёный" }
				{ id: nanoid(), name: "Эби самурай", price: 430, size: "8 шт", desc: "креветка, сыр сливочный, авокадо, икра масаго" } # почему здесь икра, а в других без икры?
				{ id: nanoid(), name: "Сенсей", price: 370, size: "8 шт", desc: "краб, спайси соус, сыр, огурец, масаго" }
			]


let categoriesHeight = Object.keys(dish_list.list).length * (56 + 1) + 1 + 32 * 2

extend tag element
	get dish_list do dish_list
	get categoriesHeight do categoriesHeight