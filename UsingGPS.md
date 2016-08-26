So Her is my quest to use the Adafruit Ultimate GPS which comes in 2 flavors,   <br />
one is a breakout, https://www.adafruit.com/products/746),  <br />
and the other is a hat (https://www.adafruit.com/products/2324) <br />
The issue with it working straight up is a: the UART connected to the GPIO is disabled, and b: the default GPIO UART is a mini-UART (i.e. software assisted)  <br />
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
pi@raspberrypi:~/balloon $ ls -l /dev/ser* <br />
lrwxrwxrwx 1 root root 7 Aug 25 03:46 /dev/serial1 -> ttyAMA0 <br />
<br />
so to enable the mini-uart, by adding the line <b> enable_uart=1</b> to the bottom of <b>/boot/config.txt</b> <br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

