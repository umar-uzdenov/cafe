tag order-view
	<self.vtc
		[h:calc(100vh - 96px - 64px - 200px - 16px) pos:fixed b:calc(96px + 200px + 16px) l:16px r:16px]
		[l:calc(16px - 100vw) r:calc(16px + 100vw)]=!details_show
		[bg:rgba(0, 0, 0, .5) c:white]>

		<h2.fcc [mih:64px]> "Ваш заказ"
		<ul.vtc [w:100% mih:calc(100vh - {categoriesHeight}px - 232px) ofy:scroll]>
			for dish, index in order.items
				<div [w:100% mih:1px bg:#ccc]>
				<div.fsc [w:100% h:72px mih:72px]>
					<div.vtc [p:0 16px w:100% mih:72px]>
						<div.flc [w:100% mih:36px]> dish.name
						<price dish=dish>
					<button
						[c:gray4]
						[c:red5]=(order.items.find do $1.id === dish.id)
						@click=(order.rem dish)> "\u2212"
					<button [c:green4] @click=(order.add dish)> "+"
					css button c:white fs:60px w:72px h:72px