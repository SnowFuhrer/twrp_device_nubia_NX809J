# Inherit from AOSP
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Inherit from device
$(call inherit-product, device/nubia/NX809J/device.mk)

# Device identifiers
PRODUCT_DEVICE := NX809J
PRODUCT_NAME := twrp_NX809J
PRODUCT_BRAND := REDMAGIC
PRODUCT_MODEL := Red Magic 11 Pro
PRODUCT_MANUFACTURER := nubia

