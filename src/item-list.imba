tag item-list
	prop menu

	<self [t:{headerHeight}px]
		[l:100vw]=(currentTab == "category-list")
		[l:80px mask-image:$mask]=(currentTab == "item-list")
		[l:calc(104px - 100vw) bg:#282828 rdr:8px]=(currentTab == "order-list")
		[l:calc(104px - 200vw)]=(currentTab == "customer-data")
		# @touch.moved(100px, "left")=(window.alert "left")
		# @touch.dx(100)=(console.log "right")
	>
		# <[fs:4xl mih:72px]> menu.list[menu.current].name
		for dish, index in menu.list[menu.current].items
			<div [w:calc(100vw - 112px) mih:1px bg:gray4]>
			<item dish=dish index=index>
		<div [w:calc(100vw - 112px) mih:1px bg:gray4]>
	
	css
		$mask: linear-gradient(to bottom, transparent 0%, white 16px, white calc(100% - 16px), transparent 100%)
		d:vtc pos:fixed l:80px w:calc(100vw - 96px) scrollbar-width:none
		b:$bottom pt:32px pb:16px c:white of:hidden ofy:scroll
		tween: all .3s ease

