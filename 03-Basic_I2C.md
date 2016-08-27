# Enabling the I²C (Inter-Integrated Circuit) Interface
So now tht GPS is up and running, it's time to get some of the other sensors working.<br>
The I²C interface is really a bus that allows multiple devices to use the same to pins, which are logicaly seperated by a device address.  For the Raspberry Pi, these address fall between decimal 33 decimal 77.
A couple of the sensors use the I²C interface which needs to be enabled.  These are the steps to get I²C enabled.<br>
