LOCAL_PATH := device/amlogic/franklin

# Characteristics
PRODUCT_CHARACTERISTICS := tv,nosdcard

# Device specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.platform.is.tv=1 \
    ro.vendor.platform.has.mbxuimode=true \
    ro.vendor.platform.has.realoutputmode=true \
    ro.vendor.platform.hdmi.device_type=4 \
    ro.vendor.platform.need.display.hdmicec=true \
    ro.hdmi.device_type=4 \
    ro.surface_flinger.max_graphics_width=1920 \
    ro.surface_flinger.max_graphics_height=1080 \
    ro.sf.lcd_density=320 \
    vendor.afbcd.enable=1 \
    ro.vendor.sdr2hdr.enable=true \
    persist.vendor.sys.framerate.priority=true

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Ethernet
PRODUCT_PROPERTY_OVERRIDES += \
    persist.adb.tcp.port=5555 \
    ro.ethup.gw=192.168.1.1 \
    ro.ethup.ip=192.168.1.250 \
    ro.ethup.mask=255.255.255.0 \
    ro.ethup.dns=8.8.8.8

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

