#!/bin/sh

# Field names: duration,service,source_bytes,dest_bytes,count,same_srv_rate,s_error_rate,srv_s_error,dst_host_count,dst_host_serv_count,dst_host_same_src_port_rate,dst_host_s_error_rate,dst_host_srv_s_error_rate,flag,ids_detection,malware_detection,ashula_detection,label,source_ip_address,source_port,dest_ip_address,dest_port,start_time,duration_session

cd solr-5.0.0
echo "Indexing Sample data"

# Since the file doesn't have headers, let's pass it in based off of http://www.takakura.com/Kyoto_data/BenchmarkData-Description-v5.pdf
bin/post -c kyoto_sample --type "text/csv" -params "&header=false&separator=%09&rowid=id&fieldnames=duration_d,service_i,source_bytes_i,dest_bytes_i,count_f,same_srv_rate_d,s_error_rate_d,srv_s_error_d,dst_host_count_d,dst_host_serv_count_d,dst_host_same_src_port_rate_d,dst_host_s_error_rate_d,dst_host_srv_s_error_rate_d,flag_s,ids_detection_s,malware_detection_s,ashula_detection_s,label_s,source_ip_address_s,source_port_i,dest_ip_address_s,dest_port_i,start_time,duration_session_f" ../data/sample.csv