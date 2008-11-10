<div id="top">
	<div class="right default-padding">Flicks <span class="small">- personal movie database</span></div>
	<div id="top-menu" class="left">
		{var i = 0}
		{for item in menu}
		  ${%macros.link(item.name, '#', {loadurl: item.url, class:'default-padding', id:'menu_item_'+i, js:'jQuery(\'#menu_item_'+i+'\').siblings().removeClass(\'active\').end().addClass(\'active\');'})%}
		  ${++i|eat}
		{/for}
	</div>
</div>
<div class="clear"></div>
<div id="content" class="default-padding panel-color border top-border"></div>
<div id="footer" class="default-padding panel-color border"></div>
<script type="text/javascript">
	$('#menu_item_0').addClass('active');
	$.alreves.loadURL('movies');
</script>
