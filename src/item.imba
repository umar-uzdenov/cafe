tag item
	prop dish
	prop index
	get inOrder do order.items.find do $1.id === dish.id

	<self [d:hcs w:100% mih:128px pl:16px pr:16px g:8px]>
		# <div [d:hcc miw:60px mih:60px bg:red]> "icon"
		<div [d:vtc w:100% mih:98px] @click=(console.log "show card")>
			<div [d:hcl w:100% mih:44px fs:20px]> dish.name
			<div [d:hcl mih:24px w:100%]> dish.desc if dish.desc
			<price dish=dish>
			<div [d:hcr w:100%]>
				<button [c:gray4] [c:red5]=inOrder @click=(order.rem dish)> <span> "\u2212"
				<button [c:green4] @click=(order.add dish)> <span> "Добавить"

		css button c:white fs:16px miw:48px h:32px