#sera que lo pido ZZrequire 'sinatra'
#use Rack::Logger

#set :logger, Logger.new(STDOUT) # STDOUT & STDERR is captured by unicorn

=begin
#NO ESTO CRE NEW SRVR get '/fi' do
  # File.read(File.join('public', 'index.html'))
  this went to config.ru config
=end

SCHEDULER.every "5m", :first_in => 0   do |job|

  puts('jc -- hist 5m info')
  labels = [ "a","b","c3","d4" ]
  data = [  
      {
        label: "Inin label",
        data: [14,19,49,17]*rand(1..6),
        borderColor: "orange",
        backgroundColor: "yellow",
        borderWidth: 1,
      }
    ]
  
  opt = { tooltips: { mode: 'index', intersect: false, },
                                  hover: { mode: 'nearest', intersect: true }
  }
  
  send_event('pdl', { labels: labels, datasets: data, options: opt })
  send_event('pal', { labels: labels, datasets: data, options: opt })


#times
     labels= [ 1586773754000 , 1586860151000, 1586946492000  ,  1587119391000, 1587292233000 ]
    data= [{  label: "aa",      data: [111, 223, 224, 112, 155 ],    },
    {      label: "bb",      data: [133, 33,   332, 331,  32],     }    ,
    { label: "xy", data: [{x: 1586838705000, 	y: -30}, {x: 1586946492000,y: 0}, {x: 1587090746000  ,y:40}, {x:  1587119222000,y: 22	}]}  
    ]
   opt= {
    scales: {
      xAxes: [{
        type: 'time',
        time: {
          displayFormats: {
          	'millisecond': 'MMM DD',
            'second': 'MMM DD',
            'minute': 'MMM DD',
            'hour': 'MMM DD',
            'day': 'MMM DD',
            'week': 'MMM DD',
            'month': 'MMM DD',
            'quarter': 'MMM DD',
            'year': 'MMM DD',
          }
        }
      }],
    },
  }
   
   send_event('pbl2', { labels: labels, datasets: data, options: opt })
  send_event('lin2', { labels: labels, datasets: data, options: opt })
  send_event('d1', { labels: 'hoy', datasets: '4' })
  
#ok  puts( settings.history.to_yaml)
#OK almacena  puts( Sinatra::Application.settings.history.to_yaml)
end

#File.write('assets/stylesheets/hi.css', settings.history.to_yaml)
#puts('jc starting hi info')
#
#Sinatra::Application.
