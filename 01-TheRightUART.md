# The Right UART
So Here is my quest to use the Adafruit Ultimate GPS which comes in 2 flavors,   <br />
one is a breakout, https://www.adafruit.com/products/746),  <br />
and the other is a hat (https://www.adafruit.com/products/2324) <br />
The issue with it working straight up are <br>
1. The UART connected to the GPIO is disabled 
2. The default GPIO UART is a mini-UART (i.e. software assisted)  <br />
There is a fantastic write-up on how to get things back on track, which I am ultimatly going to follow:  <br />
http://spellfoundry.com/2016/05/29/configuring-gpio-serial-port-raspbian-jessie-including-pi-3  <br />
<br />

First, I am using a Raspberry Pi 3+, Which I bought from Amazon, but you can get it here: <br />
https://www.adafruit.com/products/3055 <br />
<br />
With the Jessie Version of Raspian on my Pi3, the default serial port configuration is:<br />
/dev/serial0 -> ttyS0 (a.k.a. mini-UART) and is configured for GPIO, and is disabled and uses the service getty to provide console access<br />
/dev/serial1 -> ttyAMA0 and is configured for bluetooth, and is enabled<br />
<br />
Here is the current status of the serial ports: <br />
<br />
pi@raspberrypi:~/balloon $ <b>ls -l /dev/ser* </b><br />
lrwxrwxrwx 1 root root 7 Aug 25 03:46 /dev/serial1 -> ttyAMA0 <br />
<br />
We enable the mini-uart, by adding the line <b> enable_uart=1</b> to the bottom of <b>/boot/config.txt</b> and reboot.<br />
<br />
Now we can see both UARTs enabled, but backwards for our purposes:<br />
pi@raspberrypi:~/balloon $ <b>ls -l /dev/ser* </b><br />
lrwxrwxrwx 1 root root 5 Aug 26 02:48 /dev/serial0 -> ttyS0<br />
lrwxrwxrwx 1 root root 7 Aug 26 02:48 /dev/serial1 -> ttyAMA0<br />
<br />
Now it's time to stop the console service, which is unneccessary for the balloon project:<br />
<b>sudo systemctl stop serial-getty@ttyS0.service</b><br />
<b>sudo systemctl disable serial-getty@ttyS0.service</b><br />
<br />
Now, let's not reference the console service in future boots.<br />
Remove the <b>console=serial0,115200 </b> entry from the <b>/boot/cmdline.txt</b> file, and reboot.<br />
<br />
Finally we can disable that pesky bluetooth service. <br />
Add the line <b>dtoverlay=pi3-disable-bt</b> to the bottom of <b>/boot/config.txt</b> and reboot. <br />
<br />
Viola!<br />
pi@raspberrypi:~ $ <b>ls -l /dev/ser* </b><br />
lrwxrwxrwx 1 root root 7 Aug 26 03:24 /dev/serial0 -> ttyAMA0 <br />
lrwxrwxrwx 1 root root 5 Aug 26 03:24 /dev/serial1 -> ttyS0 <br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

