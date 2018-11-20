# -*- mode: ruby -*-
# vim: set ft=ruby :


MACHINES = {
:ABR1 => {
    :box_name => "centos/7",
    :net => [
               {ip: '10.0.10.1', adapter: 2, netmask: "255.255.255.0", virtualbox__intnet: "ts-net"},
            ]
},
:ABR2 => {
    :box_name => "centos/7",
    :net => [
               {ip: '10.0.20.1', adapter: 2, netmask: "255.255.255.0", virtualbox__intnet: "ts-net"},
            ]
  },
:ABR3 => {
    :box_name => "centos/7",
    :net => [
               {ip: '10.0.30.1', adapter: 2, netmask: "255.255.255.0", virtualbox__intnet: "ts-net"},
            ]
  },
}

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|

    config.vm.define boxname do |box|

        box.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s

        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end

        box.vm.provision "shell", inline: <<-SHELL
          mkdir -p ~root/.ssh
                cp ~vagrant/.ssh/auth* ~root/.ssh
        SHELL
        
        case boxname.to_s
        when "ABR1"
          box.vm.provision "shell", run: "always", inline: <<-SHELL
          echo net.ipv4.conf.all.forwarding=1  >> /etc/sysctl.conf
          echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
          echo net.ipv4.conf.all.rp_filter=2 >> /etc/sysctl.conf
          sysctl -p
          nmcli connection add type vlan ifname vlan12 dev eth1 id 12 ip4 172.16.12.10/30
          nmcli connection add type vlan ifname vlan16 dev eth1 id 16 ip4 172.16.16.10/30           
          yum install quagga -y
          cp /vagrant/quagga_conf/1ospfd.conf /etc/quagga/ospfd.conf
          cp /vagrant/quagga_conf/1zebra.conf /etc/quagga/zebra.conf
          chown quagga:quagga /etc/quagga/ospfd.conf
          chown quagga:quagga /etc/quagga/ospfd.conf
          systemctl start zebra
          systemctl enable zebra
          systemctl start ospfd
          systemctl enable ospfd
          SHELL

        
        when "ABR2"
          box.vm.provision "shell", run: "always", inline: <<-SHELL
          echo net.ipv4.conf.all.forwarding=1  >> /etc/sysctl.conf
          echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
          echo net.ipv4.conf.all.rp_filter=2 >> /etc/sysctl.conf
          sysctl -p
          nmcli connection add type vlan ifname vlan12 dev eth1 id 12 ip4 172.16.12.9/30
          nmcli connection add type vlan ifname vlan20 dev eth1 id 20 ip4 172.16.20.10/30
          yum install quagga -y
          cp /vagrant/quagga_conf/2ospfd.conf /etc/quagga/ospfd.conf
          cp /vagrant/quagga_conf/2zebra.conf /etc/quagga/zebra.conf
          chown quagga:quagga /etc/quagga/ospfd.conf
          chown quagga:quagga /etc/quagga/ospfd.conf
          systemctl start zebra
          systemctl enable zebra
          systemctl start ospfd
          systemctl enable ospfd
          SHELL
    

        when "ABR3"
          box.vm.provision "shell", run: "always", inline: <<-SHELL
          echo net.ipv4.conf.all.forwarding=1  >> /etc/sysctl.conf
          echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
          echo net.ipv4.conf.all.rp_filter=2 >> /etc/sysctl.conf
          sysctl -p
          nmcli connection add type vlan ifname vlan16 dev eth1 id 16 ip4 172.16.16.9/30
          nmcli connection add type vlan ifname vlan20 dev eth1 id 20 ip4 172.16.20.9/30 
          yum install quagga -y
          cp /vagrant/quagga_conf/3ospfd.conf /etc/quagga/ospfd.conf
          cp /vagrant/quagga_conf/3zebra.conf /etc/quagga/zebra.conf
          chown quagga:quagga /etc/quagga/ospfd.conf
          chown quagga:quagga /etc/quagga/ospfd.conf
          systemctl start zebra
          systemctl enable zebra
          systemctl start ospfd
          systemctl enable ospfd
          SHELL
        end 

      end

  end
  
  
end