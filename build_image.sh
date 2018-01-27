docker build  -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl -t lpp/teamcity_agent_bsd .
docker run -d=true --privileged --net=host -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl --name=tcbsd -it lpp/teamcity_agent_bsd &
sleep 1000
docker stop tcbsd
docker commit tcbsd lpp/teamcity_agent_bsd
docker rm tcbsd

