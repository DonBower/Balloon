!/usr/bin/env python
import time
DHThumidity = .23456789
DHTtemp = 23.456789
BMPtemp = 23.356789
BMPPressure = 98765.432109
TimeStampStr = str(time.strftime("%Y-%m-%d %H:%M:%S"))

print 'TimeStamp:{0:20s}'.format(TimeStampStr)
print 'BMP-Temp={0:=+010.5f} C'.format(BMPtemp)
print 'BMP-Pressure={0:=+010.5f} Pa'.format(BMPpressure)
print 'DHT-Temp={0:=+010.5f}*C'.format(DHTtemp)
print 'DHT-Humidity={0:=+010.5f}%'.format(DHThumidity)
print "{:s}{:s}{:s}{:s}{:s}".format(TimeStampStr,BMPTempStr,BmpPressureStr,DHTTempStr,DHTHumidityStr)

