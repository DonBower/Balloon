# Using the Ultimate GPS Module
To use the GPS from Adafruit, we need to make a few mods.<br>
First, Do the normal updates:
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo rpi-update
```
<br>
Grab the gps utilities:
```
sudo apt-get install gpsd gpsd-clients python-gps
```

Disable the gpsd service installed by apt-get
```
sudo systemctl stop gpsd.socket
sudo systemctl disable gpsd.socket
```
manualy start gpsd
```
sudo gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock
```

To reset the gpsd daemon, use this sequence:
```
sudo killall gpsd
sudo gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock
```

Although we will be copying the raw data to the usbstick (via <b>cat /dev/serial0 > /mnt/usbstick/gpslog.txt</b>), here are two monitors
```
gpsmon
cgps -s
```

Now that the Ultimate GPS Breakout is working perfectly with the on-board UART the next step is to dismantle the Pi and it's other sensors, and connect the GPS Hat. Another night though...<br>
<br>
