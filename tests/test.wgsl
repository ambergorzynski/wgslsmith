// {"0:0":[150,245,220,133,64,67,9,248,227,104,140,103,44,150,48,35,240,83,50,62,208,2,8,221,61,85,33,228,248,238,14,236,40,1,46,140,81,79,117,132,164,38,124,44,52,1,134,183]}
// Seed: 6461134473145590717

struct Struct_1 {
    a: vec2<bool>,
    b: vec2<f32>,
    c: bool,
}

struct Struct_2 {
    a: vec2<u32>,
}

struct Struct_3 {
    a: vec4<u32>,
    b: f32,
}

struct Struct_4 {
    a: i32,
}

struct Struct_5 {
    a: Struct_3,
}

struct UniformBuffer {
    a: vec2<i32>,
    b: vec2<u32>,
    c: vec4<u32>,
    d: u32,
    e: vec2<i32>,
}

struct StorageBuffer {
    a: vec4<u32>,
}

@group(0)
@binding(0)
var<uniform> u_input: UniformBuffer;

@group(0)
@binding(1)
var<storage, read_write> s_output: StorageBuffer;

var<private> global0: array<vec4<bool>, 18>;

var<private> global1: array<i32, 22> = array<i32, 22>(i32(-2147483648), 21763i, 53326i, i32(-2147483648), 1i, 10613i, 1i, -16081i, -8452i, 0i, 0i, -70232i, -67017i, i32(-2147483648), 1i, -1i, 43380i, 0i, -38025i, 1i, 90212i, -32095i);

var<private> LOOP_COUNTERS: array<u32, 17>;

fn _wgslsmith_clamp_u32(e: u32, low: u32, high: u32) -> u32 {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_mod_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return select(a % b, a, (b[0i] == 0u) || (b[1i] == 0u));
}

fn _wgslsmith_mod_u32(a: u32, b: u32) -> u32 {
    return select(a % b, a, b == 0u);
}

fn _wgslsmith_dot_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> u32 {
    return dot(clamp(a, vec2<u32>(0u), vec2<u32>(46340u)), clamp(b, vec2<u32>(0u), vec2<u32>(46340u)));
}

fn _wgslsmith_dot_vec3_u32(a: vec3<u32>, b: vec3<u32>) -> u32 {
    return dot(clamp(a, vec3<u32>(0u), vec3<u32>(37837u)), clamp(b, vec3<u32>(0u), vec3<u32>(37837u)));
}

fn _wgslsmith_mult_vec4_i32(a: vec4<i32>, b: vec4<i32>) -> vec4<i32> {
    return select(a * b, a, ((((((a[0i] == -1i) && (b[0i] == i32(-2147483648))) || ((a[0i] == i32(-2147483648)) && (b[0i] == -1i))) || (((a[1i] == -1i) && (b[1i] == i32(-2147483648))) || ((a[1i] == i32(-2147483648)) && (b[1i] == -1i)))) || (((a[2i] == -1i) && (b[2i] == i32(-2147483648))) || ((a[2i] == i32(-2147483648)) && (b[2i] == -1i)))) || (((a[3i] == -1i) && (b[3i] == i32(-2147483648))) || ((a[3i] == i32(-2147483648)) && (b[3i] == -1i)))) || (((((b[0i] != 0i) && ((a[0i] > (2147483647i / b[0i])) || (a[0i] < (i32(-2147483648) / b[0i])))) || ((b[1i] != 0i) && ((a[1i] > (2147483647i / b[1i])) || (a[1i] < (i32(-2147483648) / b[1i]))))) || ((b[2i] != 0i) && ((a[2i] > (2147483647i / b[2i])) || (a[2i] < (i32(-2147483648) / b[2i]))))) || ((b[3i] != 0i) && ((a[3i] > (2147483647i / b[3i])) || (a[3i] < (i32(-2147483648) / b[3i]))))));
}

fn _wgslsmith_f_op_vec2_f32(v: vec2<f32>) -> vec2<f32> {
    return select(v, vec2<f32>(10f), any(abs(v) < vec2<f32>(0.1f)) || any(abs(v) >= vec2<f32>(16777216f)));
}

fn _wgslsmith_sub_u32(a: u32, b: u32) -> u32 {
    return select(a - b, a, a < b);
}

fn _wgslsmith_mult_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return select(a * b, a, ((b[0i] != 0u) && (a[0i] > (4294967295u / b[0i]))) || ((b[1i] != 0u) && (a[1i] > (4294967295u / b[1i]))));
}

