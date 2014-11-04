import os
import subprocess
import popen2
def getOutPutOfCommand(cmd):
    pid = popen2.Popen3(cmd, 1, -1)
    r = pid.tochild        
    w = pid.fromchild
    e = pid.childerr
    r.close()
    pid.wait()
    output = w.read()
    tempArray = output.split("\n")
    output = tempArray[0]            
    w.close()
    e.close()
    return output



def getReturnStatusOfCommand(cmd):
	pid = popen2.Popen3(cmd, 1, -1)
	r = pid.tochild
	w = pid.fromchild
	e = pid.childerr
	r.close()
	pid.wait()
	w.close()
	e.close()
	return pid.sts
cmd="sar -n DEV 1 1|cut -d$'\n' -f4 > 1.txt"
#|grep -w \"IFACE\"|awk '{print $6,$7}'
print cmd
#for i in range(0, 20):
rate=getOutPutOfCommand(cmd)
#rate=subprocess.Popen(cmd)
print rate