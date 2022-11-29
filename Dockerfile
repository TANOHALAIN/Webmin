FROM ubuntu

RUN apt-get update && apt-get upgrade -y

RUN echo deb http://download.webmin.com/download/repository sarge contrib >> /etc/apt/sources.list

RUN apt install wget -y 

RUN apt install gnupg1 -y

#RUN apt update -y

RUN wget -q -O- http://www.webmin.com/jcameron-key.asc | apt-key add 

RUN apt update -y

RUN apt install webmin -y

RUN apt install ufw -y

RUN ufw allow 10000

VOLUME [ "/var/run/webmin:/var/run/container-control" ]

EXPOSE 10000

ENTRYPOINT [ "bash" "/bin/sh" ]
