#source = 'http://some.remote.host/linechart.xml'

labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']

SCHEDULER.every '10m', :first_in => 0 do |job|

  data = [
    {
      label: '1st First dataset',
      data: Array.new(labels.length) { rand(20..80) },
      backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 99, 132, 1)' ] * labels.length,
      borderWidth: 1,
    }, {
      label: "DOS 2nd dataset",
      data: Array.new(labels.length) { rand(40..90) },
      backgroundColor: [ 'rgba(255, 206, 86, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 206, 86, 1)' ] * labels.length,
      borderWidth: 1,
    }
  ]

  send_event('lin', { labels: labels, datasets: data })
  send_event('linechart2', { labels: labels, datasets: data })
#  send_event('lin2', { labels: labels, datasets: data })
end
