
labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']
labels = ['Mar18','Mar19','Mar20','Mar21','Mar22','Mar23','Mar24','Mar25','Mar26','Mar27','Mar28','Mar29','Mar30','Mar31','Apr1','Apr2','Apr3','Apr4','Apr5','Apr6','Apr7','Apr8','Apr9']
le = labels.length

cR =  [ 'rgba(255, 6, 20, 1)' ] * le
cO = [ 'rgba(225, 99, 32, 1)' ] * le 
cOY = [ 'rgba(205, 159, 132, 1)' ] * le 
cY = [ 'rgba(255, 206, 86, 1)' ] * le
cYG = [ 'rgba(156, 206, 105, 1)' ] * le
cG = [ 'rgba(56, 256, 205, 1)' ] * le
cC =0 
cB =0 
cP =0 
cV =0 
 
bcR =  [ 'rgba(255, 6, 20, 0.1)' ] * le
bcO = [ 'rgba(225, 99, 32, 0.1)' ] * le 
bcOY = [ 'rgba(205, 159, 132, 0.1)' ] * le 
bcY = [ 'rgba(255, 206, 86, 0.1)' ] * le
bcYG = [ 'rgba(156, 206, 105, 0.1)' ] * le
bcG = [ 'rgba(56, 256, 205, 0.1)' ] * le
 
  thousand = [  
    {
label: "US",
 data: [10,82,44,63,110,140,149,236,267,372,445,441,511,895,884,1169,1161,1320,1212,1164,1939,1973,1783],
      borderColor: cR,
      backgroundColor: bcR,
      borderWidth: 1,
    },
    {
label: "France",
 data: [0,95,207,112,112,186,240,231,365,299,319,292,418,499,509,1355,1120,1053,518,833,1417,541,1341],
      borderColor: cO ,
      backgroundColor: bcO,
#      data: Array.new(labels.length) { rand(20..80) },
#      backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
      borderWidth: 1,
    },
    {
  label: "UK",
 data: [16,66,40,56,48,54,87,43,113,181,260,209,180,381,563,569,684,708,621,439,786,938,881],
      borderColor: cOY,
      backgroundColor: bcOY,
      borderWidth: 1,
    },
    {
label: "Spain",
 data: [ 90,207,213,332,397,539,497,839,718,773,844,821,913,748,923,961,850,749,694,700,704,747,655],
      borderColor: cY,
      backgroundColor: bcY,
      borderWidth: 1,
    },
    {
label: "Italy",
 data: [475,427,627,793,651,601,743,683,712,919,889,756,812,837,727,760,766,681,525,636,604,542,610],
      borderColor: cYG,
      backgroundColor: bcYG,
      borderWidth: 1,
    }
  ]

  hundred=thousand

SCHEDULER.every "4s" do |job|

  send_event('thousand', { labels: labels, datasets: thousand})
  send_event('hundred', { labels: labels, datasets: hundred})
 # send_event('hundred', { labels: labels, datasets: thousand})

end

# grep Apr4 dashboards/covid19.erb | sed "s/,/','/g"        ^C
# grep -e datase -e header dashboards/covid19.erb | sed -E 's/.*aths (.*)/label: "\1,/;s/.*sets="(.*)"/ data: [\1],/'

=begin  
label: "Netherlands",
 data: [15,18,30,30,43,34,63,80,78,112,93,132,93,175,134,166,148,164,115,101,234,147,148],
label: "Iran",
 data: [147,149,149,123,129,127,122,143,157,144,139,123,117,141,138,124,134,158,151,136,133,121,117],
label: "Germany",
 data: [4,16,23,17,10,29,34,49,61,75,91,100,112,130,145,187,168,169,140,226,206,333,258],
label: "Belgium",
 data: [4,7,16,30,8,13,34,56,42,69,64,78,82,192,123,183,132,140,164,185,403,205,283],
=end
