FROM osrf/ros:iron-desktop-full
ARG rrace001=rrace001
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $rrace001 \
    && useradd --uid $USER_UID --gid $USER_GID -m $rrace001 \
    && chown -R $USER_UID:$USER_GID /home/$rrace001 \
    && usermod -a -G dialout $rrace001 \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $rrace001 ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$rrace001 \
    && chmod 0440 /etc/sudoers.d/$rrace001

# install docker
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io

# Create a docker group and add your user
RUN if getent group docker > /dev/null 2>&1; then \
        echo "Docker group exists"; \
    else \
        groupadd docker; \
    fi && \
    usermod -aG docker rrace001


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
ENV SHELL /bin/bash

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $rrace001
CMD ["/bin/bash"]