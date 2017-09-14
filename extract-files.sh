#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

DEVICE=griffin
VENDOR=motorola

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../..

HELPER="$CM_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$CM_ROOT"

extract "$MY_DIR"/proprietary-files.txt "$SRC"

"$MY_DIR"/setup-makefiles.sh

VENDOR_ROOT="$CM_ROOT/vendor/$VENDOR/$DEVICE/proprietary"

sed -i "s/libgui.so/libHui.so/" "$VENDOR_ROOT/vendor/lib64/libHui.so"
sed -i "s/libgui.so/libHui.so/" "$VENDOR_ROOT/vendor/lib64/lib-imsvt.so"
sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/vendor/lib64/libHu.so"
sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/vendor/lib64/libHui.so"
sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/vendor/lib64/lib-imsvt.so"
sed -i "s/libgui.so/libHui.so/" "$VENDOR_ROOT/vendor/lib/lib-imsvt.so"
sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/vendor/lib/lib-imsvt.so"

sed -i "s/libgui.so/libHui.so/" "$VENDOR_ROOT/vendor/lib/libHui.so"
sed -i "s/libgui.so/libHui.so/" "$VENDOR_ROOT/vendor/lib/libmot_gpu_mapper.so"

sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/vendor/lib/libHu.so"
sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/vendor/lib/libmot_gpu_mapper.so"
sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/vendor/lib/libHui.so"

sed -i "s/libui.so/libHu.so/" "$VENDOR_ROOT/lib/hw/camera.msm8996.so"
sed -i "s/libgui.so/libHui.so/" "$VENDOR_ROOT/lib/hw/camera.msm8996.so"

sed -i "s/libprotobuf-cpp-lite.so/libprotobuf-cpp-Hlit.so/" "$VENDOR_ROOT/vendor/lib/libprotobuf-cpp-Hlit.so"
sed -i "s/libprotobuf-cpp-lite.so/libprotobuf-cpp-Hlit.so/" "$VENDOR_ROOT/vendor/lib/libcne.so"
sed -i "s/libprotobuf-cpp-lite.so/libprotobuf-cpp-Hlit.so/" "$VENDOR_ROOT/vendor/lib/libcneapiclient.so"
sed -i "s/libprotobuf-cpp-lite.so/libprotobuf-cpp-Hlit.so/" "$VENDOR_ROOT/vendor/lib64/libprotobuf-cpp-Hlit.so"
sed -i "s/libprotobuf-cpp-lite.so/libprotobuf-cpp-Hlit.so/" "$VENDOR_ROOT/vendor/lib64/libcne.so"
sed -i "s/libprotobuf-cpp-lite.so/libprotobuf-cpp-Hlit.so/" "$VENDOR_ROOT/vendor/lib64/libcneapiclient.so"
sed -i "s/libprotobuf-cpp-lite.so/libprotobuf-cpp-Hlit.so/" "$VENDOR_ROOT/bin/cnd"

sed -i "s/libprotobuf-cpp-full.so/libprotobuf-cpp-shit.so/" "$VENDOR_ROOT/vendor/lib/libsettings.so"
sed -i "s/libprotobuf-cpp-full.so/libprotobuf-cpp-shit.so/" "$VENDOR_ROOT/vendor/lib/libprotobuf-cpp-shit.so"
sed -i "s/libprotobuf-cpp-full.so/libprotobuf-cpp-shit.so/" "$VENDOR_ROOT/vendor/lib64/libsettings.so"
sed -i "s/libprotobuf-cpp-full.so/libprotobuf-cpp-shit.so/" "$VENDOR_ROOT/vendor/lib64/libprotobuf-cpp-shit.so"
echo "Patching libprotobuf-cpp-full.so is done But you need 2.6.1 protobuf with 3.0.0 version on external/protobuf/src/google/protobuf/stubs/common.h"
