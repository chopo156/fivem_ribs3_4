print('GO runfivem.py -> starting IMPORTs')
import sys
import subprocess
#subprocess.call(["ls","-la"])

cStrDivider = '#----------------------------------------------------------------------------------------------------#'
filename = 'runfivem.py'
print("\n IMPORTs complete:- STARTING -> file '%s' . . . " % filename)

## run.sh path
strPath = '/srv/pixelatedpp/server/run.sh'

def runSubprocess(lstArgsRun):
    print('\n')
    print('#======================================================================#')
    print('#======================================================================#')
    print('running...')
    print('$ %s' % ' '.join(lstArgsRun))
    print('\n')
    subprocess.call(lstArgsRun)

def readCliArgs():
    funcname = '(%s) readCliArgs' % filename
    print('\nPrinting CLI args...\n')
    argCnt = len(sys.argv)
    print('Number of arguments: %i' % argCnt)
    print('Argument List: %s' % str(sys.argv))
    for idx, val in enumerate(sys.argv):
        print('Argv[%i]: %s' % (idx,str(sys.argv[idx])))
    print('\n  DONE printing CLI args...')

print("\n FUNCTIONS declared:- STARTING -> additional '%s' run scripts (if applicable) . . . " % filename)

#test

usage = (":- USAGE examples...                          \n\n"
         " *** IMPORT ***                               \n\n"
         "  must run from /srv/<project>/server-data/   \n\n"
         " *** IMPORT ***                               \n\n"
         "1) ‘$ python3 runfivem.py -fivem'                 \n"
         "      - runs tmux (terminal multiplexar) for maintainig fivem PID after ssh HUP/disconnect \n"
         "          - after tmux terminal is launched, then run...                \n"
         "          -  '$ python3 runfivem.py -dev|prod'                          \n\n"
         "1a) ‘$ python3 runfivem.py -fivem-join'                                   \n"
         "      - re-join (attach) to current 'fivem' session                     \n"
         "           (runs: '$ tmux a -t fivem')                                  \n"
         "      - utilized for reviewing live logs, hot-resets, etc.            \n\n"
         "      ## tmux HOT KEYs (controls) ##                                        \n"
         "      # cheat-sheet-ref: https://tmuxcheatsheet.com                         \n"
         "          # detach (leave) current session                                  \n"
         "              > ctl+b , d                                                   \n"
         "          # KILL current session (this will shutdown the fivem server)      \n"
         "              > ctl+d                                                         \n"
         "          # Enter scrolling mode                                              \n"
         "              > ctl+d , [                                                     \n"
         "          # Exit scrolling mode                                              \n"
          "              > q                                                            \n\n"
         "1b) ‘$ python3 runfivem.py -fivem-kill'                                   \n"
         "      - kill (shutdown) the current 'fivem' server session              \n"
         "           (runs: '$ tmux kill-ses -t fivem')                           \n"
         "      - NOTE: can also kill with hot key controls (above)             \n\n"
         "2) ‘$ python3 runfivem.py server.cfg \n"
         "      - runs specified 'server.cfg' file name in current working directory \n"
         "          - uses custom 'sv_licenseKey' \n"
         "          - uses current IP allocation (0.0.0.0) \n"
         "          - uses default listening port (0.0.0.0:30120) \n\n"
         "3) examples... \n"
         "      - '$ python runfivem.py -fivem'   \n"
         "      - '$ python runfivem.py -fivem-join'   \n"
         "      - '$ python runfivem.py -fivem-kill'   \n"
         "      - '$ python runfivem.py server.cfg'     \n"
         "      - '$ python runfivem.py dev_server.cfg'     \n"
         "      - '$ python runfivem.py wave_server.cfg'     \n"
         "      - '$ python runfivem.py tank_server.cfg'     \n"
         "      - NOTE: '-prod' flag currently enabled as of 042319 \n"
         "      - WARNING: '-zap' flag expects yield error ref: no 'sv_licenseKey' \n\n"
         "      - . . . \n\n"
         " exiting... \n"
         )

### this my code change ....

argCnt = len(sys.argv)
if argCnt > 1:
    readCliArgs()
    argv = None
    stringConfig = None
    foundFlag = False
    print('\nChecking CLI flags...')
    for x in range(0, argCnt):
        argv = sys.argv[x]
        if argv == '--help':
            print(" %s \n argv[1]: '--help' detected \n%s \n%s \n%s \n\n" % (cStrDivider,cStrDivider,usage,cStrDivider))
            print("\n ... sys.exit()\n\n")
            sys.exit()

        if argv == '-fivem':
            print("\n '-fivem' flag detected ... starting tmux session 'fivem' ... (%s)" % (filename,))
            print('\n  DONE Checking CLI flags... and launched tmux fivem session')
            runSubprocess(['tmux', 'new', '-s', 'fivem'])
            sys.exit()

        if argv == '-fivem-join':
            print("\n '-fivem-join' flag detected ... joining tmux session 'fivem' ... (%s)" % (filename,))
            print('\n  DONE Checking CLI flags... and attempting to join tmux fivem session')
            runSubprocess(['tmux', 'a', '-t', 'fivem'])
            sys.exit()
        
        if argv == '-fivem-kill':
            print("\n '-fivem-kill' flag detected ... killing tmux session 'fivem' ... (%s)" % (filename,))
            print('\n  DONE Checking CLI flags... and attempting to kill tmux fivem session')
            runSubprocess(['tmux', 'kill-ses', '-t', 'fivem'])
            sys.exit()
                
        if argv and not foundFlag:
            print("\n NO flag detected, but found an agrv ... proceeding to set an argv: %s... (%s)" % (argv,filename))
            stringConfig = argv
                
    print('\n  DONE Checking CLI args & flags...')

    ## attempting to execut tmux and launch fivem in one command (not working yet)
    #strTmuxRun = "'%s +exec %s'" % (strPath,stringConfig)
    #runSubprocess(['tmux', 'new', '-s', 'fivem', '-d', strTmuxRun])
    runSubprocess([strPath, '+exec', stringConfig])
    sys.exit()
else:
    print(" 0 flags or no additional agrv detected... (%s) \n\n" % (filename,))
    print("\n ... sys.exit()\n\n")
    sys.exit()

# $ python3 runfivem.py server.cfg >&1 | tee -a ../../_logs/rbrp_052319_1845.log
# $ python3 runfivem.py server.cfg >&1 | tee -a ../../_logs/dev_rbrp_052319_1845.log
# $ python3 runfivem.py tank_server.cfg >&1 | tee -a ../../_logs/dm4c_tank_060419_1855.log
# $ python3 runfivem.py server.cfg >&1 | tee -a ../../_logs/_rbrp_060619_1524.log


