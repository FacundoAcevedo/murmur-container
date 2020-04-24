#!/bin/sh
set -x
set -e

# Remove unnecessary user accounts.
sed -i -r '/^(murmur|root)/!d' /etc/group
sed -i -r '/^(murmur|root)/!d' /etc/passwd
sed -i -r '/^(murmur|root)/!d' /etc/shadow

sysdirs="
/bin
/etc
/lib
/sbin
/usr
"
for i in ${sysdirs}; do
    find "${i}" -xdev -type d \
    -exec chown root:root {} \; \
    -exec chmod 0755 {} \;
done



