docker build  -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl -t lpp/teamcity_agent_bsd .
docker run  --privileged --net=host -e "SERVER_URL=https://hephaistos.lpp.polytechnique.fr/teamcity" -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl --name=tcbsd -it lpp/teamcity_agent_bsd
docker stop tcbsd
docker commit tcbsd lpp/teamcity_agent_bsd
docker rm tcbsd

