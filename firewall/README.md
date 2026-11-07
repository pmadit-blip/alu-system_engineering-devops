# Firewall

This directory contains firewall configuration tasks.

## 0. Block all incoming traffic but allow selected ports

The script `0-block_all_incoming_traffic_but` configures UFW to deny incoming traffic by default, allow outgoing traffic, and permit incoming SSH (22), HTTPS (443), and HTTP (80) connections.

## 1. Port forwarding

The file `100-port_forwarding` configures UFW's underlying iptables rules to redirect incoming TCP traffic on port 8080 to port 80.
