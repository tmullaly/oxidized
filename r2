! Cisco IOS Software, C880 Software (C880DATA-UNIVERSALK9-M), Version 15.4(3)M5, RELEASE SOFTWARE (fc1)
! 
! Image: Software: C880DATA-UNIVERSALK9-M, 15.4(3)M5, RELEASE SOFTWARE (fc1)
! Image: Compiled: Tue 09-Feb-16 06:35 by prod_rel_team
! ROM Bootstrap: Version 12.4(22r)YB5, RELEASE SOFTWARE (fc1)
! Image: flash:c880data-universalk9-mz.154-3.M5.bin
! Chassis type: 881
! Memory: main 236544K/25600K
! Processor ID: FTX1405YDC7
! CPU: MPC8300
! Memory: nvram 256K
! Memory: flash 126000K
! 
! VTP: VTP Version                     : 2
! VTP: Configuration Revision          : 7
! VTP: Maximum VLANs supported locally : 12
! VTP: Number of existing VLANs        : 10
! VTP: VTP Operating Mode              : Server
! VTP: VTP Domain Name                 : 
! VTP: VTP Pruning Mode                : Disabled
! VTP: VTP V2 Mode                     : Disabled
! VTP: VTP Traps Generation            : Disabled
! VTP: MD5 digest                      : 0x04 0xBE 0x32 0x67 0xBA 0x23 0x8A 0x95 
! VTP: Local updater ID is 192.168.15.1 on interface Fa4 (first interface found)
! 
! NAME: "881", DESCR: "881 chassis, Hw Serial#: FTX1405YDC7, Hw Revision: 1.0"
! PID: CISCO881-SEC-K9   , VID: V01 , SN: FTX1405YDC7
! 
! NAME: "ESW Power Daughter Card", DESCR: "4-Port ESW Power Daughter Card"
! PID: 800-IL-PM-2       , VID: V01, SN: FOC14126A57
! 
! 
!
!
version 15.4
no service pad
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname R2
!
boot-start-marker
boot-end-marker
!
!
enable secret 5 $1$6YF1$XJUtqq79zKW3uJ3tJsgPp.
!
no aaa new-model
memory-size iomem 10
clock timezone EST -5 0
clock summer-time EST recurring
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!


!
!
!
!
no ip domain lookup
ip domain name thunderhouse.com
ip cef
login on-failure log
login on-success log
no ipv6 cef
!
!
multilink bundle-name authenticated
cts logging verbose
license udi pid CISCO881-SEC-K9 sn FTX1405YDC7
!
!
username oxy secret 5 $1$9cf4$rj5uLXeM0sDYxIQKCUdIt1
username admin privilege 15 secret 5 $1$.0Rt$K1onl9/llFQCDSKr0gnW61
!
!
!
!
!
! 
!
!
!
!
!
!
!
!
!
interface FastEthernet0
 no ip address
!
interface FastEthernet1
 no ip address
!
interface FastEthernet2
 no ip address
!
interface FastEthernet3
 no ip address
!
interface FastEthernet4
 ip address 192.168.15.1 255.255.255.240
 duplex auto
 speed auto
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 1
 network 0.0.0.0 255.255.255.255 area 0
!
ip forward-protocol nd
no ip http server
no ip http secure-server
!
!
ip route 0.0.0.0 0.0.0.0 192.168.15.2
!
logging host 10.20.0.28
!
snmp-server community public RO
!
control-plane
!
!
!
line con 0
 no modem enable
line aux 0
line vty 0 4
 login local
 transport input ssh
!
ntp server 74.6.168.73
ntp server 69.89.207.99
ntp server 97.107.128.165
ntp server 68.183.107.237 minpoll 8
ntp server 162.248.241.94
!
end

