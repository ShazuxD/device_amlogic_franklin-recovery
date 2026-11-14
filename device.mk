LOCAL_PATH := device/jio/franklin

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

