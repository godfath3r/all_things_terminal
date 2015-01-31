k=`ifconfig | grep wlan0 -A1 | grep inet | awk '{print $2}'`
echo ${k:0:10}
if [ "$k" == "192.168.1." ]
then
   echo 'Allready Connection'
else
   echo 'Lets connect'
fi
