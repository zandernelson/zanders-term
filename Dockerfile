FROM ubuntu:latest

COPY .zanders-term-install.sh .
COPY .zanders-term-customizations .

RUN apt-get update -y
RUN apt-get install zsh -y

CMD ["tail", "-f", "/dev/null"]