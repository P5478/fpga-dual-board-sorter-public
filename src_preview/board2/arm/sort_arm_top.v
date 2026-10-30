// ==========================================================================
// 机械臂顶层：标签解析 → 分拣策略 → 动作序列 → 舵机总线
//
// 【功能概要】
//   · 解析 'L' + 6 字节 + '!' 标签帧，得到 L1..L6 每格的颜色/形状
//   · 两种分拣模式（颜色 / 形状），按键切换，数码管显示当前模式
//   · 启动键触发一趟分拣：按格子顺序执行 20 步动作序列
//   · 支持 L 区 / R 区落点巡航、舵机泄力 + 位置回读（手动标定）
//
// 【实现说明】展示版仅保留接口；动作表、时序参数、落点标定值未公开。
// ==========================================================================
// 公开预览版：仅保留接口与设计说明，核心实现不在本仓库。


module sort_arm_top (
    input  wire clk,
    input  wire rst_n,
    output wire dbg_tx,
    output wire o_arm_tx_mon,
    output wire o1,  output wire o2,  output wire o3,  output wire o4,  output wire o5,
    output wire o6,  output wire o7,  output wire o8,  output wire o9,  output wire o10,
    output wire o11, output wire o12, output wire o13, output wire o14, output wire o15,
    output wire o16, output wire o17, output wire o18, output wire o19, output wire o20,
    input  wire i1,  input  wire i2,  input  wire i3,  input  wire i4,  input  wire i5,
    input  wire i6,  input  wire i7,  input  wire i8,  input  wire i9,  input  wire i10,
    input  wire i11, input  wire i12, input  wire i13, input  wire i14, input  wire i15,
    input  wire i16, input  wire i17, input  wire i18, input  wire i19, input  wire i20,
    input  wire key_start,
    input  wire key_mode,
    input  wire sw4,
    input  wire sw3,
    input  wire sw2,
    output wire [7:0] o_dig,
    output wire [7:0] o_sel,
    output wire led1,
    output wire led2,
    output wire led3,
    output wire led4,
    input  wire [7:0] link_data,
    input  wire       link_valid
);

    // -----------------------------------------------------------------
    // 展示版：核心实现未公开。
    // 这里只保留模块接口与设计说明，用于展示系统架构与工程组织方式。
    // -----------------------------------------------------------------

endmodule
