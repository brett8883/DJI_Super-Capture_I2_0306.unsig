@echo off 
ECHO --------------------------------------------------------------------------------------------
echo I2 Capture 0306.unsig for I2 Super-Patcher 
echo By Brett8883
echo --------------------------------------------------------------------------------------------
echo.
echo This is a simple program to capture the 0306.unsig for I2
ECHO.
echo Please Connect I2 to PC and turn it on. Please ensure it has fully started up before starting 
ECHO. 
ECHO Ready to start?
pause
cls
cd tools
:dumldore
cls
ECHO --------------------------------------------------------------------------------------------
echo I2 Capture 0306.unsig for I2 Super-Patcher 
echo By Brett8883
echo --------------------------------------------------------------------------------------------
ECHO.
ECHO Please allow DUMLdore to start up and then click the "Enable ADB" button in DUMLdore
echo. 
echo Allow ADB to enable and then give it a few seconds to process.
echo. 
echo Once ADB has been enabled please close DUMLdore and then proceed 
echo.
echo This will allow us access to access the aircraft internal files
echo.
start DUMLdoreV3.exe
pause
cls
ECHO --------------------------------------------------------------------------------------------
echo I2 Capture 0306.unsig for I2 Super-Patcher 
echo By Brett8883
echo --------------------------------------------------------------------------------------------
echo Working.. Please wait..
adb shell mount -o remount,rw /vendor
adb shell mkdir /vendor/bin
adb push wm620_0306_v03.03.09.09_20180704.pro.fw.sig /vendor/bin/
adb shell cd /vendor/bin/ ; /sbin/dji_verify -n 0306 -o 0306.unsig wm620_0306_v03.03.09.09_20180704.pro.fw.sig
adb pull /vendor/bin/0306.unsig
adb shell cd /vendor/bin/ ; rm 0306.unsig ; rm *.fw.sig ; cd / ; sync ;mount -o remount,ro /vendor|| goto error
if %errorlevel%==0 goto success

:error 
echo.
ECHO There was an error communicating with the aircraft
echo.
echo Let's try to enable ADB with DUMLdore again
echo.
echo If this is the second time you are seeing this message 
echo Please make note of the errors you see above and then exit the program
pause
cls
goto dumldore 

:success
copy *.unsig ..
cd ..
cls
ECHO --------------------------------------------------------------------------------------------
echo I2 Capture 0306.unsig for I2 Super-Patcher 
echo By Brett8883
echo --------------------------------------------------------------------------------------------
ECHO.
ECHO SUCCESS!
echo.
ECHO Please Shut down the I2. It has done well
echo Please let Brett8883 know that the process is complete
ECHO.
echo The file he will need from you is called 0306.unsig
echo. 
echo.
ECHO Thanks for doing this!
ECHO.
ECHO.
ECHO THIS IS THE END OF THE PROGRAM
pause
exit