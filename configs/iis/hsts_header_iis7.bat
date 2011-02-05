rem This will set the HSTS header in IIS 7.x to the max-age of 15768000
rem For more information on setting custom headers, and appcmd:
rem See http://technet.microsoft.com/en-us/library/cc753133(WS.10).aspx
rem See http://technet.microsoft.com/en-us/library/cc772200(WS.10).aspx

%windir%\system32\inetsrv\appcmd set config /section:httpProtocol /+customHeaders.[name='Strict-Transport-Security',value='max-age=15768000']
