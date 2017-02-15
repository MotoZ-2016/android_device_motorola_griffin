#!/bin/bash

set -e

DEVICE=griffin
VENDOR=motorola

INITIAL_COPYRIGHT_YEAR=2017

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../..

HELPER="$CM_ROOT"/vendor/cm/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$CM_ROOT"

# Copyright headers and guards
write_headers

# The blobs
write_makefiles "$MY_DIR"/proprietary-files.txt

printf '\n%s\n' "\$(call inherit-product, vendor/qcom/binaries/bluetooth/bluetooth-vendor.mk)" >> "$PRODUCTMK"
printf '\n%s\n' "\$(call inherit-product, vendor/qcom/binaries/msm8996/graphics/graphics-vendor.mk)" >> "$PRODUCTMK"

# We are done!
write_footers

