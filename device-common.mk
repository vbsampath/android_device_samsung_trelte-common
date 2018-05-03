LOCAL_PATH := device/samsung/trelte-common

# ADB
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
		
# hwui
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/trelte-common/overlay
	
# Inherit products
-include $(LOCAL_PATH)/product/*.mk

# Copy files
-include $(LOCAL_PATH)/copy/*.mk

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Samsung LSI BSP
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos5433/exynos5433.mk)

# Inherit vendor specific elements
$(call inherit-product, vendor/samsung/trelte-common/trelte-common-vendor.mk)
