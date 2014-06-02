namespace :solr do
  task :setup_solr_data_dir do
    run "mkdir -p #{shared_path}/solr/data"
  end

  desc "start solr"
  task :start, :roles => :app, :except => { :no_release => true } do 
    # original # run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr start --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/pids"
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr start --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/solr/pids"
  end

  desc "stop solr"
  task :stop, :roles => :app, :except => { :no_release => true } do 
    #original: run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr stop --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/pids"
    run "#cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr stop --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/solr/pids"
  end

  task :yes do
    puts 'y'
  end

  desc "reindex the whole database"
  task :reindex, :roles => :app do
    #stop
    run "rm -rf #{shared_path}/solr/data"
    #start
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:reindex"
    sleep 13
    puts 'y'
  end
end

# Uncomment to run after deploy:setup
# after 'deploy:setup', 'deploy:setup_solr_data_dir'

# namespace :deploy do
#   task :setup_solr_data_dir do
#     run "mkdir -p #{shared_path}/solr/data"
#   end
# end
 
# namespace :solr do
#   desc "start solr"
#   task :start, :roles => :app, :except => { :no_release => true } do 
#     run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr start --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/pids"
#   end
#   desc "stop solr"
#   task :stop, :roles => :app, :except => { :no_release => true } do 
#     run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr stop --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/pids"
#   end
#   desc "reindex the whole database"
#   task :reindex, :roles => :app do
#     stop
#     run "rm -rf #{shared_path}/solr/data"
#     start
#     run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:reindex"
#   end
# end