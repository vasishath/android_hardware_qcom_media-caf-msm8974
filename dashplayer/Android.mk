LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# ---------------------------------------------------------------------------------
#            Common definitons
# ---------------------------------------------------------------------------------
LOCAL_SRC_FILES:=                       \
        DashPlayer.cpp                  \
        DashPlayerDriver.cpp            \
        DashPlayerRenderer.cpp          \
        DashPlayerStats.cpp             \
        DashPlayerDecoder.cpp           \
        DashPacketSource.cpp            \
        DashFactory.cpp

LOCAL_SHARED_LIBRARIES :=       \
    libbinder                   \
    libcamera_client            \
    libcutils                   \
    libdl                       \
    libgui                      \
    libmedia                    \
    libstagefright              \
    libstagefright_foundation   \
    libstagefright_omx          \
    libutils                    \
    libui                       \

LOCAL_C_INCLUDES := \
        $(TOP)/frameworks/av-caf/media/libstagefright/timedtext           \
	$(TOP)/frameworks/native-caf/include/media/hardware               \
	$(TOP)/frameworks/native-caf/include/media/openmax                \
	$(TOP)/frameworks/av-caf/media/libstagefright/httplive            \
	$(TOP)/frameworks/av-caf/media/libmediaplayerservice/nuplayer     \
	$(TOP)/frameworks/av-caf/media/libmediaplayerservice              \
	$(TOP)/frameworks/av-caf/media/libstagefright/include             \
	$(TOP)/frameworks/av-caf/media/libstagefright/mpeg2ts             \
	$(TOP)/frameworks/av-caf/media/libstagefright/rtsp                \
	$(TOP)/hardware/qcom/media-caf-bfam/mm-core/inc                        \
	$(TOP)/hardware/qcom/display-caf-bfam/libgralloc                       \
    $(LOCAL_PATH)/../QCMediaPlayer/native                         \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

ifeq ($(PLATFORM_SDK_VERSION), 18)
  LOCAL_CFLAGS += -DANDROID_JB_MR2
endif


LOCAL_MODULE:= libdashplayer

#LOCAL_MODULE_TAGS := eng

ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
ifndef TARGET_DISABLE_DASH
 include $(BUILD_SHARED_LIBRARY)
endif
endif

