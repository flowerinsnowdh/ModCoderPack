# -*- coding: utf-8 -*-
"""
Created on Sat Apr  9 13:51:48 2011

@author: ProfMobius & Searge
@version: v0.1
"""

import sys, shutil, os, glob, logging
from commands import Commands
if sys.version_info[0] == 3:    
    raw_input=input
def main(conffile, force=False):
    
    if sys.version_info[0] == 3:
        print ('ERROR : Python3 is not supported yet.')
        sys.exit(1)

    if not force:            
        print('WARNING:')
        print('The cleanup script will delete all folders created by MCP, including the')
        print('src folder which may contain changes you made to the code.')
        answer = raw_input('If you really want to clean up, enter "Yes" ')
        if answer.lower() not in ['yes']:
            print('You have not entered "Yes", aborting the clean up process')
            sys.exit(0)

    commands = Commands(conffile)
    commands.checkupdates() 
    
    commands.logger.info ('> Cleaning temp')
    shutil.rmtree(commands.dirtemp, ignore_errors=True)
#    os.mkdir(commands.dirtemp) 
    
    commands.logger.info ('> Cleaning src')
    shutil.rmtree(commands.dirsrc, ignore_errors=True)
#    os.mkdir(commands.dirsrc)
    
    commands.logger.info ('> Cleaning bin')
    shutil.rmtree(commands.dirbin, ignore_errors=True)
#    os.mkdir(commands.dirbin)
    
    commands.logger.info ('> Cleaning reobf')
    shutil.rmtree(commands.dirreobf, ignore_errors=True)    
    
    commands.logger.info ('> Cleaning jars')
    shutil.rmtree(os.path.join(commands.dirjars, 'saves'), ignore_errors=True)
    shutil.rmtree(os.path.join(commands.dirjars, 'texturepacks'), ignore_errors=True)
    shutil.rmtree(os.path.join(commands.dirjars, 'world'), ignore_errors=True)
    if os.path.exists(os.path.join(commands.dirjars, 'server.log')):
        os.remove(os.path.join(commands.dirjars, 'server.log'))
    for txt_file in glob.glob(os.path.join(commands.dirjars, '*.txt')):
        os.remove(txt_file)

    commands.logger.info ('> Cleaning logs')
    logging.shutdown()
    shutil.rmtree(commands.dirlogs, ignore_errors=True)
#    os.mkdir(commands.dirlogs)
    
    
    
if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Syntax: python cleanup.py <configfile>")
        sys.exit(0)
    if len(sys.argv) == 3 and sys.argv[2] == '-f':
        main(sys.argv[1], True)
    else:
        main(sys.argv[1])
