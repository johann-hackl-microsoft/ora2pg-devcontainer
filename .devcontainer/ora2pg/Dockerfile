FROM mcr.microsoft.com/devcontainers/base:jammy

RUN echo "Install pwsh..."
# see https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu
RUN apt-get update
RUN apt-get install -y wget apt-transport-https software-properties-common
RUN wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
RUN dpkg -i packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
RUN apt-get update
RUN apt-get install -y powershell

RUN echo "Install helper for ora2pg..."
RUN apt-get install -y alien dpkg-dev debhelper build-essential libaio1 make alien rpm libpq-dev libdbi-perl libwww-perl
RUN apt -y install cpanminus
