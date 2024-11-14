FROM clamav/clamav-debian:stable

COPY ./clamav/ /etc/clamav/


RUN chown -R clamav:clamav /etc/clamav
RUN chown -R clamav:clamav /var/lib/clamav
RUN mkdir -p /run/clamav && chown -R clamav:clamav /run/clamav

COPY "./scripts/docker-entrypoint.sh" "/init"
COPY "./scripts/wrapper-entrypoint.sh" "/wrapper-init"
RUN chmod +x /wrapper-init
RUN chmod +x /init

USER 1000
ENTRYPOINT [ "/wrapper-init" ]