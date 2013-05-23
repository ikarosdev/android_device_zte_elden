
# Copyright (C) 2009 The Android Open Source Project
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

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

#USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/zte/elden/BoardConfigVendor.mk

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Includes
#TARGET_SPECIFIC_HEADER_PATH += device/zte/elden/include

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 loglevel=7 kgsl.mmutype=gpummu
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01300000
BOARD_KERNEL_PAGESIZE := 2048


TARGET_PREBUILT_KERNEL := device/zte/elden/kernel
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_FPU := neon
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_BOOTLOADER_BOARD_NAME := elden
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# PMEM
BOARD_NEEDS_MEMORYHEAPPMEM := true

#TARGET_USES_SF_BYPASS := true
#TARGET_USES_OVERLAY := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_ION_AUDIO := true
BOARD_USES_SRS_TRUEMEDIA := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# Display/Video
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ROTATOR_KERNEL_FORMATS
TARGET_NO_HW_VSYNC := true
TARGET_QCOM_HDMI_OUT := true
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
BOARD_EGL_CFG := device/zte/elden/prebuilts/lib/egl/egl.cfg

# FM Radio
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFAGS += -DHAVE_FM_RADIO

# GPS
#BOARD_USES_QCOM_GPS := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# JIT / Optimizations
WITH_DEXPREOPT := true
JS_ENGINE := v8

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_MODULE_NAME := wlan
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION := VER_0_8_X

TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
#TARGET_KERNEL_CONFIG := msm8960-elden_defconfig
#TARGET_PROVIDES_INIT_RC := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 480018432
BOARD_CACHEIMAGE_PARTITION_SIZE := 318767104
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2793406464
BOARD_PERSISTIMAGE_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_SDCARD_INTERNAL := true
#BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/vold/179:32

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/elden/recovery/kernel
BOARD_CUSTOM_GRAPHICS := ../../../device/zte/elden/recovery/graphics.c

# USB
BOARD_CUSTOM_USB_CONTROLLER := ../../device/zte/elden/UsbController.cpp
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

#TARGET_PROVIDES_RELEASETOOLS := true
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT :=
