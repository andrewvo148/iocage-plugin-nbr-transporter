#!/bin/sh

PRODUCT='NAKIVO Backup & Replication'
SHA256="fc3d5ccedf8033b57bcfa6abafcdde17baa9bacc1e4872e8ded82750abd04cce"

PRODUCT_ROOT="/usr/local/nakivo"
INSTALL="inst.sh"

CHECKSUM=`sha256 -q $INSTALL`
if [ "$SHA256" != "$CHECKSUM" ]; then
    echo "ERROR: Incorrect $PRODUCT installer checksum"
    rm $INSTALL >/dev/null 2>&1
    exit 2
fi

sh ./$INSTALL -s -i "$PRODUCT_ROOT" --eula-accept 2>&1
if [ $? -ne 0 ]; then
    echo "ERROR: $PRODUCT install failed"
    rm $INSTALL >/dev/null 2>&1
    exit 3
fi
rm $INSTALL >/dev/null 2>&1

exit 0


