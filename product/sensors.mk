# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8996

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
		$(LOCAL_PATH)/configs/hals.conf:system/etc/sensors/hals.conf 
