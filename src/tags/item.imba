tag item
	prop dish
	prop index
	get inOrder do order.items.find do $1.id === dish.id
	
	get height
		if !dish.desc
			main: 104px, card: 74px, desc: 0px
		elif dish.desc.length < 32
			main: 128px, card: 98px, desc: 24px
		elif dish.desc.length < 64
			main: 152px, card: 122px, desc: 48px
		else
			main: 176px, card: 146px, desc: 72px

	<self [d:hcs w:100% mih:{height.main} pl:16px pr:16px g:8px]>
		# <div [d:hcc miw:60px mih:60px bg:red]> "icon"
		<div [d:vtc w:100% mih:{height.card}] @click=(console.log "show card")>
			<div [d:hcl w:100% mih:44px fs:20px]> dish.name
			<div [d:hcl mih:{height.desc} w:100% lh:22px]> dish.desc if dish.desc
			<price dish=dish>
			<div [d:hcr w:100%]>
				<button [c:gray4] [c:red5]=inOrder @click=(order.rem dish)> <span> "\u2212"
				<button [c:green4] @click=(order.add dish)> <span> "Добавить"

		css button c:white fs:16px miw:48px h:32px