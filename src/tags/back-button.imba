tag back-button < button
	def onclick e
		if currentTab == "item-list"
			currentTab = "category-list"
		elif currentTab == "order-list"
			currentTab = "item-list"
		elif currentTab == "customer-data"
			currentTab = "order-list"
	

	<self [b:16px]=(currentTab != "category-list") @click=onclick> "Назад"

	css
		pos:fixed w:120px h:48px l:16px b:-64px rd:24px  fs:16px
		bg:#282828 @active:#343434 c:#C8C8C8 bxs: 0 0 0 1px #787878 inset
		d:hcc tween:all .3s ease