#!/usr/bin/env bash
set -euo pipefail

OUT="../../proprietary-files/proprietary.${MODEL}_${CSC}_${OMC}"
rm -f "$OUT"

cd vendor/firmware

write_section() {
    local header="$1"; shift
    echo "$header" >> "$OUT"
}

append_tee() {
    local title="$1" mode="$2" sha="$3"
    write_section "# $title - from ${MODEL} - ${LATEST_SHORTVERSION}"
    find -type f | sed 's|^\./||' | sort | while read -r b; do
        case "$mode" in
            plain)  echo "vendor/tee/$b${sha:+|$(sha1sum "$b" | awk '{print $1}')}" >> "$OUT" ;;
            custom) echo "vendor/tee/$b:vendor/tee/${MODEL}/$b${sha:+|$(sha1sum "$b" | awk '{print $1}')}" >> "$OUT" ;;
        esac
    done
}

# Normal
cd ../tee && append_tee "TEEgris Firmware" plain 0

# With sha1sum
echo "" >> "$OUT"
cd ../tee && append_tee "TEEgris Firmware" plain 1

# Custom path
echo "" >> "$OUT"
cd ../tee && append_tee "TEEgris Firmware" custom 0
