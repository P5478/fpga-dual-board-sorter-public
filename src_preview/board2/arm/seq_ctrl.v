// ==========================================================================
// 动作序列控制器：把一次搬运拆成 20 个步骤，逐条发送舵机指令
//
// 【功能概要】
//   · 回初始位 → 接近目标格 → 下压 → 抬起 → 转向 → 放置 → 复位
//   · 每一步 = 一条总线舵机指令（位置 + 时间），同组动作连发实现多轴联动
//   · 每步后回读舵机位置，用于调试与丢帧检测
//
// 【实现说明】展示版仅保留接口；20 步动作表、每步位置/时间值未公开。
// ==========================================================================
// 公开预览版：仅保留接口与设计说明，核心实现不在本仓库。


module seq_ctrl (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start,
    input  wire [3:0]  cell_a,
    input  wire [3:0]  cell_b,
    input  wire        jog,
    input  wire        jog_dir,
    input  wire        home,
    input  wire        pick_only,
    input  wire        tour,
    input  wire        tour_l,
    output reg         busy,
    output reg  [4:0]  step_dbg,
    output reg  [7:0]  tx_data,
    output reg         tx_valid,
    input  wire        tx_ready,
    output reg  [7:0]  pump_hint,
    output wire [15:0] v_bcd_dbg,
    output wire [3:0]  sid_dbg
);

    // -----------------------------------------------------------------
    // 展示版：核心实现未公开。
    // 这里只保留模块接口与设计说明，用于展示系统架构与工程组织方式。
    // -----------------------------------------------------------------

endmodule
