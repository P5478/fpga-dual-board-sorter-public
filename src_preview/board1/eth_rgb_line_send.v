// ==========================================================================
// 以太网视频发送：整行落缓冲 → 按段打包 → 交给 MAC
//
// 【功能概要】
//   · RGB888 → RGB565，写入双行缓冲（乒乓）
//   · 每行拆成 2 段，每段一个以太网帧（16 字节帧头 + 640 像素）
//   · 帧头携带帧号/行号/段号/OSD 数值/6 格标签
//   · 像素时钟域写、MAC 时钟域读，跨时钟域用邮箱 + 双缓冲
//
// 【实现说明】展示版仅保留接口；帧头布局的完整定义未公开。
// ==========================================================================
// 公开预览版：仅保留接口与设计说明，核心实现不在本仓库。


module eth_rgb_line_send (
    input  wire         I_pclk,
    input  wire         I_prst_n,
    input  wire         I_vs,
    input  wire         I_de,
    input  wire [23:0]  I_rgb,
    input  wire         I_en,
    input  wire [23:0]  I_osd_word,
    input  wire [47:0]  I_cell_map,
    input  wire signed [7:0] I_hshift,
    input  wire         I_mclk,
    input  wire         I_mrst,
    output reg          O_tx_valid,
    output reg  [7:0]   O_tx_data,
    input  wire         I_tx_busy,
    output reg  [15:0]  O_lines_sent,
    output reg          O_drop
);

    // -----------------------------------------------------------------
    // 展示版：核心实现未公开。
    // 这里只保留模块接口与设计说明，用于展示系统架构与工程组织方式。
    // -----------------------------------------------------------------

endmodule
