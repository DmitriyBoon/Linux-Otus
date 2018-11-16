# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  # config.vm.provision "ansible" do |ansible|
  #   ansible.verbose = "vvv"
  #   ansible.playbook = "provisioning/playbook.yml"
  #   ansible.become = "true"
  # end


  config.vm.provider "virtualbox" do |v|
	  v.memory = 256
  end

  config.vm.define "server" do |server|
    server.vm.network "private_network", ip: "192.168.255.1", virtualbox__intnet: "iptab"
    server.vm.hostname = "server"
    server.vm.provision "shell", inline: <<-SHELL
    mkdir -p ~root/.ssh; cp ~vagrant/.ssh/auth* ~root/.ssh
    sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    systemctl restart sshd
    yum update -y
    yum install epel-release -y
    yum install ntpdate -y # обновление и синхронизацию времени
    yum install ntp -y
    ntpdate pool.ntp.org
    systemctl enable ntpdate
    systemctl status ntpdate
    yum install openvpn easy-rsa -y
    cd /etc/openvpn/
    mkdir keys
    /usr/share/easy-rsa/3.0.3/easyrsa init-pki
    /usr/share/easy-rsa/3.0.3/easyrsa --batch build-ca nopass
    /usr/share/easy-rsa/3.0.3/easyrsa gen-dh
    /usr/share/easy-rsa/3.0.3/easyrsa  build-server-full server nopass
    /usr/share/easy-rsa/3.0.3/easyrsa  build-client-full client nopass
    openvpn --genkey --secret ta.key
    mv ta.key keys/
    cp pki/ca.crt keys/
    cp pki/dh.pem keys/
    cp pki/issued/server.crt keys/
    cp pki/private/server.key keys/
    cp /vagrant/sert.sh /home/vagrant/sert.sh
    cat /home/vagrant/sert.sh | tr -d '\r' > /home/vagrant/sert.sh  # убираем перевод каретки
    /home/vagrant/sert.sh
    cp /vagrant/server.conf server/
    restorecon -R -v /etc/openvpn
    systemctl start openvpn@server
    echo 'net.ipv4.conf.all.forwarding=1' >> /etc/sysctl.conf
    echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
    sysctl -p
    SHELL
  end

  config.vm.define "client" do |client|
    client.vm.network "private_network", ip: "192.168.255.2", virtualbox__intnet: "iptab"
    client.vm.hostname = "client"
    client.vm.provision "shell", inline: <<-SHELL
  mkdir -p ~root/.ssh; cp ~vagrant/.ssh/auth* ~root/.ssh
  sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
  systemctl restart sshd
  yum update -y
  yum install ntpdate -y # обновление и синхронизацию времени
  yum install ntp -y
  ntpdate pool.ntp.org
  systemctl enable ntpdate
  systemctl status ntpdate
  yum install epel-release -y
  yum install openvpn -y
  cd /etc/openvpn
  cp /vagrant/client.conf client/
  systemctl start openvpn@client
  SHELL
end

#   config.vm.define "caserv" do |caserv|
#     caserv.vm.network "private_network", ip: "192.168.255.3", virtualbox__intnet: "iptab"
#     caserv.vm.hostname = "caserv"
#     caserv.vm.provision "shell", inline: <<-SHELL
#   mkdir -p ~root/.ssh; cp ~vagrant/.ssh/auth* ~root/.ssh
#   sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#   systemctl restart sshd
#   yum update -y 
#   yum install ntpdate -y
#   yum install ntp -y
#   /etc/init.d/ntp stop
#   ntpdate pool.ntp.org
#   /etc/init.d/ntp start
#   yum install openvpn -y
# SHELL
# end
end