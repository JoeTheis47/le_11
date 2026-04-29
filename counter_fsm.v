`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:37 PM
// Design Name: 
// Module Name: le9
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module state_cntr(
    input en,
    input clk,
    input reset,
    output pulse,
    output reg [5:0] cnt
    );

reg [5:0] next_cnt;

// flip-flops (state memeory)
always @(posedge clk or posedge reset) begin
    if (reset) cnt<=5'd0; // reset to zero 
    else cnt <= next_cnt;
end

// next-state logic
always @(*) begin
    if(en) begin // check for the enable 
        if (cnt [3:0] == 4'b1001) begin 
        next_cnt[3:0] = 4'd0;
        next_cnt[5:4] = cnt[5:4] +1;
        end// if the counter reaches 15 go back to zero 
        
        else next_cnt[3:0] = cnt[3:0] + 1; // new concept -- a counter! 
    end 
    else next_cnt = cnt; // if enable is low stay in the same state 
end

// output logic 
assign pulse = ((cnt[5:4] == 2'D3) && (cnt[3:0] == 4'D9)); // at the last state send out a pulse 

endmodule

module count_to(
input [3:0] max_num,
input en,
output reg[3:0] num,
output C_out
);

endmodule