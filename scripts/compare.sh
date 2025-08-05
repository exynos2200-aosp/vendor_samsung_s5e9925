need_update=0
latest=$(curl --retry 5 --retry-delay 5 http://fota-cloud-dn.ospserver.net/firmware/${CSC}/${MODEL}/version.xml \
  | grep latest | sed 's/^[^>]*>//' | sed 's/<.*//')
latest_short=$(echo $latest | cut -d'/' -f1)
latest_csc=$(echo $latest | cut -d'/' -f2)
latest_modem=$(echo $latest | cut -d'/' -f3)
current=$(cat current.${MODEL}_${OMC}) || need_update=1
[[ $latest != $current ]] && need_update=1

echo "latest_version=$latest" >> $GITHUB_ENV
echo "latest_shortversion=$latest_short" >> $GITHUB_ENV
echo "latest_cscversion=$latest_csc" >> $GITHUB_ENV
echo "latest_modemversion=$latest_modem" >> $GITHUB_ENV
echo "need_update=$need_update" >> $GITHUB_ENV
