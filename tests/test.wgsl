// {"0:0":[243,107,30,11,161,156,13,57,48,231,243,183,132,130,184,57,230,193,181,46,70,187,180,62,188,241,118,2,166,106,19,234]}
// Seed: 2537732385656497058

struct Struct_1 {
    a: vec3<f32>,
    b: vec3<f32>,
    c: i32,
    d: u32,
}

struct Struct_2 {
    a: Struct_1,
    b: Struct_1,
    c: vec3<bool>,
    d: vec3<u32>,
}

struct Struct_3 {
    a: Struct_1,
    b: u32,
}

struct Struct_4 {
    a: f32,
    b: vec3<f32>,
}

struct UniformBuffer {
    a: vec4<u32>,
    b: vec4<u32>,
}

struct StorageBuffer {
    a: vec4<f32>,
}

@group(0)
@binding(0)
var<uniform> u_input: UniformBuffer;

@group(0)
@binding(1)
var<storage, read_write> s_output: StorageBuffer;

var<private> LOOP_COUNTERS: array<u32, 37>;

fn _wgslsmith_clamp_vec2_i32(e: vec2<i32>, low: vec2<i32>, high: vec2<i32>) -> vec2<i32> {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_dot_vec2_i32(a: vec2<i32>, b: vec2<i32>) -> i32 {
    return dot(clamp(a, vec2<i32>(-32767i), vec2<i32>(32767i)), clamp(b, vec2<i32>(-32767i), vec2<i32>(32767i)));
}

fn _wgslsmith_div_f32(a: f32, b: f32) -> f32 {
    return select(f32(42f), f32(-123f), abs(a / b) > abs(a));
}

fn _wgslsmith_clamp_u32(e: u32, low: u32, high: u32) -> u32 {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_add_vec3_i32(a: vec3<i32>, b: vec3<i32>) -> vec3<i32> {
    return select(a + b, a, ((((b[0i] > 0i) && (a[0i] > (2147483647i - b[0i]))) || ((b[1i] > 0i) && (a[1i] > (2147483647i - b[1i])))) || ((b[2i] > 0i) && (a[2i] > (2147483647i - b[2i])))) || ((((b[0i] < 0i) && (a[0i] < (i32(-2147483648) - b[0i]))) || ((b[1i] < 0i) && (a[1i] < (i32(-2147483648) - b[1i])))) || ((b[2i] < 0i) && (a[2i] < (i32(-2147483648) - b[2i])))));
}

fn _wgslsmith_mod_i32(a: i32, b: i32) -> i32 {
    return select(a % b, a, (a < 0i) || (b <= 0i));
}

fn _wgslsmith_sub_u32(a: u32, b: u32) -> u32 {
    return select(a - b, a, a < b);
}

fn _wgslsmith_sub_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> vec4<u32> {
    return select(a - b, a, a < b);
}

fn _wgslsmith_div_vec4_f32(a: vec4<f32>, b: vec4<f32>) -> vec4<f32> {
    return select(vec4<f32>(42f), vec4<f32>(-123f), (((abs(a[0i] / b[0i]) > abs(a[0i])) || (abs(a[1i] / b[1i]) > abs(a[1i]))) || (abs(a[2i] / b[2i]) > abs(a[2i]))) || (abs(a[3i] / b[3i]) > abs(a[3i])));
}

fn _wgslsmith_div_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> vec4<u32> {
    return select(a / b, a / vec4<u32>(2u), (((b[0i] == 0u) || (b[1i] == 0u)) || (b[2i] == 0u)) || (b[3i] == 0u));
}

fn _wgslsmith_dot_vec4_i32(a: vec4<i32>, b: vec4<i32>) -> i32 {
    return dot(clamp(a, vec4<i32>(-23170i), vec4<i32>(23170i)), clamp(b, vec4<i32>(-23170i), vec4<i32>(23170i)));
}

fn _wgslsmith_clamp_vec3_u32(e: vec3<u32>, low: vec3<u32>, high: vec3<u32>) -> vec3<u32> {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_mult_i32(a: i32, b: i32) -> i32 {
    return select(a * b, a, (((a == -1i) && (b == i32(-2147483648))) || ((a == i32(-2147483648)) && (b == -1i))) || ((b != 0i) && ((a > (2147483647i / b)) || (a < (i32(-2147483648) / b)))));
}

fn _wgslsmith_add_vec4_i32(a: vec4<i32>, b: vec4<i32>) -> vec4<i32> {
    return select(a + b, a, (((((b[0i] > 0i) && (a[0i] > (2147483647i - b[0i]))) || ((b[1i] > 0i) && (a[1i] > (2147483647i - b[1i])))) || ((b[2i] > 0i) && (a[2i] > (2147483647i - b[2i])))) || ((b[3i] > 0i) && (a[3i] > (2147483647i - b[3i])))) || (((((b[0i] < 0i) && (a[0i] < (i32(-2147483648) - b[0i]))) || ((b[1i] < 0i) && (a[1i] < (i32(-2147483648) - b[1i])))) || ((b[2i] < 0i) && (a[2i] < (i32(-2147483648) - b[2i])))) || ((b[3i] < 0i) && (a[3i] < (i32(-2147483648) - b[3i])))));
}

fn _wgslsmith_mult_u32(a: u32, b: u32) -> u32 {
    return select(a * b, a, (b != 0u) && (a > (4294967295u / b)));
}

fn _wgslsmith_mod_vec3_i32(a: vec3<i32>, b: vec3<i32>) -> vec3<i32> {
    return select(a % b, a, (((a[0i] < 0i) || (b[0i] <= 0i)) || ((a[1i] < 0i) || (b[1i] <= 0i))) || ((a[2i] < 0i) || (b[2i] <= 0i)));
}

fn _wgslsmith_mod_vec2_i32(a: vec2<i32>, b: vec2<i32>) -> vec2<i32> {
    return select(a % b, a, ((a[0i] < 0i) || (b[0i] <= 0i)) || ((a[1i] < 0i) || (b[1i] <= 0i)));
}

fn _wgslsmith_sub_i32(a: i32, b: i32) -> i32 {
    return select(a - b, a, ((b < 0i) && (a > (2147483647i + b))) || ((b > 0i) && (a < (i32(-2147483648) + b))));
}

fn _wgslsmith_dot_vec3_u32(a: vec3<u32>, b: vec3<u32>) -> u32 {
    return dot(clamp(a, vec3<u32>(0u), vec3<u32>(37837u)), clamp(b, vec3<u32>(0u), vec3<u32>(37837u)));
}

fn _wgslsmith_sub_vec3_u32(a: vec3<u32>, b: vec3<u32>) -> vec3<u32> {
    return select(a - b, a, a < b);
}

fn _wgslsmith_add_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> vec4<u32> {
    return select(a + b, a, a > (vec4<u32>(4294967295u) - b));
}

fn _wgslsmith_mod_u32(a: u32, b: u32) -> u32 {
    return select(a % b, a, b == 0u);
}

fn _wgslsmith_div_vec4_i32(a: vec4<i32>, b: vec4<i32>) -> vec4<i32> {
    return select(a / b, a / vec4<i32>(2i), (((((a[0i] == i32(-2147483648)) && (b[0i] == -1i)) || (b[0i] == 0i)) || (((a[1i] == i32(-2147483648)) && (b[1i] == -1i)) || (b[1i] == 0i))) || (((a[2i] == i32(-2147483648)) && (b[2i] == -1i)) || (b[2i] == 0i))) || (((a[3i] == i32(-2147483648)) && (b[3i] == -1i)) || (b[3i] == 0i)));
}

fn _wgslsmith_add_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return select(a + b, a, a > (vec2<u32>(4294967295u) - b));
}

fn _wgslsmith_f_op_vec3_f32(v: vec3<f32>) -> vec3<f32> {
    return select(v, vec3<f32>(10f), any(abs(v) < vec3<f32>(0.1f)) || any(abs(v) >= vec3<f32>(16777216f)));
}

fn _wgslsmith_f_op_f32(v: f32) -> f32 {
    return select(v, f32(10f), (abs(v) < f32(0.1f)) || (abs(v) >= f32(16777216f)));
}

fn _wgslsmith_div_u32(a: u32, b: u32) -> u32 {
    return select(a / b, a / u32(2u), b == 0u);
}

fn _wgslsmith_div_vec3_f32(a: vec3<f32>, b: vec3<f32>) -> vec3<f32> {
    return select(vec3<f32>(42f), vec3<f32>(-123f), ((abs(a[0i] / b[0i]) > abs(a[0i])) || (abs(a[1i] / b[1i]) > abs(a[1i]))) || (abs(a[2i] / b[2i]) > abs(a[2i])));
}

fn _wgslsmith_f_op_vec2_f32(v: vec2<f32>) -> vec2<f32> {
    return select(v, vec2<f32>(10f), any(abs(v) < vec2<f32>(0.1f)) || any(abs(v) >= vec2<f32>(16777216f)));
}

fn _wgslsmith_add_i32(a: i32, b: i32) -> i32 {
    return select(a + b, a, ((b > 0i) && (a > (2147483647i - b))) || ((b < 0i) && (a < (i32(-2147483648) - b))));
}

fn _wgslsmith_mod_vec3_u32(a: vec3<u32>, b: vec3<u32>) -> vec3<u32> {
    return select(a % b, a, ((b[0i] == 0u) || (b[1i] == 0u)) || (b[2i] == 0u));
}

fn _wgslsmith_add_u32(a: u32, b: u32) -> u32 {
    return select(a + b, a, a > (u32(4294967295u) - b));
}

fn _wgslsmith_div_i32(a: i32, b: i32) -> i32 {
    return select(a / b, a / i32(2i), ((a == i32(-2147483648)) && (b == -1i)) || (b == 0i));
}

fn _wgslsmith_div_vec3_u32(a: vec3<u32>, b: vec3<u32>) -> vec3<u32> {
    return select(a / b, a / vec3<u32>(2u), ((b[0i] == 0u) || (b[1i] == 0u)) || (b[2i] == 0u));
}

fn _wgslsmith_mult_vec2_i32(a: vec2<i32>, b: vec2<i32>) -> vec2<i32> {
    return select(a * b, a, ((((a[0i] == -1i) && (b[0i] == i32(-2147483648))) || ((a[0i] == i32(-2147483648)) && (b[0i] == -1i))) || (((a[1i] == -1i) && (b[1i] == i32(-2147483648))) || ((a[1i] == i32(-2147483648)) && (b[1i] == -1i)))) || (((b[0i] != 0i) && ((a[0i] > (2147483647i / b[0i])) || (a[0i] < (i32(-2147483648) / b[0i])))) || ((b[1i] != 0i) && ((a[1i] > (2147483647i / b[1i])) || (a[1i] < (i32(-2147483648) / b[1i]))))));
}

fn _wgslsmith_f_op_vec4_f32(v: vec4<f32>) -> vec4<f32> {
    return select(v, vec4<f32>(10f), any(abs(v) < vec4<f32>(0.1f)) || any(abs(v) >= vec4<f32>(16777216f)));
}

fn _wgslsmith_mult_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> vec4<u32> {
    return select(a * b, a, ((((b[0i] != 0u) && (a[0i] > (4294967295u / b[0i]))) || ((b[1i] != 0u) && (a[1i] > (4294967295u / b[1i])))) || ((b[2i] != 0u) && (a[2i] > (4294967295u / b[2i])))) || ((b[3i] != 0u) && (a[3i] > (4294967295u / b[3i]))));
}

fn _wgslsmith_clamp_i32(e: i32, low: i32, high: i32) -> i32 {
    return select(clamp(e, low, high), clamp(e, high, low), low > high);
}

fn _wgslsmith_div_vec2_f32(a: vec2<f32>, b: vec2<f32>) -> vec2<f32> {
    return select(vec2<f32>(42f), vec2<f32>(-123f), (abs(a[0i] / b[0i]) > abs(a[0i])) || (abs(a[1i] / b[1i]) > abs(a[1i])));
}

fn _wgslsmith_mult_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return select(a * b, a, ((b[0i] != 0u) && (a[0i] > (4294967295u / b[0i]))) || ((b[1i] != 0u) && (a[1i] > (4294967295u / b[1i]))));
}

fn _wgslsmith_dot_vec3_i32(a: vec3<i32>, b: vec3<i32>) -> i32 {
    return dot(clamp(a, vec3<i32>(-26754i), vec3<i32>(26754i)), clamp(b, vec3<i32>(-26754i), vec3<i32>(26754i)));
}

fn _wgslsmith_mult_vec3_u32(a: vec3<u32>, b: vec3<u32>) -> vec3<u32> {
    return select(a * b, a, (((b[0i] != 0u) && (a[0i] > (4294967295u / b[0i]))) || ((b[1i] != 0u) && (a[1i] > (4294967295u / b[1i])))) || ((b[2i] != 0u) && (a[2i] > (4294967295u / b[2i]))));
}

fn _wgslsmith_sub_vec4_i32(a: vec4<i32>, b: vec4<i32>) -> vec4<i32> {
    return select(a - b, a, (((((b[0i] < 0i) && (a[0i] > (2147483647i + b[0i]))) || ((b[1i] < 0i) && (a[1i] > (2147483647i + b[1i])))) || ((b[2i] < 0i) && (a[2i] > (2147483647i + b[2i])))) || ((b[3i] < 0i) && (a[3i] > (2147483647i + b[3i])))) || (((((b[0i] > 0i) && (a[0i] < (i32(-2147483648) + b[0i]))) || ((b[1i] > 0i) && (a[1i] < (i32(-2147483648) + b[1i])))) || ((b[2i] > 0i) && (a[2i] < (i32(-2147483648) + b[2i])))) || ((b[3i] > 0i) && (a[3i] < (i32(-2147483648) + b[3i])))));
}

fn _wgslsmith_add_vec3_u32(a: vec3<u32>, b: vec3<u32>) -> vec3<u32> {
    return select(a + b, a, a > (vec3<u32>(4294967295u) - b));
}

fn _wgslsmith_sub_vec3_i32(a: vec3<i32>, b: vec3<i32>) -> vec3<i32> {
    return select(a - b, a, ((((b[0i] < 0i) && (a[0i] > (2147483647i + b[0i]))) || ((b[1i] < 0i) && (a[1i] > (2147483647i + b[1i])))) || ((b[2i] < 0i) && (a[2i] > (2147483647i + b[2i])))) || ((((b[0i] > 0i) && (a[0i] < (i32(-2147483648) + b[0i]))) || ((b[1i] > 0i) && (a[1i] < (i32(-2147483648) + b[1i])))) || ((b[2i] > 0i) && (a[2i] < (i32(-2147483648) + b[2i])))));
}

fn _wgslsmith_dot_vec4_u32(a: vec4<u32>, b: vec4<u32>) -> u32 {
    return dot(clamp(a, vec4<u32>(0u), vec4<u32>(32767u)), clamp(b, vec4<u32>(0u), vec4<u32>(32767u)));
}

fn _wgslsmith_dot_vec2_u32(a: vec2<u32>, b: vec2<u32>) -> u32 {
    return dot(clamp(a, vec2<u32>(0u), vec2<u32>(46340u)), clamp(b, vec2<u32>(0u), vec2<u32>(46340u)));
}

fn func_6(arg_0: Struct_1, arg_1: vec2<u32>) -> vec3<f32> {
    var var_0 = Struct_1(_wgslsmith_f_op_vec3_f32(exp2(_wgslsmith_f_op_vec3_f32(abs(_wgslsmith_f_op_vec3_f32(-arg_0.a))))), arg_0.a, _wgslsmith_clamp_i32((i32(-1i) * -arg_0.c) & 18612i, arg_0.c, arg_0.c), u_input.a.x);
    var_0 = Struct_1(_wgslsmith_f_op_vec3_f32(select(_wgslsmith_f_op_vec3_f32(-vec3<f32>(_wgslsmith_f_op_f32(f32(-1f) * -121f), arg_0.a.x, arg_0.a.x)), _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(sign(_wgslsmith_div_vec3_f32(vec3<f32>(307f, arg_0.b.x, var_0.b.x), vec3<f32>(-398f, arg_0.b.x, 333f))))), select(vec3<bool>(true, any(vec3<bool>(true, false, true)), true), !select(vec3<bool>(false, true, false), vec3<bool>(false, false, true), false), select(vec3<bool>(true, false, true), vec3<bool>(true, true, true), vec3<bool>(true, true, true))))), vec3<f32>(_wgslsmith_f_op_f32(-664f - _wgslsmith_f_op_f32(sign(1893f))), arg_0.a.x, _wgslsmith_f_op_f32(var_0.a.x + 1885f)), firstLeadingBit(_wgslsmith_add_i32(-1i, arg_0.c)), arg_0.d & reverseBits(4294967295u));
    for (var var_1 = 28871i; var_1 >= -23889i; var_1 -= 1i) {
        if (LOOP_COUNTERS[0u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[0u] = LOOP_COUNTERS[0u] + 1u;
        loop {
            if (LOOP_COUNTERS[1u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[1u] = LOOP_COUNTERS[1u] + 1u;
            var var_2 = _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(abs(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(step(var_0.b.x, arg_0.b.x)) + _wgslsmith_f_op_f32(sign(arg_0.b.x))) + _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(var_0.a.x + -1231f) * arg_0.b.x)))) * 1038f);
            var var_3 = u_input.a.x;
            var var_4 = Struct_1(_wgslsmith_div_vec3_f32(_wgslsmith_f_op_vec3_f32(round(arg_0.b)), _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-arg_0.a))), vec3<f32>(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(step(589f, var_0.b.x)) * _wgslsmith_f_op_f32(-var_0.a.x)) - _wgslsmith_f_op_f32(trunc(937f))), -1607f, _wgslsmith_f_op_f32(-418f)), min(arg_0.c, 1i), var_0.d);
        }
    }
    let var_1 = _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(sign(_wgslsmith_div_f32(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-var_0.b.x)), _wgslsmith_f_op_f32(round(-1000f))))) * _wgslsmith_f_op_f32(-216f));
    if (!(!any(select(select(vec2<bool>(false, false), vec2<bool>(false, false), false), vec2<bool>(false, true), vec2<bool>(false, false))))) {
        for (var var_2: i32; true; var_2 -= 1i) {
            if (LOOP_COUNTERS[2u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[2u] = LOOP_COUNTERS[2u] + 1u;
            break;
        }
        var_0 = Struct_1(_wgslsmith_f_op_vec3_f32(abs(vec3<f32>(1266f, _wgslsmith_f_op_f32(abs(var_1)), _wgslsmith_div_f32(-1232f, _wgslsmith_f_op_f32(-arg_0.a.x))))), arg_0.b, -27841i, var_0.d);
        for (var var_2 = _wgslsmith_mod_i32(_wgslsmith_sub_i32(arg_0.c, arg_0.c), _wgslsmith_clamp_i32(~countOneBits(_wgslsmith_div_i32(60629i, 54678i)), max(_wgslsmith_mod_i32(arg_0.c, i32(-2147483648)), countOneBits(15206i)) & -(~0i), -arg_0.c)); var_2 != 1i; ) {
            if (LOOP_COUNTERS[3u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[3u] = LOOP_COUNTERS[3u] + 1u;
            return _wgslsmith_f_op_vec3_f32(-arg_0.b);
        }
        for (; ; ) {
            if (LOOP_COUNTERS[4u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[4u] = LOOP_COUNTERS[4u] + 1u;
            var var_2 = select(select(vec4<bool>(true, all(vec2<bool>(true, true)), true, true), !vec4<bool>(any(vec3<bool>(true, true, false)), all(vec2<bool>(true, false)), true, true), !(!select(vec4<bool>(true, true, false, false), vec4<bool>(true, false, false, true), vec4<bool>(true, true, false, true)))), vec4<bool>(true, true, true, true), true);
            continue;
        }
    }
    return vec3<f32>(_wgslsmith_f_op_f32(-_wgslsmith_div_f32(_wgslsmith_f_op_f32(sign(370f)), _wgslsmith_div_f32(var_0.b.x, 1557f))), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(exp2(var_1))), -1039f);
}

fn func_5() -> Struct_3 {
    var var_0 = Struct_2(Struct_1(_wgslsmith_f_op_vec3_f32(floor(vec3<f32>(1f, 1f, 1f))), _wgslsmith_f_op_vec3_f32(func_6(Struct_1(_wgslsmith_f_op_vec3_f32(sign(vec3<f32>(-265f, -1170f, -174f))), _wgslsmith_f_op_vec3_f32(round(vec3<f32>(-844f, -452f, -369f))), firstTrailingBit(31228i), u_input.a.x >> (u_input.b.x % 32u)), u_input.a.yx >> (~u_input.a.yx % vec2<u32>(32u)))), -_wgslsmith_dot_vec2_i32(vec2<i32>(1i, 2347i), vec2<i32>(-21385i, -1i)) >> (~firstTrailingBit(1u) % 32u), 4294967295u), Struct_1(_wgslsmith_f_op_vec3_f32(max(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(round(vec3<f32>(1000f, 1127f, -511f)))), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(765f, -1000f, 1139f) + vec3<f32>(953f, 198f, 1107f)) * _wgslsmith_f_op_vec3_f32(vec3<f32>(-1298f, -1735f, 1224f) + vec3<f32>(1000f, 794f, -517f))))), _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(min(vec3<f32>(-1000f, 436f, -905f), vec3<f32>(-717f, -960f, -227f))))), ~(i32(-2147483648)), (_wgslsmith_mult_u32(u_input.b.x, 1u) >> (~u_input.a.x % 32u)) & ~81787u), select(vec3<bool>(all(vec4<bool>(true, true, true, true)), select(true, true, false), all(vec4<bool>(true, true, true, false))), vec3<bool>(true, true, true), vec3<bool>(firstTrailingBit(16395u) <= 1u, true, false)), min(~(u_input.a.xxy & vec3<u32>(u_input.b.x, 23492u, 45425u)), vec3<u32>(_wgslsmith_div_u32(_wgslsmith_mult_u32(4215u, 1u), min(65397u, u_input.a.x)), 4294967295u, ~1u)));
    let var_1 = max(abs(~var_0.a.d), _wgslsmith_div_u32(_wgslsmith_sub_u32(u_input.b.x, 1u), ~0u));
    let var_2 = u_input.a.x == ~_wgslsmith_mod_u32(~u_input.b.x, _wgslsmith_dot_vec2_u32(vec2<u32>(64108u, var_1), u_input.b.yw));
    for (; (2147483647i != ~var_0.b.c) | true; ) {
        if (LOOP_COUNTERS[5u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[5u] = LOOP_COUNTERS[5u] + 1u;
    }
    let var_3 = Struct_3(var_0.b, 4294967295u);
    return Struct_3(Struct_1(var_0.a.b, vec3<f32>(-1000f, _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-1338f)), _wgslsmith_f_op_f32(min(_wgslsmith_f_op_f32(-167f), _wgslsmith_f_op_vec3_f32(func_6(var_3.a, vec2<u32>(1u, var_3.b))).x))), firstTrailingBit(-1i), 1u), ~17914u);
}

