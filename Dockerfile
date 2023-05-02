FROM ubuntu:22.04
RUN apt-get -y update && apt-get install -y wget git 
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_0.111.3_linux-amd64.deb -P /home
RUN dpkg -i /home/hugo_0.111.3_linux-amd64.deb
COPY . /home/app
WORKDIR /home/app
RUN git submodule update --init
CMD ["hugo", "server", "--bind=0.0.0.0"]
