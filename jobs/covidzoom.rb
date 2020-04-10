SCHEDULER.every "8m" do |job|

labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']

  thousand = [
    {
      label: ' Spai',
      data: Array.new(labels.length) { rand(20..80) },
      backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 99, 132, 1)' ] * labels.length,
      borderWidth: 1,
    },
    {
      label: ' Fran',
      data: Array.new(labels.length) { rand(40..90) },
      backgroundColor: [ 'rgba(255, 206, 86, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 206, 86, 1)' ] * labels.length,
      borderWidth: 1,
    }
  ]

  hundred=thousand

  send_event('thousand', { labels: labels, datasets: thousand})
  send_event('hundred', { labels: labels, datasets: hundred})

end
