FROM ubuntu:16.04

#export EGA_DCK_KEY

MAINTAINER Name <brice.aminou@gmail.com>

RUN apt-get update && apt-get install -y git && apt-get install -y wget

RUN apt-get install -y python-pip

RUN apt-get update && apt-get install -y software-properties-common && apt-get install -y python-software-properties

RUN mkdir /scripts
COPY tools/decrypt_ega_file.py /scripts/decrypt

RUN chmod +x /scripts/decrypt

ENV PATH="/scripts/:${PATH}"

ENTRYPOINT ["decrypt"]
