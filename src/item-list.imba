tag item-list
	<self.main [l:-100vw r:100vw]=!dishes_show> # hide for now
		for dish, index in dish_list.list[dish_list.current].items
			<div [w:calc(100vw - 16px) mih:1px bg:gray4]>
			<item dish=dish index=index>
		<div [w:calc(100vw - 16px) mih:1px bg:gray4]>

