<div class="bar fbbl_north">
	<span class="right">showing ${imdb_entries.length} result{if imdb_entries.length == 1}s{/if}</span>
	Results
</div>
<div class="fbbl_center">
	{for e in imdb_entries}
	<div class="data_field">
		<span class="value">${e.title} <span class="small gray">(${e.year})</span></span>
		<span class="key">${e.id}</span>
	</div>
	{/for}
</div>
<script type="text/javascript">
  $('#movie_results').FBBorderLayout({
	  spacing: 5,
	  north_collapsable: false
	});
</script>
