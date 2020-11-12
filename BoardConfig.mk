#
# Copyright (C) 2014 The Android Open Source Project
# Copyright (C) 2014-2020 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/victara

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := victara

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

# Kernel
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom androidboot.bootdevice=msm_sdcc.1 msm_rtb.filter=0x37 ehci-hcd.park=3 vmalloc=400M androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --dt $(DEVICE_PATH)/prebuilt/dt.img

# LZMA
LZMA_RAMDISK_TARGETS := recovery

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10526720

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

# Prevent anti-rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TW_THEME := portrait_hdpi
TW_EXCLUDE_TWRPAPP := true
TW_NO_USB_STORAGE := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_NO_EXFAT := true
