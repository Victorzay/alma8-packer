#!/bin/bash

# Install elrepo
dnf install -y elrepo
# Install new kernel
yum --enablerepo elrepo-kernel install kernel-lt kernel-lt-headers -y
# Remove older kernels (Only for demo! Not Production!)
# rm -f /boot/*3.10*
# Update GRUB
# grub2-mkconfig -o /boot/grub2/grub.cfg
# grub2-set-default 0
# echo "Grub update done."
# Reboot VM
shutdown -r now
