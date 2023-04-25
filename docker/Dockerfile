FROM ubuntu:focal as build

ARG TARGETPLATFORM
COPY ${TARGETPLATFORM}/nowp*.tar.gz .

RUN set -ex \
  && tar -xzf nowp*.tar.gz -C /opt \
  && rm -rf /opt/nowp-*/bin/nowp-qt \
  && mv /opt/nowp-* /opt/nowp

FROM ubuntu:focal

RUN useradd -r nowp

RUN apt-get update && apt-get install -y \
    gosu \
 && rm -rf /var/lib/apt/lists/*

ENV NOWP_DATA=/data
ENV NOWP_PREFIX=/opt/nowp
ENV PATH=${NOWP_PREFIX}/bin:$PATH
ENV RPC_PASSWORD=nowppass
ENV RPC_USER=nowpuser

COPY --from=build /opt /opt
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["${NOWP_DATA}"]

EXPOSE 6888 6887 7888 7887

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nowpd"]
