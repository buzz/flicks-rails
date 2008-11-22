<div id="movie_list" class="fbbl_west">
	${%macros.loading({size:'big'})%}
</div>
<div id="movie_main" class="fbbl_center">
	${%macros.loading({size:'big'})%}
</div>
<div class="clear"></div>
<script type="text-javascript">
	$.alreves.loadURL('imdb_entries/list');
  $('#content').FBBorderLayout({
	  spacing: 10,
	  west_width: 300
	});
</script>
