from scapy.all import *
src_ip="192.168.119.202" 
dst_ip = "192.168.119.200"
ip = IP(src=src_ip, dst=dst_ip) 
icmp= ICMP(type="echo-request") 
packet = ip/icmp
for i in range(100000000000000):
    send(packet)