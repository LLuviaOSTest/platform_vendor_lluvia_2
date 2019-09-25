PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/yodita/overlay/dictionaries

# Common overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/yodita/overlay/common

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/yodita/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/yodita/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/yodita/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \
    vendor/yodita/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Init banner
PRODUCT_COPY_FILES += \
    vendor/yodita/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Copy all Yodita specific init rc files
$(foreach f,$(wildcard vendor/yodita/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# LatinIME gesture typing
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/yodita/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/yodita/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/yodita/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/yodita/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# Sysconfigs
PRODUCT_COPY_FILES += \
    vendor/yodita/prebuilt/common/sysconfig/yodita-power-whitelist.xml:system/etc/sysconfig/yodita-power-whitelist.xml \
    vendor/yodita/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Permissions
PRODUCT_COPY_FILES += \
    vendor/yodita/prebuilt/common/etc/permissions/privapp-permissions-elgoog.xml:system/etc/permissions/privapp-permissions-elgoog.xml

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Packages
include vendor/yodita/config/packages.mk

# Version
include vendor/yodita/config/version.mk 

# Props
include vendor/yodita/config/props.mk
