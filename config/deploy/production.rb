set :branch, 'master'
set :rack_env, 'production'
set :rails_env, 'production'

set :repo_url, 'git@github.com:dinge/dinghub.git'

server 'dingdealer.de', user: 'live', port: 22, roles: %w{web app db}
