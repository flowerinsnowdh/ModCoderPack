# -*- coding: utf-8 -*-
"""
Created on Fri Apr  8 16:54:36 2011

@author: ProfMobius
@version: v1.2
"""
import sys, time, os
from commands import Commands
import recompile

def main(conffile):
    commands = Commands(conffile)
    commands.checkupdates()
    #TODO: Add a check for java here.
    cltdone = False
    srvdone = False

    commands.logger.info ('> Creating Retroguard config files')
    commands.creatergcfg()

    if not os.path.exists(commands.srcclient):
        commands.logger.info ('== Decompiling Client ==')
        if commands.checkjars(0):
            clienttime = time.time()
            commands.logger.info ('> Creating SRGS for client')
            commands.createsrgs(0)
            commands.logger.info ('> Applying Retroguard to client')
            commands.applyrg(0)
            commands.logger.info ('> Unzipping the client jar')
            commands.extractjar(0)
            commands.logger.info ('> Applying jadretro')
            commands.applyjadretro(0)
            commands.logger.info ('> Decompiling...')
            commands.applyjad(0)
            commands.logger.info ('> Applying patches')
            commands.applypatches(0)
            commands.logger.info ('> Renaming sources')
            commands.rename(0)
            commands.logger.info ('> Creating reobfuscation tables')
            commands.renamereobsrg(0)
            commands.logger.info ('> Done in %.2f seconds'%(time.time()-clienttime))
    else:
        commands.logger.warn ('!! Client already decompiled. Run cleanup before decompiling again !!')
        cltdone = True

    if not os.path.exists(commands.srcserver):
        commands.logger.info ('== Decompiling Server ==')
        if commands.checkjars(1):
            servertime = time.time()
            commands.logger.info ('> Creating SRGS for server')
            commands.createsrgs(1)
            commands.logger.info ('> Applying Retroguard to server')
            commands.applyrg(1)
            commands.logger.info ('> Unzipping the server jar')
            commands.extractjar(1)
            commands.logger.info ('> Applying jadretro')
            commands.applyjadretro(1)
            commands.logger.info ('> Decompiling...')
            commands.applyjad(1)
            commands.logger.info ('> Applying patches')
            commands.applypatches(1)
            commands.logger.info ('> Renaming sources')
            commands.rename(1)
            commands.logger.info ('> Creating reobfuscation tables')
            commands.renamereobsrg(1)
            commands.logger.info ('> Done in %.2f seconds'%(time.time()-servertime))
    else:
        commands.logger.warn ('!! Server already decompiled. Run cleanup before decompiling again !!')
        srvdone = True

    commands.logger.info ('== Post decompiling operations ==')
    if not cltdone or not srvdone:
        commands.logger.info ('> Recompiling')
        recompile.main(conffile)
    if not cltdone:
        commands.logger.info ('> Generating the md5 (client)')
        commands.gathermd5s(0)
    if not srvdone:
        commands.logger.info ('> Generating the md5 (server)')
        commands.gathermd5s(1)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Syntax: python decompile.py <configfile>")
        sys.exit(0)
    main(sys.argv[1])
