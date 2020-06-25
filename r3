! Cisco IOS Software, 2800 Software (C2800NM-ADVENTERPRISEK9_IVS-M), Version 15.1(4)M, RELEASE SOFTWARE (fc1)
! 
! Image: Software: C2800NM-ADVENTERPRISEK9_IVS-M, 15.1(4)M, RELEASE SOFTWARE (fc1)
! Image: Compiled: Thu 24-Mar-11 14:26 by prod_rel_team
! ROM Bootstrap: Version 12.4(13r)T, RELEASE SOFTWARE (fc1)
! Image: flash:c2800nm-adventerprisek9_ivs-mz.151-4.M.bin
! Chassis type: 2811
! Memory: main 249856K/12288K
! Processor ID: FTX1107A4L4
! CPU: 
! Memory: nvram 239K
! Memory: flash 500472K
! 
! VTP: VTP Version                     : 2
! VTP: Configuration Revision          : 0
! VTP: Maximum VLANs supported locally : 36
! VTP: Number of existing VLANs        : 5
! VTP: VTP Operating Mode              : Server
! VTP: VTP Domain Name                 : 
! VTP: VTP Pruning Mode                : Disabled
! VTP: VTP V2 Mode                     : Disabled
! VTP: VTP Traps Generation            : Disabled
! VTP: MD5 digest                      : 0xBF 0x86 0x94 0x45 0xFC 0xDF 0xB5 0x70 
! VTP: Local updater ID is 10.0.0.13 on interface Fa0/0 (first interface found)
! 
! NAME: "2811 chassis", DESCR: "2811 chassis"
! PID: CISCO2811         , VID: V04 , SN: FTX1107A4L4
! 
! NAME: "WAN Interface Card - Serial (1T) on Slot 0 SubSlot 0", DESCR: "WAN Interface Card - Serial (1T)"
! PID: WIC-1T=           , VID: 1.0, SN: 36693865   
! 
! NAME: "WAN Interface Card - Serial (1T) on Slot 0 SubSlot 2", DESCR: "WAN Interface Card - Serial (1T)"
! PID: WIC-1T=           , VID: 1.0, SN: 16816953   
! 
! NAME: "WAN Interface Card - HWIC CSU/DSU on Slot 0 SubSlot 3", DESCR: "WAN Interface Card - HWIC CSU/DSU"
! PID: HWIC-1DSU-T1      , VID: V02 , SN: FOC171503UT
! 
! 
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname R3
!
boot-start-marker
boot-end-marker
!
!
enable secret 5 $1$I1b.$aFTDImqhXoH3fE7F8AwEx/
!
no aaa new-model
!
!
dot11 syslog
ip source-route
!
!
ip cef
!
!
!
no ipv6 cef
!
multilink bundle-name authenticated
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
voice-card 0
!
crypto pki token default removal timeout 0
!
!
!
!
license udi pid CISCO2811 sn FTX1107A4L4
username admin secret 5 $1$sXUt$oJc6dDA328BSXF4KkMyxu.
username oxy secret 5 $1$q8pE$jv3eFxU7hBgKj6AftcxPK1
!
redundancy
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
interface FastEthernet0/0
 ip address 10.0.0.13 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 shutdown
 duplex auto
 speed auto
!
interface Serial0/0/0
 no ip address
 shutdown
 no fair-queue
!
interface Serial0/2/0
 no ip address
 shutdown
!
interface Serial0/3/0
 no ip address
 shutdown
!
ip forward-protocol nd
no ip http server
no ip http secure-server
!
!
!
logging esm config
!
!
!
!
snmp-server community public RO
!
!
control-plane
!
!
!
!
mgcp profile default
!
!
!
!
!
gatekeeper
 shutdown
!
!
!
line con 0
 exec-timeout 0 0
line aux 0
line vty 0 4
 login local
 transport input all
!
scheduler allocate 20000 1000
end

