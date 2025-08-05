mkdir -p vendor/firmware 
cp -rfa vendor/mount/firmware vendor
cd vendor
zip -r0 --store ${LATEST_SHORTVERSION}_firmware.zip "firmware"
mv -f ${LATEST_SHORTVERSION}_firmware.zip ../
cd ../
