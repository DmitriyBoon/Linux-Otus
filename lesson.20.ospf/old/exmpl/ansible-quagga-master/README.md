quagga
=======

Role to deploy and manage [Quagga](http://www.nongnu.org/quagga/).

Requirements
------------

No external dependencies.

Role Variables
--------------

- **quagga_conf**: This is a dictionary of quagga configuration
  snippets.  The value for each key will create a configuraiton file,
  where the key is the name of the configuration file.  The key name
  *must* correspond with the name of the *quagga* daemon you intend to
  run.  For example, valid key names include *ospfd*, *ospf6d*, *bgpd*,
  and so on.  The value is a yaml scalar.
- **quagga_ipv4_vty_address**: The IPv4 address to listen on.  Limited
  to routing protocols that are only IPv4 aware.  Defaults to `127.0.0.1`.
- **quagga_ipv6_vty_address**: The IPv6 address to listen on.  Limited
  to routing protocols that use IPv6.  Defaults to `::1.`


Dependencies
------------

No dependency on other roles.

Example Playbook
----------------

Example:

    - hosts: bgp_servers
      vars:
        quagga_conf:
          bgpd: |
            router bgp 64512
              bgp router-id 10.236.87.1
              network 10.236.87.0/24
              network 10.236.87.0/24
              neighbor upstream peer-group
              neighbor upstream remote-as 64515
              neighbor upstream capability dynamic
              neighbor upstream prefix-list pl-allowed-adv out
              neighbor 10.1.1.1 peer-group upstream
              neighbor 10.1.1.1 description ACME ISP
            !
            ip prefix-list pl-allowed-adv seq 5 permit 82.195.133.0/25
            ip prefix-list pl-allowed-adv seq 10 deny any
      roles:
         - { role: sfromm.quagga }

The example configuration snippet comes from Quagga's
[documentation](http://www.nongnu.org/quagga/docs/docs-info.html#BGP-Configuration-Examples).

License
-------

GPLv2

Author Information
------------------

See https://github.com/sfromm
