#!/usr/bin/env python
# coding=utf-8
############################################# 
# file: mysqlsetupreplication.py            #
# Desc: set full replication                #
# Creation: 20160203                        #
# Author: Nicolas Moreau                    #
#############################################
import sys, getopt, os
import subprocess
import string

def syntaxOptions ():
    print """Syntaxe: 
    --hostsource 
    --hostdest 
    --credsource 
    --creddest 
    --credrpl"""
    
def createRandomPassword():
    password = ''
    for x in [1,2,3]:
        password += random.choice(string.ascii_lowercase)
        password += random.choice(string.ascii_uppercase)
        password += random.choice(string.digits)
        password += random.choice('%=+$*;!')
    return password
        
def exportAndImportData ():
    print ''
def main(argv):
    action = ''
    #parse les arguments
    try:
        opts, args = getopt.getopt(argv, "a", ["hostsource", "hostdest", "credsource", "creddest", "credrpl"])
        #si le script est lance sans arguments
        if len(sys.argv) == 1:
            syntaxOptions()
    except getopt.GetoptError:
        syntaxOptions()
        sys.exit(2)
    for opt, arg in opts:
        if opt in ('-h',"--help"):
            syntaxOptions()
            sys.exit()
        elif opt in ("--hostsource"):
            hostsource = arg
        elif opt in ("--hostdest"):
            hostdest = arg
        elif opt in ("--credsource"):
            credsource = arg
        elif opt in ("--creddest"):
            creddest = arg
        elif opt in ("--credrpl"):
            credrpl = arg
        else:
            syntaxOptions()
	#start action
    try:
        
        output = subprocess.check_output(["mysqldbexport","--server=" + credsource+"@"+hostsource, "--all", "--export=both", "--rpl=MASTER", "--rpl-user=credrpl",">", "data.sql"], sterr=None)
        output = subprocess.check_output(["mysqldbimport","--server=" + creddest+"@"+hostdest, "--all", "data.sql"], sterr=None)
        #create repl user on master
        #generation of random password that match complexity criterias
        
        output = subprocess.Popen("mysql", "-e", "CREATE USER repl identified by ''")
        print output.communicate()[0]
        #setup replication
        
        output = subprocess.Popen(["mysqlreplicate","--master=" + credsource+"@", "--slave=", "--rpl-user", query], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        result = output.communicate()
        #if no error
        if not result[1]:
            print result[0]
            os._exit(0)
        os._exit(1) 
        print output.communicate()[0]
    except subprocess.CalledProcessError as detail:
        print 'ErrorCalled'
        sys.exit(1)
    except:
        print 'error'
        sys.exit(1)

# Source on localhost: ... connected.
if __name__ == "__main__":
	main(sys.argv[1:])