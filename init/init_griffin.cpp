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

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#define ISMATCH(a,b)    (a == b)

static void setSsim(void);
static void setMsim(void);

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

    if (ISMATCH(dualsim, "true")) {
        property_set("persist.radio.multisim.config", "dsds");
    } else {
        property_set("persist.radio.multisim.config", "");
    }
}

void vendor_load_properties()
{
    char carrier[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];

    std::string platform;
    std::string device_boot;
    std::string sku;
    std::string radio;
    std::string device;
    std::string car;

    platform = property_get("ro.board.platform");
    if (!ISMATCH(platform, ANDROID_TARGET))
        return;

    device_boot = property_get("ro.boot.device");
    property_set("ro.hw.device", device_boot.c_str());

    sku = property_get("ro.boot.hardware.sku");
    property_set("ro.product.model", sku.c_str());

    radio = property_get("ro.boot.radio");
    property_set("ro.hw.radio", radio.c_str());

    car = property_get("ro.boot.carrier");
    property_set("ro.hw.carrier", car.c_str());

    /* Common for all models */
    property_set("ro.build.product", "griffin");
    target_ram();
    num_sims();

    if (ISMATCH(device_boot, "sheridan")) {
       // Do things?
    }

    if (ISMATCH(sku, "XT1650-03")) {
        setSsim();
        property_set("ro.ril.force_eri_from_xml", "true");
        property_set("ro.telephony.get_imsi_from_sim", "true");
        property_set("ro.telephony.default_network", "10");
        property_set("telephony.lteOnCdmaDevice", "1");
    }

    if (ISMATCH(sku, "XT1650-05")) {
        setMsim();
        property_set("telephony.lteOnCdmaDevice", "1");
        property_set("persist.radio.mcfg_enabled", "1");
        property_set("persist.radio.force_on_dc", "true");
        property_set("persist.radio.rat_on", "combine");
        property_set("persist.radio.disable_flexmap", "0");
        property_set("gsm.sim.min.match", "8");
        property_set("ro.cdma.subscription", "0");
        property_set("ro.telephony.default_cdma_sub", "0");
        property_set("ril.subscription.types", "RUIM");
        property_set("persist.radio.force_get_pref", "1");
    }

    device = property_get("ro.product.device");
    INFO("Found sku id: %s setting build properties for %s device\n", sku.c_str(), device.c_str());
}

static void setSsim(void)
{
    property_set("persist.cne.feature", "0");
    property_set("ro.media.enc.aud.fileformat", "qcp");
    property_set("ro.media.enc.aud.codec", "qcelp");
    property_set("ro.media.enc.aud.bps", "13300");
    property_set("ro.media.enc.aud.ch", "1");
    property_set("ro.media.enc.aud.hz", "8000");
    property_set("persist.rmnet.mux", "enabled");
    property_set("persist.sys.cnd.iwlan", "0");
    property_set("persist.cne.logging.qxdm", "0");
    property_set("persist.vt.supported", "0");
    property_set("persist.eab.supported", "0");
    property_set("persist.radio.snapshot_timer", "22");
    property_set("persist.radio.snapshot_enabled", "1");
    property_set("persist.ims.volte", "true");
    property_set("persist.ims.vt", "false");
    property_set("persist.ims.vt.epdg", "false");
    property_set("persist.ims.disableADBLogs", "2");
    property_set("persist.ims.disableDebugLogs", "0");
    property_set("persist.ims.disableQXDMLogs", "0");
    property_set("persist.ims.disableIMSLogs", "0");
    property_set("persist.rcs.supported", "0");
    property_set("persist.rcs.presence.provision", "0");
    property_set("persist.radio.calls.on.ims", "true");
    property_set("persist.radio.jbims", "1");
    property_set("persist.radio.domain.ps", "0");
    property_set("persist.radio.VT_ENABLE", "1");
    property_set("persist.radio.VT_HYBRID_ENABLE", "1");
    property_set("persist.radio.ROTATION_ENABLE", "1");
    property_set("persist.radio.REVERSE_QMI", "0");
    property_set("persist.radio.RATE_ADAPT_ENABLE", "1");
    property_set("persist.radio.VT_USE_MDM_TIME", "0");
    property_set("persist.radio.videopause.mode", "0");
    property_set("persist.data.iwlan.enable", "true");
    property_set("persist.radio.mcfg_enabled", "1");
    property_set("ro.mot.ignore_csim_appid", "true");
    property_set("persist.data.netmgrd.qos.enable", "true");
    property_set("ril.subscription.types", "RUIM");
}

static void setMsim(void)
{
    property_set("persist.radio.multisim.config", "dsds");
    property_set("persist.radio.plmn_name_cmp", "1");
    property_set("ro.telephony.ril.config", "simactivation");
    property_set("ro.fsg-id", "emea_dsds");
    property_set("ro.media.enc.aud.fileformat", "amr");
    property_set("ro.media.enc.aud.codec", "amrnb");
}
