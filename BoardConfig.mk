# BoardConfig.mk for TWRP - Nubia Red Magic 11 Pro (NX809J)
DEVICE_PATH := device/nubia/NX809J
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN
BUILD_BROKEN_PLUGIN_VALIDATION := soong-libaosprecovery_defaults soong-libguitwrp_defaults soong-libminuitwrp_defaults soong-vold_defaults

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := oryon

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_RELEASE_NAME)
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := canoe
TARGET_BOARD_PLATFORM_GPU := qcom-adreno840
QCOM_BOARD_PLATFORMS += sm8850

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true


# Partitions - A/B
AB_OTA_UPDATER := true
TARGET_VIRTUAL_AB_OTA := true
TARGET_VIRTUAL_AB_OTA_COMPRESSION := true
TARGET_VIRTUAL_AB_OTA_RETROFIT := false
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    odm \
    product \
    recovery \
    system \
    system_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
    vendor_dlkm

# Partitions - Dynamic
BOARD_SUPER_PARTITION_SIZE := 19327352832
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm system_dlkm odm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 19323158528
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Dynamic Partition / Logical Tools
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true

# Partitions - Sizes
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_HAS_NO_REAL_SDCARD := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 0
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Crypto
BOARD_USES_METADATA_PARTITION   := true
TW_INCLUDE_CRYPTO               := true
TW_INCLUDE_OMAPI                := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Userdata
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# TWRP Configuration
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm goodix_fp nubia_tgk_aw_sar1_ch0 nubia_tgk_aw_sar0_ch0 pmic_resin"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_EXCLUDE_DEFAULT_USB_INIT := false
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1200
TW_NO_SCREEN_BLANK := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_APEX := true
TW_FRAMERATE := 120
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.bootimage.build.date.utc=ro.build.date.utc;ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"
#TW_BACKUP_EXCLUSIONS := /data/fonts
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_CUSTOM_VIBRATION_FILE := "/sys/devices/platform/soc/9c0000.qcom,qupv3_i2c_geni_se/990000.i2c/i2c-25/25-005a/leds/zte_vibrator/activate"
TW_DEVICE_VERSION := Nubia-NX809J
#screen


# Space Saving (100MB Partition Limit)
BOARD_RAMDISK_USE_LZ4 := true
TW_THEME := portrait_hdpi

# Keep languages for accessibility
TW_EXTRA_LANGUAGES := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_EXCLUDE_MTP := true

TW_SCREEN_W := 1216
TW_SCREEN_H := 2688
TARGET_SCREEN_WIDTH := 1216
TARGET_SCREEN_HEIGHT := 2688
