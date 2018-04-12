#
# Copyright (C) 2018 The LineageOS Project
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

#
# Moto Z
#

## QCOM BUILD
# This is the build that came with the device
# keeping this here and incrementing it as needed
# once we start upgrading so we can keep track of
# things properly.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.version.qcom=LA.UM.7.6.r1-02500-89xx.0

## Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.deep_buffer.media=true \
    audio.offload.video=false \
    af.fast_track_multiplier=1 \
    vendor.audio_hal.period_size=240 \
    ro.qc.sdk.audio.fluencetype=none \
    ro.qc.sdk.audio.ssr=false \
    persist.audio.dualmic.config=endfire \
    ro.vendor.audio.sdk.fluencetype=none \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=true \
    vendor.audio.tunnel.encode=false \
    vendor.audio.offload.buffer.size.kb=64 \
    vendor.audio.offload.pcm.16bit.enable=false \
    vendor.audio.offload.pcm.24bit.enable=false \
    vendor.audio.offload.track.enable=true \
    vendor.voice.path.for.pcm.voip=false \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.min.duration.secs=60 \
    vendor.audio.offload.passthrough=false \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio.offload.gapless.enabled=false \
    vendor.audio.safx.pbe.enabled=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.hw.aac.encoder=false \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio.flac.sw.decoder.24bit=true \
    persist.vendor.bt.enable.splita2dp=false \
    persist.vendor.audio.speaker.prot.enable=true \
    persist.vendor.audio.spkr.cal.duration=5 \
    audio.offload.disable=false \
    audio.playback.mch.downsample=0 \
    persist.vendor.audio.fluence.mode=none \
    persist.vendor.audio.endcall.delay=250 \
    persist.vendor.audio.fluence.voicecomm=true

## Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=rome

## Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.HAL3.enabled=1 \
    persist.camera.debug.logfile=0 \
    persist.camera.gyro.disable=0 \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.motorola.camera2,com.motorola.motocit,org.lineageos.snap \
    persist.camera.camera2=true \
    persist.camera.expose.aux=1 \
    persist.camera.is_type=3 \
    persist.ts.postmakeup=false \
    persist.ts.rtmakeup=false

## CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1 \
    persist.vendor.cne.logging.qxdm=3974 \
    persist.vendor.cne.rat.wlan.chip.oem=WCN \
    persist.vendor.dpm.feature=0 \
    persist.vendor.sys.cnd.iwlan=1

## CoreSight
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.coresight.config=stm-events

## Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gralloc.enable_fb_ubwc=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1 \
    sdm.debug.disable_skip_validate=1 \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.opengles.version=196609 \
    debug.sf.recomputecrop=0 \
    ro.sf.lcd_density=560

## Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    mm.enable.qcom_parser=1048575 \
    vendor.mm.en.sec.smoothstreaming=false \
    mm.enable.smoothstreaming=false \
    mmp.enable.3g2=true \
    vidc.enc.dcvs.extra-buff-count=2 \
    vendor.vidc.enc.disable.pq=true

# HDR
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.display.hdr.config=/vendor/etc/hdr_tm_config.xml

## Mods
PRODUCT_PROPERTY_OVERRIDES += \
    sys.mod.platformsdkversion=205

## Netmgr
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.vendor.data.mode=concurrent

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.gt_library=libqti-gt.so \
    ro.vendor.at_library=libqti-at.so \
    ro.vendor.extension_library=libqti-perfd-client.so

## Play Store
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-motorola \
    ro.com.google.clientidbase.am=android-motorola \
    ro.com.google.clientidbase.gmm=android-motorola \
    ro.com.google.clientidbase.ms=android-motorola \
    ro.com.google.clientidbase.yt=android-motorola

## QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

## IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ims.disableADBLogs=2 \
    persist.vendor.ims.disableDebugLogs=0 \
    persist.vendor.ims.disableQXDMLogs=0 \
    persist.vendor.ims.disableIMSLogs=0 \
    persist.vendor.ims.vt.enableadb=1 \
    persist.radio.NO_STAPA=1 \
    persist.radio.VT_HYBRID_ENABLE=1

## RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.no_wait_for_card=1 \
    persist.vendor.radio.dfr_mode_set=1 \
    persist.vendor.radio.relay_oprt_change=1 \
    persist.vendor.radio.oem_ind_to_both=0 \
    persist.vendor.radio.qcril_uim_vcc_feature=1 \
    persist.vendor.radio.0x9e_not_callname=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.force_get_pref=1 \
    persist.vendor.radio.is_wps_enabled=true \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.eri64_as_home=1 \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.sw_mbn_update=1 \
    persist.vendor.radio.jbims=1 \
    persist.vendor.radio.sar_sensor=1 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.msgtunnel.start=true \
    persist.vendor.radio.apn_delay=5000 \
    persist.vendor.radio.calls.on.ims=true \
    persist.vendor.radio.domain.ps=0 \
    persist.vendor.cne.rat.wlan.chip.oem=WCN \
    persist.radio.adb_log_on=0 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.eons.enabled=false \
    persist.radio.msgtunnel.start=true \
    persist.radio.sar_sensor=1 \
    persist.radio.apn_delay=5000 \
    persist.radio.calls.on.ims=true \
    persist.radio.domain.ps=0 \
    persist.radio.VT_ENABLE=1 \
    persist.radio.ROTATION_ENABLE=1 \
    persist.radio.REVERSE_QMI=0 \
    persist.radio.RATE_ADAPT_ENABLE=1 \
    persist.radio.VT_USE_MDM_TIME=0 \
    persist.data.qmi.adb_logmask=0 \
    persist.net.doxlat=true \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3=""  \
    persist.sys.qc.sub.rdump.on=1 \
    persist.sys.qc.sub.rdump.max=0 \
    ro.telephony.call_ring.multiple=false \
    ril.subscription.types=NV,RUIM \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    vendor.rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    telephony.lteOnCdmaDevice=1 \
    DEVICE_PROVISIONED=1 \
    ro.vendor.build.vendorprefix=/vendor \
    ro.build.vendorprefix=/vendor

## QTI Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.dev_ori=false \
    ro.qti.sensors.mot_detect=false \
    ro.qti.sensors.pmd=false \
    ro.qti.sensors.sta_detect=false

## RmNet Data
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.wda.enable=true \
    persist.data.df.dl_mode=5 \
    persist.data.df.ul_mode=5 \
    persist.data.df.agg.dl_pkt=10 \
    persist.data.df.agg.dl_size=4096 \
    persist.data.df.mux_count=8 \
    persist.data.df.iwlan_mux=9 \
    persist.data.df.dev_name=rmnet_usb0 \
    persist.data.iwlan.enable=true \
    persist.rmnet.data.enable=true \
    persist.rmnet.mux=enabled

## Time Service
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

## Vendor Extension
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# VNDK
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vndk.version=28

## Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
