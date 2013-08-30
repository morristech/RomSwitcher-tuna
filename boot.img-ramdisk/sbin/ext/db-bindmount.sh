#!/sbin/busybox sh

mkdir -p /1stdata/dual/2nddata
mount --bind /1stdata/dual/2nddata /data
mount --bind /1stdata/app /data/app

mount -o remount,rw /system
/sbin/busybox mount -t rootfs -o remount,rw rootfs

chmod 771 /1stdata
chmod 755 /system

mv -f /res/app/* /system/app/
chmod 0644 /system/app/*.apk

/sbin/busybox mount -t rootfs -o remount,ro rootfs
mount -o remount,ro /system
