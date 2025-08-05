mkdir -p vendor/mount vendor/tee
sudo mount vendor.img vendor/mount
cp -rfa vendor/mount/tee vendor
cd vendor
zip -r0 --store ${LATEST_SHORTVERSION}_tee.zip "tee"
mv -f ${LATEST_SHORTVERSION}_tee.zip ../
