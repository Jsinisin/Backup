sudo modprobe zram && sudo bash -c 'echo "zstd" > /sys/block/zram0/comp_algorithm' && sudo bash -c 'echo "8G" > /sys/block/zram0/disksize' && mkswap --label zram0 /dev/zram0 && swapon --priority 100 /dev/zram0 && sudo 'echo "options zram num_devices=1" > /etc/modules-load.d/zram.conf' && sudo 'echo "ACTION=="add", KERNEL=="zram0", ATTR{comp_algorithm}="zstd", ATTR{disksize}="8G", RUN="/usr/bin/mkswap -U clear /dev/%k", TAG+="systemd" > /etc/udev/rules.d/99-zram.rules'
