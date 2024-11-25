#![allow(non_upper_case_globals)]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]

mod bindings;

pub use bindings::*;

pub mod webgpu {
    include!(concat!(env!("OUT_DIR"), "/webgpu.rs"));
}

mod dawn {
    use std::ffi::c_void;

    use crate::webgpu;

    pub type EnumerateAdapterCallback =
        unsafe extern "C" fn(*const webgpu::WGPUAdapterInfo, *mut c_void);

    extern "C" {
        pub fn new_instance() -> *mut c_void;

        pub fn delete_instance(instance: *mut c_void);

        pub fn enumerate_adapters(
            instance: *mut c_void,
            callback: Option<EnumerateAdapterCallback>,
            userdata: *mut c_void,
        );

        pub fn create_device(
            instance: *mut c_void,
            callback: webgpu::WGPUUncapturedErrorCallback,
            backend_type: webgpu::WGPUBackendType,
            device_id: u32,
        ) -> webgpu::WGPUDevice;

        pub fn map_async(
            mode: webgpu::MapMode mode,
            offset: size_t,
            size: size_t,
            callback: webgpu::WGPUBUfferMapCallback
        ) -> webgpu::WGPUFuture;

        pub fn wait_any(
            instance: *mut c_void,
            future: webgpu::WGPUFuture,
        ) -> webgpu::WGPUWaitStatus;
    }
}
