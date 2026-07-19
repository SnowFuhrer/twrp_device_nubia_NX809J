LOCAL_PATH := device/nubia/NX809J

# A/B support
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true


PRODUCT_CHECK_PREBUILT_MAX_PAGE_SIZE := false
PRODUCT_ENABLE_UFFD_GC := true

# Virtual A/B
#ENABLE_VIRTUAL_AB := true

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd
    
# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Copy recovery files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# Copy TWRP specific filesystem flags
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.flags:/root/system/etc/twrp.flags

TARGET_RECOVERY_DEVICE_MODULES += \
    vendor.qti.hardware.display.config-V7-ndk.so \
    android.hardware.common-V2-ndk.so \

# Shipping API level
BOARD_SHIPPING_API_LEVEL := 36
PRODUCT_SHIPPING_API_LEVEL := 36
PRODUCT_TARGET_VNDK_VERSION := 36
