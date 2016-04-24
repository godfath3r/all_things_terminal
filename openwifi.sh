ip=`ifconfig | grep wlan0 -A1 | grep inet | awk '{print $2}'`

# Start wifi only if you're not connected.
if [ "${ip:0:10}" == "192.168.1." ]
then
   echo 'Allready Connected'
else
   echo 'Lets connect'
   ifconfig wlan0 up
   wpa_supplicant -BDwext -iwlan0 -c /root/wpa.conf
   dhcpcd
   chmod 0777 /dev/tty0
   systemctl restart openntpd.service
fi
