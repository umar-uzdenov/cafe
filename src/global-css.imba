# set size
const style = document.documentElement.style
const tg = window.Telegram.WebApp

style.setProperty "--vh", "{tg.viewportStableHeight}px"
style.setProperty "--safe-top", "{tg.contentSafeAreaInset.top}px"
style.setProperty "--safe-bottom", "{tg.contentSafeAreaInset.bottom}px"
style.setProperty "--main-height", "{
	tg.viewportStableHeight - tg.contentSafeAreaInset.top - tg.contentSafeAreaInset.bottom -
	80 # bottom
}px"
# style.setProperty "--top", "{160}px"

global css body $bottom:80px $top:160px

global css
	# $block-height: calc($vh - $safe-top - $safe-bottom)
	*  m:0 p:0 box-sizing:border-box
	body ff:Arial,sans-serif bg:#3c3c3c
	button
		ol:none bd:none cursor:pointer bgc:transparent
		user-select:none -webkit-user-select:none -moz-user-select:none -ms-user-select:none
		-webkit-tap-highlight-color:transparent -webkit-touch-callout:none