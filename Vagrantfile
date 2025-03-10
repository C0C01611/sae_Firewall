Vagrant.configure("2") do |config|
  # Forcer VirtualBox comme provider
  config.vm.provider "virtualbox"

  # Machine Serveur
  config.vm.define "server" do |server|
    server.vm.box = "debian/bookworm64"
    server.vm.hostname = "server"
    server.vm.network "private_network", ip: "192.168.56.10"

    server.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
    end

    server.vm.synced_folder "./scripts", "/home/vagrant/scripts"

    server.vm.provision "shell", inline: <<-SHELL
      echo "🔹 Installation du serveur..."
      sudo apt update
      sudo apt install -y nginx ufw
      sudo ufw allow 80
      sudo ufw allow 443
      sudo ufw enable
      sudo systemctl start nginx
      echo "✅ Serveur prêt avec Nginx et UFW !"
    SHELL
  end

  # Machine Client
  config.vm.define "client" do |client|
    client.vm.box = "debian/bookworm64"
    client.vm.hostname = "client"
    client.vm.network "private_network", ip: "192.168.56.20"

    client.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end

    client.vm.synced_folder "./scripts", "/home/vagrant/scripts"

    client.vm.provision "shell", inline: <<-SHELL
      echo "🔹 Installation du client..."
      sudo apt update
      sudo apt install -y curl nmap
      echo "✅ Client prêt avec curl et nmap !"
    SHELL
  end
end

