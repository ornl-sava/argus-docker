FROM debian
MAINTAINER John Goodall <jgoodall@ornl.gov>

LABEL program=argus

ENV PROG argus
ENV VERS 3.0.8.2
ENV PREFIX /opt
ENV PATH $PREFIX/sbin:$PREFIX/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update -qq && \
    apt-get install -yq curl gcc make bison flex libpcap-dev libwrap0-dev --no-install-recommends

WORKDIR /tmp
RUN curl -sL http://qosient.com/argus/src/$PROG-$VERS.tar.gz | tar -zxf - && \
    cd $PROG-$VERS && \
    ./configure --prefix=$PREFIX && \
    make && \
    make install && \
    rm -rf /tmp/$PROG-$VERS

WORKDIR $PREFIX
ENTRYPOINT ["/opt/sbin/argus"]
CMD ["-h"]
