# Balloon
All the stuff we need to launch the balloon
So while trying to re-configure the Raspberry Pi to use the on-board UART 
to use with the Ultimate GPS module from Adafruit  (https://www.adafruit.com/products/746)
I had this partialy working before, by enabling UART1, but there was a problem.
After endabling, the GPS sentences would have extra lines coming out of serial0.
What I would like to see is using the onboard UART, which would allow for us to use 
the GPS Hat from Adafruit, which would include (https://www.adafruit.com/products/2324)

<p>

So at this point the OS has been completly reset.
Fortunatly, I have a full backup of what I did here on GitHub!

First order of business, was to connect to my wifi, which had to be done via the console.
Next we update/upgrage the OS to the latest version.
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo rpi-update
