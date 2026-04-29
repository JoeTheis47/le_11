`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:20 PM
// Design Name: 
// Module Name: le9_tb
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

module test;
  reg en,clk,reset;
  wire pulse;
  wire [5:0] count;
    
  // Instantiate design under test
  state_cntr U1(
  .en(en), .clk(clk), .reset(reset), .pulse(pulse) , .cnt(count)
  );
    initial begin
    en = 0; // begin with the count as low, and nothing else high, so that its not enabled or anything
    clk = 0;
    reset = 0;
    #2 
    reset = 1;// resets to bring initial value to 0
    #2 
    reset = 0; // then lets it run again
    #6
    en = 1; // enables counter to begin
    #24000 // has to be extended to view all of the test_bench
    $finish;
    //$display("Value of c in hex is %h", c);
    //$display("Parity of c is %b", parity);
  end
  
  always begin
    #10 // half the period of the clock
    clk = ~clk; // creates the clock
  end
  
endmodule