FILES=( "boot.img.lz4" "dtbo.img.lz4" "vbmeta.img.lz4" "vendor_boot.img.lz4" )

for f in "${FILES[@]}"; do
    tar xvf ${AP_TAR} ${f}
    lz4 -d ${f} >/dev/null 2>&1
done

FILES="boot.img dtbo.img vbmeta.img vendor_boot.img"
tar cvf ${LATEST_SHORTVERSION}_kernel.tar $FILES
rm -f $FILES
