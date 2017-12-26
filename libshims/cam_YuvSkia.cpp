/*
 * Copyright (C) 2018 LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "SkBitmap.h"
#include "SkColorTable.h"

struct LockRec {
    LockRec() : fPixels(NULL), fColorTable(NULL) {}
    
    void*           fPixels;
    SkColorTable*   fColorTable;
    size_t          fRowBytes;
    
    void zero() { sk_bzero(this, sizeof(*this)); }
    
    bool isZero() const {
        return NULL == fPixels && NULL == fColorTable && 0 == fRowBytes;
    }
};

extern "C" void _ZN8SkBitmap14tryAllocPixelsEPNS_9AllocatorE(SkBitmap::Allocator* allocator);

extern "C" void _ZN8SkBitmap14tryAllocPixelsEPNS_9AllocatorEP12SkColorTable(SkBitmap::Allocator* allocator, SkColorTable* ctable){
    return _ZN8SkBitmap14tryAllocPixelsEPNS_9AllocatorE(allocator);
}

extern "C" bool _ZNK8SkBitmap10lockPixelsEv(LockRec* rec){
    return true;
}

extern "C" void _ZNK8SkBitmap12unlockPixelsEv(){
}
