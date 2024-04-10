FROM debian:10

#ADD.MONO.REPOSITORY
RUN apt-get update && apt-get -y install gpg dirmngr ca-certificates gnupg
RUN gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list

#INSTALL.ADDITIONAL.APPLICATION
RUN apt-get update && apt-get -y install unzip python3 mono-complete

#COPY.FILES
WORKDIR /Livyframe
ADD https://livyazilim.com/download/Livytodo-builds/livytodo-lin-livytodo.zip .
#COPY livyBuilds/livytodo-lin-livytodo.zip .
RUN unzip livytodo-lin-livytodo.zip -d livytodo-lin-livytodo && rm livytodo-lin-livytodo.zip
#COPY docker-livy-server-setup-file/livytodo-livserver.exe.config /Livyframe/livytodo-lin-livytodo/livytodo_server/livserver.exe.config
#RUN chmod 755 /Livyframe/livytodo-lin-livytodo/livytodo_server/livserver.exe.config

#RUN.APPLICATION.SERVICE
WORKDIR /Livyframe/livytodo-lin-livytodo/livytodo_server
CMD mono livserver.exe

#OPEN.PORTS
EXPOSE 25000
