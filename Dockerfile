FROM hairyhenderson/gomplate:v3.10.0 as gomplate
FROM alpine:latest as velocity

ARG VELOCITY_VERSION=3.0.1
RUN apk add --update \
  ca-certificates \
  curl \
  && curl -fsSL -o /tmp/velocity.jar https://versions.velocitypowered.com/download/${VELOCITY_VERSION}.jar

FROM openjdk:17.0.1-buster
COPY --from=gomplate /gomplate /bin/gomplate
COPY --from=velocity /tmp/velocity.jar /velocity/velocity.jar
COPY rootfs/ /

RUN apt update \
  && apt install -y dumb-init \
  && useradd -M -d /velocity -s /usr/sbin/nologin -u 1000 velocity \
  && chown -R velocity.velocity /velocity

USER velocity
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/docker-entrypoint.sh" ]
