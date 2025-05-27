tag item
	prop dish
	prop index
	get inOrder do order.items.find do $1.id === dish.id

	<self [d:hcs w:100% mih:68px pl: 16px pr: 16px g:8px]>
		# <div [d:hcc miw:60px mih:60px bg:red]> "icon"
		<div [d:vtc w:100% mih:60px] @click=(console.log "show card")>
			<div [d:hcl w:100% mih:44px fs:20px]> dish.name
			# <div.desc [mih:24px]> if dish.desc then dish.desc
			<price dish=dish>
		<div [d:hcc]>
			<button [c:gray4] [c:red5]=inOrder @click=(order.rem dish)> <span> "\u2212"
			<button [c:green4] @click=(order.add dish)> <span> "+"

		css button c:white fs:60px miw:48px h:68px