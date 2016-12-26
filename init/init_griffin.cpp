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

    platform = property_get("ro.board.platform");
    if (!ISMATCH(platform, ANDROID_TARGET))
        return;

    device_boot = property_get("ro.boot.device");
    property_set("ro.hw.device", device_boot.c_str());

    sku = property_get("ro.boot.hardware.sku");
    property_set("ro.product.model", sku.c_str());

    radio = property_get("ro.boot.radio");
    property_set("ro.hw.radio", radio.c_str());

    /* Common for all models */
    property_set("ro.build.product", "griffin");
    target_ram();
    num_sims();

    if (ISMATCH(device_boot, "sheridan")) {
       // Do things?
    }

    if (ISMATCH(sku, "XT1650-03")) {
       // TODO
    }

    device = property_get("ro.product.device");
    INFO("Found sku id: %s setting build properties for %s device\n", sku.c_str(), device.c_str());
}
