FROM clamav/clamav:1.4.1-11


COPY ./clamav/ /etc/clamav/

COPY "./scripts/wrapper-entrypoint.sh" "/wrapper-init"
RUN chmod +x /wrapper-init
ENTRYPOINT [ "/wrapper-init" ]