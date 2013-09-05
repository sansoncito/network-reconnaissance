#!/usr/bin/env sh
 
date_now=`date +'%Y%m%d'`
projectName='project'
 
sudo nmap -sS -sC -Pn -T4 -A -R -O -p 1-65535 --randomize_hosts -oA Scans/nmap/${date_now}_nmap_${projectName} -iL ${projectName}_ips &
sudo nmap -sU -sC -Pn -T4 -A -R -O --top-ports 5000 --randomize_hosts -oA Scans/nmap/${date_now}_nmap_UDP_${projectName} -iL ${projectName}_ips &
sudo nmap -sN -sC -Pn -T4 -A -R -O --top-ports 5000 --randomize_hosts -oA Scans/nmap/${date_now}_nmap_NULL_${projectName} -iL ${projectName}_ips &
sudo nmap -sF -sC -Pn -T4 -A -R -O --top-ports 5000 --randomize_hosts -oA Scans/nmap/${date_now}_nmap_FIN_${projectName} -iL ${projectName}_ips &
sudo nmap -sX -sC -Pn -T4 -A -R -O --top-ports 5000 --randomize_hosts -oA Scans/nmap/${date_now}_nmap_Xmas_${projectName} -iL ${projectName}_ips &