fn func_7(arg_0: vec3<bool>, arg_1: Struct_3) -> f32 {
    let var_0 = arg_1.a;
    for (var var_1 = 72000i; !(arg_1.a.d >= _wgslsmith_clamp_u32(~1u, firstLeadingBit(_wgslsmith_sub_u32(var_0.d, arg_1.a.d)), _wgslsmith_dot_vec2_u32(~vec2<u32>(u_input.a.x, var_0.d), _wgslsmith_add_vec2_u32(u_input.a.yy, u_input.a.ww)))); var_1 = 3588i) {
        if (LOOP_COUNTERS[6u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[6u] = LOOP_COUNTERS[6u] + 1u;
        var var_2 = countOneBits(_wgslsmith_add_vec4_i32(_wgslsmith_add_vec4_i32(abs(~vec4<i32>(arg_1.a.c, 2815i, var_0.c, arg_1.a.c)), -(~vec4<i32>(2147483647i, 65915i, -1756i, arg_1.a.c))), select(max(vec4<i32>(i32(-2147483648), arg_1.a.c, arg_1.a.c, -1i), vec4<i32>(var_0.c, 36603i, 20255i, arg_1.a.c)), _wgslsmith_div_vec4_i32(vec4<i32>(arg_1.a.c, arg_1.a.c, -1i, 40328i), vec4<i32>(var_0.c, var_0.c, 41955i, -23523i)), arg_0.x) << (_wgslsmith_div_vec4_u32(~u_input.b, ~u_input.a) % vec4<u32>(32u))));
        let var_3 = all(!select(!(!arg_0), !(!vec3<bool>(false, arg_0.x, arg_0.x)), !select(arg_0, arg_0, true)));
        var_2 = ~firstTrailingBit(_wgslsmith_div_vec4_i32(~(~vec4<i32>(arg_1.a.c, arg_1.a.c, var_2.x, arg_1.a.c)), ~vec4<i32>(var_2.x, -48109i, -47362i, var_2.x)));
        var var_4 = abs(_wgslsmith_sub_vec3_i32(_wgslsmith_mod_vec3_i32(-(vec3<i32>(-5031i, 1i, arg_1.a.c) ^ var_2.wwy), vec3<i32>(-36954i, func_5().a.c, -arg_1.a.c)), ~(-var_2.xzz >> (select(u_input.b.wxw, vec3<u32>(u_input.a.x, arg_1.a.d, 5810u), var_3) % vec3<u32>(32u)))));
    }
    let var_1 = func_5();
    let var_2 = ~15280u;
    return _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-var_0.a.x) * _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(trunc(_wgslsmith_f_op_f32(sign(arg_1.a.a.x)))))) - _wgslsmith_f_op_f32(ceil(var_0.a.x)));
}

