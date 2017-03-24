#!/usr/bin/env bash
# This script creates proprietary /usr/bin/azkaban-* executables which run associated script
# Note that symlinks are not an option since azkaban's scripts cannot then resolve it's configs

DESTDIR="$1"
AZKABAN_TYPE="$2"

if test -z $DESTDIR || test -z $AZKABAN_TYPE || test -z $MAKELEVEL; then
    echo "Please use 'make deb' instead" >&2
    exit 1
fi

ORIG_BIN="$DESTDIR/usr/share/$AZKABAN_TYPE/bin"

for SCRIPT in `ls "$ORIG_BIN"`; do

    BIN_NAME="$DESTDIR/usr/bin/${SCRIPT/.sh}"

    tee -a "$BIN_NAME" << EOF
#!/usr/bin/env bash

# Currently in \$DESTDIR/usr/bin ..
# Must be relative beause of possible usage of \$DESTDIR!
\$(dirname \$0)/../share/$AZKABAN_TYPE/bin/$SCRIPT

EOF

    chmod +x "$BIN_NAME"

done
