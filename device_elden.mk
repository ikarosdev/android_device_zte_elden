$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/elden/elden-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/elden/overlay

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

LOCAL_PATH := device/zte/elden
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/ramdisk/icon_ftm.png:root/icon_ftm.png \
        $(LOCAL_PATH)/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
        $(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
        $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.qcom.rc \
        $(LOCAL_PATH)/ramdisk/logo.bmp:root/logo.bmp

$(call inherit-product, build/target/product/full.mk)

#LLVM for RenderScript
LLVM_ROOT_PATH := external/llvm

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Audio
PRODUCT_PACKAGES += \
        alsa.msm8960 \
        audio.a2dp.default \
        audio.primary.msm8960 \
        audio_policy.msm8960 \
        libalsa-intf \
        libaudioparameter \
        libaudioutils

# Camera
PRODUCT_PACKAGES += \
        camera.msm8960

# WIFI
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_cfg.dat:/system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
        $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
        $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
        $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
        $(LOCAL_PATH)/prebuilt/lib/modules/wlan.ko:system/lib/modules/wlan.ko

# Graphics
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/bin/gpu_dcvsd:system/bin/gpu_dcvsd \
        $(LOCAL_PATH)/prebuilt/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
        $(LOCAL_PATH)/prebuilt/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
        $(LOCAL_PATH)/prebuilt/lib/libadreno_utils.so:system/lib/libadreno_utils.so \
        $(LOCAL_PATH)/prebuilt/lib/libc2d2_a3xx.so:system/lib/libc2d2_a3xx.so \
        $(LOCAL_PATH)/prebuilt/lib/libc2d2_z180.so:system/lib/libc2d2_z180.so \
        $(LOCAL_PATH)/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
        $(LOCAL_PATH)/prebuilt/lib/libCB.so:system/lib/libCB.so \
        $(LOCAL_PATH)/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
        $(LOCAL_PATH)/prebuilt/lib/libllvm-a3xx.so:system/lib/libllvm-a3xx.so \
        $(LOCAL_PATH)/prebuilt/lib/libllvm-arm.so:system/lib/libllvm-arm.so \
        $(LOCAL_PATH)/prebuilt/lib/libOpenCL.so:system/lib/libOpenCL.so \
        $(LOCAL_PATH)/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
        $(LOCAL_PATH)/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
        $(LOCAL_PATH)/prebuilt/lib/libsc-a3xx.so:system/lib/libsc-a3xx.so


# EGL
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
        $(LOCAL_PATH)/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
        $(LOCAL_PATH)/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
        $(LOCAL_PATH)/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
        $(LOCAL_PATH)/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
        $(LOCAL_PATH)/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so


# Qualcomm scripts
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.modem_links.sh:/system/etc/init.qcom.modem_links.sh \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.post_boot.sh:/system/etc/init.qcom.post_boot.sh \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.post_boot_ftm.sh:/system/etc/init.qcom.post_boot_ftm.sh \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.sdio.sh:/system/etc/init.qcom.sdio.sh \
        $(LOCAL_PATH)/prebuilt/etc/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh

# Vold
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# APN
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/etc/apns-conf.xml:/system/etc/apns-conf.xml

#GPS
PRODUCT_PACKAGES += \
        gps.default \
        libgps.utils \
        libloc_adapter \
        libloc_eng \
        libloc_api_v02 \
	libloc_api-rpc-qc

# Graphics
PRODUCT_PACKAGES += \
        copybit.msm8960 \
        gralloc.msm8960 \
        hwcomposer.msm8960 \
        libgenlock \
        libmemalloc \
        liboverlay \
	libI420colorconvert \
        libc2dcolorconvert \
        libtilerenderer \
        libQcomUI

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs

# HDMI
PRODUCT_PACKAGES += \
        hdmid

# Lights
PRODUCT_PACKAGES += \
        lights.msm8960

# OMX
PRODUCT_PACKAGES += \
        libdivxdrmdecrypt \
        liblasic \
        libmm-omxcore \
        libOmxCore \
        libOmxVdec \
        libOmxVenc \
        libOmxVidEnc \
        libstagefrighthw \
        ast-mm-vdec-omx-test \
        mm-vdec-omx-property-mgr \
        mm-vdec-omx-test \
        mm-venc-omx-test720p \
        mm-video-driver-test \
        mm-video-encdrv-test

# Sensors
PRODUCT_PACKAGES += \
        sensors.msm8960

# USB
PRODUCT_PACKAGES += \
        com.android.future.usb.accessory

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
        ro.feature.ztedrm.support=1 \
        ril.subscription.types=NV \
        persist.sys.usb.menu=enable \
        persist.sys.usb.config=mtp \
        ro.config.sec_storage=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_elden
PRODUCT_DEVICE := elden
