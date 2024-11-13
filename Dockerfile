FROM clamav/clamav-debian:stable


COPY ./clamav/ /etc/clamav/

COPY "./scripts/wrapper-entrypoint.sh" "/wrapper-init"
RUN chmod +x /wrapper-init
ENTRYPOINT [ "/wrapper-init" ]