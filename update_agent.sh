#!/usr/local/bin/bash
#generate ~/.bash_profile with forwarded env vars from docker container
echo "starting teamcity update"
/usr/local/bin/bash /home/vagrant/env
/usr/local/bin/bash -c 'export SERVER_URL=https://hephaistos.lpp.polytechnique.fr/teamcity && /usr/local/bin/bash /home/vagrant/tc.sh' &
sleep 300
/usr/local/bin/bash /home/vagrant/buildAgent/bin/agent.sh stop

