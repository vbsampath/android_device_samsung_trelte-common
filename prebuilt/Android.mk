LOCAL_PATH := $(call my-dir)

#
# Simple script to mount /system read-write
#
include $(CLEAR_VARS)

LOCAL_MODULE := sysrw
LOCAL_SRC_FILES := bin/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

#
# Show the current CPU frequency variables
#
include $(CLEAR_VARS)

LOCAL_MODULE := showcpu
LOCAL_SRC_FILES := bin/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)
