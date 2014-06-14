# read data and replace dots in names with underscores
obesity = read.csv(
  'http://www.stat.berkeley.edu/classes/s133/data/obesity.csv',
  stringsAsFactors = F
)
names(obesity) = gsub("\\.", "_", names(obesity))
# add column with two letter state names and 
obesity = plyr::mutate(obesity, 
                       State = str_trim(State),
                       state = state.abb[match(State, state.name)],
)
rCharts::choropleth(
  cut(Adult_Obesity_Rate, 5, labels = F) ~ state,
  data = obesity,
  pal = 'PuRd'
)

