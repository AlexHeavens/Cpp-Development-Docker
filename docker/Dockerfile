FROM ubuntu:18.04
SHELL ["/bin/bash", "-c"]

ENV HOST_USER_NAME alexander
ENV HOST_USER_ID 1000

ADD docker /docker

RUN apt-get update && \
	apt-get install --yes \
		sudo man software-properties-common \
		gnupg-agent ca-certificates apt-transport-https \
		wget curl git bash-completion \
		tldr vim gedit clang-format g++ libasound2

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
	add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable" && \
	apt-get update && \
	apt-get install --yes \
		docker-ce docker-ce-cli containerd.io

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" && \
	apt-get update && \
	apt-get install code --yes

# dummy user to allow non-root vscode install
RUN useradd -u 9999 user
ADD --chown=user:user home_template /home/user

RUN su user -c 'code --install-extension ms-azuretools.vscode-docker && \
	code --install-extension ms-vscode.cpptools'

CMD ["/bin/bash", "--init-file", "/docker/mimic_host_user.bash"]
