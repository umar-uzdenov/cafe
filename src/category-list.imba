tag category-list
	def setCategory key
		dish_list.current = key
		show_dishes!

	<self.main [l:calc(16px - 100vw) r:calc(16px + 100vw)]=!categories_show> # hide for now
		for own key, category of dish_list.list
			<div [w:calc(100vw - 16px) mih:1px bg:gray4]>
			<button [d:hcl px:16px g:24px  c:white w:100% mih:72px] @click=(setCategory key)>
				<span [fs:40px]> category.icon
				<span [fs:20px]> category.name
		<div [w:calc(100vw - 16px) mih:1px bg:gray4]>
