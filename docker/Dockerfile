FROM ubuntu:18.04
SHELL ["/bin/bash", "-c"]

ENV HOST_USER_NAME alexander
ENV HOST_USER_ID 1000

ADD docker /docker

RUN apt-get update && \
	apt-get install --yes \
		wget curl software-properties-common apt-transport-https docker git libasound2 sudo
RUN apt-get install --yes \
		tldr vim gedit clang-format g++

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" && \
	apt-get update && \
	apt-get install code --yes

# Dummy user to allow non-root vscode install
ADD home_template /home/user
RUN useradd -u 9999 user && \
	chown -R user:user /home/user

RUN su user -c 'code --install-extension ms-azuretools.vscode-docker && \
	code --install-extension ms-vscode.cpptools'

CMD ["/bin/bash", "--init-file", "/docker/mimic_host_user.bash"]
