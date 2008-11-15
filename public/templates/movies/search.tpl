<div class="fbbl_north">
	<div class="bar">
		Search personal database
	</div>
	<div class="bar">
		Search IMDb
	</div>
	<div class="data_field">
		<span class="value">
			<form id="movie_by_id" action="imdb_entries/find_remote" method="post">
				<input name="imdb_number" type="textfield"/>
				<input value="Go" type="submit"/>
			</form>
		</span>
		<span class="key">by IMDb number:</span>
		<div class="clear"></div>
	</div>
	<div class="data_field">
		<span class="value">
			<form id="movie_by_title" action="imdb_entries/find_remote" method="post">
				<input name="title" type="textfield"/>
				<input value="Go" type="submit">
			</form>
		</span>
		<span class="key">by title:</span>
		<div class="clear"></div>
	</div>
</div>
<div id="movie_results" class="fbbl_center">
</div>
<script type="text/javascript">
  $('#content').FBBorderLayout({
	  spacing: 20,
	  north_collapsable: false
	});
	$('#movie_by_id :submit').click(function(e){
	  e.preventDefault();
	  $.alreves.submitForm($('#movie_by_id'),
      {success:function(){$('#content :input').enable();}})
	    .find(':input');
    $('#content :input').disable();
	});
	$('#movie_by_title :submit').click(function(e){
	  e.preventDefault();
	  $.alreves.submitForm($('#movie_by_title'),
      {success:function(){$('#content :input').enable();}})
	    .find(':input');
      $('#content :input').disable();
	});
</script>
