LOCAL_PATH := $(call my-dir)

ifneq ($(filter msm8960 msm8974 msm8226,$(TARGET_BOARD_PLATFORM)),)

include $(CLEAR_VARS)

LOCAL_MODULE := keystore.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_SRC_FILES := keymaster_qcom.cpp

LOCAL_C_INCLUDES := $(TARGET_OUT_HEADERS)/common/inc \
		    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include \
                    external/openssl/include

LOCAL_C_FLAGS = -fvisibility=hidden -Wall -Werror

ifeq ($(TARGET_NO_QSEECOM_SET_BANDWIDTH),true)
  LOCAL_CFLAGS += -DNO_QSEECOM_SET_BANDWIDTH
endif

LOCAL_SHARED_LIBRARIES := \
        libcrypto \
        liblog \
        libc \
        libdl

LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_BOARD_PLATFORM
