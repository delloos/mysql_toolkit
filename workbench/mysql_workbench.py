#!/usr/bin/env python
# coding=utf-8

# Ce script permet l'ajout / la suppression et la visualisation de certains paramètres
import sys, getopt, os
import subprocess
import re
import xml.etree.ElementTree as ET
from xml.etree.cElementTree import tostring
from xml.dom import minidom
import uuid
import time
def syntaxOptions():
    print """Usage : ./mysql_workbench.py
    --host=192.168.0.2 (mandatory)
    --port=3306
    --user=root (mandatory)
    --password=myrootpass (mandatory)
    --database=mysql
    """
    os._exit(1)

def buildTree(host, user, password, database, port, xmlFilePath):
    try:
        #generate new guid for connection like "04CA46BC-F5AC-433B-9891-831A306101B1" if two connections have the same uuid file is reset by workbench
        guid = str(uuid.uuid1()).upper()
        #generate connection name
        connectionName = user + '@' + host + ':' + str(port)
        print port

        #allelements = list(root.iter())
        #print allelements
        #get firstchild to import in it
        database=''

        #ET.dump(tree)
         #build tree
        tree = ET.parse(xmlFilePath)
        rootReal = tree.getroot()
        #rootReal[0].insert(0, root)

        #print root.tag
        #build new element

        value = ET.SubElement(rootReal[0],"value")
        value.set('struct-checksum',"0x96ba47d8")
        value.set('id',guid)
        value.set('struct-name',"db.mgmt.Connection")
        value.set('type','object')
        link = ET.SubElement(value,'link')
        link.set('key', 'driver')
        link.set('struct-name',"db.mgmt.Driver")
        link.set('type','object')
        link.text ='com.mysql.rdbms.mysql.driver.native'
        value2 = ET.SubElement(value,"value")
        value2.set('key', 'hostIdentifier')
        value2.set('type','string')
        value2.text = connectionName
        value3 = ET.SubElement(value,'value')
        value3.set('key','isDefault')
        value3.set('type','int')
        value3.text = '0'
        value4 = ET.SubElement(value,"value")
        value4.set('key', 'modules')
        value4.set('type', 'dict')
        value4.set('_ptr_', '0x7fcb93c00d00')
        dic = ET.SubElement(value,'value')
        dic.set('_ptr_','0x7fcb93c00d60')
        dic.set('type', 'dict')
        dic.set('key', 'parameterValues')
        #sublevel
        parameters = ET.SubElement(dic,'value')
        parameters.set('key','SQL_MODE')
        parameters.set('type','string')
        hostname =  ET.SubElement(dic,'value')
        hostname.set('key', 'hostName')
        hostname.set('type','string')
        hostname.text = host
        myPassword = ET.SubElement(dic,'value')
        myPassword.set('key','password')
        myPassword.set('type','string')
        myPassword.text = password
        myPort = ET.SubElement(dic,'value')
        myPort.set('key','port')
        myPort.set('type','int')
        myPort.text = str(port)
        schema = ET.SubElement(dic,'value')
        schema.set('key','schema')
        schema.set('type','string')
        schema.text = database
        sslCA = ET.SubElement(dic,'value')
        sslCA.set('key','sslCA')
        sslCA.set('type','string')
        sslCA.text = ''
        sslCert = ET.SubElement(dic,'value')
        sslCert.set('key','sslCert')
        sslCert.set('type','string')
        sslCert.text = ''
        sslCipher = ET.SubElement(dic,'value')
        sslCipher.set('key','sslCipher')
        sslCipher.set('type','string')
        sslCipher.text = ''
        sslKey = ET.SubElement(dic,'value')
        sslKey.set('key','sslKey')
        sslKey.set('type','string')
        sslKey.text = ''
        useSSL = ET.SubElement(dic,'value')
        useSSL.set('key','useSSL')
        useSSL.set('type','int')
        useSSL.text = '1'
        userName = ET.SubElement(dic,'value')
        userName.set('key','userName')
        userName.set('type','string')
        userName.text = user
        name = ET.SubElement(value,'value')
        name.set('key','name')
        name.set('type','string')
        name.text = host + ':' + user
        #tree = ET.ElementTree(rootReal)
        tempXML = tostring(tree.getroot()) #, method='html')
        tempXML = minidom.parseString(tempXML).toprettyxml(indent='  ')
        tempXML = tempXML.replace('/>', '></value>')
        tempXML = tempXML.replace("\n\n", '')
        tempXML = tempXML.replace('"dict"></value>', '"dict"/>')
        print tempXML
        #before writing the right file, write a complete copy
        dt = time.strftime("%Y%m%d-%H%M%S")
        f = open(xmlFilePath + '.copy' + dt,'w')
        f.write(tempXML)
        f.close()
        #final write
        f = open(xmlFilePath, 'w')
        f.write(tempXML)
        f.close()
    except IOError:
        print 'Error: connections.xml file not found on specified path'

def main(argv):
    #user for connection
    user = False
    #password for connection
    password = False
    #database context for connection
    database = False
    #port for connection
    port = 3306
    #host for connection
    host = False
    #path to connections.xml file
    xmlFilePath = '/root/.mysql/workbench/connections.xml'

    try:
        opts, args = getopt.getopt(argv, "u:H:p:l:", ["help", "user=", "password=", "database=", "port=", "host="])
    except getopt.GetoptError:
        syntaxOptions()
        #if launch without argument
    if len(sys.argv) == 1:
        syntaxOptions()
    for opt, arg in opts:
        if opt in ("-h","--help"):
                syntaxOptions()
        elif opt in ("-u","--user"):
            user = arg
        elif opt in ("-d","--database"):
            database = arg
        elif opt in ("-u","--user"):
            user = arg
        elif opt in ("-p", "--password"):
            password = arg
        elif opt in ("-v","--host"):
            host = arg

    #check for mandatory option
    if user and isinstance(user, basestring) and password and isinstance(password, basestring) and host and isinstance(host,basestring) and database and isinstance(database,basestring):
        buildTree(host, user, password, database, port, xmlFilePath)
    else:
        syntaxOptions()

if __name__ == "__main__":
    main(sys.argv[1:])
os._exit(1)
