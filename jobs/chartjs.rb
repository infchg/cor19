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
  	header: "C Burned",
  	labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"],
  	colorNames: ["yellow", "yellow", "yellow", "yellow", "yellow"],
  	datasets: [21, 33, 22, 49, 10]
  })

end
