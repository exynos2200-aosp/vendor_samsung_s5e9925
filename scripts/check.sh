version_short=$(echo ${AP_TAR} | cut -d'_' -f3)
version_csc=$(echo ${CSC_TAR} | cut -d'_' -f4)
version_modem=$(echo ${CP_TAR} | cut -d'_' -f3)
[[ $version_short == "${LATEST_SHORTVERSION}" ]]
[[ $version_csc == "${LATEST_CSCVERSION}" ]]
[[ $version_modem == "${LATEST_MODEMVERSION}" ]]
echo "PDA version: $version_short" >> "versions.txt"
echo "CSC version: $version_csc" >> "versions.txt"
echo "Modem version: $version_modem" >> "versions.txt"
