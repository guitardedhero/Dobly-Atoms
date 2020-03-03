#!/system/bin/sh


# Dolby Atmos™ service control
# gh


(
  killall audioserver 2>/dev/null
)&

(
  sleep 2
  /vendor/bin/hw/vendor.dolby.hardware.dms@1.0-service 2>/dev/null
)&
