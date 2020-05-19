LOCAL_PATH := device/samsung/trelte-common

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos5433
BOARD_VENDOR := samsung

BOARD_KERNEL_CMDLINE := selinux=0

# Binder
TARGET_USES_64_BIT_BINDER := true

# Inherit board specific defines
-include device/samsung/trelte-common/board/*.mk