fn func_8(arg_0: bool, arg_1: vec2<f32>, arg_2: Struct_4, arg_3: Struct_3) -> Struct_1 {
    switch (arg_3.a.c) {
        case 0i: {
            switch (func_5().a.c) {
                case 17205i: {
                    var var_0 = Struct_4(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(max(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-arg_3.a.a.x) + arg_2.b.x), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(exp2(arg_3.a.a.x)))))), _wgslsmith_f_op_vec3_f32(-vec3<f32>(-431f, arg_1.x, 1002f)));
                    var_0 = arg_2;
                    var_0 = arg_2;
                    var_0 = arg_2;
                }
                default: {
                    var var_0 = arg_3;
                    var_0 = func_5();
                    let var_1 = arg_3.a;
                    var_0 = arg_3;
                }
            }
            switch (_wgslsmith_mod_i32(_wgslsmith_sub_i32(_wgslsmith_div_i32(arg_3.a.c, -(~arg_3.a.c)), arg_3.a.c), arg_3.a.c)) {
                case i32(-2147483648): {
                    let var_0 = ~u_input.a.x;
                    var var_1 = arg_3.a.b.x;
                    var_1 = -353f;
                }
                case 1i: {
                    let var_0 = _wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(-vec2<f32>(func_5().a.b.x, arg_2.a))));
                    let var_1 = Struct_4(_wgslsmith_f_op_f32(1190f * arg_1.x), vec3<f32>(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(max(_wgslsmith_f_op_f32(func_7(vec3<bool>(false, arg_0, arg_0), arg_3)), -277f)) - -505f), _wgslsmith_f_op_f32(exp2(_wgslsmith_f_op_f32(floor(_wgslsmith_f_op_f32(step(1343f, var_0.x)))))), -146f));
                }
                default: {
                    var var_0 = _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(floor(-1527f)) - _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-627f - arg_3.a.b.x) * arg_3.a.b.x)));
                    let var_1 = Struct_1(_wgslsmith_f_op_vec3_f32(select(_wgslsmith_f_op_vec3_f32(arg_3.a.b * _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(ceil(vec3<f32>(arg_2.a, 761f, 724f))))), _wgslsmith_f_op_vec3_f32(arg_2.b + _wgslsmith_f_op_vec3_f32(-_wgslsmith_div_vec3_f32(vec3<f32>(arg_2.b.x, 1502f, 1471f), arg_3.a.b))), select(select(vec3<bool>(false, false, arg_0), vec3<bool>(true, true, arg_0), arg_0 & arg_0), vec3<bool>(false, any(vec2<bool>(true, false)), !arg_0), vec3<bool>(!arg_0, false, all(vec4<bool>(false, arg_0, arg_0, arg_0)))))), _wgslsmith_f_op_vec3_f32(func_6(Struct_1(vec3<f32>(_wgslsmith_f_op_f32(1469f * -1884f), arg_2.b.x, -986f), arg_2.b, ~(-1i), ~_wgslsmith_dot_vec4_u32(u_input.a, vec4<u32>(1u, u_input.a.x, arg_3.a.d, arg_3.b))), u_input.a.zw)), 1i, _wgslsmith_sub_u32(arg_3.b, abs(~_wgslsmith_dot_vec3_u32(u_input.a.zzw, vec3<u32>(arg_3.a.d, u_input.b.x, u_input.b.x)))));
                    var_0 = func_5().a.b.x;
                    var var_2 = false;
                    var var_3 = true;
                }
            }
            var var_0 = reverseBits(~(min(abs(vec2<i32>(arg_3.a.c, arg_3.a.c)), vec2<i32>(27742i, 1i)) | ~(~vec2<i32>(i32(-2147483648), 1i))));
        }
        case -1i: {
            loop {
                if (LOOP_COUNTERS[7u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[7u] = LOOP_COUNTERS[7u] + 1u;
                var var_0 = ~(-_wgslsmith_dot_vec3_i32(firstTrailingBit(_wgslsmith_sub_vec3_i32(vec3<i32>(1i, -6748i, arg_3.a.c), vec3<i32>(-7664i, arg_3.a.c, arg_3.a.c))), vec3<i32>(arg_3.a.c, i32(-2147483648), arg_3.a.c) & _wgslsmith_add_vec3_i32(vec3<i32>(-1i, 2147483647i, 41620i), vec3<i32>(arg_3.a.c, arg_3.a.c, arg_3.a.c))));
                return Struct_1(_wgslsmith_f_op_vec3_f32(step(_wgslsmith_f_op_vec3_f32(sign(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(min(arg_2.b, arg_3.a.b))))), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(func_5().a.b + vec3<f32>(1175f, 755f, -142f)) * _wgslsmith_f_op_vec3_f32(-arg_3.a.a)))), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(abs(_wgslsmith_f_op_vec3_f32(step(arg_2.b, vec3<f32>(1167f, 541f, arg_1.x)))))) + _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-arg_3.a.b)) * arg_2.b)), -30664i, u_input.b.x);
            }
            loop {
                if (LOOP_COUNTERS[8u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[8u] = LOOP_COUNTERS[8u] + 1u;
                var var_0 = Struct_4(-1000f, vec3<f32>(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(arg_1.x - 770f) + 619f)), arg_1.x, _wgslsmith_f_op_f32(1192f - func_5().a.a.x)));
                var var_1 = ~u_input.b.x;
                let var_2 = Struct_2(arg_3.a, arg_3.a, !select(!select(vec3<bool>(arg_0, arg_0, arg_0), vec3<bool>(true, arg_0, true), vec3<bool>(arg_0, false, false)), vec3<bool>(arg_0, arg_0, true), select(vec3<bool>(arg_0, true, arg_0), !vec3<bool>(arg_0, arg_0, true), select(vec3<bool>(arg_0, false, arg_0), vec3<bool>(arg_0, true, arg_0), vec3<bool>(arg_0, true, false)))), firstTrailingBit(u_input.b.xxx));
                var_0 = arg_2;
            }
        }
        default: {
            let var_0 = 969f;
            switch (arg_3.a.c) {
                case -1i: {
                }
                case -20392i: {
                    var var_1 = abs(121i);
                    var var_2 = Struct_4(284f, _wgslsmith_div_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(floor(arg_2.b))), arg_3.a.b));
                    var_1 = ~func_5().a.c;
                    let var_3 = arg_3.a.c;
                }
                default: {
                    let var_1 = func_5().a;
                    let var_2 = arg_2.b.yy;
                    var var_3 = Struct_2(func_5().a, func_5().a, !vec3<bool>(true, true, !all(vec3<bool>(true, false, arg_0))), firstTrailingBit(vec3<u32>(1u, select(func_5().a.d, ~0u, !arg_0), _wgslsmith_mod_u32(var_1.d, arg_3.b) ^ 1u)));
                    let var_4 = min(select(vec2<i32>(arg_3.a.c, var_3.a.c) ^ _wgslsmith_mult_vec2_i32(vec2<i32>(var_1.c, arg_3.a.c), ~vec2<i32>(arg_3.a.c, var_3.a.c)), vec2<i32>(-var_1.c & (i32(-1i) * -1i), arg_3.a.c), var_3.c.zx), vec2<i32>(47514i, _wgslsmith_add_i32(_wgslsmith_dot_vec2_i32(vec2<i32>(324i, -56947i) & vec2<i32>(1i, var_1.c), countOneBits(vec2<i32>(4360i, arg_3.a.c))), 0i)));
                    var var_5 = Struct_3(var_3.b, abs(8636u & _wgslsmith_sub_u32(84011u, ~u_input.b.x)));
                }
            }
            let var_1 = func_5();
            switch (var_1.a.c | _wgslsmith_mod_i32(abs(1i), arg_3.a.c)) {
                default: {
                    let var_2 = reverseBits((vec3<i32>(_wgslsmith_mult_i32(i32(-2147483648), 0i), -14301i, ~(-1i)) ^ (~vec3<i32>(2147483647i, arg_3.a.c, 0i) << (abs(u_input.a.yxz) % vec3<u32>(32u)))) >> (_wgslsmith_mod_vec3_u32(vec3<u32>(arg_3.a.d, 27266u, var_1.a.d), vec3<u32>(var_1.b, 33235u, func_5().b)) % vec3<u32>(32u)));
                    let var_3 = -_wgslsmith_clamp_vec2_i32(var_2.zy, var_2.yy, -vec2<i32>(select(arg_3.a.c, 0i, false), ~arg_3.a.c));
                }
            }
        }
    }
    var var_0 = vec3<bool>(false, true, !(arg_3.a.c <= arg_3.a.c));
    var_0 = !vec3<bool>(true | arg_0, true, true);
    if (any(select(var_0.xx, select(vec2<bool>(!arg_0, !arg_0), var_0.yz, select(all(vec2<bool>(false, arg_0)), var_0.x, var_0.x)), vec2<bool>(any(vec3<bool>(var_0.x, false, arg_0)), ~arg_3.a.d != u_input.b.x)))) {
    }
    for (var var_1 = 1i; arg_0; var_1 += 1i) {
        if (LOOP_COUNTERS[9u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[9u] = LOOP_COUNTERS[9u] + 1u;
        continue;
    }
    return arg_3.a;
}

fn func_4() -> Struct_3 {
    loop {
        if (LOOP_COUNTERS[10u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[10u] = LOOP_COUNTERS[10u] + 1u;
        break;
    }
    loop {
        if (LOOP_COUNTERS[11u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[11u] = LOOP_COUNTERS[11u] + 1u;
    }
    switch (~9592i) {
        default: {
            var var_0 = func_8(any(select(vec3<bool>(true, true, false), vec3<bool>(true, true, true), vec3<bool>(true, true, true))), _wgslsmith_f_op_vec2_f32(-vec2<f32>(_wgslsmith_f_op_f32(abs(_wgslsmith_f_op_f32(f32(-1f) * -2012f))), 506f)), Struct_4(_wgslsmith_f_op_f32(trunc(_wgslsmith_f_op_f32(func_7(vec3<bool>(true, true, true), func_5())))), _wgslsmith_f_op_vec3_f32(step(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-vec3<f32>(-3129f, 737f, -361f))), _wgslsmith_f_op_vec3_f32(-vec3<f32>(234f, -1693f, 2618f))))), Struct_3(func_5().a, ~(~0u)));
        }
    }
    let var_0 = vec2<bool>(true, true);
    for (; false; ) {
        if (LOOP_COUNTERS[12u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[12u] = LOOP_COUNTERS[12u] + 1u;
        return Struct_3(Struct_1(_wgslsmith_f_op_vec3_f32(floor(vec3<f32>(595f, _wgslsmith_f_op_f32(select(-766f, -632f, var_0.x)), 747f))), vec3<f32>(_wgslsmith_f_op_f32(-534f + func_5().a.a.x), _wgslsmith_f_op_f32(390f + _wgslsmith_div_f32(-1604f, -403f)), _wgslsmith_f_op_f32(trunc(_wgslsmith_f_op_f32(f32(-1f) * -588f)))), _wgslsmith_mod_i32(1i, countOneBits(i32(-1i) * -1i)), u_input.b.x), min(4294967295u, _wgslsmith_clamp_u32(11183u, ~u_input.a.x >> (u_input.b.x % 32u), ~(u_input.b.x << (u_input.a.x % 32u)))));
    }
    return func_5();
}

fn func_3(arg_0: Struct_4, arg_1: Struct_2) -> vec4<u32> {
    let var_0 = func_4();
    var var_1 = var_0.a.d;
    for (var var_2 = 1i; var_2 == 11348i; ) {
        if (LOOP_COUNTERS[13u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[13u] = LOOP_COUNTERS[13u] + 1u;
        var var_3 = _wgslsmith_f_op_f32(-arg_0.b.x);
        var var_4 = func_8(arg_1.c.x, _wgslsmith_f_op_vec2_f32(-vec2<f32>(_wgslsmith_f_op_f32(-468f), -382f)), arg_0, var_0);
        if (!all(select(select(vec4<bool>(true, false, arg_1.c.x, true), select(vec4<bool>(true, arg_1.c.x, false, true), vec4<bool>(true, arg_1.c.x, true, true), vec4<bool>(true, true, false, true)), select(arg_1.c.x, arg_1.c.x, true)), select(!vec4<bool>(arg_1.c.x, arg_1.c.x, true, true), !vec4<bool>(true, arg_1.c.x, true, true), !arg_1.c.x), select(select(vec4<bool>(arg_1.c.x, arg_1.c.x, false, true), vec4<bool>(arg_1.c.x, false, false, arg_1.c.x), vec4<bool>(false, false, false, arg_1.c.x)), !vec4<bool>(arg_1.c.x, arg_1.c.x, false, false), !vec4<bool>(true, arg_1.c.x, arg_1.c.x, false))))) {
            var var_5 = vec3<f32>(arg_0.b.x, -538f, _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-arg_1.b.a.x))));
            var var_6 = 4294967295u;
            let var_7 = ~_wgslsmith_mult_vec2_u32(abs(vec2<u32>(_wgslsmith_mult_u32(var_0.b, u_input.b.x), ~23960u)), vec2<u32>(_wgslsmith_mult_u32(1u, _wgslsmith_mult_u32(4294967295u, 0u)), ~53621u));
            var var_8 = -var_0.a.c;
            var_4 = Struct_1(arg_1.b.a, var_4.a, arg_1.a.c, 0u);
        }
        switch (arg_1.a.c ^ func_5().a.c) {
            default: {
            }
        }
    }
    var var_2 = ~vec4<u32>(~_wgslsmith_dot_vec3_u32(arg_1.d | arg_1.d, vec3<u32>(var_0.a.d, 4294967295u, 1u)), _wgslsmith_dot_vec3_u32(_wgslsmith_sub_vec3_u32(~arg_1.d, vec3<u32>(0u, arg_1.d.x, arg_1.d.x) ^ vec3<u32>(70208u, 4294967295u, var_0.b)), max(u_input.b.xyx, ~vec3<u32>(4294967295u, 8618u, 59407u))), _wgslsmith_div_u32(~(arg_1.b.d | arg_1.a.d), u_input.a.x), 1u);
    return u_input.a >> (u_input.b % vec4<u32>(32u));
}

fn func_2() -> Struct_1 {
    let var_0 = -742f;
    let var_1 = ~_wgslsmith_div_vec4_u32(abs(reverseBits(func_3(Struct_4(var_0, vec3<f32>(var_0, -1472f, var_0)), Struct_2(Struct_1(vec3<f32>(1070f, -1182f, var_0), vec3<f32>(var_0, 1000f, var_0), 0i, u_input.b.x), Struct_1(vec3<f32>(-1889f, 737f, -741f), vec3<f32>(var_0, var_0, var_0), 2147483647i, 6103u), vec3<bool>(false, true, false), vec3<u32>(u_input.a.x, 42275u, u_input.b.x))))), u_input.b);
    if (all(vec4<bool>(26510i < ((54527i << (u_input.a.x % 32u)) ^ _wgslsmith_clamp_i32(-3775i, i32(-2147483648), 2147483647i)), false, !((var_1.x >= 24321u) | true), _wgslsmith_add_u32(~u_input.b.x, 0u) <= 5281u))) {
        switch (~(i32(-2147483648))) {
            case i32(-2147483648): {
                var var_2 = var_1.wz;
                let var_3 = u_input.a;
                let var_4 = true;
                let var_5 = _wgslsmith_f_op_f32(ceil(var_0));
            }
            case -1i: {
                var var_2 = ~_wgslsmith_mult_u32(u_input.a.x, 29445u);
                let var_3 = var_0;
                var var_4 = !select(vec4<bool>(!any(vec4<bool>(false, true, false, false)), !all(vec4<bool>(true, false, false, true)), false, false), vec4<bool>(any(select(vec4<bool>(false, false, true, false), vec4<bool>(true, false, true, true), vec4<bool>(true, true, false, false))), all(vec2<bool>(false, true)), true, (var_3 <= var_3) & true), vec4<bool>(select(988f == var_3, true, true), true, true, false));
            }
            default: {
            }
        }
        switch (reverseBits(_wgslsmith_div_i32(1i, _wgslsmith_add_i32(i32(-2147483648), ~(-1346i))) | _wgslsmith_add_i32(firstLeadingBit(func_8(false, vec2<f32>(var_0, -1103f), Struct_4(-814f, vec3<f32>(var_0, -341f, var_0)), Struct_3(Struct_1(vec3<f32>(var_0, 745f, 531f), vec3<f32>(812f, 576f, var_0), 41511i, u_input.b.x), 1u)).c), ~16689i))) {
            case i32(-2147483648): {
                var var_2 = vec3<i32>(i32(-2147483648), abs(_wgslsmith_div_i32(-func_5().a.c, _wgslsmith_dot_vec2_i32(vec2<i32>(1i, 2147483647i), vec2<i32>(0i, -7382i)) >> (~1u % 32u))), 0i);
                var var_3 = vec4<bool>(true, -994f > _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-608f + _wgslsmith_f_op_f32(abs(var_0)))), any(!(!select(vec4<bool>(false, true, false, false), vec4<bool>(true, true, false, false), vec4<bool>(true, false, false, false)))), !(!(0u < u_input.a.x)));
                var_3 = select(select(vec4<bool>(true, true, !(var_3.x | false), var_3.x), vec4<bool>(select(true, 211f <= var_0, true), true, any(vec3<bool>(true, true, false)) || var_3.x, !(10690u < var_1.x)), select(true, var_3.x, false | var_3.x)), select(!select(!vec4<bool>(true, var_3.x, var_3.x, false), select(vec4<bool>(true, false, var_3.x, false), vec4<bool>(true, true, false, false), vec4<bool>(true, var_3.x, true, true)), true), vec4<bool>(!(var_2.x < var_2.x), true | all(vec2<bool>(true, var_3.x)), ~4221u == func_8(false, vec2<f32>(278f, var_0), Struct_4(-1000f, vec3<f32>(181f, var_0, 146f)), Struct_3(Struct_1(vec3<f32>(var_0, var_0, var_0), vec3<f32>(299f, 1453f, 830f), var_2.x, u_input.b.x), u_input.a.x)).d, !any(var_3.xxz)), any(vec4<bool>(true != var_3.x, true, true, u_input.b.x >= u_input.b.x))), false);
                var_3 = select(select(vec4<bool>(any(var_3.xz), all(vec2<bool>(true, var_3.x)), var_3.x, !var_3.x), !vec4<bool>(!var_3.x, false, var_2.x != var_2.x, var_3.x != var_3.x), var_3.x), !vec4<bool>(all(!var_3.wz), var_3.x, true, true), any(select(vec3<bool>(false, true, -1000f > var_0), select(var_3.yzy, !var_3.xyw, any(vec3<bool>(true, var_3.x, var_3.x))), var_3.x)));
                let var_4 = !var_3.www;
            }
            case 2147483647i: {
                var var_2 = Struct_2(func_5().a, func_5().a, select(select(select(vec3<bool>(true, true, true), select(vec3<bool>(true, false, true), vec3<bool>(false, true, true), true), select(vec3<bool>(false, true, false), vec3<bool>(false, false, false), vec3<bool>(false, false, false))), vec3<bool>(true, true, true), select(vec3<bool>(false, false, false), select(vec3<bool>(true, false, false), vec3<bool>(true, true, false), false), select(vec3<bool>(false, false, true), vec3<bool>(false, false, false), vec3<bool>(false, false, false)))), select(select(vec3<bool>(false, false, true), select(vec3<bool>(false, false, false), vec3<bool>(false, false, false), vec3<bool>(false, false, false)), vec3<bool>(true, true, true)), vec3<bool>(true, false, true), true), !any(vec2<bool>(true, true))), min(~vec3<u32>(39772u, 34211u, 29436u), vec3<u32>(firstTrailingBit(_wgslsmith_add_u32(u_input.a.x, 4294967295u)), u_input.b.x, 0u)));
            }
            default: {
                var var_2 = vec4<u32>(u_input.b.x, u_input.b.x, ~_wgslsmith_add_u32(1u, 33737u), ~4294967295u);
                var_2 = _wgslsmith_mult_vec4_u32(vec4<u32>(~(~(var_1.x ^ var_2.x)), ~0u, ~4294967295u, u_input.a.x), _wgslsmith_sub_vec4_u32(reverseBits(max(vec4<u32>(15210u, 4294967295u, u_input.b.x, 1u), var_1)) >> ((vec4<u32>(32097u, var_1.x, 43676u, var_1.x) ^ u_input.a) % vec4<u32>(32u)), var_1 ^ abs(u_input.a)));
                let var_3 = Struct_1(vec3<f32>(var_0, _wgslsmith_f_op_f32(floor(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-296f + 1362f) * _wgslsmith_f_op_f32(var_0 - 1120f)))), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(f32(-1f) * -828f)))), vec3<f32>(_wgslsmith_f_op_f32(-1435f), 3086f, _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(330f * -1247f))), select(-_wgslsmith_mod_i32(1i, 1i), 1i, any(vec3<bool>(true, true, true))), var_1.x);
                var_2 = ~(~vec4<u32>(var_3.d, select(var_3.d, 24528u, true), ~1u, var_3.d));
            }
        }
    }
    for (var var_2 = 8357i; ; ) {
        if (LOOP_COUNTERS[14u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[14u] = LOOP_COUNTERS[14u] + 1u;
    }
    var var_2 = _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(func_5().a.a * _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(min(vec3<f32>(var_0, var_0, -256f), _wgslsmith_f_op_vec3_f32(-vec3<f32>(var_0, var_0, -223f)))) + vec3<f32>(_wgslsmith_f_op_f32(f32(-1f) * -821f), _wgslsmith_f_op_f32(-var_0), _wgslsmith_f_op_f32(var_0 * var_0)))) - _wgslsmith_f_op_vec3_f32(max(_wgslsmith_f_op_vec3_f32(sign(_wgslsmith_f_op_vec3_f32(vec3<f32>(-543f, var_0, var_0) + _wgslsmith_f_op_vec3_f32(select(vec3<f32>(661f, 213f, 195f), vec3<f32>(var_0, var_0, -924f), true))))), _wgslsmith_f_op_vec3_f32(-vec3<f32>(_wgslsmith_f_op_f32(trunc(var_0)), _wgslsmith_f_op_f32(-634f * -245f), 568f)))));
    return Struct_1(vec3<f32>(-1975f, _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-2063f * -1364f))), -374f), _wgslsmith_f_op_vec3_f32(select(_wgslsmith_f_op_vec3_f32(floor(vec3<f32>(_wgslsmith_f_op_f32(-var_0), _wgslsmith_div_f32(var_2.x, 1167f), _wgslsmith_f_op_f32(min(-1821f, var_0))))), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(trunc(vec3<f32>(-512f, 322f, 2362f))) + _wgslsmith_f_op_vec3_f32(vec3<f32>(var_2.x, var_2.x, 1209f) + vec3<f32>(var_0, -806f, var_2.x))) - _wgslsmith_f_op_vec3_f32(_wgslsmith_div_vec3_f32(vec3<f32>(741f, var_0, var_2.x), vec3<f32>(var_2.x, var_2.x, 429f)) + _wgslsmith_f_op_vec3_f32(vec3<f32>(365f, var_0, 409f) * vec3<f32>(var_0, 1483f, var_0)))), select(!select(vec3<bool>(false, true, true), vec3<bool>(false, true, false), vec3<bool>(false, true, true)), vec3<bool>(any(vec4<bool>(false, true, true, true)), true, false), vec3<bool>(true, true, true)))), -23802i >> (1u % 32u), u_input.a.x);
}

