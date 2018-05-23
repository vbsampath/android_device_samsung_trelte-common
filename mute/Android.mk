#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(BOARD_USE_MUTE_WORKAROUND),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := unmute-incall-audio
LOCAL_SRC_FILES:= $(LOCAL_MODULE).cpp
LOCAL_MODULE_TAGS := debug eng
LOCAL_SHARED_LIBRARIES:= libmedia

include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)

LOCAL_MODULE := 99unmute-incall-audio
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := debug eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/init.d

include $(BUILD_PREBUILT)

endif
