#include <iostream>
#include <fstream>
#include <memory>

#include <dawn/dawn_proc.h>
#include <dawn/webgpu.h>
#include <dawn/webgpu_cpp.h>
#include <dawn/webgpu_cpp_print.h>
#include <dawn/native/DawnNative.h>

extern "C" dawn::native::Instance* new_instance() {
    // Initialize WebGPU proc table
    dawnProcSetProcs(&dawn::native::GetProcs());

    auto instance = new dawn::native::Instance;

    // This makes things slow
    // instance->EnableBackendValidation(true);
    // instance->SetBackendValidationLevel(dawn::native::BackendValidationLevel::Full);

    WGPURequestAdapterOptions options = {};
    instance->EnumerateAdapters(&options); 

    return instance;
}

extern "C" void delete_instance(dawn::native::Instance* instance) {
    delete instance;
} 

extern "C" void enumerate_adapters(
    const dawn::native::Instance* instance,
    void(*callback)(const WGPUAdapterInfo*, void*),
    void* userdata
) {
    if (callback == nullptr) return;

    WGPURequestAdapterOptions options = {};
    auto adapters = instance->EnumerateAdapters(&options);

    for (auto& adapter : adapters) {
        WGPUAdapterInfo info{};
        adapter.GetInfo(&info);
        callback(&info, userdata);
    }
}

extern "C" WGPUFuture map_async(
    size_t offset,
    size_t size,
    WGPUBufferMapCallback callback
) {

    WGPUBufferMapCallbackInfo2 callbackInfo = WGPUBufferMapCallbackInfo2 {
        mode: WGPUCallbackMode_WGPUCallbackMode_WaitAnyOnly, // callback mode
        callback: callback
    };

    wgpu::Future future = MapAsync2(map_mode, offset, size, callbackInfo);
}

extern "C" WGPUWaitStatus wait_any(
    const dawn::native::Instance* instance,
    wgpu::Future future
) {

    /*
    // create futureInfo struct
    WGPUFutureWaitInfo futureInfo {};
    futureInfo.future = future;
    futureInfo.completed = false;
    */

    wgpu::Instance wgpuInstance(instance->Get());

    //wgpu::FutureWaitInfo waitInfo = {future};

    return wgpuInstance.WaitAny(
        future,
        UINT64_MAX);
    
}

extern "C" WGPUDevice create_device(
    const dawn::native::Instance* instance,
    WGPUUncapturedErrorCallback callback,
    WGPUBackendType backendType,
    uint32_t deviceID
) {
    WGPURequestAdapterOptions options = {};
    auto adapters = instance->EnumerateAdapters(&options);

    dawn::native::Adapter *selectedAdapter = nullptr;
    for (auto& adapter : adapters) {
        WGPUAdapterInfo info{};
        adapter.GetInfo(&info);
        if (info.backendType == backendType && info.deviceID == deviceID) {
            selectedAdapter = &adapter;
            break;
        }
    }

    if (!selectedAdapter) return nullptr;

    WGPUUncapturedErrorCallbackInfo2 callbackInfo = {};
    callbackInfo.callback = callback;

    WGPUDeviceDescriptor descriptor = {};
    descriptor.uncapturedErrorCallbackInfo2 = callbackInfo;

    wgpu::DeviceDescriptor desc = {};
    desc.SetUncapturedErrorCallback(
            [](const wgpu::Device&, wgpu::ErrorType type, wgpu::StringView message) {
        });
    
    return selectedAdapter->CreateDevice(&desc);
}
