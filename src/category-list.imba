tag category-list
	def setCategory key
		dish_list.current = key
		show_dishes!

	<self.vtc [h:{categoriesHeight}px b:96px]
		[l:calc(16px - 100vw) r:calc(16px + 100vw)]=!categories_show> # hide for now
		for own key, category of dish_list.list
			<div [w:100% h:1px bg:#ccc]>
			<button [c:white fs:20px h:56px] @click=(setCategory key)> category.name
		<div [w:100% h:1px bg:#ccc]>

	css pos:fixed l:16px r:16px p:32px
		bg:rgba(0, 0, 0, .5) c:white
