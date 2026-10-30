// ==========================================================================
// 以太网视频接收：拆帧头 → 双缓冲拼行 → 还原 128 位像素流
//
// 【功能概要】
//   · 按字节序号拆出 16 字节帧头（帧号/行号/段号/OSD/6 格标签）
//   · 一行两段收齐后拼成完整行，交给显示链路
//   · 帧号 + 行号双重校验，避免断行造成假帧起始
//
// 【实现说明】展示版仅保留接口。
// ==========================================================================
// 公开预览版：仅保留接口与设计说明，核心实现不在本仓库。


module eth_rgb_recv (
    input  wire         I_clk,
    input  wire         I_rst,
    input  wire         I_valid,
    input  wire [7:0]   I_data,
    output reg          O_word_valid,
    output reg  [127:0] O_word_data,
    output reg          O_frame_start,
    output reg  [23:0]  O_osd_word,
    output reg          O_osd_toggle,
    output reg  [63:0]  O_cell_frame,
    output reg          O_cell_toggle,
    output reg  [15:0]  O_lines_done,
    output reg  [15:0]  O_segs_seen,
    output reg          O_drop
);

    // -----------------------------------------------------------------
    // 展示版：核心实现未公开。
    // 这里只保留模块接口与设计说明，用于展示系统架构与工程组织方式。
    // -----------------------------------------------------------------

endmodule
