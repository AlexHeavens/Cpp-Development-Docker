FROM ubuntu:18.04

RUN mkdir /home/user/workspace /scripts --parents
ADD docker /docker

ENV HOST_USER_NAME alexander
ENV HOST_USER_ID 1000

RUN apt-get update && \
	apt-get install --yes \
		wget curl software-properties-common apt-transport-https docker git
RUN apt-get install --yes \
		tldr vim gedit

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" && \
	apt-get update && \
	apt-get install code --yes

ENTRYPOINT "/docker/entrypoint.bash"
