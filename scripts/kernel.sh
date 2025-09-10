FILES=( "boot.img.lz4" "dtbo.img.lz4" "vbmeta.img.lz4" "vendor_boot.img.lz4" )

for f in "${FILES[@]}"; do
    tar xvf ${AP_TAR} ${f}
done

FILES="boot dtbo vbmeta vendor_boot"
tar cvf ${LATEST_SHORTVERSION}_kernel.tar ${FILES}.img.lz4
rm -f $FILES
