! Cisco IOS Software, C2900 Software (C2900-UNIVERSALK9-M), Version 15.2(4)M6, RELEASE SOFTWARE (fc2)
! 
! Image: Software: C2900-UNIVERSALK9-M, 15.2(4)M6, RELEASE SOFTWARE (fc2)
! Image: Compiled: Wed 19-Mar-14 19:23 by prod_rel_team
! ROM Bootstrap: Version 15.0(1r)M16, RELEASE SOFTWARE (fc1)
! Image: flash0:c2900-universalk9-mz.SPA.152-4.M6.bin
! Chassis type: CISCO2901/K9
! Memory: main 483328K/40960K
! Processor ID: FTX1824Y00Q
! CPU: 
! Memory: nvram 255K
! 
! VTP: VTP Version                     : 2
! VTP: Configuration Revision          : 0
! VTP: Maximum VLANs supported locally : 20
! VTP: Number of existing VLANs        : 5
! VTP: VTP Operating Mode              : Server
! VTP: VTP Domain Name                 : 
! VTP: VTP Pruning Mode                : Disabled
! VTP: VTP V2 Mode                     : Disabled
! VTP: VTP Traps Generation            : Disabled
! VTP: MD5 digest                      : 0xBF 0x86 0x94 0x45 0xFC 0xDF 0xB5 0x70 
! VTP: Local updater ID is 192.168.23.1 on interface Gi0/0 (first interface found)
! 
! NAME: "CISCO2901/K9", DESCR: "CISCO2901/K9 chassis, Hw Serial#: FTX1824Y00Q, Hw Revision: 1.0"
! PID: CISCO2901/K9      , VID: V06 , SN: FTX1824Y00Q
! 
! NAME: "One-Port Fast Ethernet High Speed WAN Interface Card on Slot 0 SubSlot 0", DESCR: "One-Port Fast Ethernet High Speed WAN Interface Card"
! PID: HWIC-1FE          , VID: V01 , SN: FOC11144A9M
! 
! NAME: "C1941/C2901 AC Power Supply", DESCR: "C1941/C2901 AC Power Supply"
! PID: PWR-1941-2901-AC  , VID:    , SN:            
! 
! 
!
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
service password-encryption
!
hostname r2
!
boot-start-marker
boot-end-marker
!
!
enable secret 5 $1$Gge7$kUSi2nO9JdMdLYgHgfHZW.
!
no aaa new-model
clock timezone EST -5 0
clock summer-time EST recurring
!
ip cef
!
!
!
!
!
!
no ip domain lookup
ip domain name thunderhouse.com
no ipv6 cef
!
multilink bundle-name authenticated
!
!
!
!
license udi pid CISCO2901/K9 sn FTX1824Y00Q
!
!
username admin privilege 15 secret 5 $1$.0Rt$K1onl9/llFQCDSKr0gnW61
username oxy secret 5 $1$9cf4$rj5uLXeM0sDYxIQKCUdIt1
!
redundancy
!
!
!
!
!
ip ssh version 2
! 
!
!
!
!
!
!
!
!
interface Loopback0
 ip address 10.2.0.5 255.255.255.255
!
interface Embedded-Service-Engine0/0
 no ip address
 shutdown
!
interface GigabitEthernet0/0
 description to-r3-gi0/1
 ip address 192.168.23.1 255.255.255.252
 duplex auto
 speed auto
!
interface GigabitEthernet0/1
 description to-core-gi0/0
 ip address 192.168.2.2 255.255.255.252
 duplex auto
 speed auto
!
interface FastEthernet0/0/0
 ip address 10.92.0.1 255.255.255.0
 duplex auto
 speed auto
!
!
router eigrp 1
 network 10.2.0.5 0.0.0.0
 network 10.92.0.1 0.0.0.0
 network 192.168.2.2 0.0.0.0
 network 192.168.23.1 0.0.0.0
!
ip forward-protocol nd
!
no ip http server
no ip http secure-server
!
ip route 0.0.0.0 0.0.0.0 10.2.0.3
!
logging host 10.20.0.28
!
!
snmp-server community public RO
snmp-server enable traps entity-sensor threshold
!
control-plane
!
!
!
line con 0
 privilege level 15
 logging synchronous
line aux 0
line 2
 no activation-character
 no exec
 transport preferred none
 transport output pad telnet rlogin lapb-ta mop udptn v120 ssh
 stopbits 1
line vty 0 4
 login local
 transport input ssh
line vty 5 15
 login local
 transport input ssh
!
scheduler allocate 20000 1000
ntp logging
ntp server 74.6.168.73
ntp server 69.89.207.99
ntp server 97.107.128.165
ntp server 68.183.107.237 minpoll 9
ntp server 162.248.241.94
!
end

