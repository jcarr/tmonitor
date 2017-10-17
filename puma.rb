root = "/srv/webapps/tmonitor"

workers 2

#activate_control_app "tcp://127.0.0.1:9293"
bind "unix:///tmp/puma.tmonitor.sock"
pidfile "#{root}/tmp/pids/puma.pid"
rackup "#{root}/config.ru"
state_path "#{root}/tmp/pids/puma.state"

