APP_ROOT = '/home/ming/www/ruby-china/current'
pidfile "#{APP_ROOT}/tmp/pids/puma.pid"
state_path "#{APP_ROOT}/tmp/pids/puma.state"
daemonize true
workers 1
threads 2,8
preload_app!

