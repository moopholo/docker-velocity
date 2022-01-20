FROM hairyhenderson/gomplate:v3.10.0 as gomplate
FROM alpine:latest as velocity

ARG VELOCITY_VERSION
ARG VELOCITY_BUILD
RUN apk add --update \
  ca-certificates \
  curl \
  jq \
  && version="${VELOCITY_VERSION:-$(curl -sL https://papermc.io/api/v2/projects/velocity | jq -r '.versions | max_by( select(contains("SNAPSHOT") | not) | split(".") | map(tonumber))')}" \
  && build="${VELOCITY_BUILD:-$(curl -sL https://papermc.io/api/v2/projects/velocity/versions/${version} | jq -r '.builds[-1]')}" \
  && jar="$(curl -sL https://papermc.io/api/v2/projects/velocity/versions/${version}/builds/${build} | jq -r '.downloads.application.name')" \
  && sha="$(curl -sL https://papermc.io/api/v2/projects/velocity/versions/${version}/builds/${build} | jq -r '.downloads.application.sha256')" \
  && curl -fsSL -o /tmp/velocity.jar "https://papermc.io/api/v2/projects/velocity/versions/${version}/builds/${build}/downloads/${jar}" \
  && echo "${sha}  /tmp/velocity.jar" | sha256sum -c -

FROM openjdk:17.0.2-buster
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
