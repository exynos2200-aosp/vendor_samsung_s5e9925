tar xvf ${AP_TAR} vbmeta.img.lz4
lz4 -d vbmeta.img.lz4 vbmeta.img
rm vbmeta.img.lz4
printf "$(printf '\\x%02X' 3)" | dd of="vbmeta.img" bs=1 seek=123 count=1 conv=notrunc &> /dev/null
tar cvf ${LATEST_SHORTVERSION}_patched_vbmeta.tar vbmeta.img
rm vbmeta.img
