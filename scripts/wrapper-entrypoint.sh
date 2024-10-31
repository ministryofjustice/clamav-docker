#!/bin/sh

# Replace the PrivateMirror URL in the freshclam.conf file
sed -i 's|PrivateMirror .*|PrivateMirror '"$MIRROR_URL"'|g' /etc/clamav/freshclam.conf

# Execute the original entrypoint script
exec /init