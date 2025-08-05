mkdir bl
cd bl
tar xvf ../${BL_TAR}
tar xvf ../${CP_TAR}
lz4 -d -m *.lz4
rm -rf *.lz4
for i in *; do
    mv $i ${i}_${MODEL}
done

rm -f "vbmeta.img"

zip -r0 --store "../${LATEST_SHORTVERSION}_BL_CP-los.zip" .

[ -f "../proprietary-firmware/firmware.${MODEL}_${OMC}" ] && rm -f "../proprietary-firmware/firmware.${MODEL}_${OMC}"

{
    echo "# Firmware for model ${MODEL} - from Samsung package version ${LATEST_SHORTVERSION}"
    echo ""
    sha1sum * | awk '{print $2 "|" $1}'
    echo ""
} >> "../proprietary-firmware/firmware.${MODEL}_${OMC}"

echo "${LATEST_SHORTVERSION}" >> "version_${MODEL}"
{
    echo "# Files containing Samsung package version for supported models"
    sha1sum "version_${MODEL}" | awk '{print $2 "|" $1}'
} >> "../proprietary-firmware/firmware.${MODEL}_${OMC}"
