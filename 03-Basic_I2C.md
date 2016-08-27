# Enabling the I²C (Inter-Integrated Circuit) Interface
So now tht GPS is up and running, it's time to get some of the other sensors working.<br>
The I²C interface is an opensource, single-bit serial bus that allows multiple devices connected to just two bidirectional open-drain lines, Serial Data Line (SDA) and Serial Clock Line (SCL), and are logicaly seperated by a device address.  For the Raspberry Pi, these address fall between hex 03 and hex 77.
A couple of the sensors use the I²C interface which needs to be enabled.  These are the steps to get I²C enabled.<br>
First, let's install some tools:<br>
<b>sudo apt-get install python-smbus i2-tools</b><br>
You could enable the i2c interface via the GUI, but where's the fun in that.  Let's use raspi-config instead.<br>
<b>sudo raspi-config</b><br>
Select the following sequence:<br>
<b>Advanced Options</b> => <b>I2C</b> => <b>\<Yes></b> => <b>\<Ok></b> => <b>\<Finish></b><br>
Or you can add the <b>dtparam=i2c1=on</b> line, and un-comment the line <b>#dtparam=i2c_arm=on</b> in the <b>/boot/config.txt</b> file.<br>
<br>
The interface can be checked with the command <b>``sudo i2cdetect -y 1``</b><br>
You sould see an table displayed with an address at each grid vector.<br>
Here is mine: <br>
``     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f ``<br>
``00:          -- -- -- -- -- -- -- -- -- -- -- -- -- ``<br>
``10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ``<br>
``20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ``<br>
``30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ``<br>
``40: -- -- -- -- -- -- -- -- 48 -- -- -- -- -- -- -- ``<br>
``50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ``<br>
``60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ``<br>
``70: -- -- -- -- -- -- -- 77                         ``<br>
<br>
<br>
<br>