fn _wgslsmith_mod_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> vec4<u32> {
    return select(a % b, a, (((b[0i] == 0u) || (b[1i] == 0u)) || (b[2i] == 0u)) || (b[3i] == 0u));
}

fn _wgslsmith_clamp_vec4_i32(e: vec4<i32>, low: vec4<i32>, high: vec4<i32>) -> vec4<i32> {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_div_vec2_f32(a: vec2<f32>, b: vec2<f32>) -> vec2<f32> {
    return select(vec2<f32>(42f), vec2<f32>(-123f), (abs(a[0i] / b[0i]) > abs(a[0i])) || (abs(a[1i] / b[1i]) > abs(a[1i])));
}

fn _wgslsmith_f_op_vec3_f32(v: vec3<f32>) -> vec3<f32> {
    return select(v, vec3<f32>(10f), any(abs(v) < vec3<f32>(0.1f)) || any(abs(v) >= vec3<f32>(16777216f)));
}

fn _wgslsmith_mod_i32(a: i32, b: i32) -> i32 {
    return select(a % b, a, (a < 0i) || (b <= 0i));
}

fn _wgslsmith_div_f32(a: f32, b: f32) -> f32 {
    return select(f32(42f), f32(-123f), abs(a / b) > abs(a));
}

fn _wgslsmith_mult_u32(a: u32, b: u32) -> u32 {
    return select(a * b, a, (b != 0u) && (a > (4294967295u / b)));
}

fn _wgslsmith_div_u32(a: u32, b: u32) -> u32 {
    return select(a / b, a / u32(2u), b == 0u);
}

fn _wgslsmith_clamp_i32(e: i32, low: i32, high: i32) -> i32 {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_div_i32(a: i32, b: i32) -> i32 {
    return select(a / b, a / i32(2i), ((a == i32(-2147483648)) && (b == -1i)) || (b == 0i));
}

fn _wgslsmith_sub_i32(a: i32, b: i32) -> i32 {
    return select(a - b, a, ((b < 0i) && (a > (2147483647i + b))) || ((b > 0i) && (a < (i32(-2147483648) + b))));
}

fn _wgslsmith_sub_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> vec4<u32> {
    return select(a - b, a, a < b);
}

fn _wgslsmith_dot_vec4_i32(a: vec4<i32>, b: vec4<i32>) -> i32 {
    return dot(clamp(a, vec4<i32>(-23170i), vec4<i32>(23170i)), clamp(b, vec4<i32>(-23170i), vec4<i32>(23170i)));
}

fn _wgslsmith_add_u32(a: u32, b: u32) -> u32 {
    return select(a + b, a, a > (u32(4294967295u) - b));
}

fn _wgslsmith_f_op_f32(v: f32) -> f32 {
    return select(v, f32(10f), (abs(v) < f32(0.1f)) || (abs(v) >= f32(16777216f)));
}

fn _wgslsmith_add_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return select(a + b, a, a > (vec2<u32>(4294967295u) - b));
}

fn _wgslsmith_sub_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return select(a - b, a, a < b);
}

fn _wgslsmith_div_vec4_i32(a: vec4<i32>, b: vec4<i32>) -> vec4<i32> {
    return select(a / b, a / vec4<i32>(2i), (((((a[0i] == i32(-2147483648)) && (b[0i] == -1i)) || (b[0i] == 0i)) || (((a[1i] == i32(-2147483648)) && (b[1i] == -1i)) || (b[1i] == 0i))) || (((a[2i] == i32(-2147483648)) && (b[2i] == -1i)) || (b[2i] == 0i))) || (((a[3i] == i32(-2147483648)) && (b[3i] == -1i)) || (b[3i] == 0i)));
}

