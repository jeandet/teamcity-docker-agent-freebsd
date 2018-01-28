# Pull base image.
FROM jeandet/teamcity-docker-vm-base-agent
MAINTAINER Alexis Jeandet "alexis.jeandet@member.fsf.org"

# Add files.
RUN mkdir -p /vm/buildAgent
ADD start_vm.xsh /vm/
ADD start.sh /vm/
ADD update_agent.sh /vm/
ADD tc.sh /vm/
ADD bootstrap.sh /vm/
ADD Vagrantfile /vm/

ADD https://teamcity.jetbrains.com/update/buildAgent.zip /vm/
RUN unzip /vm/buildAgent.zip -d /vm/buildAgent/ && \
     chmod +x /vm/start_vm.xsh && \
     chmod +x /vm/start.sh && \
     chmod +x /vm/tc.sh && \
     touch /vm/env && \
     echo "" >> /vm/buildAgent/conf/buildAgent.dist.properties && \
     echo "system.bsd=true" >> /vm/buildAgent/conf/buildAgent.dist.properties && \
     echo "system.os=FREEBSD" >> /vm/buildAgent/conf/buildAgent.dist.properties && \
     echo "system.agent_name=freebsd" >> /opt/buildagent/conf/buildAgent.dist.properties  && \
     echo "system.agent_repo=https://github.com/jeandet/teamcity-docker-agent-freebsd" >> /opt/buildagent/conf/buildAgent.dist.properties


# Define working directory.
WORKDIR /vm

# Ports open.
EXPOSE 22 5800 5900 5901

# Define default command.
CMD ./start_vm.xsh
