APP_ROOT = '/data/www/ruby-china/current'
bind  "unix:///var/run/ruby-china.sock"
pidfile "#{APP_ROOT}/tmp/pids/puma.pid"
state_path "#{APP_ROOT}/tmp/pids/puma.state"
daemonize true
workers 2
threads 2,8
preload_app!

