set :rails_env, "production"
set :ip, "198.61.208.253"
server "#{ip}", :web, :app, :db, primary: true