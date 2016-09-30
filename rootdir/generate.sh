#!/bin/bash
FILES=etc/*
rm Android.mk
rm init.mk
echo "LOCAL_PATH           := \$(call my-dir)" >> Android.mk
echo "" >> Android.mk
echo "# Init scripts" >> Android.mk
echo "">> Android.mk


echo "PRODUCT_PACKAGES += \\" >> init.mk

for f in $FILES
do
  NEW=$(echo "$f" | cut -c 5-100)


  echo "    $NEW \\" >> init.mk

  echo "include \$(CLEAR_VARS)">> Android.mk
  echo "LOCAL_MODULE       := $NEW">> Android.mk
  echo "LOCAL_MODULE_TAGS  := optional eng">> Android.mk

  if [[ "$NEW" == *sh ]]
  then
    echo "LOCAL_MODULE_CLASS := EXECUTABLES">> Android.mk
  else
    echo "LOCAL_MODULE_CLASS := ETC">> Android.mk
  fi

  echo "LOCAL_SRC_FILES    := etc/$NEW">> Android.mk
  echo "LOCAL_MODULE_PATH  := \$(TARGET_ROOT_OUT)">> Android.mk
  echo "include \$(BUILD_PREBUILT)">> Android.mk
  echo "" >> Android.mk
  # take action on each file. $f store current file name
done
