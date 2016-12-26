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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Motorola
TARGET_USES_MOTOROLA_LOG := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include
DEVICE_PATH := device/motorola/griffin

# Arch
BOARD_VENDOR := motorola-qcom
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := kryo
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_NO_BOOTLOADER := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 5704253440
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 0xD5B07B000
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true


# Display
HAVE_ADRENO_SOURCE:= false
BOARD_USES_ADRENO := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true


# Kernel
BOARD_KERNEL_BASE := 0x80000000
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=32M@0-0xffffffff
BOARD_KERNEL_CMDLINE += cnsscore.pcie_link_down_panic=1

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
TARGET_KERNEL_ARCH := arm64
# TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := griffin_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/msm8996
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-androidkernel-

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530
TARGET_BOOTLOADER_BOARD_NAME := griffin
TARGET_NO_RADIOIMAGE := true
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/ #### THIS SEEMS WRONG
TARGET_USES_64_BIT_BINDER := true
BOARD_USES_QC_TIME_SERVICES := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_griffin
TARGET_RECOVERY_DEVICE_MODULES := libinit_griffin
TARGET_UNIFIED_DEVICE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
#AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Keystore
TARGET_PROVIDES_KEYMASTER := true

# Ril
TARGET_RIL_VARIANT := caf

# NFC
BOARD_NFC_CHIPSET := pn547

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_MODULE_PATH 		 := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME			 := "wlan"

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAS_QCA_BT_ROME := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true
QCOM_BT_USE_SMD_TTY := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_CAMERA_APP := Camera2

# TWRP
# RECOVERY_VARIANT := twrp
# TW_THEME := portrait_hdpi
# RECOVERY_SDCARD_ON_DATA := true
# TW_SCREEN_BLANK_ON_BOOT := true
# TARGET_RECOVERY_QCOM_RTC_FIX := true
# TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
# TW_DEFAULT_BRIGHTNESS := 80
# TW_INCLUDE_NTFS_3G := true
# TW_INCLUDE_CRYPTO := true
# TW_NO_USB_STORAGE := true
# TW_USE_TOOLBOX    := true

# Sensors
USE_SENSOR_MULTI_HAL := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += hardware/cyanogen/cmhw

# FM
TARGET_QCOM_NO_FM_FIRMWARE := true
