set :rails_env, "staging"
set :ip, "166.78.144.163"
set :branch, "development"
server "#{ip}", :web, :app, :db, primary: true