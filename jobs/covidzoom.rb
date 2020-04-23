
labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']
labels = ['Mar18','Mar19','Mar20','Mar21','Mar22','Mar23','Mar24','Mar25','Mar26','Mar27','Mar28','Mar29','Mar30','Mar31','Apr1','Apr2','Apr3','Apr4','Apr5','Apr6','Apr7','Apr8','Apr9','Ap10','Ap11','Ap12','Ap13','Ap14','Ap15','Ap16','Ap17','Ap18','Ap19','Ap20','Ap21','Ap22']
le = labels.length

cR =  [ 'rgba(255, 6, 20, 1)' ] * le
cO = [ 'rgba(225, 99, 32, 1)' ] * le 
cOY = [ 'rgba(205, 159, 132, 1)' ] * le 
cY = [ 'rgba(255, 206, 86, 1)' ] * le
cYG = [ 'rgba(186, 254, 145, 1)' ] * le
cG = [ 'rgba(56, 256, 205, 1)' ] * le
cC = 'cyan'
cB ='blue' 
cP ='purple' 
cV ='violet' 
 
bcR =  [ 'rgba(255, 6, 20, 0.07)' ] * le
bcO = [ 'rgba(225, 99, 32, 0.06)' ] * le 
bcOY = [ 'rgba(205, 159, 132, 0.05)' ] * le 
bcY = [ 'rgba(255, 206, 86, 0.05)' ] * le
bcYG = [ 'rgba(156, 206, 105, 0.05)' ] * le
bcG = [ 'rgba(56, 256, 205, 0.1)' ] * le
 
bcC = 'rgba(0, 250, 205, 0.06' 
bcB ='rgba(0, 190, 105, 0.06' 
bcP ='rgba(156, 90, 105, 0.06' 
bcV ='rgba(156, 70, 255, 0.1' 

  thousand = [  
    {
label: "US",
 data: [10,82,44,63,110,140,149,236,267,372,445,441,511,895,884,1169,1161,1320,1212,1164,1939,1973,1783,2108,1877,1557,1509,2303,2494,4591,3857,1891,1997,1433,2351,2139],
      borderColor: cR,
      backgroundColor: bcR,
      borderWidth: 1,
    },
    {
label: "France",
 data: [0,95,207,112,112,186,240,231,365,299,319,292,418,499,509,1355,1120,1053,518,833,1417,541,1341,987,635,561,574,762,1438,753,761,642,395,547,531,544],
      borderColor: cO ,
      backgroundColor: bcO,
#      data: Array.new(labels.length) { rand(20..80) },
#      backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
      borderWidth: 1,
    },
    {
  label: "UK",
 data: [16,66,40,56,48,54,87,43,113,181,260,209,180,381,563,569,684,708,621,439,786,938,881,980,917,737,717,778,761,861,847,888,596,449,828,763],
      borderColor: cOY,
      backgroundColor: bcOY,
      borderWidth: 1,
    },
    {
label: "Spain",
 data: [ 90,207,213,332,397,539,497,839,718,773,844,821,913,748,923,961,850,749,694,700,704,747,655,634,525,603,547,300,652,607,687,41,410,399,430,435],
      borderColor: cY,
      backgroundColor: bcY,
      borderWidth: 1,
    },
    {
label: "Italy",
 data: [475,427,627,793,651,601,743,683,712,919,889,756,812,837,727,760,766,681,525,636,604,542,610,570,619,431,566,602,578,525,575,482,433,454,534,437],
      borderColor: cYG,
      backgroundColor: bcYG,
      borderWidth: 1,
    }
  ]

  hundred=  [
    {
label: "Belgium",
 data: [4,7,16,30,8,13,34,56,42,69,64,78,82,192,123,183,132,140,164,185,403,205,283,496,327,254,303,254,283,417,306,290,230,145,170,264],
      borderColor: cC,
      backgroundColor: bcC,
      borderWidth: 1,
    },
    {
label: "Germany",
 data: [4,16,23,17,10,29,34,49,61,75,91,100,112,130,145,187,168,169,140,226,206,333,258,160,-31,286,172,100,510,248,300,107,127,276,171,246],
      borderColor: cB,
      backgroundColor: bcB,
      borderWidth: 1,
    },
    {
label: "Netherlands",
 data: [15,18,30,30,43,34,63,80,78,112,93,132,93,175,134,166,148,164,115,101,234,147,148,115,132,94,86,122,189,181,144,142,83,67,165,138],
      borderColor: cP,
      backgroundColor: bcP,
      borderWidth: 1,
    },
    {
 label: "Brazil",
 data: [0,0,0,0,0,0,0,0, 18,15,19,25,23,42,39,84,35,86,41,78,122,133,131,107,67,99,105,204,204,188,217,213,108,125,154,165],
      borderColor: cV,
      backgroundColor: bcV,
      borderWidth: 1,
    },
    {
label: "Iran",
 data: [147,149,149,123,129,127,122,143,157,144,139,123,117,141,138,124,134,158,151,136,133,121,117,122,125,117,111,98,94,92,89,73,87,91,88,94],
      borderColor: cV,
      backgroundColor: bcYG,
      borderWidth: 1,
    }
  ]

opt = { tooltips: { mode: 'index', intersect: false, },
				hover: { mode: 'nearest', intersect: true }
}

SCHEDULER.every "5m", :first_in => 0   do |job|
# NEED SCHEDULER.every '10m', :first_in => 0 do |job|
  #
  send_event('thousand', { labels: labels, datasets: thousand, options: opt })
  send_event('hundred', { labels: labels, datasets: hundred})
  send_event('pbl', { labels: labels, datasets: thousand, options: opt})

end

=begin  
# grep Apr4 dashboards/covid19.erb | sed "s/,/','/g"        ^C
# grep -e datase -e header dashboards/covid19.erb | sed -E 's/.*aths (.*)/label: "\1,/;s/.*sets="(.*)"/ data: [\1],/'


=end
