VS=$(echo ${AP_TAR} | cut -d'_' -f3)
VC=$(echo ${CSC_TAR} | cut -d'_' -f4)
[[ $VS == "${LATEST_SHORTVERSION}" ]]
[[ $VC == "${LATEST_CSCVERSION}" ]]
echo "PDA version: $VS" >> "versions.txt"
echo "CSC version: $VC" >> "versions.txt"
