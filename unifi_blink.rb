require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

# hostname to look for
target_hostnames = ['iPhone-5s']
# consider recently connected if uptime within
recent_time = 60 * 2 # 2 minutes

base_url = "https://tretti-dc02.tretti.local:8443"
username = ""
password = ""


#data = '{ "data" : [ { "_id" : "52d3b47424f8eab480f43676" , "_rx_bytes" : 803897 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 9528 , "_tx_bytes" : 5188924 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 5873 , "_tx_retries" : 0 , "_uptime" : 2093 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1391152145 , "auth_time" : -24543390 , "authorized" : true , "bssid" : "0a:27:22:b9:c3:a6" , "bytes" : 32794762 , "bytes.d" : 14 , "bytes.r" : 0 , "ccq" : 1000 , "channel" : 6 , "dhcpend_time" : 0 , "dhcpstart_time" : 0 , "essid" : "CDON Group" , "first_seen" : 1389606004 , "hostname" : "android-5fae2e664b420d60" , "idletime" : 1 , "ip" : "10.180.20.91" , "is_11b" : false , "is_11n" : true , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "10:68:3f:88:28:f0" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : true , "qos_policy_applied" : true , "radio" : "ng" , "roam_count" : 3 , "rssi" : 32 , "running_11n" : true , "rx_bytes" : 4309413 , "rx_bytes.d" : 14 , "rx_bytes.r" : 0 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 50161 , "rx_packets.d" : 1 , "rx_packets.r" : 0 , "rx_rate" : 58500 , "signal" : -61 , "state" : 47 , "state_ht" : true , "state_pwrmgt" : false , "t" : "sta" , "tx_bytes" : 28485349 , "tx_bytes.d" : 0 , "tx_bytes.r" : 0 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 31763 , "tx_packets.d" : 0 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 65000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 54943 , "user_id" : "52d3b47424f8eab480f43676"} , { "_id" : "52cbec9e24f8eab44ecf3676" , "_rx_bytes" : 3005835 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 16510 , "_tx_bytes" : 6068098 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 32017 , "_tx_retries" : 0 , "_uptime" : 54604 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1391152472 , "auth_time" : -61462571 , "authorized" : true , "bssid" : "0e:27:22:b9:c3:a6" , "bytes" : 9073933 , "bytes.d" : 770 , "bytes.r" : 51 , "ccq" : 540 , "channel" : 6 , "dhcpend_time" : 593 , "dhcpstart_time" : 591 , "essid" : "CDON Group_BasPC" , "first_seen" : 1389096093 , "hostname" : "NOTE00838" , "idletime" : 0 , "ip" : "10.180.92.64" , "is_11b" : false , "is_11n" : true , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "34:23:87:58:2e:08" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : false , "qos_policy_applied" : true , "radio" : "ng" , "rssi" : 31 , "running_11n" : true , "rx_bytes" : 3005835 , "rx_bytes.d" : 434 , "rx_bytes.r" : 28 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 16510 , "rx_packets.d" : 2 , "rx_packets.r" : 0 , "rx_rate" : 52000 , "signal" : -62 , "state" : 47 , "state_ht" : true , "state_pwrmgt" : false , "t" : "sta" , "tx_bytes" : 6068098 , "tx_bytes.d" : 336 , "tx_bytes.r" : 22 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 32017 , "tx_packets.d" : 1 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 39000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 54616 , "user_id" : "52cbec9e24f8eab44ecf3676"} , { "_id" : "52eb5b1c24f8eab432733776" , "_rx_bytes" : 7527838 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 111502 , "_tx_bytes" : 26068471 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 50344 , "_tx_retries" : 0 , "_uptime" : 44516 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1391162565 , "auth_time" : -71551086 , "authorized" : true , "bssid" : "0e:27:22:b9:c3:a6" , "bytes" : 33596309 , "bytes.d" : 535 , "bytes.r" : 35 , "ccq" : 1000 , "channel" : 6 , "dhcpend_time" : 122 , "dhcpstart_time" : 119 , "essid" : "CDON Group_BasPC" , "first_seen" : 1391155995 , "hostname" : "NOTE00870" , "idletime" : 2 , "ip" : "10.180.92.128" , "is_11b" : false , "is_11n" : true , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "3c:a9:f4:75:c3:34" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : true , "qos_policy_applied" : true , "radio" : "ng" , "rssi" : 48 , "running_11n" : true , "rx_bytes" : 7527838 , "rx_bytes.d" : 415 , "rx_bytes.r" : 27 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 111502 , "rx_packets.d" : 10 , "rx_packets.r" : 0 , "rx_rate" : 117000 , "signal" : -45 , "state" : 47 , "state_ht" : true , "state_pwrmgt" : false , "t" : "sta" , "tx_bytes" : 26068471 , "tx_bytes.d" : 120 , "tx_bytes.r" : 8 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 50344 , "tx_packets.d" : 2 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 130000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 44523 , "user_id" : "52eb5b1c24f8eab432733776"} , { "_id" : "4fa23d3966a8eab475520838" , "_rx_bytes" : 4144707 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 62560 , "_tx_bytes" : 4600261 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 16262 , "_tx_retries" : 0 , "_uptime" : 410 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1386327072 , "auth_time" : -1298013236 , "authorized" : true , "bssid" : "0a:27:22:b9:c3:a6" , "bytes" : 41618798722 , "bytes.d" : 0 , "bytes.r" : 0 , "ccq" : 1000 , "channel" : 6 , "dhcpend_time" : 0 , "dhcpstart_time" : 0 , "essid" : "CDON Group" , "first_seen" : 1336032569 , "hostname" : "LAP-032" , "idletime" : 24 , "ip" : "10.180.20.65" , "is_11b" : false , "is_11n" : true , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "90:00:4e:ae:1d:25" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : false , "qos_policy_applied" : true , "radio" : "ng" , "roam_count" : 92 , "rssi" : 41 , "running_11n" : true , "rx_bytes" : 12794767208 , "rx_bytes.d" : 0 , "rx_bytes.r" : 0 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 149153051 , "rx_packets.d" : 0 , "rx_packets.r" : 0 , "rx_rate" : 65000 , "signal" : -52 , "state" : 47 , "state_ht" : true , "state_pwrmgt" : false , "t" : "sta" , "tx_bytes" : 28824031514 , "tx_bytes.d" : 0 , "tx_bytes.r" : 0 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 59675146 , "tx_packets.d" : 0 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 65000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 4880016 , "user_id" : "4fa23d3966a8eab475520838"} , { "_id" : "51372fc07290eab459485e44" , "_rx_bytes" : 1437600 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 9491 , "_tx_bytes" : 6747985 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 21836 , "_tx_retries" : 0 , "_uptime" : 40997 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1391090767 , "auth_time" : 235059 , "authorized" : true , "bssid" : "0e:27:22:b9:c3:a6" , "bytes" : 171390652 , "bytes.d" : 803 , "bytes.r" : 53 , "ccq" : 1000 , "channel" : 6 , "dhcpend_time" : 23 , "dhcpstart_time" : 21 , "essid" : "CDON Group_BasPC" , "first_seen" : 1362571200 , "hostname" : "NOTE00523" , "idletime" : 3 , "ip" : "10.180.92.74" , "is_11b" : false , "is_11n" : false , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "9c:2a:70:43:5c:3e" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : false , "qos_policy_applied" : true , "radio" : "ng" , "roam_count" : 2 , "rssi" : 42 , "running_11n" : false , "rx_bytes" : 25465843 , "rx_bytes.d" : 755 , "rx_bytes.r" : 50 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 132026 , "rx_packets.d" : 5 , "rx_packets.r" : 0 , "rx_rate" : 54000 , "signal" : -51 , "state" : 16423 , "state_ht" : false , "state_pwrmgt" : false , "t" : "sta" , "tx_bytes" : 145924809 , "tx_bytes.d" : 48 , "tx_bytes.r" : 3 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 189487 , "tx_packets.d" : 1 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 54000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 116321 , "user_id" : "51372fc07290eab459485e44"} , { "_id" : "514c28677290eab4cf9b5e44" , "_rx_bytes" : 1489090 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 15039 , "_tx_bytes" : 8160161 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 9477 , "_tx_retries" : 0 , "_uptime" : 116298 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1386327140 , "auth_time" : 234847 , "authorized" : true , "bssid" : "0a:27:22:b9:c3:a6" , "bytes" : 615279230 , "bytes.d" : 0 , "bytes.r" : 0 , "ccq" : 1000 , "channel" : 6 , "dhcpend_time" : 60 , "dhcpstart_time" : 59 , "essid" : "CDON Group" , "first_seen" : 1363945575 , "hostname" : "iPad" , "idletime" : 43 , "ip" : "10.180.20.73" , "is_11b" : false , "is_11n" : true , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "ac:3c:0b:b6:4b:b2" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : true , "qos_policy_applied" : true , "radio" : "ng" , "roam_count" : 24 , "rssi" : 36 , "running_11n" : true , "rx_bytes" : 187382209 , "rx_bytes.d" : 0 , "rx_bytes.r" : 0 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 677522 , "rx_packets.d" : 0 , "rx_packets.r" : 0 , "rx_rate" : 65000 , "signal" : -57 , "state" : 63 , "state_ht" : true , "state_pwrmgt" : true , "t" : "sta" , "tx_bytes" : 427897021 , "tx_bytes.d" : 0 , "tx_bytes.r" : 0 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 464304 , "tx_packets.d" : 0 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 65000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 4879948 , "user_id" : "514c28677290eab4cf9b5e44"} , { "_id" : "52d8e43224f8eab48b1b3776" , "_rx_bytes" : 1090818 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 13870 , "_tx_bytes" : 2729634 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 5860 , "_tx_retries" : 0 , "_uptime" : 116300 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1390826937 , "auth_time" : -528956112 , "authorized" : true , "bssid" : "0e:27:22:b9:c3:a6" , "bytes" : 8568045 , "bytes.d" : 1638 , "bytes.r" : 109 , "ccq" : 1000 , "channel" : 6 , "dhcpend_time" : 39 , "dhcpstart_time" : 32 , "essid" : "CDON Group_BasPC" , "first_seen" : 1389945906 , "hostname" : "Andreas-4s" , "idletime" : 7 , "ip" : "10.180.92.130" , "is_11b" : false , "is_11n" : true , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "c8:33:4b:58:a0:74" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : true , "qos_policy_applied" : true , "radio" : "ng" , "roam_count" : 4 , "rssi" : 48 , "running_11n" : true , "rx_bytes" : 2763340 , "rx_bytes.d" : 1332 , "rx_bytes.r" : 88 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 37933 , "rx_packets.d" : 14 , "rx_packets.r" : 0 , "rx_rate" : 65000 , "signal" : -45 , "state" : 63 , "state_ht" : true , "state_pwrmgt" : true , "t" : "sta" , "tx_bytes" : 5804705 , "tx_bytes.d" : 306 , "tx_bytes.r" : 20 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 14936 , "tx_packets.d" : 4 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 65000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 380151 , "user_id" : "52d8e43224f8eab48b1b3776"} , { "_id" : "5139b5fb7290eab4a0535e44" , "_rx_bytes" : 23333090 , "_rx_crypts" : 0 , "_rx_dropped" : 0 , "_rx_errors" : 0 , "_rx_frags" : 0 , "_rx_packets" : 86830 , "_tx_bytes" : 30538133 , "_tx_dropped" : 0 , "_tx_errors" : 0 , "_tx_packets" : 109207 , "_tx_retries" : 0 , "_uptime" : 116175 , "ap_mac" : "00:27:22:b8:c3:a6" , "assoc_time" : 1390909962 , "auth_time" : -78316770 , "authorized" : true , "bssid" : "0e:27:22:b9:c3:a6" , "bytes" : 356087856 , "bytes.d" : 207 , "bytes.r" : 13 , "ccq" : 1000 , "channel" : 6 , "dhcpend_time" : 172 , "dhcpstart_time" : 106 , "essid" : "CDON Group_BasPC" , "first_seen" : 1362736635 , "hostname" : "NOTE00533" , "idletime" : 7 , "ip" : "10.180.92.136" , "is_11b" : false , "is_11n" : true , "is_guest" : false , "last_seen" : 1391207088 , "mac" : "f4:b7:e2:2a:e1:ca" , "map_id" : "4fa3f6f866a8eab4d8520838" , "noise" : -93 , "powersave_enabled" : false , "qos_policy_applied" : true , "radio" : "ng" , "roam_count" : 2 , "rssi" : 56 , "running_11n" : true , "rx_bytes" : 86848800 , "rx_bytes.d" : 108 , "rx_bytes.r" : 7 , "rx_crypts" : 0 , "rx_crypts.d" : 0 , "rx_crypts.r" : 0 , "rx_dropped" : 0 , "rx_dropped.d" : 0 , "rx_dropped.r" : 0 , "rx_errors" : 0 , "rx_errors.d" : 0 , "rx_errors.r" : 0 , "rx_frags" : 0 , "rx_frags.d" : 0 , "rx_frags.r" : 0 , "rx_packets" : 314899 , "rx_packets.d" : 2 , "rx_packets.r" : 0 , "rx_rate" : 65000 , "signal" : -37 , "state" : 47 , "state_ht" : true , "state_pwrmgt" : false , "t" : "sta" , "tx_bytes" : 269239056 , "tx_bytes.d" : 99 , "tx_bytes.r" : 6 , "tx_dropped" : 0 , "tx_dropped.d" : 0 , "tx_dropped.r" : 0 , "tx_errors" : 0 , "tx_errors.d" : 0 , "tx_errors.r" : 0 , "tx_packets" : 434543 , "tx_packets.d" : 2 , "tx_packets.r" : 0 , "tx_power" : 40 , "tx_rate" : 65000 , "tx_retries" : 0 , "tx_retries.d" : 0 , "tx_retries.r" : 0 , "uptime" : 297126 , "user_id" : "5139b5fb7290eab4a0535e44"}] , "meta" : { "rc" : "ok"}}'

