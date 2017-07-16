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
#include "log.h"
#include "util.h"

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

/* Target-Specific Dalvik Heap & HWUI Configuration */
void target_ram() {
    std::string ram;

    ram = property_get("ro.boot.ram");

    // TODO: VZW has different settings here as they have more ram
}

void num_sims() {
    std::string dualsim;

    dualsim = property_get("ro.boot.dualsim");
    property_set("ro.hw.dualsim", dualsim.c_str());

    if (dualsim == "true") {
        property_set("persist.radio.multisim.config", "dsds");
    } else {
        property_set("persist.radio.multisim.config", "");
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

    platform = property_get("ro.board.platform");
    if (platform != ANDROID_TARGET)
        return;

    device_boot = property_get("ro.boot.device");
    property_set("ro.hw.device", device_boot.c_str());

    property_override("ro.product.device", "griffin");

    sku = property_get("ro.boot.hardware.sku");
    property_override("ro.product.model", sku.c_str());

    carrier = property_get("ro.boot.carrier");
    property_set("ro.carrie", carrier.c_str());

    radio = property_get("ro.boot.radio");
    property_set("ro.hw.radio", radio.c_str());

    dualsim = property_get("ro.boot.dualsim");

    /* Common for all models */
    property_override("ro.build.product", "griffin");
    target_ram();
    num_sims();

    if (device_boot == "sheridan") {
        property_set("persist.audio.calfile0", "/etc/acdbdata/sheridan/Bluetooth_cal.acdb");
        property_set("persist.audio.calfile1", "/etc/acdbdata/sheridan/General_cal.acdb");
        property_set("persist.audio.calfile2", "/etc/acdbdata/sheridan/Global_cal.acdb");
        property_set("persist.audio.calfile3", "/etc/acdbdata/sheridan/Handset_cal.acdb");
        property_set("persist.audio.calfile4", "/etc/acdbdata/sheridan/Hdmi_cal.acdb");
        property_set("persist.audio.calfile5", "/etc/acdbdata/sheridan/Headset_cal.acdb");
        property_set("persist.audio.calfile6", "/etc/acdbdata/sheridan/Speaker_cal.acdb");
    }
    else {
        property_set("persist.audio.calfile0", "/etc/acdbdata/griffin/Bluetooth_cal.acdb");
        property_set("persist.audio.calfile1", "/etc/acdbdata/griffin/General_cal.acdb");
        property_set("persist.audio.calfile2", "/etc/acdbdata/griffin/Global_cal.acdb");
        property_set("persist.audio.calfile3", "/etc/acdbdata/griffin/Handset_cal.acdb");
        property_set("persist.audio.calfile4", "/etc/acdbdata/griffin/Hdmi_cal.acdb");
        property_set("persist.audio.calfile5", "/etc/acdbdata/griffin/Headset_cal.acdb");
        property_set("persist.audio.calfile6", "/etc/acdbdata/griffin/Speaker_cal.acdb");
    }

    if (sku == "XT1650-03") {

        if (carrier == "retmx" || carrier == "retbr") {
            property_set("persist.radio.pb.max.match", "10");
            property_set("persist.radio.pb.min.match", "7");
            property_set("ro.ril.power_collapse", "1");
        }
        
        property_set("ro.telephony.default_network", "10,0");
    }

    if (sku == "XT1650-05") {
        property_set("persist.radio.data_ltd_sys_ind", "1");
        property_set("persist.radio.hw_mbn_update", "0");
        property_set("persist.radio.ignore_dom_time", "5");
        property_set("persist.radio.start_ota_daemon", "1");
        property_set("persist.radio.sw_mbn_update", "0");
        property_set("persist.oem.dump", "0");
        property_set("persist.volte_enalbed_by_hw", "1");
        property_set("ro.telephony.default_network", "22,20");
        property_set("persist.radio.flexmap_type", "nw_mode");
        property_set("persist.radio.rat_on", "combine");
        property_set("persist.netmon.linger", "1");
        property_set("ro.lenovo.dialergain", "80");
        property_set("persist.radio.pb.min.match", "11");
        property_set("ro.mot.NfcEnabled", "false");
        property_set("ro.com.android.mobiledata", "true");
        property_set("ro.prc.GcastEnabled", "false");
        property_set("ro.prc.MiracastEnabled", "false");
        property_set("persist.radio.force_on_dc", "true");
        property_set("wifi.open.delay", "false");
        property_set("persist.radio.mot_ecc_custid", "china");
        property_set("persist.sys.backgrounddata", "false");
        property_set("persist.sys.lenovo.ltetype", "VOLTE");
        property_set("fmradio.driver.enable", "0");
    }

    property_set("persist.ims.volte", "true");
    property_set("persist.ims.vt", "false");
    property_set("persist.ims.vt.epdg", "false");
    property_set("persist.ims.rcs", "false");
    property_set("ro.radio.imei.sv", "4");
    property_set("persist.radio.call.audio.output", "0");
    property_set("persist.radio.videopause.mode", "0");
    property_set("persist.vt.supported", "0");
    property_set("persist.eab.supported", "0");
    property_set("persist.rcs.supported", "0");
    property_set("persist.rcs.presence.provision", "0");

    device = property_get("ro.product.device");
    INFO("Found sku id: %s setting build properties for %s device\n", sku.c_str(), device.c_str());
}
