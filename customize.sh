SKIPUNZIP=1

# Dolby Atmos™ operations
# gh

unzip -qqo "$ZIPFILE" module.prop -d $MODPATH >&2
unzip -qqo "$ZIPFILE" functions -d $TMPDIR >&2

source $TMPDIR/functions

go
