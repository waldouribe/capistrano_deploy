set :rails_env, "production"
set :ip, "198.61.208.253"
set :branch, "master"
server "#{ip}", :web, :app, :db, primary: true