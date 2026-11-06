# Cisco Routing and Switching Lab

## Project Overview

Configured a Cisco Packet Tracer network using VLANs, 802.1Q trunking, and router-on-a-stick inter-VLAN routing.

The objective was to separate IT and Sales into different VLANs while allowing communication between them through a Cisco router.

## Equipment

- Two Cisco 2911 Routers
- One Cisco 2960 Switch
- Three PCs
- Cisco Packet Tracer

## IP Addressing

| Device | VLAN | IP Address | Default Gateway |
|---|---|---|---|
| PC1 | 10 - IT | 192.168.10.10/24 | 192.168.10.1 |
| PC2 | 10 - IT | 192.168.10.20/24 | 192.168.10.1 |
| PC3 | 20 - Sales | 192.168.20.10/24 | 192.168.20.1 |

## Switch Configuration

Created VLAN 10 (IT) and VLAN 20 (Sales).

Assigned switch ports:

- Fa0/1 and Fa0/2 to VLAN 10
- Fa0/3 to VLAN 20
- Gi0/1 as an 802.1Q trunk

Verified VLAN membership using `show vlan brief` and trunk operation using `show interfaces trunk`.

## Router Configuration

Configured router-on-a-stick using the following subinterfaces:

- Gi0/0.10 — 192.168.10.1/24, VLAN 10
- Gi0/0.20 — 192.168.20.1/24, VLAN 20

Verified the connected networks using `show ip route`.

## Connectivity Testing

Tested connectivity from PC1 (192.168.10.10) in VLAN 10 to PC3 (192.168.20.10) in VLAN 20.

The initial ping returned three replies out of four. A second test succeeded with **four replies and 0% packet loss**.

This confirmed successful inter-VLAN communication.

## Screenshots

### VLAN Configuration

![VLAN Configuration](vlans.PNG)

### 802.1Q Trunk Verification

![Trunk Verification](trunk.PNG)

### Inter-VLAN Ping Test

![Successful Inter-VLAN Ping Test](ping.PNG)

### Network Topology

![Cisco Network Topology](cisco%20lab.PNG)



## Skills Demonstrated

- Cisco IOS command-line configuration
- VLAN creation and port assignments
- 802.1Q trunking
- Router-on-a-stick configuration
- IPv4 addressing and default gateways
- Inter-VLAN routing
- Ping testing and network troubleshooting

## Packet Tracer Project

[Download the Cisco Packet Tracer lab](Cisco-Routing-Switching-Lab.pkt)

## Phase 2: Multi-Router Network Expansion

### Router-to-Router IP Addressing

| Router | Interface | IP Address |
|---|---|---|
| R1 | GigabitEthernet0/1 | 10.0.0.1/30 |
| R2 | GigabitEthernet0/0 | 10.0.0.2/30 |

### Completed

- Added a second Cisco 2911 router (R2).
- Connected R1 GigabitEthernet0/1 to R2 GigabitEthernet0/0.
- Configured the 10.0.0.0/30 point-to-point network.
- Verified both router interfaces were operational.
- Successfully tested router-to-router connectivity.

### Next Steps

- Add a second Cisco 2960 switch and PC4 behind R2.
- Configure the 192.168.30.0/24 LAN.
- Configure static routes between R1 and R2.
- Test connectivity between PC1 and PC4.
- Configure OSPF and compare it with static routing.
