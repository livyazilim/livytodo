FROM debian:10

#ADD.MONO.REPOSITORY
RUN apt-get update && apt-get -y install gpg dirmngr ca-certificates gnupg
RUN gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list
#INSTALL.ADDITIONAL.APPLICATION
RUN apt-get update && apt-get -y install unzip python3 python3-requests apache2 apache2-utils mono-complete libapache2-mod-mono mono-apache-server4

#COPY.FILES
WORKDIR /Livyframe
ADD https://livyazilim.com/download/Livytodo-builds/livytodo-lin-livytodo.zip .
#COPY livyBuilds/livytodo-lin-livytodo.zip .
RUN unzip livytodo-lin-livytodo.zip -d livytodo-lin-livytodo && rm livytodo-lin-livytodo.zip
COPY docker-livy-client-setup-file/livytodo-profile.ini /Livyframe/livytodo-lin-livytodo/livytodo_client/profile.ini
RUN chmod 755 /Livyframe/livytodo-lin-livytodo/livytodo_client/profile.ini
COPY docker-livy-client-setup-file/livytodo-livyclient-apache.conf /etc/apache2/sites-available/.
RUN a2ensite livytodo-livyclient-apache.conf
RUN a2dissite 000-default.conf

#CHECK.UPDATE
WORKDIR /Livyframe/livytodo-lin-livytodo/livytodo_server
CMD python3 livserver.py notrun

#RUN.APACHE.SERVICE
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

#OPEN.PORTS
EXPOSE 80
