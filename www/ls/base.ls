mesice = <[lednu únoru březnu dubnu květnu červnu červenci srpnu září říjnu listopadu prosinci]>
new Tooltip!watchElements!
date = new Date!
  ..setDate 13
years = for year in [2015 to 2100]
  date.setFullYear year
  fridayMonths = []
  for month in [0 to 11]
    date.setMonth month
    if date.getDay! is 5
      fridayMonths.push mesice[month]
  {year, fridayMonths}
container = d3.select ig.containers.base
  ..selectAll \div.year .data years .enter!append \div
    ..attr \class \year
    ..attr \data-tooltip ->
      txt = "V roce <b>#{it.year}</b> "
      txt += switch it.fridayMonths.length
        | 1 => "bude <b>jeden</b> pátek třináctého"
        | 2 => "budou <b>dva</b> pátky třináctého"
        | 3 => "budou <b>tři</b> pátky třináctého"
      txt += ": "
      if it.fridayMonths.length > 1
        lastMonth = it.fridayMonths.pop!
      txt += "v&nbsp;<b>#{it.fridayMonths.join '</b>, v&nbsp;<b>' }</b>"
      if lastMonth
        txt += " a&nbsp;v&nbsp;<b>#{lastMonth}</b>"
      txt
    ..append \span .attr \class \title .html (.year)
    ..append \div .attr \class \container
      ..selectAll \div.friday .data (.fridayMonths) .enter!append \div
        ..attr \class \friday
