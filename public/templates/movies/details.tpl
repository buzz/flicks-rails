<div class="bar fbbl_north">
	<div class="right"></div>
	Details
</div>
<div class="fbbl_center">
	<div class="data_field">
		<span class="value">${movie.id}</span>
		<span class="key">ID:</span>
	</div>
	<div class="data_field">
		<span class="value">${movie.title}</span>
		<span class="key">Title:</span>
	</div>
</div>
<script type="text/javascript">
  $('#movie_details').FBBorderLayout({
	  spacing: 5,
	  north_collapsable: false,
	  south_collapsable: false
	});
</script>