# login to get session id
login_request = HTTPI::Request.new
# we are unsecure
login_request.auth.ssl.verify_mode = :none
login_request.open_timeout = 5
login_request.url = "#{base_url}/login"
login_request.query = { login: 'login', username: username, password: password }
login_response = HTTPI.get(login_request)
# format: "unifisession=83414528DB91EA04F014CCCB1780C05C; Path=/; Secure"
session_id = login_response.headers['set-cookie'].split('; ')[0]

# now we have session id, get data

data_request = HTTPI::Request.new
# again, we are unsecure
data_request.auth.ssl.verify_mode = :none
data_request.open_timeout = 5
data_request.url = "#{base_url}/api/stat/sta"
data_request.headers = { 'Cookie' => session_id }
data_response = HTTPI.get(data_request)

# we have data, parse it
parsed_data = JSON.parse(data_response.body)

# collect connected hosts and uptime
connected_hosts = parsed_data['data'].collect { |c| [c['hostname'], c['_uptime']]  }

# find recently connected target hostnames
connected_hosts.each do |hostname, uptime|
  if target_hostnames.include?(hostname)
    # temp: remove uptime check
    # and uptime <= recent_time
    # BLINK!
    blink_stick = BlinkStick.first
    blink_stick.blink(color: :red, blink: 10)
    blink_stick.color = :red
  end
end

