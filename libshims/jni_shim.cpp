#include <stdint.h>

namespace android {
    // libnativehelper.so
    extern "C" void jniGetFDFromFileDescriptor() {}
    extern "C" void jniLogException() {}
    extern "C" void jniThrowNullPointerException() {}
    // libandroid_runtime.so
    extern "C" void _ZN7android14AndroidRuntime21registerNativeMethodsEP7_JNIEnvPKcPK15JNINativeMethodi() {}
    extern "C" void _ZN7android14AndroidRuntime9getJNIEnvEv() {}
}
