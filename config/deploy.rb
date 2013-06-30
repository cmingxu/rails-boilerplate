set :stages, %w(production staging qa)
set :default_stage, ENV['env'] || "production"
require 'capistrano/ext/multistage'

set :application, ""
set :repository,  ""

set :scm, :git 

ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/public_key.pem"]
set :use_sudo, false
set :user, "ubuntu"
set :deploy_to, ""


set :rvm_ruby_string, "1.9.3@global"
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset
require "rvm/capistrano"


namespace :deploy do
  task :build_gems, :roles => :app do
    desc "Building gems"
    run "cd #{release_path} && bundle install"
  end

  task :create_database do
    desc "Migrating database"
    run "cd #{release_path} && rake db:create RAILS_ENV=#{stage}"
  end

  task :migrations do
    desc "Migrating database"
    run "cd #{release_path} && rake db:migrate RAILS_ENV=#{stage}"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  after "deploy:update_code","deploy:build_gems", "db:copy_configuration", "deploy:migrations", "deploy:cleanup"
end

namespace :db do
  task :copy_configuration do
    run "cp #{release_path}/config/database.yml.default #{release_path}/config/database.yml"
  end
end


load 'deploy/assets'
