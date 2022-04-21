# -*- coding: utf-8 -*-
"""
Created on Fri Apr  8 16:54:36 2011

@author: ProfMobius
@version: v1.2
"""

import sys
import logging
from optparse import OptionParser

from commands import Commands, CLIENT, SERVER, CalledProcessError
from mcp import decompile_side, updatemd5_side


def main():
    parser = OptionParser(version='MCP %s' % Commands.fullversion())
    parser.add_option('-j', '--jad', dest='force_jad', action='store_true',
                      help='force use of JAD even if Fernflower available', default=False)
    parser.add_option('-s', '--csv', dest='force_csv', action='store_true',
                      help='force use of CSVs even if SRGs available', default=False)
    parser.add_option('-r', '--norecompile', dest='no_recompile', action='store_true',
                      help='disable recompile after decompile', default=False)
    parser.add_option('-d', '--nocomments', dest='no_comments', action='store_true', help='disable javadoc',
                      default=False)
    parser.add_option('-a', '--noreformat', dest='no_reformat', action='store_true',
                      help='disable source reformatting', default=False)
    parser.add_option('-n', '--norenamer', dest='no_renamer', action='store_true',
                      help='disable field and method renaming', default=False)
    parser.add_option('-l', '--lvt', dest='keep_lvt', action='store_true', help='preserve local variable table',
                      default=False)
    parser.add_option('-g', '--generics', dest='keep_generics', action='store_true',
                      help='preserve generics as well as local variables', default=False)
    parser.add_option('-p', '--nopatch', dest='no_patch', action='store_true',
                      help='disable source patching', default=False)
    parser.add_option('-o', '--onlypatch', dest='only_patch', action='store_true', help='only patch source',
                      default=False)
    parser.add_option('-c', '--config', dest='config', help='additional configuration file')
    options, _ = parser.parse_args()
    decompile(options.config, options.force_jad, options.force_csv, options.no_recompile, options.no_comments,
              options.no_reformat, options.no_renamer, options.no_patch, options.only_patch, options.keep_lvt,
              options.keep_generics)


def decompile(conffile, force_jad, force_csv, no_recompile, no_comments, no_reformat, no_renamer, no_patch, only_patch,
              keep_lvt, keep_generics):
    try:
        commands = Commands(conffile, verify=True, no_patch=no_patch)

        commands.checkupdates()

        use_ff = commands.has_ff and not force_jad
        use_srg = commands.has_srg and not force_csv

        if force_jad and not commands.has_jad:
            commands.logger.error('!! forcing jad when not available !!')
            sys.exit(1)

        if force_csv and not commands.has_map_csv:
            commands.logger.error('!! forcing csvs when not available !!')
            sys.exit(1)

        # if only patch then disable everything but patching
        if only_patch:
            no_patch = False
            no_comments = True
            no_reformat = True
            no_renamer = True
            no_recompile = True
        # if no_patch then disable patching, comments, reformat, renamer, or recompile
        if no_patch:
            no_comments = True
            no_reformat = True
            no_renamer = True
            no_recompile = True

        # if we have generics enabled we need the lvt as well
        if keep_generics:
            keep_lvt = True

        commands.logger.info('> Creating Retroguard config files')
        commands.creatergcfg(reobf=False, keep_lvt=keep_lvt, keep_generics=keep_generics)

        try:
            cltdecomp = decompile_side(commands, CLIENT, use_ff=use_ff, use_srg=use_srg, no_comments=no_comments,
                                       no_reformat=no_reformat, no_renamer=no_renamer, no_patch=no_patch)
            srvdecomp = decompile_side(commands, SERVER, use_ff=use_ff, use_srg=use_srg, no_comments=no_comments,
                                       no_reformat=no_reformat, no_renamer=no_renamer, no_patch=no_patch)
        except CalledProcessError:
            # retroguard or other called process error so bail
            commands.logger.error('Decompile failed')
            sys.exit(1)
        if not no_recompile:
            if cltdecomp:
                try:
                    updatemd5_side(commands, CLIENT)
                except CalledProcessError:
                    commands.logger.error('Initial client recompile failed, correct source then run updatemd5')
                    pass
            if srvdecomp:
                try:
                    updatemd5_side(commands, SERVER)
                except CalledProcessError:
                    commands.logger.error('Initial server recompile failed, correct source then run updatemd5')
                    pass
        else:
            commands.logger.info('!! recompile disabled !!')
    except Exception:  # pylint: disable-msg=W0703
        logging.exception('FATAL ERROR')
        sys.exit(1)


if __name__ == '__main__':
    main()
