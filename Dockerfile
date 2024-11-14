FROM clamav/clamav-debian:stable

COPY ./clamav/ /etc/clamav/

USER root
RUN chown -R clamav:clamav /etc/clamav
RUN mkdir -p /run/clamav && chown -R clamav:clamav /run/clamav

COPY "./scripts/wrapper-entrypoint.sh" "/wrapper-init"
RUN chmod +x /wrapper-init

USER clamav
ENTRYPOINT [ "/wrapper-init" ]