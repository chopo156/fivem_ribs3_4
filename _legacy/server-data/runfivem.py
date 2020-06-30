print('GO runfivem.py -> starting IMPORTs')
import sys
import subprocess
import time
from datetime import datetime
#subprocess.call(["ls","-la"])

cStrDivider = '#----------------------------------------------------------------------------------------------------#'
filename = 'runfivem.py'
print("\n IMPORTs complete:- STARTING -> file '%s' . . . " % filename)

## run.sh path
strPath = '/srv/fivem-dm4c/server/run.sh'

## log config
timenow = '%s' % int(round(time.time()))
#timenow = datetime.fromtimestamp(int(timenow))
strLogFile = '/srv/_logs/fivem-dm4c_%s.log' % timenow
strLog = '>&1 | tee -a %s' % strLogFile

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

usage = (":- USAGE examples...                          \n\n"
         " *** IMPORT ***                               \n\n"
         "  must run from /srv/<project>/server-data/   \n\n"
         " *** IMPORT ***                               \n\n"
         "1) ‘$ python3 runfivem.py -fivem | -discord'                 \n"
         "      - runs tmux (terminal multiplexar) for maintainig fivem PID after ssh HUP/disconnect \n"
         "          - after tmux terminal is launched, then run...                \n"
         "          -  '$ python3 runfivem.py -dev|prod'                          \n\n"
         "1a) ‘$ python3 runfivem.py -fivem-join | -discord-join'                                   \n"
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
         "1b) ‘$ python3 runfivem.py -fivem-kill | -discord-kill'                                   \n"
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
         "      - '$ python runfivem.py -discord'   \n"
         "      - '$ python runfivem.py -discord-join'   \n"
         "      - '$ python runfivem.py -discord-kill'   \n"
         "      - '$ python runfivem.py server.cfg'     \n"
         "      - '$ python runfivem.py nat_server.cfg'     \n"
         "      - '$ python runfivem.py dev_server.cfg'     \n"
         "      - '$ python runfivem.py wave_server.cfg'     \n"
         "      - '$ python runfivem.py tank_server.cfg'     \n"
         "      - . . . \n\n"
         " exiting... \n"
         )


argCnt = len(sys.argv)
if argCnt > 1:
    readCliArgs()
    argv = None
    stringConfig = None
    foundFlag = False
    autostart = False
    print('\nChecking CLI flags...')
    for x in range(1, argCnt):
        argv = sys.argv[x]
        if argv == '--help':
            print(" %s \n argv[1]: '--help' detected \n%s \n%s \n%s \n\n" % (cStrDivider,cStrDivider,usage,cStrDivider))
            print("\n ... sys.exit()\n\n")
            sys.exit()

        if argv == '-discord':
            print("\n '-discord' flag detected ... starting tmux session 'discord' ... (%s)" % (filename,))
            print('\n  DONE Checking CLI flags... and launched tmux discord session')
            runSubprocess(['tmux', 'new', '-s', 'discord'])
            sys.exit()

        if argv == '-discord-join':
            print("\n '-discord-join' flag detected ... joining tmux session 'discord' ... (%s)" % (filename,))
            print('\n  DONE Checking CLI flags... and attempting to join tmux discord session')
            runSubprocess(['tmux', 'a', '-t', 'discord'])
            sys.exit()

        if argv == '-discord-kill':
            print("\n '-discord-kill' flag detected ... killing tmux session 'discord' ... (%s)" % (filename,))
            print('\n  DONE Checking CLI flags... and attempting to kill tmux discord session')
            runSubprocess(['tmux', 'kill-ses', '-t', 'discord'])
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

        if argv == '-start':
            print("\n '-start' flag detected ... starting tmux and running 'fivem' ... (%s)" % (filename,))
            print('\n  DONE Checking CLI flags... and attempting to start tmux fivem session')
            # Nx2 6-19-19 @7:44pm PST - Fixing the execute tmux and launch fivem in one command using f string
            autostart = True
                
        if argv and not foundFlag:
            print("\n NO flag detected, but found an agrv ... proceeding to set an argv: %s... (%s)" % (argv,filename))
            stringConfig = argv
                
    print('\n  DONE Checking CLI args & flags...')

    ## attempting to execut tmux and launch fivem in one command (not working yet)
    #strTmuxRun = "'%s +exec %s'" % (strPath,stringConfig)
    #runSubprocess(['tmux', 'new', '-s', 'fivem', '-d', strTmuxRun])

    # Nx2 6-19-19 @7:44pm PST - Set the run command, start tmux, and launch fivem in one command using f string, then join the tmux
    if autostart == True:
        runCommand = "python3 runfivem.py %s" % stringConfig
        print(runCommand)
        # start new tmux
        runSubprocess(['tmux', 'new', '-d', '-s', 'fivem'])
        # wait 3 seconds
        time.sleep(1)
        # send start server command to tmux
        runSubprocess(['tmux', 'send-keys', '-t', 'fivem', 'C-z', runCommand, 'Enter'])
        # wait 3 seconds
        time.sleep(1)
        # join tmux
        runSubprocess(['tmux', 'a', '-t', 'fivem'])
        sys.exit()
    else:
        runSubprocess([strPath, '+exec', stringConfig])
        sys.exit()
else:
    print(" 0 flags or no additional agrv detected... (%s) \n\n" % (filename,))
    print("\n ... sys.exit()\n\n")
    sys.exit()

# $ python3 runfivem.py server.cfg >&1 | tee -a ../../_logs/rbrp_052319_1845.log
# $ python3 runfivem.py server.cfg >&1 | tee -a ../../_logs/dev_rbrp_052319_1845.log
# $ python3 runfivem.py tank_server.cfg >&1 | tee -a ../../_logs/dm4c_tank_060419_1855.log
# $ python3 runfivem.py wave_server.cfg >&1 | tee -a ../../_logs/dm4c_wave_060419_1855.log
# $ python3 runfivem.py nat_server.cfg >&1 | tee -a ../../_logs/dm4c_nat_060419_1855.log
# $ python3 runfivem.py server.cfg >&1 | tee -a ../../_logs/dm4c_060419_1855.log
# $ python3 runfivem.py server.cfg >&1 | tee -a ../../_logs/_rbrp_060619_1524.log
# $ python3.6 server_join.py >&1 | tee -a ../../_logs/discord_061319_0512.log
