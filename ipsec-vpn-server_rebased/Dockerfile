FROM hwdsl2/ipsec-vpn-server
MAINTAINER Faisal Alquaddoomi <faisal@cs.ucla.edu>

# pyshark/psycopg2 dependencies for packet logger
RUN apt-get -yqq update \
  && DEBIAN_FRONTEND=noninteractive \
  && apt-get -yqq --no-install-recommends install \
    tshark \
    python \
    python-lxml \
    python-pip \
    python-dev \
    python-setuptools \
    libxml2 libxslt-dev libz-dev \
  && apt-get -y clean

RUN pip install pyshark cachetools sqlalchemy psycopg2

COPY ./staging/etc /etc

