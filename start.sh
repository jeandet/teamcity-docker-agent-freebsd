#!/usr/local/bin/bash
#generate ~/.bash_profile with forwarded env vars from docker container
if [ -e /provisioned ]
then
  echo "starting teamcity"
  /usr/local/bin/bash /home/vagrant/env
  /usr/local/bin/bash /home/vagrant/tc.sh
else
  echo "starting teamcity for first time update"
  /usr/local/bin/bash /home/vagrant/env
  /usr/local/bin/bash /home/vagrant/tc.sh &
  sleep 300
  /usr/local/bin/bash /home/vagrant/buildAgent/bin/agent.sh stop
fi

