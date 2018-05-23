#
# Userspace cpu hotplug support
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := hotplug
LOCAL_SRC_FILES:= $(LOCAL_MODULE).cpp
LOCAL_SHARED_LIBRARIES := liblog 
LOCAL_MODULE_TAGS := debug eng

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := cpu.agent
LOCAL_SRC_FILES := etc/hotplug/$(LOCAL_MODULE)
LOCAL_MODULE_TAGS := debug eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/hotplug

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := 00hotplug
LOCAL_SRC_FILES := etc/init.d/$(LOCAL_MODULE)
LOCAL_MODULE_TAGS := debug eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/init.d

include $(BUILD_PREBUILT)
