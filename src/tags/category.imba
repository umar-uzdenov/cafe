
tag category
	prop categoryKey
	prop category
	prop menu

	<self @click=(emit "select", categoryKey)
		[px=8px w:80px h:72px mih:72px]=(currentTab != "category-list")
		[h: 88px mih=88px]=(menu.current == categoryKey and currentTab != "category-list")
		[bg:#282828 bxs:0px 4px #282828, 0px -4px #282828 rdr:4px]=(menu.current != categoryKey and currentTab != "category-list")
	>
		<img src="/img/category/{category.img}.jpg" [rd:4px s:108px transition:$tween]
			[s:64px]=(currentTab == "item-list")
		> # category.icon
		<div [h:96px d:vtl g:8px o:1 tween:$tween]
			[o:0]=(currentTab != "category-list")>

			<span [fs:20px d:hcl h:32px d:hcl]> category.name
			<div [w:64px mih:1px bg:#505050]>
			<div [d:vcl]> for own _, item of (index = 0, category.items) # hack
				<span [h:24px d:hcc]> item.name if ++index <= 2

	css
		d:hcl px:16px g:24px c:white h:128px mih:128px w:100vw
		tween:$tween

tag category-separator
	<self [w:calc(100vw - 16px) h:1px mih:1px bg:#505050]
		[h:0px bg:#282828]=(currentTab != "category-list")
	>