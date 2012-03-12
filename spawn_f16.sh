#!/usr/bin/bash

IMG=f16_$(date +%F-%k-%M)

echo $IMG

virt-install --connect qemu:///system \
  -l http://download.fedoraproject.org/pub/fedora/linux/releases/16/Fedora/x86_64/os/ \
  -n $IMG \
  --ram 1024 \
  --disk path=/other/libvirt/images/$IMG,size=10 \
  --initrd-inject=my.ks \
  --extra-args "ks=file:/my.ks" \
  --virt-type kvm \
  --os-type linux \
  --os-variant fedora16 \
  --graphics type=vnc \
  -w network=default
