# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := elden

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/elden/device_elden.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := elden
PRODUCT_NAME := cm_elden
PRODUCT_BRAND := zte
PRODUCT_MODEL := elden
PRODUCT_MANUFACTURER := zte

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="ZTE/N9120_METROPCS_USA/elden:4.0.4/IMM76I/20121119.142646.21040:user/release-keys" \
    PRIVATE_BUILD_DESC="N9120_METROPCS_USA-user 4.0.4 IMM76I 20121119.142646.21040 release-keys"
