tag item-list
	<self [l:-100vw r:100vw]=!dishes_show> # hide for now
		for dish, index in dish_list.list[dish_list.current].items
			<item dish=dish index=index>
			if index != dish_list.list[dish_list.current].items.length - 1 # hack for last el
				<div [w:calc(100vw - 16px) mih:1px bg:gray4]>

	css
		mask-image: linear-gradient(to bottom, transparent 0%, white 16px, white calc(100% - 16px), transparent 100%)
		d:vtc h:calc($bh - $bottom - $top) b:$bottom
		pos:fixed l:0 r:0 p:16px 0px 8px 0 c:white ofy:scroll