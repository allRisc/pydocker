# Set base image
FROM docker/dev-environments-default:stable-1

# Pepare APT
RUN apt-get -qq update
RUN apt install -y software-properties-common
RUN apt-get install -y locales
RUN apt-get -qq update

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# Install Python versions from source
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev
RUN apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
RUN apt-get install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev

COPY ./install_python.sh .
RUN chmod +x install_python.sh
RUN ./install_python.sh 3.7.17  altinstall
RUN ./install_python.sh 3.8.17  altinstall
RUN ./install_python.sh 3.9.18  altinstall
RUN ./install_python.sh 3.10.13 altinstall
RUN ./install_python.sh 3.11.7  altinstall
RUN ./install_python.sh 3.12.1  install

# Install pip
RUN python3 -m ensurepip --upgrade

# Setup Python
RUN pip3 install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install wheel