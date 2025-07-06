tag order-list
	<self
		[l:calc(100vw - 8px) bg:#282828]=(currentTab == "item-list")
		[l:16px mask-image:$mask]=(currentTab == "order-list")
		[l:calc(40px - 100vw) bg:#282828]=(currentTab == "customer-data")
		# [l:calc(16px - 100vw) r:calc(16px + 100vw)]
	>
		for dish, index in order.items
			<div [w:calc(100vw - 48px) mih:1px bg:gray4]>
			<item dish=dish index=index>
		if order.items.length
			<div [w:calc(100vw - 48px) mih:1px bg:gray4]>
		else
			<h3 [d:hcc w:100% h:96px fs:24px]> "Вы ничего пока не выбрали"

	css
		$mask:linear-gradient(to bottom, transparent 0%, white 16px, white calc(100% - 16px), transparent 100%)
		pos:fixed l:100vw w:calc(100vw - 32px) t:96px b:$bottom
		d:vtc py:16px rd:8px c:white ofy:scroll scrollbar-width:none
		tween: all .3s ease