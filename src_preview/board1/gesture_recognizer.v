// ==========================================================================
// 手势识别：从 RGB 像素流中数出手指数量（1~5）
//
// 【功能概要】
//   · 在指定扫描带内逐行分析"深色手掌"区域，按行分组成手指
//   · 结合手掌位置与手指分布做几何判定，输出手指数量 + 整只手的外接框
//   · 全部在像素时钟域流水线完成，不占用 CPU
//
// 【实现说明】展示版仅保留接口；阈值模型、扫描策略与判定规则未公开。
// ==========================================================================
// 公开预览版：仅保留接口与设计说明，核心实现不在本仓库。


module gesture_recognizer (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        i_vsync,
    input  wire        i_de,
    input  wire [23:0] i_rgb,
    output reg  [3:0]  o_finger_count,
    output reg         o_bbox_valid,
    output reg  [11:0] o_bbox_x_min,
    output reg  [11:0] o_bbox_x_max,
    output reg  [11:0] o_bbox_y_min,
    output reg  [11:0] o_bbox_y_max,
    output wire [3:0]  o_dbg_groups,
    output wire [19:0] o_dbg_pixels,
    output wire [11:0] o_dbg_x_min,
    output wire [11:0] o_dbg_x_max,
    output wire [11:0] o_dbg_scan_x_min,
    output wire [7:0]  o_dbg_thr
);

    // -----------------------------------------------------------------
    // 展示版：核心实现未公开。
    // 这里只保留模块接口与设计说明，用于展示系统架构与工程组织方式。
    // -----------------------------------------------------------------

endmodule
