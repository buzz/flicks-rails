<div class="bar fbbl_north">
	IMDb data
</div>
<div id="imdb_main" class="fbbl_center">
	${%macros.loading({size:'big'})%}
</div>
<script type="text/javascript">
  $('#content').FBBorderLayout({
	  spacing: 5,
	  north_collapsable: false
	});
	$.alreves.loadURL();
</script>
