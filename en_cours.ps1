# a tester pour refaire mise a jour en cas de defaillance d une mise à jour 
# Les commandes sont à lancer dans une invite de commandes windows +Rdism

net stop bits
net stop wuauserv
ren c:\windows\softwaredistribution softwaredistribution.bak
ren c:\windows\system32\catroot2 catroot2.bak
net start bits
net start wuauserv