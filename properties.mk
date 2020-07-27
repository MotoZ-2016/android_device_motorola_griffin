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
# props for Moto Z
#

# QCOM BUILD
# This is the build that came with the device
# keeping this here and incrementing it as needed
# once we start upgrading so we can keep track of
# things properly.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.version.qcom=LA.UM.7.6.r1-02500-89xx.0

# Audio
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

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=rome

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.HAL3.enabled=1 \
    persist.camera.debug.logfile=0 \
    persist.camera.gyro.disable=0 \
    persist.camera.camera2=true \
    persist.ts.postmakeup=false \
    persist.ts.rtmakeup=false

# Codec2 switch
PRODUCT_PROPERTY_OVERRIDES += \
    debug.media.codec2=2

# Color Mode
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.enable_default_color_mode=1

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.logging.qxdm=3974 \
    persist.vendor.cne.rat.wlan.chip.oem=WCN \
    persist.vendor.sys.cnd.iwlan=1

# CoreSight
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.coresight.config=stm-events

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gralloc.enable_fb_ubwc=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1 \
    sdm.debug.disable_skip_validate=1 \
    debug.sf.disable_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    persist.demo.hdmirotationlock=false \
    debug.sf.enable_hwc_vds=1 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.opengles.version=196609 \
    debug.sf.recomputecrop=0

# Media
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

# Mods
PRODUCT_PROPERTY_OVERRIDES += \
    sys.mod.platformsdkversion=205

# Netmgr
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.vendor.data.mode=concurrent

# OMX
# Rank OMX SW codecs lower than OMX HW codecs
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.omx_default_rank.sw-audio=1 \
    debug.stagefright.omx_default_rank=0

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.gt_library=libqti-gt.so \
    ro.vendor.at_library=libqti-at.so \
    ro.vendor.extension_library=libqti-perfd-client.so

# Play Store
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-motorola \
    ro.com.google.clientidbase.am=android-motorola \
    ro.com.google.clientidbase.gmm=android-motorola \
    ro.com.google.clientidbase.ms=android-motorola \
    ro.com.google.clientidbase.yt=android-motorola

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.vendor.ims.dropset_feature=0 \
    persist.vendor.ims.disableADBLogs=2 \
    persist.vendor.ims.disableDebugLogs=0 \
    persist.vendor.ims.disableQXDMLogs=0 \
    persist.vendor.ims.disableIMSLogs=0 \
    persist.vendor.ims.vt.enableadb=1

# RIL
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
    persist.data.qmi.adb_logmask=0 \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.vendor.radio.aosp_usr_pref_sel=true \
    persist.vendor.radio.flexmap_type=none \
    persist.net.doxlat=true \
    persist.sys.qc.sub.rdump.on=1 \
    persist.sys.qc.sub.rdump.max=0 \
    ro.telephony.call_ring.multiple=false \
    ril.subscription.types=NV,RUIM \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    vendor.rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    ro.telephony.iwlan_operation_mode=legacy \
    ro.vendor.build.vendorprefix=/vendor \
    ro.build.vendorprefix=/vendor

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.fflag.override.settings_network_and_internet_v2=true \
    persist.vendor.cne.feature=1 \
    persist.vendor.dpm.feature=0 \
    DEVICE_PROVISIONED=1 \
    ril.subscription.types=NV,RUIM \
    telephony.lteOnCdmaDevice=1

# QTI Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.dev_ori=false \
    ro.qti.sensors.mot_detect=false \
    ro.qti.sensors.pmd=false \
    ro.qti.sensors.sta_detect=false

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_virtual_display_dimension=4096 \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000 \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_phase_offset_ns=1500000 \
    debug.sf.early_app_phase_offset_ns=1500000 \
    debug.sf.early_gl_phase_offset_ns=3000000 \
    debug.sf.early_gl_app_phase_offset_ns=15000000

# Time daemon
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# Vendor Extension
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
