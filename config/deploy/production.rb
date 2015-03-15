set :ip, "162.209.125.214"
server "#{ip}", :web, :app, :db, primary: true
set :rails_env, 'production'
set :branch, "master"