Installation guide

#### Fresh server ####
Go to your vps provider and create (or rebuild) a server
Then connect via ssh to the server

#### Remove previous ssh configs in your local machine ####
$ cd ~/.ssh
$ rm id_rsa
$ rm id_rsa.pub
$ rm known_hosts
$ cd ~/.ssh;rm id_rsa;rm id_rsa.pub;rm known_hosts

## Check if folder is clean by executing
$ cd ~/.ssh;ls
## No files should be shown

#### Create 'deployer' user ####
## My ip is: 50.56.174.177 so
## $ ssh root@50.56.174.177
$ ssh root@50.56.174.177
Are you sure you want to continue connecting (yes/no)? yes
root@50.56.174.177s password: 8woJzxJ8wU9N
# Change password:
$ passwd

# Set up languages, Optional
$ export LANGUAGE=en_US.UTF-8
$ export LANG=en_US.UTF-8
$ export LC_ALL=en_US.UTF-8
$ locale-gen en_US.UTF-8
$ dpkg-reconfigure locales
# You may need to shutdown
# $ sudo shutdown -r now
$ export LANGUAGE=en_US.UTF-8;export LANG=en_US.UTF-8;export LC_ALL=en_US.UTF-8;locale-gen en_US.UTF-8;dpkg-reconfigure locales


# Create user
$ sudo adduser deployer
## Keep fields as default, just press enter untill its done

# Give sudo privileges to 'deployer'
$ sudo adduser deployer sudo

# Exit from the server
(Ctrl + D)
# Go to your application
cd /your_app_location
# Then run the following capistrano tasks

# Capistrano tasks
cap deploy:install
# You might need to press (Ctrl+C) if it's frozen.
# Then run the following command
cap rbenv:install_tail 
# Check if rbenv tasks installed ruby and bundler using:
cap rbenv:check

# Install java
$ ssh root@50.56.174.177
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt-get -y update
$ sudo apt-get -y install oracle-java7-installer
# Exit
(Ctrl + D)

# Now run the setup
cap deploy:setup

# Finally deploy
cap deploy:cold

# Run stuff
cap redis:setup
cap redis:start # Doesn't work
# Instead :
# Enter the server search redis process "ps -A -f | grep redis" and "kill -9 <id>" then run redis-server

cap sidekiq:start
cap solr:start

# SSH en bitbucker
# https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git