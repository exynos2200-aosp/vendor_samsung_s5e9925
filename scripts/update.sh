git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --local user.name "github-actions[bot]"
git pull origin ${GHR} --ff-only
echo ${LATEST_VERSION} > current.${MODEL}_${OMC}
git add current.${MODEL}_${OMC}
git add proprietary-files/proprietary.${MODEL}_${OMC}
git add proprietary-firmware/firmware.${MODEL}_${OMC}
git add file_context/file.${MODEL}_${OMC}
git add fs_config/fs.${MODEL}_${OMC}
git commit -m "s5e9925: ${MODEL}: ${LATEST_VERSION}"
git tag "${LATEST_SHORTVERSION}_${OMC}"
