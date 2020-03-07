:: A common occurance on your windows or any machine is that a reboot has happened however
:: a program is still using or running on a port that is needed, stopping your productivity.
:: As demonstrated here: https://community.talend.com/t5/Architecture-Best-Practices-and/How-to-find-and-kill-a-process-running-on-a-port/ta-p/55315
:: using the netstat command we get a list of all active ports
netstat
:: then by specifying the following switches
:: -a displays ALL ports in use not just that associated to user.
:: -n stops a hostname lookup which could take a long time
:: -o this one is CRITICAL it lists the corresponding PID
:: So by using:
netstat -ano
:: We can then pipe that into a findstr command to get the port and process out of the result set:
netstat -ano|findstr "PID :80"
:: 80 of course being the PORT that we want back.
:: With the process now listed, simply run:
taskkill /pid 12345 /f
:: the /pid option depicts that we are killing by PID, the /f is top force and 12345 is the PID!
:: The day is won.