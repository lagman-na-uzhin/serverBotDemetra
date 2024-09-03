#!/bin/bash

### BEGIN INIT INFO
# Provides:          scriptname
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO

NAME=tgserverbot
PIDFILE=/home/<user>/serverbot/serverbot.pid
DAEMON=/home/<user>/serverbot/bot.py

case "$1" in
  start)
        echo -n "Starting server telegram bot: "$NAME
    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
        echo "."
    ;;
  stop)
        echo -n "Stopping server telegram bot: "$NAME
    start-stop-daemon --stop --quiet --oknodo --pidfile $PIDFILE
        echo "."
    ;;
  restart)
        echo -n "Restarting server telegram bot: "$NAME
    start-stop-daemon --stop --quiet --oknodo --retry 15 --pidfile $PIDFILE
    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
    echo "."
    ;;

  *)
    echo "Usage: "$1" {start|stop|restart}"
    exit 1
esac

exit 0
