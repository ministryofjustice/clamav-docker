#!/bin/sh
ls -ld /var/lib/clamav

# Check if MIRROR_URL is defined and not empty
if [ -n "$MIRROR_URL" ]
then
    # MIRROR_URL is defined, replace the PrivateMirror URL in the freshclam.conf file
    sed -i 's|PrivateMirror .*|PrivateMirror '"$MIRROR_URL"'|g' /etc/clamav/freshclam.conf
else
    # MIRROR_URL is not defined, comment out the PrivateMirror line
    sed -i 's|^PrivateMirror|## PrivateMirror|g' /etc/clamav/freshclam.conf
fi

# Execute the original entrypoint script
exec /init