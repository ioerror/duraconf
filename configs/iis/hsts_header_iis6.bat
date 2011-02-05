rem This will set the HSTS header in IIS 6.x to the max-age of 15768000
rem This relies on the IIS administrative scripts being installed and being in the default location. 

cscript c:\inetpub\AdminScripts\adsutil.vbs set w3svc/HttpCustomHeaders "Strict-Transport-Security: max-age=15768000"