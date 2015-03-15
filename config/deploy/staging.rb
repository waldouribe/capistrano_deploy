set :ip, "104.130.2.49"
server "#{ip}", :web, :app, :db, primary: true
set :rails_env, 'staging'
set :branch, "development"