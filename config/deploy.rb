# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

set :application, "my_app"
set :repo_url, "git@github.com:monteirobrena/my_app.git"
set :default_env, { rvm_bin_path: "/usr/local/rvm/bin/rvm" }
set :rvm_ruby_version, "ruby-2.6.3"

set :appsignal_config, name: 'My app'
set :appsignal_env, :production


#SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} && cd #{release_path}/ do bundle exec rake"


# Assets
#set :assets_roles, [:web, :app]
#set :assets_prefix, 'prepackaged-assets'
#set :assets_manifests, ['app/assets/config/manifest.js']
#set :rails_assets_groups, :assets
#set :normalize_asset_timestamps, %w{public/images public/javascripts public/stylesheets}
#set :keep_assets, 2

#append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'


#set :deploy_to, "/Users/monteirobrena/Documents/Brena/Posts/AppSignal/Projects/deploy"
#set :deploy_via, :copy
#set :rvm_type, :user
#set :user, "monteirobrena"
#set :deploy_to, "/home/admin/"


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

namespace :deploy do
  desc "Run seed"
  task :seed do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
      end
    end
  end

  after :migrating, :seed
end
