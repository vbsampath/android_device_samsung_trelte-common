ifeq ($(BOARD_USE_USER_GOVERNOR),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := governor.conf.default
LOCAL_SRC_FILES := etc/governor/$(LOCAL_MODULE)
LOCAL_MODULE_TAGS := debug eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/governor

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := governor.conf.experimental
LOCAL_SRC_FILES := etc/governor/$(LOCAL_MODULE)
LOCAL_MODULE_TAGS := debug eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/governor

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := 00governor
LOCAL_SRC_FILES := etc/init.d/$(LOCAL_MODULE)
LOCAL_MODULE_TAGS := debug eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/init.d

include $(BUILD_PREBUILT)

endif
