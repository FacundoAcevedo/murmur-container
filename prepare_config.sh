#!/bin/sh
set -e

INI_DESTINATION="/data/murmur.ini"
# Set correct volume permissions
if [ "$(stat -c %u /data)" != "murmur" ]
then
    chown -R murmur:murmur /data
fi

#Copy mumble config to the volume
#Sed a little to make it work
if [ ! -f /data/murmur.ini ]
then
    cp /etc/murmur.ini ${INI_DESTINATION}
    chown murmur:murmur ${INI_DESTINATION}
    chmod o-rwx ${INI_DESTINATION}
    echo "Mumble-server's configuration has been created."
    echo "Replacing paths..."
    sed -i 's/var.log.murmur/data/' ${INI_DESTINATION}
    sed -i 's/var.lib.murmur/data/' ${INI_DESTINATION}
fi