fn func_1(arg_0: vec4<bool>, arg_1: vec2<i32>, arg_2: vec3<f32>, arg_3: vec4<i32>) -> vec4<u32> {
    for (var var_0 = 0i; ; var_0 += 1i) {
        if (LOOP_COUNTERS[15u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[15u] = LOOP_COUNTERS[15u] + 1u;
        break;
    }
    loop {
        if (LOOP_COUNTERS[16u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[16u] = LOOP_COUNTERS[16u] + 1u;
        loop {
            if (LOOP_COUNTERS[17u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[17u] = LOOP_COUNTERS[17u] + 1u;
            var var_0 = min(vec2<i32>(~_wgslsmith_mod_i32(arg_3.x, -39983i), firstTrailingBit(arg_3.x)) | ~arg_1, arg_3.xy);
        }
        let var_0 = Struct_3(func_2(), 1u);
    }
    let var_0 = ~(~(~(~u_input.b.x)));
    switch (-1i) {
        default: {
            switch (-13833i) {
                case 27298i: {
                    var var_1 = func_2().a.x;
                    let var_2 = vec2<u32>(_wgslsmith_clamp_u32(var_0, _wgslsmith_add_u32(func_2().d, 52118u), ~(~var_0)), 29765u ^ ~var_0);
                    var_1 = _wgslsmith_f_op_f32(-arg_2.x);
                    let var_3 = Struct_2(func_8(all(select(select(vec3<bool>(arg_0.x, arg_0.x, true), vec3<bool>(arg_0.x, arg_0.x, arg_0.x), arg_0.x), select(arg_0.xwx, vec3<bool>(arg_0.x, true, arg_0.x), vec3<bool>(arg_0.x, true, false)), vec3<bool>(arg_0.x, arg_0.x, arg_0.x))), arg_2.yy, Struct_4(arg_2.x, _wgslsmith_f_op_vec3_f32(-arg_2)), func_4()), func_8(true, func_4().a.b.yy, Struct_4(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(1418f + arg_2.x)), arg_2), func_5()), !select(!vec3<bool>(true, arg_0.x, true), vec3<bool>(false, any(arg_0.zxz), 7929i == arg_3.x), vec3<bool>(false, any(vec4<bool>(false, true, arg_0.x, false)), arg_0.x)), ~((_wgslsmith_mod_vec3_u32(vec3<u32>(1u, 1u, var_0), u_input.a.wwz) & u_input.b.xwz) << ((select(u_input.a.zww, u_input.a.xwx, arg_0.yyx) ^ vec3<u32>(u_input.a.x, u_input.a.x, 57833u)) % vec3<u32>(32u))));
                }
                case i32(-2147483648): {
                    let var_1 = Struct_4(arg_2.x, arg_2);
                }
                default: {
                    var var_1 = 45635u;
                    var_1 = u_input.a.x;
                    let var_2 = arg_0.x;
                }
            }
            let var_1 = vec3<i32>(reverseBits(-_wgslsmith_mult_i32(arg_1.x, i32(-1i) * -16804i)), 1i, i32(-1i) * -21786i);
            if (true) {
                let var_2 = true;
                var var_3 = Struct_1(_wgslsmith_f_op_vec3_f32(select(func_8(false, vec2<f32>(arg_2.x, _wgslsmith_f_op_f32(-arg_2.x)), Struct_4(arg_2.x, func_4().a.b), func_4()).a, _wgslsmith_f_op_vec3_f32(exp2(arg_2)), select(select(select(arg_0.yxx, arg_0.wyz, arg_0.zzy), !vec3<bool>(var_2, var_2, false), arg_0.yzx), arg_0.zzz, true))), func_5().a.b, _wgslsmith_sub_i32(-1i, arg_1.x), 4294967295u);
                let var_4 = arg_0.xz;
                var var_5 = _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(min(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(_wgslsmith_f_op_vec3_f32(func_6(Struct_1(arg_2, vec3<f32>(var_3.a.x, arg_2.x, var_3.a.x), 0i, 1u), vec2<u32>(94006u, var_0))).x - arg_2.x)), _wgslsmith_f_op_f32(-arg_2.x))));
                var_5 = _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(var_3.b.x + var_3.a.x) - _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-327f - _wgslsmith_f_op_f32(trunc(_wgslsmith_f_op_f32(f32(-1f) * -1000f)))) - var_3.a.x));
            }
            loop {
                if (LOOP_COUNTERS[18u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[18u] = LOOP_COUNTERS[18u] + 1u;
            }
            var var_2 = Struct_4(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-arg_2.x) - _wgslsmith_f_op_f32(arg_2.x - _wgslsmith_div_f32(arg_2.x, _wgslsmith_f_op_f32(arg_2.x + -448f)))), _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-vec3<f32>(_wgslsmith_div_f32(389f, arg_2.x), -2867f, 1f))));
        }
    }
    if (false) {
        switch (i32(-2147483648)) {
            default: {
                let var_1 = _wgslsmith_f_op_vec4_f32(select(vec4<f32>(arg_2.x, _wgslsmith_f_op_f32(func_2().b.x - _wgslsmith_f_op_f32(abs(_wgslsmith_f_op_f32(289f * arg_2.x)))), arg_2.x, _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(floor(arg_2.x)) - -388f)), _wgslsmith_f_op_vec4_f32(-_wgslsmith_f_op_vec4_f32(abs(_wgslsmith_f_op_vec4_f32(_wgslsmith_f_op_vec4_f32(max(vec4<f32>(arg_2.x, arg_2.x, arg_2.x, 528f), vec4<f32>(-1409f, arg_2.x, 568f, 2123f))) * vec4<f32>(arg_2.x, 1234f, 471f, arg_2.x))))), any(!(!(!arg_0.zzw)))));
                var var_2 = func_2();
                var var_3 = var_2.b.x;
            }
        }
        switch (arg_3.x) {
            case -29278i: {
                let var_1 = _wgslsmith_f_op_f32(f32(-1f) * -1000f) >= _wgslsmith_div_f32(arg_2.x, _wgslsmith_div_f32(310f, _wgslsmith_f_op_f32(arg_2.x * _wgslsmith_div_f32(arg_2.x, arg_2.x))));
                var var_2 = _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-256f));
                var var_3 = u_input.a.x;
                var_2 = arg_2.x;
                let var_4 = Struct_4(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-584f) * _wgslsmith_f_op_f32(-arg_2.x)) + 1000f) * 594f), vec3<f32>(_wgslsmith_f_op_f32(-arg_2.x), _wgslsmith_f_op_f32(-arg_2.x), arg_2.x));
            }
            case 0i: {
                let var_1 = select(!vec4<bool>(all(select(vec2<bool>(arg_0.x, false), arg_0.wx, arg_0.xy)), arg_0.x, arg_0.x, arg_0.x), select(arg_0, select(vec4<bool>(arg_0.x, arg_0.x || false, arg_0.x, arg_0.x), select(!vec4<bool>(true, arg_0.x, true, arg_0.x), arg_0, select(arg_0, arg_0, arg_0.x)), vec4<bool>(arg_0.x, arg_0.x, true, arg_0.x)), (func_2().c >= arg_1.x) && !(true && arg_0.x)), !arg_0);
                var var_2 = func_5().a;
                let var_3 = Struct_1(_wgslsmith_f_op_vec3_f32(-func_5().a.b), _wgslsmith_f_op_vec3_f32(sign(_wgslsmith_f_op_vec3_f32(vec3<f32>(_wgslsmith_f_op_f32(abs(arg_2.x)), _wgslsmith_f_op_f32(-arg_2.x), _wgslsmith_f_op_f32(arg_2.x * -537f)) + var_2.a))), firstTrailingBit(var_2.c), func_8(any(!vec4<bool>(true, true, true, arg_0.x)), vec2<f32>(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(-arg_2.x)), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(sign(var_2.a.x)))), Struct_4(_wgslsmith_f_op_f32(f32(-1f) * -368f), func_5().a.a), func_4()).d);
            }
            case 11197i: {
                let var_1 = arg_2;
                var var_2 = true;
                var var_3 = _wgslsmith_f_op_vec4_f32(_wgslsmith_f_op_vec4_f32(-_wgslsmith_f_op_vec4_f32(-_wgslsmith_f_op_vec4_f32(trunc(_wgslsmith_f_op_vec4_f32(vec4<f32>(var_1.x, -208f, arg_2.x, 290f) + vec4<f32>(arg_2.x, 1413f, -1195f, 579f)))))) * _wgslsmith_div_vec4_f32(_wgslsmith_f_op_vec4_f32(_wgslsmith_f_op_vec4_f32(exp2(_wgslsmith_f_op_vec4_f32(-vec4<f32>(var_1.x, -934f, 193f, arg_2.x)))) + vec4<f32>(var_1.x, _wgslsmith_f_op_f32(-642f * 890f), -1264f, func_4().a.a.x)), _wgslsmith_f_op_vec4_f32(-_wgslsmith_f_op_vec4_f32(-vec4<f32>(arg_2.x, arg_2.x, -1000f, var_1.x)))));
                let var_4 = vec4<bool>(arg_0.x, any(vec3<bool>(all(arg_0) && arg_0.x, any(vec4<bool>(arg_0.x, false, arg_0.x, arg_0.x)), true)), all(vec3<bool>(true, (var_1.x != arg_2.x) == arg_0.x, true)), !(!(!(arg_2.x > var_3.x))));
            }
            case 74438i: {
            }
            default: {
            }
        }
        switch (_wgslsmith_div_i32(~1i, select(reverseBits(countOneBits(arg_3.x)), func_5().a.c, !any(vec3<bool>(arg_0.x, true, arg_0.x)))) << (~select(countOneBits(25814u >> (u_input.b.x % 32u)), ~u_input.a.x, arg_0.x) % 32u)) {
            case 4845i: {
                var var_1 = Struct_3(Struct_1(arg_2, _wgslsmith_f_op_vec3_f32(select(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(step(vec3<f32>(arg_2.x, arg_2.x, arg_2.x), arg_2))), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(arg_2 * arg_2) - _wgslsmith_f_op_vec3_f32(-vec3<f32>(-490f, arg_2.x, arg_2.x))), !(!vec3<bool>(arg_0.x, true, arg_0.x)))), arg_3.x, func_2().d), 1u);
            }
            case 19029i: {
                let var_1 = Struct_4(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-1f) * func_4().a.a.x), _wgslsmith_f_op_vec3_f32(select(vec3<f32>(arg_2.x, -1256f, _wgslsmith_div_f32(_wgslsmith_f_op_f32(f32(-1f) * -850f), _wgslsmith_f_op_f32(arg_2.x - arg_2.x))), vec3<f32>(_wgslsmith_f_op_f32(func_7(select(arg_0.wzz, arg_0.zxy, arg_0.x), Struct_3(Struct_1(arg_2, vec3<f32>(arg_2.x, arg_2.x, -259f), arg_1.x, 43645u), u_input.a.x))), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(arg_2.x + arg_2.x)), arg_2.x), arg_0.x)));
                var var_2 = var_1.b;
                let var_3 = arg_0.xy;
                let var_4 = true;
                let var_5 = func_5();
            }
            case 50220i: {
                let var_1 = any(arg_0);
                var var_2 = _wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(_wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(-arg_2.xz))) * vec2<f32>(func_2().a.x, _wgslsmith_f_op_f32(trunc(func_4().a.b.x)))));
                let var_3 = select(!(!select(arg_0.xww, arg_0.xxy, select(arg_0.yzw, vec3<bool>(arg_0.x, false, arg_0.x), arg_0.x))), select(select(!arg_0.www, select(vec3<bool>(true, arg_0.x, true), arg_0.wyz, vec3<bool>(true, arg_0.x, var_1)), arg_0.yxz), select(vec3<bool>(any(vec3<bool>(false, var_1, var_1)), false, true), select(arg_0.zzx, select(vec3<bool>(arg_0.x, var_1, var_1), vec3<bool>(false, arg_0.x, true), arg_0.ywx), vec3<bool>(false, var_1, arg_0.x)), vec3<bool>(true, true, true)), true), vec3<bool>(true, any(arg_0.yw), var_0 != ~u_input.a.x));
                var_2 = _wgslsmith_f_op_vec2_f32(-_wgslsmith_f_op_vec2_f32(arg_2.yz - vec2<f32>(1000f, _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(min(-244f, -1068f))))));
            }
            case 1i: {
                let var_1 = i32(-2147483648);
                var var_2 = arg_2.zy;
            }
            default: {
                var var_1 = Struct_4(_wgslsmith_f_op_f32(-1000f * _wgslsmith_div_f32(arg_2.x, -1461f)), _wgslsmith_f_op_vec3_f32(-arg_2));
                let var_2 = Struct_3(func_2(), 34775u);
                var var_3 = _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(func_6(var_2.a, countOneBits(u_input.a.wx) & ~vec2<u32>(var_0, u_input.a.x))));
            }
        }
        for (var var_1: i32; arg_0.x; var_1 += 1i) {
            if (LOOP_COUNTERS[19u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[19u] = LOOP_COUNTERS[19u] + 1u;
            var_1 = arg_3.x;
            let var_2 = !select(arg_0.ywx, select(arg_0.zxy, !arg_0.wwy, arg_0.x), any(select(vec2<bool>(arg_0.x, arg_0.x), vec2<bool>(false, arg_0.x), select(vec2<bool>(true, arg_0.x), vec2<bool>(true, arg_0.x), false))));
            var_1 = -(~_wgslsmith_dot_vec4_i32(~vec4<i32>(arg_3.x, arg_3.x, -44303i, 55532i), arg_3 & ~vec4<i32>(arg_1.x, arg_3.x, arg_3.x, arg_3.x)));
        }
        var var_1 = ~select(firstTrailingBit(u_input.a.xzz), u_input.b.xyy, vec3<bool>(any(vec4<bool>(arg_0.x, true, arg_0.x, false)), arg_0.x, !all(arg_0.yy)));
    }
    return ~countOneBits(~min(u_input.b, u_input.a << (u_input.a % vec4<u32>(32u))));
}

