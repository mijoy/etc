#!/bin/bash
# snmpwalk -OqvU -v 1 -c public -m +PowerNet-MIB 10.1.4.212 rPDUOutletStatusOutletState.1 
# snmpget -OqvU -v 3 -u mijoy -l authPriv -a MD5 -A qwertyuiop12345 -x DES -X qwertyuiop12345 -m +PowerNet-MIB 10.1.5.142 rPDUOutletStatusOutletState.1
#command='snmpset -OqvU -v 2c -c public -m +PowerNet-MIB 10.1.5.142 sPDUOutletCtl.3 i 1'
#command='snmpset -OqvU -v 1 -c public  -m +PowerNet-MIB 10.1.5.142 sPDUOutletCtl.3 i 1'
#max="$1"
# powernet_snmp_v1.txt
#command='snmpset -OqvU -v 2c -c public -m +PowerNet-MIB 10.1.5.142 sPDUOutletCtl.3 i 1'
#command='snmpset -OqvU -v 1 -c public  -m +PowerNet-MIB 10.1.5.142 sPDUOutletCtl.3 i 1'

current_dir=${PWD} 
temp_name="`date +%Y.%m.%d.%H.%M_%S`"


 command='snmpget -OqvU -v 1 -c public -m +PowerNet-MIB 10.1.5.142 rPDUOutletStatusOutletState.1'
# command='snmpget -OqvU -v 2c -c public -m +PowerNet-MIB 10.1.5.142 rPDUOutletStatusOutletState.1'
# command='snmpget -OqvU -v 3 -u mijoy -l authPriv -a MD5 -A qwertyuiop12345 -x DES -X qwertyuiop12345 -m +PowerNet-MIB 10.1.5.142 rPDUOutletStatusOutletState.5'

# command='snmpset -OqvU -v 3 -u mijoy -l authPriv -a MD5 -A qwertyuiop12345 -x DES -X qwertyuiop12345 -m +PowerNet-MIB 10.1.5.142 sPDUOutletCtl.5 i 1'


current_dir=${PWD} 

echo $current_dir
time_output=${current_dir}/log_result/snmp_speedtest_${temp_name}.log 

for i in {1..10}
do
    /usr/bin/time -a -o $time_output -f  "\t%e \t%U \t%S" $command 
         #  sleep 1
done


echo "-----------------------------------------------"

/usr/bin/awk -f ${current_dir}/average.awk $time_output

echo ""
echo "-----------------------------------------------" 



#nice gzip -9 ${time_output}
