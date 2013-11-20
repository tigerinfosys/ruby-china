# coding: utf-8
require "bundler/capistrano"
require "sidekiq/capistrano"
require "capistrano-rbenv"
require 'puma/capistrano'

default_run_options[:pty] = true

set :rbenv_ruby_version, '2.0.0-p247'
set :application, "ruby-china"
set :repository,  "https://github.com/feitian124/ruby-china.git"
set :branch, "52jita"
set :scm, :git
set :user, "ming"
set :deploy_to, "/data/www/#{application}"
set :runner, "ming"
set :deploy_via, :remote_cache
# set :git_shallow_clone, 1
set :puma_role, :app
set :puma_config_file, "config/puma.rb"

role :web, "52jita.net"                          # Your HTTP server, Apache/etc
role :app, "52jita.net"                          # This may be the same as your `Web` server
role :db,  "52jita.net", :primary => true # This is where Rails migrations will run

namespace :faye do
  desc "Start Faye"
  task :start, :roles => :app do
    run "cd #{deploy_to}/current/faye_server; thin start -C thin.yml"
  end

  desc "Stop Faye"
  task :stop, :roles => :app do
    run "cd #{deploy_to}/current/faye_server; thin stop -C thin.yml"
  end

  desc "Restart Faye"
  task :restart, :roles => :app do
    run "cd #{deploy_to}/current/faye_server; thin restart -C  thin.yml"
  end
end

task :init_shared_path, :roles => :web do
  run "mkdir -p #{deploy_to}/shared/log"
  run "mkdir -p #{deploy_to}/shared/pids"
  run "mkdir -p #{deploy_to}/shared/assets"
end

task :link_shared_files, :roles => :web do
  run "ln -sf #{shared_path}/assets #{deploy_to}/current/public/assets"
  run "ln -sf #{deploy_to}/shared/config/*.yml #{deploy_to}/current/config/"
  run "ln -sf #{deploy_to}/shared/config/initializers/secret_token.rb #{deploy_to}/current/config/initializers"
  run "ln -sf #{deploy_to}/shared/config/faye_thin.yml #{deploy_to}/current/faye_server/thin.yml"
  run "ln -sf #{shared_path}/pids #{deploy_to}/current/tmp/"
end

task :mongoid_create_indexes, :roles => :web do
  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:mongoid:create_indexes"
end

task :compile_assets, :roles => :web do
  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake assets:precompile"
  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake assets:cdn"
end

task :mongoid_migrate_database, :roles => :web do
  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:migrate"
end

after "deploy:finalize_update","deploy:symlink", :init_shared_path, :link_shared_files, :mongoid_migrate_database #, :compile_assets
