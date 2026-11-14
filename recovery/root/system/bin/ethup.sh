#!/system/bin/sh
L=/tmp/ethup.log
p() { v=$(getprop ro.ethup.$1); [ -z "$v" ] && v=$(getprop ethup.$1); echo "$v"; }
GW=$(p gw);     [ -z "$GW" ] && GW=192.168.1.1
IP=$(p ip);     [ -z "$IP" ] && IP=${GW%.*}.250
MASK=$(p mask); [ -z "$MASK" ] && MASK=255.255.255.0
DNS=$(p dns);   [ -z "$DNS" ] && DNS=8.8.8.8
i=0
while [ $i -lt 30 ]; do
  IF=$(ls /sys/class/net | grep -E '^eth' | head -n1)
  [ -n "$IF" ] && break
  sleep 1; i=$((i+1))
done
echo "iface=$IF ip=$IP mask=$MASK gw=$GW dns=$DNS" > $L
[ -z "$IF" ] && exit 1
echo 0 99999999 > /proc/sys/net/ipv4/ping_group_range
ifconfig $IF $IP netmask $MASK up
ip route replace default via $GW dev $IF
setprop net.dns1 $DNS
ifconfig $IF >> $L
ip route >> $L
