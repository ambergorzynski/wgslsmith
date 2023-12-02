struct IOBuffer {
    value: u32,
}

@group(0)
@binding(0)
var<uniform> input: IOBuffer;

@group(0)
@binding(1)
var<storage, read_write> output: IOBuffer;

@compute
@workgroup_size(1)
fn main() {
    output.value = input.value;
}
