#!/opt/homebrew/bin/bash
#
# Script to burn ISO files to a USB drive
#
##########################################
if test -z "${1}"; then
  echo "please provide a path to the iso file"
  exit 1
fi

hdiutil convert -format UDRW -o /tmp/image.img "${1}"
mv /tmp/image.img.dmg /tmp/image.img
diskutil list
echo "Enter ID of disk (e.g. 4)"
read -r id
diskutil unmountDisk "/dev/disk${id}"
sudo dd if=/tmp/image.img of="/dev/rdisk${id}" bs=1m
sync
diskutil eject "/dev/disk${id}"
