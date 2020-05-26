LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ncnn-prebuilt

ifeq ($(TARGET_ARCH_ABI), armeabi) 
	ncnn_build_path := build-android-armeabi
endif
ifeq ($(TARGET_ARCH_ABI), armeabi-v7a) 
	ncnn_build_path := build-android-armv7
endif
ifeq ($(TARGET_ARCH_ABI), arm64-v8a) 
	ncnn_build_path := build-android-aarch64
endif
ifeq ($(TARGET_ARCH_ABI), x86_64) 
	ncnn_build_path := build-android-x86_64
endif
ifeq ($(TARGET_ARCH_ABI), x86) 
	ncnn_build_path := build-android-x86
endif

LOCAL_SRC_FILES := $(LOCAL_PATH)/../ncnn/$(ncnn_build_path)/install/lib/libncnn.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../ncnn/$(ncnn_build_path)/install/include/ncnn/
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := ImageRecognitionEngine

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../src/

MY_CPP_LIST := $(wildcard $(LOCAL_PATH)/../src/*.cpp)

LOCAL_SRC_FILES := $(MY_CPP_LIST:$(LOCAL_PATH)/%=%)

LOCAL_LDLIBS += -fopenmp -landroid

LOCAL_STATIC_LIBRARIES := ncnn-prebuilt

include $(BUILD_SHARED_LIBRARY)