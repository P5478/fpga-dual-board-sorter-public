// ==========================================================================
// 板 1 顶层：摄像头采集 → ISP → 实时识别 → 画框叠加 → 以太网发送
//
// 【功能概要】
//   1. 配置并接收 MIPI 摄像头（1280x720），完成 ISP 流水线（去马赛克 / 自动曝光 / 自动白平衡）
//   2. 在像素流上并行运行两套识别：
//        · 运动目标检测（帧差法：分块统计 + 3x3 多数滤波 + 目标框跟踪）
//        · 静态彩色多目标识别（颜色/形状分类，最多 8 个目标）
//   3. 手势识别：统计手指数量（1~5）并给出整只手的外接框
//   4. 把检测框、手势框和 OSD 数字叠加回画面
//   5. 把画好的画面按行打包成自定义以太网帧（RGB565，两段/行），经 RGMII 千兆发送
//   6. 每帧把 6 个格子的标签汇总成 8 字节帧，同时走串口和以太网帧头
//
// 【端口分组】摄像头控制 | MIPI/LVDS 输入 | HDMI 输出 | RGMII 以太网 | 按键 | 数码管 | 调试串口
//
// 【实现说明】展示版仅保留接口；像素流水线、识别算法、参数标定均未公开。
// ==========================================================================
// 公开预览版：仅保留接口与设计说明，核心实现不在本仓库。


module design_top_wrapper (
    input wire        I_sys_clk,
    output wire       O_cam_scl,
    inout  wire       IO_cam_sda,
    output wire       O_cam_24m,
    output wire       O_cam_rst,
    inout wire [3:0]  I_button,
    output wire       O_phy_rst,
    input  wire [3:0] I_a_rgmii_rxd,
    input  wire       I_a_rgmii_rx_ctl,
    input  wire       I_a_rgmii_rxc,
    output wire [3:0] O_a_rgmii_txd,
    output wire       O_a_rgmii_tx_ctl,
    output wire       O_a_rgmii_txc,
    output wire [7:0] O_DIG,
    output wire [7:0] O_SEL,
    output wire       O_link_tx,
    output wire       O_link_tx_dbg,
    output wire       O_link_tx_j2,
    output wire       O_link_tx_j1b,
    output wire       O_link_tx_j2b,
    output wire       O_tmds_ch0_p,
    output wire       O_tmds_ch1_p,
    output wire       O_tmds_ch2_p,
    output wire       O_tmds_clk_p,
    inout wire        IO_rx_clk_pad_n,
    inout wire        IO_rx_clk_pad_p,
    inout wire[3:0]   IO_rx_data_pad_n,
    inout wire[3:0]   IO_rx_data_pad_p,
    output wire[12:0] ddr_addr,
    output wire[ 1:0] ddr_ba,
    output wire[ 0:0] ddr_cke,
    output wire[ 0:0] ddr_odt,
    output wire[ 0:0] ddr_cs_n,
    output wire       ddr_ras_n,
    output wire       ddr_cas_n,
    output wire       ddr_we_n,
    output wire[ 0:0] ddr_ck_p,
    output wire[ 0:0] ddr_ck_n,
    inout wire[1:0]   ddr_dm,
    inout wire[15:0]  ddr_dq,
    inout wire[1:0]   ddr_dqs_p,
    inout wire[1:0]   ddr_dqs_n
);

    // -----------------------------------------------------------------
    // 展示版：核心实现未公开。
    // 这里只保留模块接口与设计说明，用于展示系统架构与工程组织方式。
    // -----------------------------------------------------------------

endmodule
