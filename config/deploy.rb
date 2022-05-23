# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

#role :app, ""

set :user, "ubuntu"

set :use_sudo, false
set :application, "my_app"
set :repo_url, "git@github.com:monteirobrena/my_app.git"

#set :deploy_to, "/Users/monteirobrena/Documents/Brena/Posts/AppSignal/Projects/deploy"
#set :deploy_via, :copy
#set :default_env, { rvm_bin_path: "~/.rvm/bin" }
#set :rvm_ruby_verrion, "ruby-3.0.0"
#set :rvm_type, :user
#set :user, "monteirobrena"
#set :deploy_to, "/home/admin/"

# override deploy:restart since this isn't a Rails app
namespace :deploy do

  namespace :check do
#    after :make_linked_dirs, :bundle_install
  end

  desc "Bundle and Yarn install."
  task :bundle_install do
    on roles(:app) do
      execute "cd /Users/monteirobrena/Documents/Brena/Posts/AppSignal/Projects/deploy/current && gem install bundler"
      execute "cd /Users/monteirobrena/Documents/Brena/Posts/AppSignal/Projects/deploy/current && bundle install"
      execute "yarn install --check-files"
    end
  end

  task :restart do
    # no-op
  end
end


#set :copy_dir, "/Users/monteirobrena/Documents/Brena/Posts/AppSignal/Projects/deploy/tmp"
#set :copy_remote_dir, "/Users/monteirobrena/Documents/Brena/Posts/AppSignal/Projects/deploy/tmp"

#set :repo_url, "git@example.com:me/my_repo.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
