<div class="bar fbbl_north">
	<div class="right"></div>
	List
</div>
<div class="fbbl_center">
	<table id="movies" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
			</tr>
		</thead>
		<tbody>
			{for movie in movies}
			<tr>
				<td>${movie.id}</td>
				<td>
					${%macros.link(movie.title, '#', {loadurl:'movies/'+movie.id})%}
				</td>
			</tr>
			{/for}
		</tbody>
	</table>
</div>
<script type="text/javascript">
	$('#movies').dataTable({
	  'bPaginate': false,
	  'bProcessing': false,
	  'bInfo': false,
	  'bLengthChange': false,
	  'bFilter': false,
	  'sDom': 't',
		'oLanguage': {'sSearch': ''}
  });
  $('#movie_list').FBBorderLayout({
	  spacing: 5,
	  north_collapsable: false,
	  south_collapsable: false
	});
  $.alreves.loadURL('movies/${movie.id}');
</script>
