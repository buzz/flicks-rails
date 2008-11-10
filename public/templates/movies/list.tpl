<div class="bar">Movie list</div>
<table id="movies">
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
			<td><a href="#">${movie.title}</a><br/></td>
		</tr>
		{/for}
	</tbody>
</table>
<script type="text/javascript">
	$('#movies').dataTable({
	  'bPaginate': false,
	  'bProcessing': false,
	  'bInfo': false,
	  'bLengthChange': false,
	  'sDom': '<"vert-scroll"t>f',
		'oLanguage': {'sSearch': ''}
  });
</script>
