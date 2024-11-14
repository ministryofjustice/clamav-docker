#!/bin/sh
ls -ld /var/lib/clamav
chown -R clamav:clamav /var/lib/clamav
# Replace the PrivateMirror URL in the freshclam.conf file
sed -i 's|PrivateMirror .*|PrivateMirror '"$MIRROR_URL"'|g' /etc/clamav/freshclam.conf

# Execute the original entrypoint script
exec /init