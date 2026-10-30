// ==========================================================================
// sync_2ff.v —— 通用两级同步器（跨时钟域收单比特信号）
//
// 说明：
//   · 用于把异步/跨时钟域的单比特电平信号安全地收进本地时钟域；
//   · 两级触发器降低亚稳态传播概率；
//   · 只适用于"慢变电平"信号；总线类数据请用异步 FIFO / 握手同步。
// ==========================================================================
`timescale 1ns / 1ps

module sync_2ff (
    input  wire clk,
    input  wire rst_n,
    input  wire async_in,   // 异步输入
    output wire sync_out    // 同步后的输出
);

    reg meta, sync;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            meta <= 1'b0;
            sync <= 1'b0;
        end else begin
            meta <= async_in;
            sync <= meta;
        end
    end

    assign sync_out = sync;

endmodule
