{macro googlechart(alt, chd, options)}
{eval EOF}
o = jQuery.extend({
  cht: 'p3',
  chf: 'bg,s,00000000',
  chco: '888888,555555',
  chs: '400x150',
  chl: ''
}, options);
EOF
<img alt="${alt}" src="http://chart.apis.google.com/chart?chd=${chd}&amp;cht=${o.cht}{if typeof o.chtt != 'undefined'}&amp;chtt=${o.chtt}{/if}&amp;chf=${o.chf}&amp;chco=${o.chco}&amp;chs=${o.chs}&amp;chl=${o.chl}"/>
{/macro}
${macros.googlechart = googlechart|eat}
