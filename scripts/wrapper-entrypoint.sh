#!/bin/sh
ls -ld /var/lib/clamav

# Check if MIRROR_URL is defined and not empty
if [ -n "$MIRROR_URL" ]
then
    # MIRROR_URL is defined
    # Uncomment the PrivateMirror line and replace mirror1.example.com with the provided MIRROR_URL
    sed -i 's|#PrivateMirror mirror1.example.com|PrivateMirror '"$MIRROR_URL"'|g' /etc/clamav/freshclam.conf
fi

# Execute the original entrypoint script
exec /init