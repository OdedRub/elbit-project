Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "oded"
  #config.vm.network "private_network", ip: "192.168.56.2"
  config.vm.network "private_network", ip: "dhcp"

  config.vm.provision "file", source: "/home/oded/git/home_assignments/elbit/application", destination: "/home/vagrant/data" 
  config.vm provision "file", source: "/home/oded/git/home_assignments/elbit/gunicorn.service", destination: "/home/vagrant/data"
  config.vm provision "file", source: "/home/oded/git/home_assignments/elbit/nginx.conf", destination: "/home/vagrant/data"
  
  config.vm.provision "shell", path: "install.sh"
  
end
