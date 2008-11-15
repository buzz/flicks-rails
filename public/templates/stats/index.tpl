<div class="bar">
	Statistics
</div>
<div class="data_field">
	<span class="value">
		${movie_count}
	</span>
	<span class="key">
		Movies:
	</span>
</div>
<div class="data_field">
	<span class="value">
		${imdb_entry_count}
	</span>
	<span class="key">
		IMDb entries:
	</span>
</div>
<div class="data_field">
	<span class="value">
		${%macros.googlechart('test', 't:'+imdb_coverage+','+(100-imdb_coverage), {chl:'have%7Cdo+not+have', chtt:'IMDb+coverage'})%}
	</span>
	<span class="key">
		IMDb coverage: ${imdb_coverage} %
	</span>
	<div class="clear"></div>
</div>
