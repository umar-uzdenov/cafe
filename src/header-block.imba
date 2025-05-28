let value = ""

extend tag element
	get headerText do value
	set headerText do value = $1

tag header-block < h2
	<self [d:hcc h:48px mih:48px t:calc($top - 64px) pos:fixed l:0 r:0 c:white]> headerText