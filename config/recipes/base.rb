# Helpers
def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    update_packages
    install_libxslt
    install_python

    git.install
    nginx.install
    postgresql.install
    nodejs.install
    make.install
    redis.install
    rbenv.install
  end

  desc "Update ubuntu packages"  
  task :update_packages do
    run "#{sudo} apt-get -y -f install"# -f fixes corruped packages
    run "#{sudo} apt-get clean"
    run "#{sudo} apt-get -y --fix-missing update; true"
  end

  desc "Install libxslt (C library for GNOME)"
  task :install_libxslt do
    run "#{sudo} apt-get -y install libxslt-dev libxml2-dev"
  end

  desc "Install python"
  task :install_python do
    run "#{sudo} apt-get -y install python-software-properties"
  end
end
