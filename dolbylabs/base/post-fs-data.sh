#!/system/bin/sh
MODDIR=${0%/*}


# Dolby Atmos™ environment preparation
# gh


# Mount relevant partitions rw:

mount -o rw,remount /data 2>/dev/null


# Switch SELinux to Permissive Mode if in Enforcing Mode:

(
  selinux=`getenforce`
  if [ "$selinux" == "Enforcing" ]; then
    setenforce 0 2>/dev/null
  fi
)&


# Create database directory for Dolby, if necessary:

(
  if [ ! -d /data/vendor/dolby ]; then
    mkdir -p /data/vendor/dolby
    chmod 0770 /data/vendor/dolby
    chown 1013.1013 /data/vendor/dolby
    chcon u:object_r:vendor_data_file:s0 /data/vendor/dolby
  fi
)&
