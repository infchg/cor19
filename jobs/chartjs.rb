SCHEDULER.every "20m" do |job|

  send_event("bar-chart", {
  	type: "bar",
  	header: "Chr2 bar i bar-c Burned",
  	labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"],
  	colorNames: ["yellow", "yellow", "yellow", "yellow", "yellow"],
        datasets: [21, 33, 22, 49, 10]*rand(1..5)
  })



  send_event("chart2", {
  	type: "bar",
  	header: "Chart1 Burned",
  	labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"],
  	colorNames: ["yellow", "yellow", "yellow", "yellow", "yellow"],
  	datasets: [21, 33, 22, 49, 10]
  })
end