fn func_9(arg_0: vec4<u32>, arg_1: vec4<i32>, arg_2: i32, arg_3: vec2<f32>) -> Struct_1 {
    let var_0 = _wgslsmith_f_op_f32(-1061f);
    loop {
        if (LOOP_COUNTERS[20u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[20u] = LOOP_COUNTERS[20u] + 1u;
        var var_1 = -17079i;
        let var_2 = func_5();
        let var_3 = Struct_2(func_4().a, func_5().a, !(!vec3<bool>(true, var_0 > var_0, true)), ~max(_wgslsmith_mult_vec3_u32(vec3<u32>(var_2.a.d, 95075u, 1u), ~u_input.b.zww), arg_0.yyw));
        var_1 = 2147483647i;
        for (var var_4: i32; ; var_4 -= 1i) {
            if (LOOP_COUNTERS[21u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[21u] = LOOP_COUNTERS[21u] + 1u;
            var_4 = abs(-countOneBits(select(var_2.a.c ^ var_2.a.c, 0i, true)));
            let var_5 = var_3.c.xz;
        }
    }
    loop {
        if (LOOP_COUNTERS[22u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[22u] = LOOP_COUNTERS[22u] + 1u;
        loop {
            if (LOOP_COUNTERS[23u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[23u] = LOOP_COUNTERS[23u] + 1u;
        }
        switch (arg_2) {
            default: {
                break;
            }
        }
    }
    var var_1 = Struct_1(vec3<f32>(arg_3.x, _wgslsmith_f_op_f32(floor(_wgslsmith_f_op_f32(select(_wgslsmith_f_op_f32(-939f - -222f), _wgslsmith_f_op_f32(var_0 + var_0), false)))), _wgslsmith_f_op_f32(sign(_wgslsmith_f_op_f32(trunc(922f))))), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(sign(vec3<f32>(arg_3.x, 839f, 1356f))))) + _wgslsmith_f_op_vec3_f32(-vec3<f32>(func_5().a.a.x, _wgslsmith_f_op_f32(floor(1681f)), _wgslsmith_f_op_f32(-arg_3.x)))), _wgslsmith_mod_i32(-abs(-arg_1.x), -func_5().a.c), _wgslsmith_dot_vec3_u32(_wgslsmith_clamp_vec3_u32(vec3<u32>(4294967295u, 4294967295u, ~14074u), ~(~vec3<u32>(24283u, u_input.a.x, arg_0.x)), ~u_input.b.zyz), vec3<u32>(_wgslsmith_sub_u32(u_input.a.x, 1u), u_input.b.x, _wgslsmith_mod_u32(1u, 23708u) ^ func_5().a.d)));
    switch (countOneBits(arg_2)) {
        case i32(-2147483648): {
            loop {
                if (LOOP_COUNTERS[24u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[24u] = LOOP_COUNTERS[24u] + 1u;
                var_1 = Struct_1(vec3<f32>(_wgslsmith_f_op_f32(-1534f - _wgslsmith_f_op_f32(max(arg_3.x, 1141f))), -2368f, _wgslsmith_f_op_f32(trunc(-430f))), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-var_1.b)) + _wgslsmith_f_op_vec3_f32(-vec3<f32>(-1354f, 206f, 323f))) - _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(select(vec3<f32>(-215f, -950f, 791f), var_1.b, false))) + _wgslsmith_f_op_vec3_f32(max(_wgslsmith_f_op_vec3_f32(var_1.b * var_1.b), _wgslsmith_f_op_vec3_f32(vec3<f32>(var_0, 1099f, -2170f) * var_1.a))))), -19782i, 22254u);
                var var_2 = Struct_2(Struct_1(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(2582f, var_1.b.x, var_1.b.x) - vec3<f32>(var_0, var_1.a.x, -722f)) - _wgslsmith_f_op_vec3_f32(-vec3<f32>(var_1.a.x, -261f, 455f)))), vec3<f32>(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(arg_3.x - 866f) + -1142f), func_2().b.x, _wgslsmith_f_op_f32(var_0 * var_0)), func_5().a.c, 104325u), func_2(), select(!vec3<bool>(all(vec2<bool>(true, true)), arg_2 >= 2147483647i, any(vec3<bool>(true, false, false))), !select(select(vec3<bool>(false, false, false), vec3<bool>(false, true, true), vec3<bool>(false, true, true)), select(vec3<bool>(true, true, false), vec3<bool>(false, true, true), false), vec3<bool>(true, true, true)), !select(vec3<bool>(true, true, true), vec3<bool>(true, true, true), vec3<bool>(true, true, true))), vec3<u32>(8686u, (abs(var_1.d) | 4294967295u) ^ 56245u, _wgslsmith_add_u32(_wgslsmith_dot_vec4_u32(u_input.a, vec4<u32>(29218u, 39881u, 0u, 1u)), arg_0.x)));
                let var_3 = firstTrailingBit(var_1.d);
                let var_4 = Struct_1(_wgslsmith_f_op_vec3_f32(step(_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(func_6(Struct_1(var_1.b, vec3<f32>(619f, 459f, 800f), arg_2, arg_0.x), vec2<u32>(34527u, 697u)))) - _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(floor(vec3<f32>(var_2.b.b.x, -533f, -1000f))))), _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(-1046f, -357f, -1383f) * var_1.a) * vec3<f32>(var_2.a.b.x, var_2.a.a.x, var_2.a.a.x))))), _wgslsmith_f_op_vec3_f32(ceil(func_4().a.b)), -2399i, _wgslsmith_dot_vec4_u32(vec4<u32>(u_input.a.x, arg_0.x, 13365u << (func_3(Struct_4(-1260f, vec3<f32>(673f, var_0, var_1.a.x)), Struct_2(var_2.b, Struct_1(vec3<f32>(var_2.b.b.x, 1518f, var_2.a.b.x), vec3<f32>(-1776f, arg_3.x, -1267f), var_2.a.c, arg_0.x), var_2.c, vec3<u32>(var_2.d.x, arg_0.x, var_1.d))).x % 32u), 4294967295u), _wgslsmith_add_vec4_u32(vec4<u32>(~var_3, 113420u, 41780u, arg_0.x), min(select(vec4<u32>(0u, var_3, arg_0.x, var_1.d), arg_0, vec4<bool>(true, var_2.c.x, var_2.c.x, true)), select(arg_0, vec4<u32>(78718u, 4294967295u, arg_0.x, var_2.d.x), vec4<bool>(var_2.c.x, true, var_2.c.x, false))))));
                break;
            }
            var_1 = Struct_1(_wgslsmith_f_op_vec3_f32(max(vec3<f32>(_wgslsmith_f_op_f32(-_wgslsmith_div_f32(arg_3.x, arg_3.x)), var_1.a.x, _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(func_7(vec3<bool>(true, false, true), Struct_3(Struct_1(vec3<f32>(var_1.b.x, 1561f, 1000f), vec3<f32>(1232f, var_0, var_0), var_1.c, 97448u), u_input.a.x))) - _wgslsmith_f_op_vec3_f32(func_6(Struct_1(var_1.b, var_1.b, 1079i, u_input.b.x), u_input.b.yy)).x)), vec3<f32>(_wgslsmith_f_op_f32(_wgslsmith_f_op_f32(-1731f) + -362f), var_0, arg_3.x))), func_8(all(vec2<bool>(true, false)), arg_3, Struct_4(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(f32(-1f) * -300f)), vec3<f32>(-215f, _wgslsmith_f_op_f32(select(827f, -419f, false)), _wgslsmith_f_op_f32(-var_0))), Struct_3(Struct_1(var_1.b, _wgslsmith_f_op_vec3_f32(-vec3<f32>(var_1.b.x, arg_3.x, 950f)), arg_2, func_2().d), u_input.a.x)).b, arg_2, _wgslsmith_div_u32(abs(_wgslsmith_sub_u32(0u, ~4294967295u)), func_3(Struct_4(_wgslsmith_f_op_f32(var_1.a.x * var_1.a.x), _wgslsmith_f_op_vec3_f32(vec3<f32>(1640f, var_1.b.x, 780f) * var_1.b)), Struct_2(Struct_1(var_1.b, vec3<f32>(-1203f, -514f, var_1.a.x), arg_2, 4294967295u), Struct_1(vec3<f32>(var_0, var_1.a.x, var_0), vec3<f32>(-399f, arg_3.x, 1431f), arg_2, u_input.b.x), vec3<bool>(false, false, false), vec3<u32>(arg_0.x, arg_0.x, u_input.b.x))).x));
            let var_2 = select(select(select(!select(vec2<bool>(true, true), vec2<bool>(false, false), vec2<bool>(true, false)), select(select(vec2<bool>(false, true), vec2<bool>(false, false), true), vec2<bool>(true, true), true), -arg_1.x <= _wgslsmith_mod_i32(i32(-2147483648), var_1.c)), vec2<bool>(any(vec3<bool>(true, true, true)), true), vec2<bool>(all(vec4<bool>(false, true, false, true)), all(select(vec4<bool>(true, true, true, true), vec4<bool>(false, false, false, true), false)))), !(!vec2<bool>(true, all(vec3<bool>(false, false, false)))), !vec2<bool>(false, any(vec2<bool>(false, false)) & true));
            let var_3 = Struct_2(func_2(), func_4().a, select(select(vec3<bool>(all(vec3<bool>(false, var_2.x, var_2.x)), false, true), vec3<bool>(var_2.x || false, false, true), true), select(!select(vec3<bool>(var_2.x, var_2.x, var_2.x), vec3<bool>(var_2.x, true, false), true), select(!vec3<bool>(var_2.x, var_2.x, true), vec3<bool>(var_2.x, false, false), any(var_2)), select(select(vec3<bool>(var_2.x, false, true), vec3<bool>(var_2.x, false, false), true), vec3<bool>(var_2.x, false, false), !vec3<bool>(true, false, var_2.x))), select(vec3<bool>(var_0 > 547f, true, arg_3.x <= 1599f), !(!vec3<bool>(var_2.x, var_2.x, var_2.x)), select(vec3<bool>(var_2.x, false, false), !vec3<bool>(false, false, var_2.x), var_2.x))), abs(_wgslsmith_clamp_vec3_u32(~_wgslsmith_clamp_vec3_u32(u_input.a.xwz, vec3<u32>(u_input.a.x, u_input.a.x, 39517u), vec3<u32>(var_1.d, arg_0.x, 79284u)), func_1(vec4<bool>(true, var_2.x, var_2.x, var_2.x), vec2<i32>(arg_2, arg_2), var_1.b, arg_1).yyw >> ((vec3<u32>(arg_0.x, 4294967295u, arg_0.x) & u_input.a.ywx) % vec3<u32>(32u)), vec3<u32>(1u, 0u, select(4294967295u, 50338u, var_2.x)))));
        }
        case 1i: {
            var var_2 = arg_1.xz;
            let var_3 = Struct_3(func_2(), ~(var_1.d << (4294967295u % 32u)));
            var var_4 = arg_1.wyw;
            var_1 = var_3.a;
        }
        case 6705i: {
            let var_2 = -_wgslsmith_clamp_i32(abs(~_wgslsmith_add_i32(2146i, 16174i)), -func_8(false, _wgslsmith_f_op_vec2_f32(var_1.b.xz * vec2<f32>(arg_3.x, -611f)), Struct_4(arg_3.x, var_1.a), func_4()).c, func_2().c);
            for (var var_3 = 2147483647i; ; var_3 -= 1i) {
                if (LOOP_COUNTERS[25u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[25u] = LOOP_COUNTERS[25u] + 1u;
            }
            loop {
                if (LOOP_COUNTERS[26u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[26u] = LOOP_COUNTERS[26u] + 1u;
                var var_3 = _wgslsmith_clamp_u32(30358u, 0u, arg_0.x);
                var var_4 = arg_2 > -63447i;
                continue;
            }
            var var_3 = max(firstLeadingBit(abs(_wgslsmith_add_vec4_i32(arg_1, arg_1) ^ max(vec4<i32>(0i, 2147483647i, var_2, -18347i), arg_1))), vec4<i32>(~abs(_wgslsmith_mult_i32(var_2, arg_2)), var_2, -59695i, var_2));
        }
        default: {
            return func_2();
        }
    }
    return Struct_1(_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(round(vec3<f32>(func_4().a.b.x, _wgslsmith_f_op_f32(arg_3.x - 345f), _wgslsmith_f_op_f32(abs(1609f))))) + _wgslsmith_f_op_vec3_f32(func_5().a.b + _wgslsmith_f_op_vec3_f32(-vec3<f32>(-681f, var_1.a.x, arg_3.x)))), _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(var_0, 221f, -1254f) * var_1.a) - _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(var_1.a * vec3<f32>(arg_3.x, -3121f, -2220f))))), 36860i, ~abs(var_1.d));
}

