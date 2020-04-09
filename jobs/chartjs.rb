SCHEDULER.every "2m" do |job|
  send_event("chart3", {
  	type: "bar",
  	header: "C Burned",
  	labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"],
  	colorNames: ["yellow", "yellow", "yellow", "yellow", "yellow"],
  	datasets: [21, 33, 22, 49, 10]
  })

  send_event("bar-chart", {
  	type: "bar",
  	header: "Ci bar-c Burned",
  	labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"],
  	colorNames: ["yellow", "yellow", "yellow", "yellow", "yellow"],
        datasets: [21, 33, 22, 49, 10]*rand(1..5)
  })


labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']

  data = [
    {
      label: 'a First dataset',
      data: Array.new(labels.length) { rand(20..80) },
      backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 99, 132, 1)' ] * labels.length,
      borderWidth: 1,
    }, {
      label: 'Second dataset',
      data: Array.new(labels.length) { rand(40..90) },
      backgroundColor: [ 'rgba(255, 206, 86, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 206, 86, 1)' ] * labels.length,
      borderWidth: 1,
    }
  ]

  send_event('linechart', { labels: labels, datasets: data })
  send_event('linechart2', { labels: labels, datasets: data })

end
