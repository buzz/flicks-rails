<div class="bar fbbl_north">
	<div class="right">${movie.title}</div>
	Details
</div>
<div class="fbbl_center">
	<div class="data_field">
		<span class="value">${movie.disk_id}</span>
		<span class="key">Disk ID:</span>
	</div>
	<div class="data_field">
		<span class="value">${movie.disks}</span>
		<span class="key">Disks:</span>
	</div>
	<div class="data_field">
		<span class="value">${movie.video_format}</span>
		<span class="key">Video format:</span>
	</div>
	<div class="data_field">
		<span class="value">${%macros.link(movie.imdb_entry.imdb_number, 'http://akas.imdb.com/title/tt'+movie.imdb_entry.imdb_number, {target:'_blank'})%}</span>
		<span class="key">IMDb number:</span>
	</div>
</div>
<script type="text/javascript">
  $('#movie_main').FBBorderLayout({
	  spacing: 5,
	  north_collapsable: false,
	  south_collapsable: false
	});
</script>
