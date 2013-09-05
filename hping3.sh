#!/usr/bin/env sh

output_file="./project.hping3"
input_file="./project_ips"

cat ${input_file} | while read ip; do
  hping3 -c 1 --icmptype 8 $ip >> ${output_file}.icmp_echo
done

cat ${input_file} | while read ip; do
  hping3 -c 1 --icmp-ts $ip >> ${output_file}.icmp-ts
done

cat ${input_file} | while read ip; do
  hping3 -c 1 --icmptype 15 $ip >> ${output_file}.icmp-15
done

cat ${input_file} | while read ip; do
  hping3 -c 1 --icmp-addr $ip >> ${output_file}.icmp-addr
done

cat ${input_file} | while read ip; do
  hping3 -c 1 -S -p 80 $ip >> ${output_file}.syn80
done

cat ${input_file} | while read ip; do
  hping3 -c 1 -S -p 80 -f $ip >> ${output_file}.syn80-f
done

cat ${input_file} | while read ip; do
  hping3 -c 2 --udp -p 161 $ip >> ${output_file}.udp161
done

cat ${input_file} | while read ip; do
  hping3 -c 2 --udp -p 161 -S -s 161 $ip >> ${output_file}.udp161-s
done
