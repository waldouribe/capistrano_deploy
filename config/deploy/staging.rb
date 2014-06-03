set :rails_env, "staging"
set :ip, "166.78.144.163"
server "#{ip}", :web, :app, :db, primary: true