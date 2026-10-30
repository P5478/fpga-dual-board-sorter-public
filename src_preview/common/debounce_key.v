// ==========================================================================
// debounce_key.v —— 通用按键消抖（同步设计，按下/松开各出一个单拍脉冲）
//
// 设计要点：
//   1. 先做两级同步，把异步按键信号收进本地时钟域（防亚稳态）；
//   2. 电平必须连续稳定 DEBOUNCE_MS 毫秒才被采信，机械抖动全部滤掉；
//   3. 输出按下沿 / 松开沿各一个时钟周期的脉冲，方便上层做"按一下"逻辑。
//
// 参数：
//   CLK_FRE      —— 时钟频率（MHz）
//   DEBOUNCE_MS  —— 消抖时间（毫秒），默认 20
//   ACTIVE_LOW   —— 1 = 按下为低（带上拉的按键），0 = 按下为高
// ==========================================================================
`timescale 1ns / 1ps

module debounce_key #(
    parameter integer CLK_FRE     = 50,
    parameter integer DEBOUNCE_MS = 20,
    parameter         ACTIVE_LOW  = 1
)(
    input  wire clk,
    input  wire rst_n,
    input  wire key_in,        // 原始按键输入（异步）

    output reg  press_pulse,   // 按下：拉高一个时钟
    output reg  release_pulse, // 松开：拉高一个时钟
    output reg  key_level      // 消抖后的电平（1 = 按下）
);

    localparam integer DEBOUNCE_MAX = CLK_FRE * 1000 * DEBOUNCE_MS;

    // ---- 1. 两级同步 ----
    reg sync1, sync2;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync1 <= 1'b1;
            sync2 <= 1'b1;
        end else begin
            sync1 <= key_in;
            sync2 <= sync1;
        end
    end

    wire key_raw = ACTIVE_LOW ? ~sync2 : sync2;   // 统一成"1 = 按下"

    // ---- 2. 稳定计数器：电平连续不变才更新 ----
    reg [31:0] stable_cnt;
    reg        key_level_d;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stable_cnt  <= 32'd0;
            key_level   <= 1'b0;
            key_level_d <= 1'b0;
        end else if (key_raw == key_level) begin
            stable_cnt <= 32'd0;
        end else if (stable_cnt >= DEBOUNCE_MAX) begin
            stable_cnt  <= 32'd0;
            key_level   <= key_raw;
            key_level_d <= key_level;
        end else begin
            stable_cnt <= stable_cnt + 32'd1;
        end
    end

    // ---- 3. 边沿脉冲 ----
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            press_pulse   <= 1'b0;
            release_pulse <= 1'b0;
        end else begin
            press_pulse   <= key_level & ~key_level_d;
            release_pulse <= ~key_level & key_level_d;
        end
    end

endmodule
