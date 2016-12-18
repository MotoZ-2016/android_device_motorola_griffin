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


$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/motorola/griffin/griffin-vendor.mk)
# $(call inherit-product, vendor/qcom/binaries/msm8996/graphics/graphics-vendor.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/rootdir/init.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Include package config fragments
include $(LOCAL_PATH)/product/*.mk

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# Device was launched with M
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

## UNTESTED ITEMS BELOW
# Camera
PRODUCT_PACKAGES += \
    Camera2 \
    libshim_camera \
    libcamera_shim

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# NFC
PRODUCT_PACKAGES += \
	libnfc \
	libnfc_jni \
	nfc_nci.pn54x.default \
    com.android.nfc_extras \
    com.nxp.nfc.nq \
    libnqnfc-nci \
	libp61-jcop-kit \
    nfc_nci.nqx.default \
    NQNfcNci \
	NfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
	$(LOCAL_PATH)/configs/nfc/libnfc-nxp_ds.conf:system/etc/libnfc-nxp_ds.conf


# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fpc1020.kl:system/usr/keylayout/fpc1020.kl \
    $(LOCAL_PATH)/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics.kl


# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config \
		$(LOCAL_PATH)/configs/dsi_config.xml:system/etc/data/dsi_config.xml \
		$(LOCAL_PATH)/configs/qmi_config.xml:system/etc/data/qmi_config.xml \
		$(LOCAL_PATH)/configs/netmgr_config.xml:system/etc/data/netmgr_config.xml


# Memory
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-hwui-memory.mk)

#GreyBus
PRODUCT_PACKAGES += \
    greybus

#V4L2_HAL
PRODUCT_PACKAGES += \
    v4l2_hal

# CMActions
PRODUCT_PACKAGES += \
    CMActions

# DRM
PRODUCT_PACKAGES += \
	libprotobuf-cpp-lite

# Ebtables
PRODUCT_PACKAGES += \
   ebtables \
   ethertypes \
   libebtc
