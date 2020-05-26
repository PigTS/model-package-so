#ndk r16
#APP_STL := gnustl_static
#ndk r20
APP_STL := c++_static
APP_CPPFLAGS := -std=c++11
APP_CPPFLAGS += -std=c++0x
APP_CPPFLAGS += -fexceptions -O3
APP_CPPFLAGS += -fPIC -frtti
#APP_ABI := armeabi
APP_ABI := armeabi-v7a arm64-v8a x86_64 x86
APP_PLATFORM := android-23
APP_OPTIM := release