fn _wgslsmith_clamp_vec2_u32(e: vec2<u32>, low: vec2<u32>, high: vec2<u32>) -> vec2<u32> {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_index_u32(index: u32, size: u32) -> u32 {
    return index % size;
}

fn _wgslsmith_mult_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> vec4<u32> {
    return select(a * b, a, ((((b[0i] != 0u) && (a[0i] > (4294967295u / b[0i]))) || ((b[1i] != 0u) && (a[1i] > (4294967295u / b[1i])))) || ((b[2i] != 0u) && (a[2i] > (4294967295u / b[2i])))) || ((b[3i] != 0u) && (a[3i] > (4294967295u / b[3i]))));
}

fn func_6(arg_0: vec3<bool>, arg_1: vec4<bool>, arg_2: i32, arg_3: Struct_4) -> vec4<u32> {
    loop {
        if (LOOP_COUNTERS[0u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[0u] = LOOP_COUNTERS[0u] + 1u;
        switch (16310i) {
            case 2147483647i: {
                global0 = array<vec4<bool>, 18>();
                var var_0 = Struct_3(vec4<u32>(~(~(~70592u)), _wgslsmith_dot_vec2_u32(vec2<u32>(u_input.b.x, ~0u), u_input.c.zy), ~1u, max(_wgslsmith_mod_u32(u_input.c.x, u_input.d) << (abs(u_input.c.x) % 32u), ~firstLeadingBit(29141u))), 380f);
                break;
            }
            case i32(-2147483648): {
                break;
            }
            case 0i: {
            }
            default: {
                global1 = array<i32, 22>();
                continue;
            }
        }
        var var_0 = arg_3;
        for (; all(vec3<bool>(all(arg_1), true, all(arg_0.yz))) & all(vec4<bool>(true, !arg_1.x, true, true)); ) {
            if (LOOP_COUNTERS[1u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[1u] = LOOP_COUNTERS[1u] + 1u;
            let var_1 = Struct_1(arg_0.xz, vec2<f32>(1f, 1f), arg_0.x);
            global1 = array<i32, 22>();
        }
    }
    for (; ; ) {
        if (LOOP_COUNTERS[2u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[2u] = LOOP_COUNTERS[2u] + 1u;
        for (; any(select(select(!arg_0, vec3<bool>(true, arg_1.x, false), arg_1.xww), select(select(arg_1.yxw, arg_0, arg_1.x), select(arg_1.yzz, arg_0, vec3<bool>(arg_0.x, arg_1.x, false)), arg_0), arg_1.yyw)) && !arg_1.x; ) {
            if (LOOP_COUNTERS[3u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[3u] = LOOP_COUNTERS[3u] + 1u;
            let var_0 = u_input.c.xxz;
        }
        loop {
            if (LOOP_COUNTERS[4u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[4u] = LOOP_COUNTERS[4u] + 1u;
            let var_0 = Struct_1(select(arg_1.zz, select(select(arg_0.yx, vec2<bool>(arg_1.x, arg_1.x), false), arg_1.zw, select(arg_1.yx, vec2<bool>(true, false), u_input.d >= 0u)), 227f >= _wgslsmith_f_op_f32(step(-986f, _wgslsmith_f_op_f32(f32(-1f) * -917f)))), _wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(_wgslsmith_f_op_vec2_f32(floor(_wgslsmith_f_op_vec2_f32(-vec2<f32>(681f, 1346f)))) + _wgslsmith_f_op_vec2_f32(floor(_wgslsmith_div_vec2_f32(vec2<f32>(-352f, -216f), vec2<f32>(-383f, -101f)))))), arg_0.x);
            break;
        }
    }
    var var_0 = -(17674i << (u_input.c.x % 32u));
    var var_1 = -_wgslsmith_mod_i32(-42817i, ~(~u_input.e.x));
    var var_2 = -firstTrailingBit(-(arg_3.a << (~u_input.c.x % 32u)));
    return ~vec4<u32>(u_input.c.x, _wgslsmith_clamp_u32(0u, _wgslsmith_mod_u32(max(1u, 4294967295u), ~102116u), abs(_wgslsmith_dot_vec2_u32(u_input.b, vec2<u32>(u_input.d, 108967u)))), ~u_input.b.x, 64371u);
}

fn func_5(arg_0: vec2<i32>, arg_1: u32) -> bool {
    global1 = array<i32, 22>();
    let var_0 = abs(_wgslsmith_mod_u32(_wgslsmith_mult_u32(_wgslsmith_dot_vec3_u32(vec3<u32>(51423u, 4294967295u, 92222u), u_input.c.wzz), ~25851u) & arg_1, 118443u));
    for (var var_1 = 47222i; select(true, true | (_wgslsmith_sub_u32(arg_1, u_input.b.x >> (u_input.b.x % 32u)) > ~arg_1), !(4294967295u == ~(23002u | u_input.c.x))); ) {
        if (LOOP_COUNTERS[5u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[5u] = LOOP_COUNTERS[5u] + 1u;
        var var_2 = Struct_4(-25910i);
        let var_3 = Struct_2(firstLeadingBit(u_input.b));
        if (all(vec4<bool>(((u_input.e.x & global1[_wgslsmith_index_u32(arg_1, 22u)]) < select(var_2.a, u_input.e.x, true)) || true, !any(select(vec2<bool>(true, true), vec2<bool>(false, true), vec2<bool>(false, true))), true, true))) {
            global1 = array<i32, 22>();
            continue;
        }
        let var_4 = _wgslsmith_f_op_f32(ceil(538f));
        var var_5 = Struct_2(~_wgslsmith_add_vec2_u32(_wgslsmith_mult_vec2_u32(var_3.a, abs(var_3.a)), ~vec2<u32>(var_3.a.x, var_3.a.x)));
    }
    global0 = array<vec4<bool>, 18>();
    switch (0i) {
        case 2147483647i: {
            let var_1 = var_0;
            var var_2 = _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(1f, 1f, 1f) * _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(floor(vec3<f32>(-180f, 2609f, 434f))) + _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(-214f, 224f, 143f) + vec3<f32>(642f, 847f, -1000f)) - _wgslsmith_f_op_vec3_f32(step(vec3<f32>(927f, -717f, -1696f), vec3<f32>(1044f, -1061f, -1339f)))))) * _wgslsmith_f_op_vec3_f32(sign(vec3<f32>(1076f, _wgslsmith_f_op_f32(abs(_wgslsmith_f_op_f32(525f - -164f))), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-614f))))));
            let var_3 = Struct_2(firstLeadingBit(countOneBits(~u_input.b)));
        }
        case 0i: {
            global1 = array<i32, 22>();
            global0 = array<vec4<bool>, 18>();
            global1 = array<i32, 22>();
            var var_1 = u_input.c.zx;
        }
        case 60481i: {
            global0 = array<vec4<bool>, 18>();
            if (!any(!global0[_wgslsmith_index_u32(~12446u, 18u)])) {
                let var_1 = Struct_2(_wgslsmith_sub_vec2_u32(vec2<u32>(~(var_0 << (u_input.d % 32u)), _wgslsmith_mult_u32(arg_1, arg_1) << (~18982u % 32u)), ~u_input.b));
                var var_2 = Struct_3(u_input.c, -739f);
                let var_3 = 613f;
            }
            loop {
                if (LOOP_COUNTERS[6u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[6u] = LOOP_COUNTERS[6u] + 1u;
                let var_1 = Struct_5(Struct_3(func_6(select(select(vec3<bool>(true, false, true), vec3<bool>(true, true, true), vec3<bool>(true, true, false)), select(vec3<bool>(false, true, true), vec3<bool>(true, true, false), false), any(vec3<bool>(false, true, false))), select(select(vec4<bool>(false, true, false, false), vec4<bool>(false, false, true, false), vec4<bool>(true, true, false, false)), global0[_wgslsmith_index_u32(14119u, 18u)], true), 0i, Struct_4(_wgslsmith_sub_i32(0i, global1[_wgslsmith_index_u32(var_0, 22u)]))), -764f));
                var var_2 = Struct_2(_wgslsmith_add_vec2_u32(_wgslsmith_add_vec2_u32(vec2<u32>(0u, u_input.d << (arg_1 % 32u)), ~vec2<u32>(u_input.b.x, 37830u)), _wgslsmith_sub_vec2_u32(min(~vec2<u32>(var_1.a.a.x, 63435u), var_1.a.a.xy), vec2<u32>(_wgslsmith_div_u32(70223u, 1u), ~var_1.a.a.x))));
                var var_3 = 114995u;
                global1 = array<i32, 22>();
            }
            return all(select(select(global0[_wgslsmith_index_u32(arg_1, 18u)], global0[_wgslsmith_index_u32(u_input.c.x, 18u)], true), vec4<bool>(true, !any(vec2<bool>(true, true)), any(vec4<bool>(true, true, true, true)), true), select(vec4<bool>(true, true, true, true), select(vec4<bool>(true, false, false, false), vec4<bool>(true, true, true, true), all(vec4<bool>(true, false, true, false))), select(vec4<bool>(true, true, false, false), select(global0[_wgslsmith_index_u32(var_0, 18u)], global0[_wgslsmith_index_u32(var_0, 18u)], global0[_wgslsmith_index_u32(u_input.b.x, 18u)]), select(global0[_wgslsmith_index_u32(0u, 18u)], global0[_wgslsmith_index_u32(0u, 18u)], global0[_wgslsmith_index_u32(36096u, 18u)])))));
        }
        default: {
            for (var var_1 = -1i; ; ) {
                if (LOOP_COUNTERS[7u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[7u] = LOOP_COUNTERS[7u] + 1u;
                let var_2 = Struct_4(~_wgslsmith_sub_i32(_wgslsmith_clamp_i32(_wgslsmith_sub_i32(-31219i, -12322i), ~8122i, -12795i), 0i));
            }
        }
    }
    return false;
}

fn func_4(arg_0: f32) -> vec3<bool> {
    global1 = array<i32, 22>();
    loop {
        if (LOOP_COUNTERS[8u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[8u] = LOOP_COUNTERS[8u] + 1u;
    }
    switch (3781i) {
        default: {
        }
    }
    let var_0 = _wgslsmith_mod_u32(reverseBits(~u_input.b.x), _wgslsmith_div_u32(~abs(u_input.d ^ 18441u), ~u_input.b.x));
    return select(vec3<bool>(func_5(vec2<i32>(global1[_wgslsmith_index_u32(u_input.b.x, 22u)], global1[_wgslsmith_index_u32(u_input.c.x, 22u)]), 4294967295u) & (arg_0 <= _wgslsmith_f_op_f32(566f + arg_0)), true, func_5(vec2<i32>(global1[_wgslsmith_index_u32(var_0, 22u)], global1[_wgslsmith_index_u32(~var_0, 22u)]), 14979u >> (var_0 % 32u))), select(select(vec3<bool>(all(vec3<bool>(false, false, false)), true, true), vec3<bool>(true, true, true), false), !select(vec3<bool>(false, false, false), select(vec3<bool>(false, false, false), vec3<bool>(true, false, true), false), true), select(select(select(vec3<bool>(true, true, true), vec3<bool>(false, true, true), false), vec3<bool>(false, true, false), true), vec3<bool>(arg_0 < arg_0, any(vec3<bool>(true, true, true)), true), 4294967295u < (var_0 >> (var_0 % 32u)))), !(_wgslsmith_f_op_f32(round(_wgslsmith_f_op_f32(-arg_0))) != _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(sign(arg_0)) * arg_0)));
}

fn func_3(arg_0: Struct_3, arg_1: Struct_1, arg_2: vec2<i32>) -> vec2<bool> {
    global1 = array<i32, 22>();
    let var_0 = !select(vec3<bool>(true, arg_1.c, arg_1.a.x), !func_4(2108f), _wgslsmith_f_op_f32(exp2(_wgslsmith_f_op_f32(-arg_0.b))) != arg_0.b);
    global0 = array<vec4<bool>, 18>();
    global1 = array<i32, 22>();
    global0 = array<vec4<bool>, 18>();
    return func_4(_wgslsmith_f_op_f32(arg_1.b.x * _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(_wgslsmith_div_f32(-1290f, -2047f) * _wgslsmith_f_op_f32(1251f - arg_0.b))))).zy;
}

fn func_2() -> Struct_3 {
    loop {
        if (LOOP_COUNTERS[9u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[9u] = LOOP_COUNTERS[9u] + 1u;
    }
    let var_0 = Struct_1(!(!func_3(Struct_3(u_input.c, -196f), Struct_1(vec2<bool>(true, true), vec2<f32>(992f, -111f), false), ~u_input.e)), vec2<f32>(_wgslsmith_f_op_f32(sign(653f)), _wgslsmith_div_f32(_wgslsmith_f_op_f32(sign(_wgslsmith_f_op_f32(-1000f * -1364f))), _wgslsmith_div_f32(1455f, _wgslsmith_f_op_f32(-134f)))), true);
    loop {
        if (LOOP_COUNTERS[10u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[10u] = LOOP_COUNTERS[10u] + 1u;
        continue;
    }
    loop {
        if (LOOP_COUNTERS[11u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[11u] = LOOP_COUNTERS[11u] + 1u;
        break;
    }
    let var_1 = vec4<i32>(_wgslsmith_dot_vec4_i32(~(vec4<i32>(-1i) * -vec4<i32>(2147483647i, 2147483647i, 2147483647i, 35362i)), _wgslsmith_div_vec4_i32(-vec4<i32>(global1[_wgslsmith_index_u32(u_input.d, 22u)], 19760i, 10183i, u_input.e.x), _wgslsmith_mult_vec4_i32(vec4<i32>(u_input.e.x, 1i, -13207i, -1i), _wgslsmith_clamp_vec4_i32(vec4<i32>(-1i, i32(-2147483648), -2247i, global1[_wgslsmith_index_u32(62046u, 22u)]), vec4<i32>(-43664i, u_input.e.x, -64226i, u_input.e.x), vec4<i32>(42410i, 60746i, -32011i, -31193i))))), u_input.a.x, -53148i, ~(-1i));
    return Struct_3(vec4<u32>(u_input.d, ~u_input.c.x, min(u_input.d ^ (u_input.d ^ u_input.d), abs(u_input.d)), 1u), var_0.b.x);
}

fn func_7(arg_0: Struct_3, arg_1: Struct_2) -> f32 {
    var var_0 = Struct_3(u_input.c, _wgslsmith_f_op_f32(trunc(163f)));
    let var_1 = _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(max(arg_0.b, func_2().b)));
    switch (select(0i, u_input.e.x, (1240f == _wgslsmith_f_op_f32(exp2(_wgslsmith_f_op_f32(158f * var_0.b)))) == false)) {
        default: {
            if (u_input.a.x <= global1[_wgslsmith_index_u32(~firstTrailingBit(firstLeadingBit(u_input.c.x)), 22u)]) {
                let var_2 = Struct_4(_wgslsmith_div_i32(71867i, -13144i));
            }
            let var_2 = select(vec4<u32>(arg_0.a.x, _wgslsmith_mod_u32(4294967295u ^ firstTrailingBit(7835u), ~_wgslsmith_add_u32(13223u, arg_0.a.x)), ~46384u, select(~(~1u), abs(abs(arg_1.a.x)), _wgslsmith_f_op_f32(arg_0.b - arg_0.b) >= _wgslsmith_f_op_f32(var_0.b - var_0.b))), u_input.c << (vec4<u32>(~arg_1.a.x, 4294967295u, _wgslsmith_mult_u32(~u_input.d, u_input.d), (arg_0.a.x >> (59068u % 32u)) << (4294967295u % 32u)) % vec4<u32>(32u)), !global0[_wgslsmith_index_u32(arg_1.a.x ^ _wgslsmith_div_u32(firstLeadingBit(u_input.d), firstTrailingBit(var_0.a.x)), 18u)]);
            var_0 = func_2();
            switch (_wgslsmith_sub_i32(_wgslsmith_sub_i32(firstTrailingBit(_wgslsmith_sub_i32(global1[_wgslsmith_index_u32(abs(arg_0.a.x), 22u)], -u_input.e.x)), i32(-2147483648)), -27482i)) {
                default: {
                    global0 = array<vec4<bool>, 18>();
                    var var_3 = 1i;
                    let var_4 = Struct_5(Struct_3(arg_0.a, arg_0.b));
                    let var_5 = _wgslsmith_f_op_vec3_f32(abs(vec3<f32>(479f, -329f, 1000f)));
                    var var_6 = Struct_4(~0i);
                }
            }
            let var_3 = vec3<f32>(arg_0.b, _wgslsmith_f_op_f32(exp2(_wgslsmith_f_op_f32(-arg_0.b))), -555f);
        }
    }
    switch (u_input.a.x) {
        case 877i: {
            var_0 = func_2();
            switch (max(min(u_input.a.x, ~(i32(-2147483648) ^ global1[_wgslsmith_index_u32(~arg_1.a.x, 22u)])), 1970i)) {
                case -1i: {
                    let var_2 = Struct_2(~min(select(_wgslsmith_clamp_vec2_u32(arg_0.a.zz, var_0.a.xw, arg_0.a.ww), arg_0.a.xy, vec2<bool>(false, false)), vec2<u32>(~24864u, _wgslsmith_dot_vec3_u32(vec3<u32>(u_input.c.x, 4294967295u, 4294967295u), vec3<u32>(arg_1.a.x, 36028u, 29477u)))));
                    global0 = array<vec4<bool>, 18>();
                    let var_3 = Struct_4(i32(-1i) * -20620i);
                    var_0 = Struct_3(var_0.a, _wgslsmith_f_op_f32(418f + _wgslsmith_f_op_f32(-379f - _wgslsmith_f_op_f32(step(-543f, _wgslsmith_f_op_f32(max(955f, -531f)))))));
                }
                case 1i: {
                    let var_2 = var_0.b;
                    let var_3 = _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(f32(-1f) * -1148f));
                    let var_4 = abs(_wgslsmith_mod_vec2_u32(arg_0.a.zw, _wgslsmith_clamp_vec2_u32(select(arg_1.a, arg_0.a.wx, true) ^ ~arg_1.a, vec2<u32>(4294967295u, u_input.d), arg_1.a)));
                    let var_5 = Struct_5(arg_0);
                }
                case 0i: {
                    let var_2 = -63266i;
                    global0 = array<vec4<bool>, 18>();
                    let var_3 = vec4<f32>(-689f, -159f, _wgslsmith_f_op_f32(sign(_wgslsmith_f_op_f32(abs(_wgslsmith_f_op_f32(ceil(_wgslsmith_f_op_f32(244f * arg_0.b))))))), arg_0.b);
                    var var_4 = Struct_5(arg_0);
                    let var_5 = Struct_3(~(countOneBits(firstTrailingBit(vec4<u32>(arg_1.a.x, 23u, 18835u, 59971u))) << (reverseBits(vec4<u32>(var_4.a.a.x, 4294967295u, 52372u, 19314u)) % vec4<u32>(32u))), var_4.a.b);
                }
                case 29586i: {
                    let var_2 = -1387f;
                    let var_3 = 1u;
                    global0 = array<vec4<bool>, 18>();
                }
                default: {
                    var_0 = Struct_3(_wgslsmith_mult_vec4_u32(_wgslsmith_sub_vec4_u32(_wgslsmith_sub_vec4_u32(var_0.a, vec4<u32>(var_0.a.x, 4795u, 4294967295u, arg_0.a.x)), vec4<u32>(1u, arg_0.a.x, 1u, u_input.c.x)) ^ _wgslsmith_mod_vec4_u32(~var_0.a, u_input.c), u_input.c), arg_0.b);
                    return _wgslsmith_f_op_f32(_wgslsmith_div_f32(_wgslsmith_f_op_f32(round(_wgslsmith_f_op_f32(-274f + _wgslsmith_div_f32(1511f, 1000f)))), _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(708f + _wgslsmith_f_op_f32(-var_0.b)) - var_0.b)) - 387f);
                }
            }
            if (firstTrailingBit(~(~28974u) & var_0.a.x) == abs(4294967295u)) {
                var var_2 = arg_1;
                global1 = array<i32, 22>();
                let var_3 = 1f;
                let var_4 = !vec2<bool>(false && any(vec3<bool>(false, true, true)), any(vec2<bool>(true, true)));
                var_2 = Struct_2(func_6(select(func_4(1666f), func_4(_wgslsmith_div_f32(var_1, var_3)), vec3<bool>(!var_4.x, false, true)), vec4<bool>(18031i < countOneBits(u_input.a.x), false, any(!vec3<bool>(var_4.x, true, false)), true), global1[_wgslsmith_index_u32(select(_wgslsmith_div_u32(arg_0.a.x, arg_1.a.x), var_2.a.x, var_4.x), 22u)], Struct_4(countOneBits(u_input.a.x))).zx);
            }
            if (any(select(func_4(_wgslsmith_f_op_f32(step(_wgslsmith_f_op_f32(arg_0.b * 174f), var_0.b))).zz, !select(vec2<bool>(true, true), func_4(936f).yy, true), true))) {
                var_0 = Struct_3(u_input.c, _wgslsmith_div_f32(var_1, var_0.b));
            }
        }
        default: {
            if (!(!(_wgslsmith_clamp_u32(44000u, ~1u, _wgslsmith_dot_vec2_u32(vec2<u32>(var_0.a.x, u_input.c.x), vec2<u32>(arg_1.a.x, 2958u))) > _wgslsmith_clamp_u32(1u, max(1u, 0u), 1u)))) {
            }
            var var_2 = Struct_1(select(!select(select(vec2<bool>(true, false), vec2<bool>(true, true), vec2<bool>(false, true)), vec2<bool>(false, false), vec2<bool>(false, false)), !vec2<bool>(all(vec3<bool>(true, false, true)), 2147483647i == global1[_wgslsmith_index_u32(92575u, 22u)]), vec2<bool>(any(!global0[_wgslsmith_index_u32(1u, 18u)]), all(vec3<bool>(true, false, false)) == true)), _wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(round(vec2<f32>(_wgslsmith_f_op_f32(-708f), var_1)))), all(vec3<bool>(false, true, true)));
            loop {
                if (LOOP_COUNTERS[12u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[12u] = LOOP_COUNTERS[12u] + 1u;
                break;
            }
            var_0 = func_2();
        }
    }
    for (var var_2 = 25373i; var_2 != 1i; global1 = array<i32, 22>()) {
        if (LOOP_COUNTERS[13u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[13u] = LOOP_COUNTERS[13u] + 1u;
    }
    return _wgslsmith_div_f32(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(min(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(f32(-1f) * -924f)), _wgslsmith_f_op_f32(-var_1))) * _wgslsmith_f_op_f32(ceil(var_1))), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(f32(-1f) * -287f)));
}

fn func_1(arg_0: u32) -> f32 {
    var var_0 = Struct_3(vec4<u32>(arg_0, ~(~abs(4294967295u)), (_wgslsmith_dot_vec2_u32(vec2<u32>(1u, arg_0), vec2<u32>(4294967295u, arg_0)) ^ arg_0) << (_wgslsmith_mult_u32(u_input.d, _wgslsmith_add_u32(arg_0, u_input.d)) % 32u), arg_0), _wgslsmith_f_op_f32(min(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(max(_wgslsmith_f_op_f32(290f + 2712f), _wgslsmith_f_op_f32(-1928f + 606f)))), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(func_7(func_2(), Struct_2(u_input.c.zy)))))));
    var var_1 = vec2<bool>(true, true);
    let var_2 = Struct_4(1i);
    var var_3 = var_2;
    loop {
        if (LOOP_COUNTERS[14u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[14u] = LOOP_COUNTERS[14u] + 1u;
        continue;
    }
    return _wgslsmith_f_op_f32(385f + _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(round(2384f))) + var_0.b) + _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(abs(var_0.b)))));
}

@compute
@workgroup_size(1)
fn main() {
    let var_0 = _wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(_wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(vec2<f32>(-587f, -437f) - vec2<f32>(772f, 392f)))) - _wgslsmith_div_vec2_f32(_wgslsmith_f_op_vec2_f32(min(_wgslsmith_f_op_vec2_f32(-vec2<f32>(-403f, -1662f)), _wgslsmith_f_op_vec2_f32(select(vec2<f32>(-1021f, 1253f), vec2<f32>(890f, -249f), false)))), _wgslsmith_f_op_vec2_f32(select(_wgslsmith_div_vec2_f32(vec2<f32>(-2656f, -1000f), vec2<f32>(-1400f, 295f)), vec2<f32>(1f, 1f), vec2<bool>(true, true))))));
    global0 = array<vec4<bool>, 18>();
    var var_1 = _wgslsmith_f_op_f32(-1000f + _wgslsmith_div_f32(_wgslsmith_f_op_f32(abs(_wgslsmith_f_op_f32(ceil(_wgslsmith_f_op_f32(func_1(u_input.c.x)))))), var_0.x));
    global1 = array<i32, 22>();
    loop {
        if (LOOP_COUNTERS[15u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[15u] = LOOP_COUNTERS[15u] + 1u;
        for (var var_2 = 53182i | (_wgslsmith_div_i32(~u_input.a.x, 49331i) << (~1u % 32u)); all(vec2<bool>(all(vec3<bool>(func_4(-1284f).x, true, all(vec4<bool>(false, true, true, true)))), !(!(var_0.x <= -2041f)))); var_2 += 1i) {
            if (LOOP_COUNTERS[16u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[16u] = LOOP_COUNTERS[16u] + 1u;
            continue;
        }
    }
    let var_2 = (vec4<u32>(~u_input.c.x, 4294967295u, 13910u, 1u) << (u_input.c % vec4<u32>(32u))) << (u_input.c % vec4<u32>(32u));
    let var_3 = Struct_5(func_2());
    let x = u_input.a;
    s_output = StorageBuffer(vec4<u32>(func_6(select(vec3<bool>(true, true, true), vec3<bool>(true, true, true), vec3<bool>(false, false, true)), !(!global0[_wgslsmith_index_u32(4294967295u, 18u)]), u_input.a.x, Struct_4(u_input.a.x)).x, 1u, 40542u, select(0u, select(48496u, ~u_input.c.x, false), any(vec2<bool>(false, true)))));
}

