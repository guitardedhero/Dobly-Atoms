#!/system/bin/sh


# Dolby Atmos™ partition file restoration
# gh


mount_filesystems() {
  mount -o rw,remount / 2>/dev/null
  if [ "$BOOTMODE" ]; then
    mirror=/sbin/.magisk/mirror
    sysroot=$mirror/system_root
    sys=$(realpath $mirror/system)
    ven=$(realpath $mirror/vendor)
    mount -o rw,remount $sysroot 2>/dev/null
    mount -o rw,remount $sys 2>/dev/null
    mount -o rw,remount $ven 2>/dev/null
  else
    mount -o rw,remount /system
    mount -o rw,remount /vendor 2>/dev/null
    sys=/system
    if [ -L /vendor ]; then
      ven=$sys/vendor
    else
      ven=/vendor
    fi
  fi
}

backup=.bak
filecontexts=$ven/etc/selinux/vendor_file_contexts
servicecontexts=$ven/etc/selinux/vendor_hwservice_contexts
manifest=$sys/etc/vintf/manifest.xml
for file in $filecontexts $servicecontexts $manifest; do
  if [ -e "$file$backup" ]; then
    mv -f $file$backup $file
  fi
done

mount -o ro,remount /system 2>/dev/null
mount -o ro,remount /vendor 2>/dev/null
