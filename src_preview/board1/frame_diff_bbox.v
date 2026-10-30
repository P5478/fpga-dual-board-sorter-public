// ==========================================================================
// 运动目标检测与静态多目标识别（行缓存流水线）
//
// 【功能概要】
//   · 帧差法检测运动目标：逐块统计像素差 → 3x3 多数滤波 → 行程判定 → 目标框
//   · 静态彩色多目标识别：颜色/形状分类，最多同时跟踪 8 个目标
//   · 每个目标输出：中心坐标、外接框、形状码、颜色码
//
// 【端口分组】像素输入（DE/VS/24bit RGB）| 目标结果（最多 8 路）| 帧同步/统计
//
// 【实现说明】展示版仅保留接口；分块统计、颜色判定、形状分类算法均未公开。
// ==========================================================================
// 公开预览版：仅保留接口与设计说明，核心实现不在本仓库。


module frame_diff_bbox (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        i_vsync,
    input  wire        i_hsync,
    input  wire        i_de,
    input  wire [23:0] i_rgb,
    input  wire        i_enable,
    input  wire        i_static_mode,
    input  wire        i_mask_mode,
    output reg         o_vsync,
    output reg         o_hsync,
    output reg         o_de,
    output reg  [23:0] o_rgb,
    output reg         o_motion_detected,
    output reg  [3:0]  o_target_count,
    output wire [7:0]  o_region_valid,
    output wire [95:0] o_region_cx,
    output wire [95:0] o_region_cy,
    output wire [23:0] o_region_shape,
    output wire [23:0] o_region_color,
    output wire        o_frame_tick,
    output wire        o_dbg_stb,
    output wire [2:0]  o_dbg_idx,
    output wire [9:0]  o_dbg_sx,
    output wire [8:0]  o_dbg_sy,
    output wire [16:0] o_dbg_cnt,
    output wire [9:0]  o_dbg_top,
    output wire [9:0]  o_dbg_bot,
    output wire [9:0]  o_dbg_shift,
    output wire [2:0]  o_dbg_shape,
    output wire        o_dbg_usable
);

    // -----------------------------------------------------------------
    // 展示版：核心实现未公开。
    // 这里只保留模块接口与设计说明，用于展示系统架构与工程组织方式。
    // -----------------------------------------------------------------

endmodule
