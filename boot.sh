#! /bin/sh
cd ./rootfs
find . | cpio -o --format=newc > ../rootfs.img
cd ../


qemu-system-x86_64 \
-m 256M \
-kernel ./bzImage \
-initrd  ./rootfs.img \
-nographic \
-append "console=ttyS0 root=/dev/sda rw nokaslr quiet" \
-netdev user,id=t0, -device e1000,netdev=t0,id=nic0 \
-cpu kvm64,+smep,+smap \
-gdb tcp::10086
