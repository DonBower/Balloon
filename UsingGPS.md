To use the GPS from Adafruit, we need to make a few mods.<br />
First, Do the normal updates:<br />
<b>sudo apt-get update  </b> <br />
<b>sudo apt-get upgrade  </b> <br />
<b>sudo apt-get dist-upgrade  </b> <br />
<b>sudo rpi-update </b> <br />
<br />
Grab the gps utilities:<br />
<b>sudo apt-get install gpsd gpsd-clients python-gps</b><br />
<br />
Disable the gpsd service installed by apt-get<br />
<b>sudo systemctl stop gpsd.socket</b><br>
<b>sudo systemctl disable gpsd.socket</b><br />
<br />
<br />
<br />
<br />
<br />
<br />