fn func_10(arg_0: Struct_2, arg_1: vec3<u32>, arg_2: vec3<f32>) -> Struct_1 {
    if (!arg_0.c.x) {
        let var_0 = _wgslsmith_add_vec3_u32(vec3<u32>(0u, 47315u, 26939u), firstTrailingBit(reverseBits(max(abs(arg_1), arg_0.d))));
        let var_1 = ~(-_wgslsmith_sub_vec3_i32(firstTrailingBit(vec3<i32>(0i, 2147483647i, -1i)), vec3<i32>(arg_0.b.c, arg_0.b.c, 31443i)) << (vec3<u32>(~21112u, ~arg_0.b.d, arg_0.d.x) % vec3<u32>(32u)));
        switch (~(-(1567i >> (arg_1.x % 32u)))) {
            case 1i: {
                var var_2 = vec3<u32>(u_input.b.x << (var_0.x % 32u), abs(~arg_0.d.x), 0u) & (~(~vec3<u32>(27909u, arg_1.x, 63883u)) & u_input.b.yzz);
                var var_3 = arg_0.c.x;
                let var_4 = func_5();
                let var_5 = func_4().a;
            }
            case 2147483647i: {
                var var_2 = _wgslsmith_clamp_i32(_wgslsmith_sub_i32(_wgslsmith_dot_vec4_i32(~vec4<i32>(arg_0.a.c, 2147483647i, -11392i, var_1.x), vec4<i32>(arg_0.a.c, 1i, _wgslsmith_add_i32(arg_0.b.c, -44816i), arg_0.b.c)), var_1.x), _wgslsmith_div_i32(_wgslsmith_dot_vec2_i32(vec2<i32>(~arg_0.a.c, var_1.x), var_1.yx), select(-(~var_1.x), i32(-2147483648), true)), -(-4483i >> (u_input.b.x % 32u)));
            }
            case -11081i: {
            }
            case i32(-2147483648): {
                var var_2 = Struct_4(_wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(max(_wgslsmith_div_f32(_wgslsmith_f_op_f32(arg_2.x * arg_2.x), func_5().a.b.x), _wgslsmith_f_op_f32(_wgslsmith_f_op_f32(abs(1259f)) * arg_2.x)))), arg_2);
                var var_3 = var_2.b.xz;
            }
            default: {
                return arg_0.b;
            }
        }
    }
    loop {
        if (LOOP_COUNTERS[27u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[27u] = LOOP_COUNTERS[27u] + 1u;
        if (arg_0.c.x) {
            break;
        }
        var var_0 = func_4();
    }
    loop {
        if (LOOP_COUNTERS[28u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[28u] = LOOP_COUNTERS[28u] + 1u;
    }
    loop {
        if (LOOP_COUNTERS[29u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[29u] = LOOP_COUNTERS[29u] + 1u;
        for (var var_0 = 0i; var_0 > 2147483647i; var_0 -= 1i) {
            if (LOOP_COUNTERS[30u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[30u] = LOOP_COUNTERS[30u] + 1u;
            var_0 = 2147483647i;
            var_0 = 38324i;
            continue;
        }
    }
    var var_0 = arg_0.c.x;
    return func_5().a;
}

@compute
@workgroup_size(1)
fn main() {
    let var_0 = _wgslsmith_f_op_f32(f32(-1f) * -1000f);
    let var_1 = _wgslsmith_add_u32(_wgslsmith_div_u32(abs(~(~0u)), 1u), 0u);
    switch (abs(~5218i)) {
        default: {
            for (var var_2 = 1i; ; var_2 -= 1i) {
                if (LOOP_COUNTERS[31u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[31u] = LOOP_COUNTERS[31u] + 1u;
                return;
            }
            switch (19205i) {
                default: {
                    let var_2 = select(vec2<bool>(any(vec4<bool>(true, true, true, 130f != var_0)), var_0 <= 643f), vec2<bool>(true, true), !any(select(select(vec3<bool>(false, true, false), vec3<bool>(false, false, true), false), vec3<bool>(false, true, true), false)));
                    let var_3 = func_10(Struct_2(Struct_1(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(max(vec3<f32>(var_0, var_0, 647f), vec3<f32>(1858f, var_0, var_0)))), _wgslsmith_f_op_vec3_f32(exp2(_wgslsmith_f_op_vec3_f32(-vec3<f32>(1591f, -849f, var_0)))), max(_wgslsmith_sub_i32(0i, 2991i), 1i), var_1), func_9(~func_1(vec4<bool>(true, false, var_2.x, false), vec2<i32>(12953i, -40848i), vec3<f32>(var_0, 1008f, -259f), vec4<i32>(-53747i, 0i, 53004i, 44288i)), _wgslsmith_sub_vec4_i32(abs(vec4<i32>(1i, 2147483647i, -36297i, -9442i)), -vec4<i32>(1i, -25595i, -28636i, 8551i)), 1i, vec2<f32>(_wgslsmith_f_op_f32(-975f + var_0), -1000f)), select(select(vec3<bool>(var_2.x, true, var_2.x), vec3<bool>(var_2.x, var_2.x, var_2.x), !var_2.x), select(!vec3<bool>(false, false, var_2.x), vec3<bool>(true, false, var_2.x), !vec3<bool>(var_2.x, true, var_2.x)), vec3<bool>(all(vec2<bool>(true, false)), any(vec3<bool>(true, var_2.x, var_2.x)), all(vec3<bool>(false, var_2.x, false)))), u_input.b.xyz), vec3<u32>(func_2().d, u_input.b.x, ~u_input.b.x), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(step(vec3<f32>(1000f, 822f, -1167f), vec3<f32>(var_0, -539f, -719f))) + _wgslsmith_f_op_vec3_f32(step(vec3<f32>(-649f, var_0, var_0), vec3<f32>(var_0, var_0, var_0))))) - _wgslsmith_f_op_vec3_f32(_wgslsmith_div_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(-851f, -2222f, -2581f) * vec3<f32>(var_0, -1000f, -445f)), vec3<f32>(var_0, 1092f, var_0)) - _wgslsmith_f_op_vec3_f32(-_wgslsmith_div_vec3_f32(vec3<f32>(var_0, var_0, var_0), vec3<f32>(var_0, var_0, -151f))))));
                    let var_4 = _wgslsmith_f_op_f32(217f * _wgslsmith_f_op_f32(-444f - -648f));
                    var var_5 = ~(1u & func_10(Struct_2(Struct_1(vec3<f32>(-1295f, var_4, var_3.a.x), var_3.b, 28029i, u_input.b.x), var_3, select(vec3<bool>(true, false, false), vec3<bool>(var_2.x, false, var_2.x), vec3<bool>(var_2.x, var_2.x, var_2.x)), vec3<u32>(0u, 46599u, 4294967295u) >> (u_input.b.xxz % vec3<u32>(32u))), _wgslsmith_div_vec3_u32(~vec3<u32>(2145u, var_1, var_1), ~u_input.a.xwy), _wgslsmith_f_op_vec3_f32(-vec3<f32>(-1048f, var_0, 1000f))).d);
                    var var_6 = var_2.x && true;
                }
            }
            loop {
                if (LOOP_COUNTERS[32u] >= 1u) {
                    break;
                }
                (LOOP_COUNTERS)[32u] = LOOP_COUNTERS[32u] + 1u;
                let var_2 = func_3(Struct_4(-266f, _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-vec3<f32>(746f, -1000f, var_0))) + vec3<f32>(_wgslsmith_f_op_f32(-var_0), _wgslsmith_f_op_f32(-535f + -1706f), _wgslsmith_f_op_f32(-236f)))), Struct_2(Struct_1(_wgslsmith_f_op_vec3_f32(vec3<f32>(var_0, var_0, -1434f) - _wgslsmith_f_op_vec3_f32(vec3<f32>(var_0, var_0, 130f) + vec3<f32>(var_0, var_0, var_0))), vec3<f32>(_wgslsmith_f_op_f32(f32(-1f) * -2134f), _wgslsmith_f_op_f32(abs(var_0)), var_0), _wgslsmith_dot_vec3_i32(abs(vec3<i32>(2147483647i, -43463i, 1i)), vec3<i32>(1033i, 12614i, 0i)), countOneBits(u_input.b.x)), func_4().a, vec3<bool>(true | any(vec2<bool>(false, false)), false, true), u_input.a.yyx)).x;
                var var_3 = vec3<bool>(any(!select(vec2<bool>(true, true), select(vec2<bool>(false, false), vec2<bool>(false, false), true), any(vec2<bool>(false, false)))), true, true);
                var var_4 = _wgslsmith_div_u32(_wgslsmith_clamp_u32(0u, var_1, ~(~56548u)), func_4().b) | 0u;
                var_3 = !(!select(vec3<bool>(select(true, var_3.x, var_3.x), var_3.x, true), !vec3<bool>(var_3.x, var_3.x, false), all(vec4<bool>(true, true, true, true))));
                var_3 = select(select(!vec3<bool>(false, select(true, false, true), any(vec3<bool>(false, true, var_3.x))), !select(vec3<bool>(var_3.x, true, false), !vec3<bool>(var_3.x, var_3.x, var_3.x), vec3<bool>(var_3.x, var_3.x, var_3.x)), vec3<bool>(false, true, true)), select(vec3<bool>(all(vec3<bool>(var_3.x, var_3.x, var_3.x)), 1i >= func_10(Struct_2(Struct_1(vec3<f32>(-262f, var_0, var_0), vec3<f32>(-687f, -721f, var_0), 5258i, u_input.b.x), Struct_1(vec3<f32>(358f, -455f, var_0), vec3<f32>(-848f, var_0, -177f), 2147483647i, var_1), vec3<bool>(false, var_3.x, true), u_input.b.xww), vec3<u32>(51296u, var_1, 0u), vec3<f32>(var_0, -1000f, var_0)).c, var_0 <= var_0), select(!select(vec3<bool>(var_3.x, false, true), vec3<bool>(false, var_3.x, var_3.x), vec3<bool>(var_3.x, true, var_3.x)), !vec3<bool>(var_3.x, true, var_3.x), false), true), vec3<bool>(!any(select(vec4<bool>(var_3.x, true, false, var_3.x), vec4<bool>(false, var_3.x, var_3.x, false), vec4<bool>(true, false, var_3.x, var_3.x))), true, false));
            }
        }
    }
    if (true) {
        let var_2 = func_4();
        let var_3 = _wgslsmith_add_vec3_i32(vec3<i32>(~(_wgslsmith_mult_i32(1i, var_2.a.c) & -34189i), var_2.a.c ^ 13373i, 1i), vec3<i32>(~(77073i << (var_1 % 32u)), var_2.a.c, _wgslsmith_dot_vec2_i32(vec2<i32>(1i, 1i), _wgslsmith_mod_vec2_i32(vec2<i32>(15219i, var_2.a.c), vec2<i32>(2147483647i, 37264i)))) & ~(_wgslsmith_add_vec3_i32(vec3<i32>(var_2.a.c, -52806i, var_2.a.c), vec3<i32>(0i, -54131i, var_2.a.c)) & vec3<i32>(var_2.a.c, var_2.a.c, -24575i)));
        loop {
            if (LOOP_COUNTERS[33u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[33u] = LOOP_COUNTERS[33u] + 1u;
        }
        for (var var_4 = 15881i; !(!any(vec4<bool>(true, true, true, true))); var_4 -= 1i) {
            if (LOOP_COUNTERS[34u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[34u] = LOOP_COUNTERS[34u] + 1u;
            let var_5 = Struct_4(_wgslsmith_div_f32(var_2.a.b.x, var_0), _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(floor(_wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(vec3<f32>(var_0, var_2.a.b.x, 981f) * vec3<f32>(var_2.a.b.x, 1295f, var_2.a.b.x)) - _wgslsmith_f_op_vec3_f32(-var_2.a.a)))) - _wgslsmith_f_op_vec3_f32(_wgslsmith_f_op_vec3_f32(floor(vec3<f32>(var_0, 358f, 138f))) - _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(var_2.a.a + var_2.a.b)))));
            var var_6 = Struct_3(var_2.a, 7552u);
            var_6 = func_4();
        }
        let var_4 = vec3<u32>(1u, 36325u, var_2.b);
    }
    if (select(true, (!all(vec3<bool>(false, true, false)) & (_wgslsmith_f_op_f32(-var_0) != -587f)) || (true & all(vec3<bool>(true, true, true))), any(vec2<bool>(true | select(false, true, false), false)))) {
        switch (19886i) {
            default: {
                var var_2 = Struct_2(func_5().a, func_9(~(~u_input.a), vec4<i32>(_wgslsmith_mod_i32(2147483647i, 12207i) << (u_input.a.x % 32u), _wgslsmith_clamp_i32(12855i, 0i, -52923i) << (reverseBits(29921u) % 32u), 24522i, _wgslsmith_sub_i32(max(11914i, -23453i), ~0i)), func_2().c, vec2<f32>(_wgslsmith_div_f32(_wgslsmith_f_op_f32(func_7(vec3<bool>(false, false, true), Struct_3(Struct_1(vec3<f32>(var_0, var_0, -432f), vec3<f32>(-779f, var_0, var_0), 2147483647i, 4294967295u), 27276u))), -1000f), _wgslsmith_f_op_f32(-_wgslsmith_f_op_f32(263f + var_0)))), !vec3<bool>(true, 34785u < ~var_1, true), u_input.a.yyy);
                let var_3 = Struct_2(var_2.b, Struct_1(var_2.a.b, _wgslsmith_div_vec3_f32(_wgslsmith_f_op_vec3_f32(-func_5().a.a), var_2.b.a), ~_wgslsmith_add_i32(0i, func_2().c), var_2.a.d), var_2.c, var_2.d);
                var_2 = Struct_2(var_2.b, func_4().a, vec3<bool>(var_3.d.x < 1u, var_3.c.x, var_2.c.x), ~vec3<u32>(var_2.b.d, func_4().b, 0u));
            }
        }
        loop {
            if (LOOP_COUNTERS[35u] >= 1u) {
                break;
            }
            (LOOP_COUNTERS)[35u] = LOOP_COUNTERS[35u] + 1u;
            continue;
        }
    }
    for (var var_2 = -35666i; var_2 > i32(-2147483648); var_2 = 0i) {
        if (LOOP_COUNTERS[36u] >= 1u) {
            break;
        }
        (LOOP_COUNTERS)[36u] = LOOP_COUNTERS[36u] + 1u;
        let var_3 = Struct_3(func_9(vec4<u32>(8372u, ~14992u, var_1 | 1u, ~62611u) << (firstLeadingBit(~vec4<u32>(u_input.b.x, var_1, 29390u, var_1)) % vec4<u32>(32u)), _wgslsmith_div_vec4_i32(_wgslsmith_sub_vec4_i32(~vec4<i32>(1i, -8221i, -34399i, 1i), ~vec4<i32>(1i, 62943i, 29599i, -14968i)), max(vec4<i32>(0i, 2147483647i, -26294i, 1i), vec4<i32>(-41251i, i32(-2147483648), -10303i, 5552i)) >> (select(vec4<u32>(82853u, 27767u, 4294967295u, u_input.b.x), u_input.b, vec4<bool>(false, true, false, false)) % vec4<u32>(32u))), 1i, _wgslsmith_f_op_vec2_f32(-_wgslsmith_div_vec2_f32(func_9(u_input.a, vec4<i32>(11205i, -5217i, 63691i, 7032i), -24047i, vec2<f32>(-124f, var_0)).a.zy, _wgslsmith_f_op_vec2_f32(trunc(vec2<f32>(var_0, 296f)))))), 1u);
        var var_4 = -1542f;
        let var_5 = Struct_2(Struct_1(_wgslsmith_f_op_vec3_f32(vec3<f32>(_wgslsmith_f_op_f32(-var_3.a.a.x), var_0, var_3.a.b.x) * var_3.a.b), _wgslsmith_f_op_vec3_f32(-_wgslsmith_f_op_vec3_f32(-var_3.a.a)), var_3.a.c, 0u), var_3.a, vec3<bool>(any(select(vec4<bool>(false, false, false, false), select(vec4<bool>(false, true, false, true), vec4<bool>(true, true, true, true), vec4<bool>(true, true, true, false)), var_3.b <= u_input.b.x)), true, true), _wgslsmith_sub_vec3_u32(firstTrailingBit(~u_input.a.zxw | _wgslsmith_sub_vec3_u32(u_input.a.zyw, vec3<u32>(var_1, var_3.b, 0u))), ~_wgslsmith_sub_vec3_u32(~u_input.a.xwz, vec3<u32>(25872u, var_1, 59754u))));
    }
    let x = u_input.a;
    s_output = StorageBuffer(_wgslsmith_f_op_vec4_f32(step(_wgslsmith_f_op_vec4_f32(-_wgslsmith_f_op_vec4_f32(-vec4<f32>(var_0, -454f, -205f, 1000f))), _wgslsmith_f_op_vec4_f32(-_wgslsmith_f_op_vec4_f32(-_wgslsmith_f_op_vec4_f32(vec4<f32>(var_0, var_0, -3164f, var_0) - vec4<f32>(895f, var_0, -1061f, var_0)))))));
}

