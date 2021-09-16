FROM quay.io/bitnami/minideb:buster AS build
ARG MYCORRHIZA_VERSION=v1.4.0
ADD https://github.com/bouncepaw/mycorrhiza/releases/download/${MYCORRHIZA_VERSION}/mycorrhiza-${MYCORRHIZA_VERSION}-linux-amd64.tar.gz /tmp/mycorrhiza.tar.gz
RUN mkdir -p /tmp/mycorrhiza && \
    tar xvf /tmp/mycorrhiza.tar.gz -C /tmp/mycorrhiza

FROM quay.io/bitnami/git:2.33.0
COPY --from=build /tmp/mycorrhiza/mycorrhiza /usr/bin/mycorrhiza
RUN mkdir -p /wiki
WORKDIR /wiki
CMD [ "/usr/bin/mycorrhiza" ]
