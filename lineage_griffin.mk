#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# for specific
$(call inherit-product, vendor/motorola/griffin/griffin-vendor.mk)
$(call inherit-product, device/motorola/griffin/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/motorola/griffin/overlay

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
TARGET_BOOTANIMATION_HALF_RES := true

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_NAME := lineage_griffin
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := griffin
PRODUCT_MODEL := Moto Z
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola

TARGET_VENDOR_PRODUCT_NAME := griffin_retail
TARGET_VENDOR_DEVICE_NAME := griffin

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="griffin-user 8.0.0 OPL27.76-51 58 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := motorola/griffin/griffin:8.0.0/OPL27.76-51/58:user/release-keys
TARGET_VENDOR := motorola
