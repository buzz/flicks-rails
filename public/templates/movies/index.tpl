<div class="bar fbbl_north">
	List
</div>
<div class="fbbl_center">
	<table id="movies" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>#</th>
				<th>Title</th>
				<th>Video codec</th>
				<th>Audio codec</th>
				<th>No. disk</th>
				<th>Releaser</th>
			</tr>
		</thead>
		<tbody>
			{for movie in movies}
			<tr>
				<td>${movie.disk_id}</td>
				<td>
					${%macros.link(movie.title, '#', {loadurl:'movies/'+movie.id})%}
				</td>
				<td>${movie.video_format}</td>
				<td>${movie.audio_format}</td>
				<td>${movie.disks}</td>
				<td>${movie.releaser}</td>
			</tr>
			{/for}
		</tbody>
	</table>
</div>
<div class="right fbbl_south">
	<form id="movie_filter_form" action="#">
		<input name="movie_filter" type="textfield"/>
	</form>
</div>
<script type="text/javascript">
	(function(){
	var table = $('#movies').dataTable({
	  'bPaginate': false,
	  'bProcessing': false,
	  'bInfo': false,
	  'bLengthChange': false,
	  'bFilter': false,
	  'sDom': 't'
  });
  $('#content').FBBorderLayout({
	  spacing: 5,
	  north_collapsable: false,
	  south_collapsable: false
	});
  $('#movie_filter_form :input').keyup(function () {
		table.fnFilter(this.value);
	} );
  })()
</script>
