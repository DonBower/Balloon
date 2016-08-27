# Using the Ultimate GPS Module
To use the GPS from Adafruit, we need to make a few mods.<br>
First, Do the normal updates:<br>
<b>sudo apt-get update  </b> <br>
<b>sudo apt-get upgrade  </b> <br>
<b>sudo apt-get dist-upgrade  </b> <br>
<b>sudo rpi-update </b> <br>
<br>
Grab the gps utilities:<br>
<b>sudo apt-get install gpsd gpsd-clients python-gps</b><br>
<br>
Disable the gpsd service installed by apt-get<br>
<b>sudo systemctl stop gpsd.socket</b><br>
<b>sudo systemctl disable gpsd.socket</b><br>
<br>
manualy start gpsd<br>
<b>sudo gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock</b><br>
<br>
To reset the gpsd daemon, use this sequence:<br>
<b>sudo killall gpsd</b><br>
<b>sudo gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock</b><br>
<br>
Although we will be copying the raw data to the usbstick (via <b>cat /dev/serial0 > /mnt/usbstick/gpslog.txt</b>), here are two monitors<br>
<b>gpsmon</b><br>
<b>cgps -s</b><br>
<br>
Now that the Ultimate GPS Breakout is working perfectly with the on-board UART the next step is to dismantle the Pi and it's other sensors, and connect the GPS Hat. Another night though...<br>
<br>