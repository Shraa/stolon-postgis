FROM sorintlab/stolon:v0.12.0-pg9.4

LABEL \
    VER="1.0" \
    author="Mikhail Velkin <twilight@solfoto.ru>" \
    maintainer="Mikhail Velkin <twilight@solfoto.ru>" \
    description="Postgres server for Stolon cluster with PostGIS extension and required dependencies" \
    source="https://gitlab.com/ScanEx/Maritime.Infra/postgis"

ARG TZ=Europe/Moscow
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true
ARG POSTGIS_VER=2.3

RUN set -ex \
 && ln -snf /usr/share/zoneinfo/ /etc/localtime \
 && dpkg-reconfigure tzdata \
 && apt-get update -yqq \
 && apt-get upgrade -yqq \
 && apt-get install --no-install-recommends -yqq \
      ca-certificates \
      postgis \
      postgresql-9.4-postgis-2.3-scripts \
      postgresql-9.4-postgis-2.3 \
      postgresql-server-dev-9.4 \
 && rm -rf \
      /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/* \
      /usr/share/man \
      /usr/share/doc \
      /usr/share/doc-base
