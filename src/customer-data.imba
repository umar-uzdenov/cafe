tag customer-data
	<self [t:{headerHeight}px]
		[l:100vw]=(currentTab == "category-list" or currentTab == "item-list")
		[l:calc(100vw - 8px) mask-image:$mask  bg:#282828]=(currentTab == "order-list")
		[l:16px]=(currentTab == "customer-data")
	>
		<submit-form>

	css
		pos:fixed l:100vw w:calc(100vw - 32px) t:96px b:$bottom
		d:vtc pt:32px pb:16px px:8px rd:8px c:white ofy:scroll scrollbar-width:none
		tween: all .3s ease