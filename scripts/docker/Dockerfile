FROM python:3.9.2-slim

LABEL maintainer="marco.delapierre@pawsey.org.au"

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get clean all && \
    apt-get update && \
    apt-get install -y \
        cowsay \
        vim \
    && apt-get clean all && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install cowpy

ENV PATH=/usr/games:$PATH

CMD ["/bin/bash"]

