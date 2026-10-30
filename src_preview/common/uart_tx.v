// ==========================================================================
// uart_tx.v —— 通用 UART 发送器（8N1，valid/ready 握手）
//
// 设计要点：
//   1. 波特率分频常数在综合时算好，运行时零开销；
//   2. 模块空闲（ready=1）且 valid=1 时接收一个字节，随后 busy 拉低 ready；
//   3. 起始位 / 8 数据位 / 停止位，LSB 先发。
//
// 参数：
//   CLK_FRE   —— 时钟频率（MHz）
//   BAUD_RATE —— 波特率，默认 115200
// ==========================================================================
`timescale 1ns / 1ps

module uart_tx #(
    parameter integer CLK_FRE   = 50,
    parameter integer BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] tx_data,        // 待发送字节
    input  wire       tx_data_valid,  // 数据有效（与 ready 同时为 1 即握手成功）
    output reg        tx_data_ready,  // 1 = 空闲，可以接收新字节
    output reg        tx_pin          // 串行输出（空闲为高）
);

    localparam integer CYCLE = CLK_FRE * 1000000 / BAUD_RATE;

    localparam [1:0] S_IDLE  = 2'd0,
                     S_START = 2'd1,
                     S_DATA  = 2'd2,
                     S_STOP  = 2'd3;

    reg [1:0]  state;
    reg [15:0] cycle_cnt;
    reg [2:0]  bit_cnt;
    reg [7:0]  data_latch;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state         <= S_IDLE;
            cycle_cnt     <= 16'd0;
            bit_cnt       <= 3'd0;
            data_latch    <= 8'd0;
            tx_pin        <= 1'b1;
            tx_data_ready <= 1'b1;
        end else begin
            case (state)
                S_IDLE: begin
                    tx_pin        <= 1'b1;
                    tx_data_ready <= 1'b1;
                    if (tx_data_valid) begin
                        data_latch    <= tx_data;
                        tx_data_ready <= 1'b0;
                        cycle_cnt     <= 16'd0;
                        state         <= S_START;
                    end
                end

                S_START: begin
                    tx_pin <= 1'b0;                       // 起始位
                    if (cycle_cnt == CYCLE - 1) begin
                        cycle_cnt <= 16'd0;
                        bit_cnt   <= 3'd0;
                        state     <= S_DATA;
                    end else begin
                        cycle_cnt <= cycle_cnt + 16'd1;
                    end
                end

                S_DATA: begin
                    tx_pin <= data_latch[bit_cnt];        // LSB 先发
                    if (cycle_cnt == CYCLE - 1) begin
                        cycle_cnt <= 16'd0;
                        if (bit_cnt == 3'd7) begin
                            state <= S_STOP;
                        end else begin
                            bit_cnt <= bit_cnt + 3'd1;
                        end
                    end else begin
                        cycle_cnt <= cycle_cnt + 16'd1;
                    end
                end

                S_STOP: begin
                    tx_pin <= 1'b1;                       // 停止位
                    if (cycle_cnt == CYCLE - 1) begin
                        cycle_cnt <= 16'd0;
                        state     <= S_IDLE;
                    end else begin
                        cycle_cnt <= cycle_cnt + 16'd1;
                    end
                end

                default: state <= S_IDLE;
            endcase
        end
    end

endmodule
