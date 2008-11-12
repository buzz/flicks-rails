<div id="wrapper">
	<div id="top" class="fbbl_north">
		<div class="right default-padding">Flicks<span class="small"> - personal movie database</span></div>
		<div id="top-menu">
			{var i = 0}
			{for item in menu}
			${%macros.link(item.name, '#', {loadurl: item.url, class:'default-padding', id:'menu_item_'+i, js:'jQuery(\'#menu_item_'+i+'\').siblings().removeClass(\'active\').end().addClass(\'active\');'})%}
			${++i|eat}
			{/for}
		</div>
		<div id="border-bottom"></div>
	</div>
	<div id="content" class="fbbl_center default-padding panel-color border"></div>
	<div id="footer" class="fbbl_south default-padding panel-color border"></div>
</div>
<script type="text/javascript">
	$('#menu_item_0').addClass('active');
	$.alreves.loadURL('movies');
  $('#wrapper').FBBorderLayout({
	  spacing: 0,
	  north_collapsable: false,
	  south_collapsable: false
	});
</script>
