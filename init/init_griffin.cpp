/*
   Copyright (c) 2014, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"
#include <utils/Log.h>
#include <android-base/properties.h>

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

using android::base::GetProperty;
using android::base::SetProperty;

/* Target-Specific Dalvik Heap & HWUI Configuration */
void target_ram() {
    std::string ram;

    //ram = GetProperty("ro.boot.ram", "");

    // TODO: VZW has different settings here as they have more ram
}

void num_sims() {
    std::string dualsim;

    dualsim = GetProperty("ro.boot.dualsim", "false");
    SetProperty("ro.hw.dualsim", dualsim.c_str());

    if (dualsim == "true") {
        SetProperty("persist.radio.multisim.config", "dsds");
    } else {
        SetProperty("persist.radio.multisim.config", "");
    }
}

void vendor_load_properties()
{
    std::string carrier;
    std::string devicename;

    std::string platform;
    std::string device_boot;
    std::string sku;
    std::string radio;
    std::string device;
    std::string dualsim;

    platform = GetProperty("ro.board.platform", "msm8996");
    if (platform != ANDROID_TARGET)
        return;

    device_boot = GetProperty("ro.boot.device", "sheridan");
    SetProperty("ro.hw.device", device_boot.c_str());

    property_override("ro.product.device", "griffin");

    sku = android::base::GetProperty("ro.boot.hardware.sku", "XT1650-03");
    property_override("ro.product.model", sku.c_str());

    carrier = GetProperty("ro.boot.carrier", "reteu");
    SetProperty("ro.carrier", carrier.c_str());

    /*radio = GetProperty("ro.boot.radio", "");
    SetProperty("ro.hw.radio", radio.c_str());*/

    /* Common for all models */
    property_override("ro.build.product", "griffin");
    target_ram();
    num_sims();

    if (device_boot == "sheridan") {
        SetProperty("persist.audio.calfile0", "/etc/acdbdata/sheridan/Bluetooth_cal.acdb");
        SetProperty("persist.audio.calfile1", "/etc/acdbdata/sheridan/General_cal.acdb");
        SetProperty("persist.audio.calfile2", "/etc/acdbdata/sheridan/Global_cal.acdb");
        SetProperty("persist.audio.calfile3", "/etc/acdbdata/sheridan/Handset_cal.acdb");
        SetProperty("persist.audio.calfile4", "/etc/acdbdata/sheridan/Hdmi_cal.acdb");
        SetProperty("persist.audio.calfile5", "/etc/acdbdata/sheridan/Headset_cal.acdb");
        SetProperty("persist.audio.calfile6", "/etc/acdbdata/sheridan/Speaker_cal.acdb");
    }
    else {
        SetProperty("persist.audio.calfile0", "/etc/acdbdata/griffin/Bluetooth_cal.acdb");
        SetProperty("persist.audio.calfile1", "/etc/acdbdata/griffin/General_cal.acdb");
        SetProperty("persist.audio.calfile2", "/etc/acdbdata/griffin/Global_cal.acdb");
        SetProperty("persist.audio.calfile3", "/etc/acdbdata/griffin/Handset_cal.acdb");
        SetProperty("persist.audio.calfile4", "/etc/acdbdata/griffin/Hdmi_cal.acdb");
        SetProperty("persist.audio.calfile5", "/etc/acdbdata/griffin/Headset_cal.acdb");
        SetProperty("persist.audio.calfile6", "/etc/acdbdata/griffin/Speaker_cal.acdb");
    }

    if (sku == "XT1650-03") {

        if (carrier == "retmx" || carrier == "retbr") {
            SetProperty("persist.radio.pb.max.match", "10");
            SetProperty("persist.radio.pb.min.match", "7");
            SetProperty("ro.ril.power_collapse", "1");
        }
        
        SetProperty("ro.telephony.default_network", "10,0");
    }

    if (sku == "XT1650-05") {
        SetProperty("persist.radio.data_ltd_sys_ind", "1");
        SetProperty("persist.radio.hw_mbn_update", "0");
        SetProperty("persist.radio.ignore_dom_time", "5");
        SetProperty("persist.radio.start_ota_daemon", "1");
        SetProperty("persist.radio.sw_mbn_update", "0");
        SetProperty("persist.oem.dump", "0");
        SetProperty("persist.volte_enalbed_by_hw", "1");
        SetProperty("ro.telephony.default_network", "22,20");
        SetProperty("persist.radio.flexmap_type", "nw_mode");
        SetProperty("persist.radio.rat_on", "combine");
        SetProperty("persist.netmon.linger", "1");
        SetProperty("ro.lenovo.dialergain", "80");
        SetProperty("persist.radio.pb.min.match", "11");
        SetProperty("ro.mot.NfcEnabled", "false");
        SetProperty("ro.com.android.mobiledata", "true");
        SetProperty("ro.prc.GcastEnabled", "false");
        SetProperty("ro.prc.MiracastEnabled", "false");
        SetProperty("persist.radio.force_on_dc", "true");
        SetProperty("wifi.open.delay", "false");
        SetProperty("persist.radio.mot_ecc_custid", "china");
        SetProperty("persist.sys.backgrounddata", "false");
        SetProperty("persist.sys.lenovo.ltetype", "VOLTE");
        SetProperty("fmradio.driver.enable", "0");
    }

    SetProperty("persist.ims.volte", "true");
    SetProperty("persist.ims.vt", "false");
    SetProperty("persist.ims.vt.epdg", "false");
    SetProperty("persist.ims.rcs", "false");
    SetProperty("ro.radio.imei.sv", "4");
    SetProperty("persist.radio.call.audio.output", "0");
    SetProperty("persist.radio.videopause.mode", "0");
    SetProperty("persist.vt.supported", "0");
    SetProperty("persist.eab.supported", "0");
    SetProperty("persist.rcs.supported", "0");
    SetProperty("persist.rcs.presence.provision", "0");

    device = GetProperty("ro.product.device", "griffin");
    ALOGI("Found sku id: %s setting build properties for %s device\n", sku.c_str(), device.c_str());
}
