<div id="top">
	<div class="right default-padding">Flicks <span class="small">- personal movie database</span></div>
	<div id="top-menu" class="left">
		{for item in menu}
		<a href="#" class="default-padding">${item.name}</a>
		{/for}
	</div>
</div>
<div class="clear"></div>
<div id="content" class="default-padding panel-color border"></div>
<div id="footer" class="default-padding panel-color border"></div>
<script type="text/javascript">
	$.alreves.loadURL('movies');
</script>
