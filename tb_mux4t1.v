`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Ritav
//
// Create Date: 08.04.2026 13:42:40
// Design Name: 1-bit 4:1 MUX testbench
// Module Name: tb_mux4t1
// Project Name: MUX Implementation
// Target Devices: Simulation Only
// Tool Versions: Vivado 2025.2
// Description: 
//     Testbench for 1-bit 4:1 multiplexer (mux4t1), verifies functionality with all input combinations and enable states.
// Dependencies: 
//     Modules: mux4t1, mux2t1
// Revision:
//     Revision 0.01 - File Created
// Additional Comments:
//     Simulation includes undefined inputs to test X-propagation and enable behavior.
//////////////////////////////////////////////////////////////////////////////////

module tb_mux4t1();
reg en;
reg [3:0]in;
reg [1:0]sel;
wire dout;

//instantiation
mux4t1 MUX(.en(en), .in(in), .sel(sel), .dout(dout));

initial begin //enable signal for all 2:1 mux
#2 en = 1'b0;
#13 en = 1'b1;
end

//select signal, sel[0] for both of first stage 2:1 mux, sel[1] for second stage 2:1 mux
initial repeat(5) begin 
#5 sel = 2'b00;
#5 sel = 2'b01;
#5 sel = 2'b10;
#5 sel = 2'b11;
end

initial begin //input lines, in[0] in[1] in[2] in[3], for 4:1 mux
#5 in = 4'bx;
#5 in = 4'b0;
#5 in = 4'b1;
#5 in = 4'b10;
#5 in = 4'b0011;
#5 in = 4'b0100;
#5 in = 4'b0101;
#5 in = 4'b0110;
#5 in = 4'b0111;
#5 in = 4'b1000;
#5 in = 4'b1001;
#5 in = 4'b1010;
#5 in = 4'b1011;
#5 in = 4'b1100;
#5 in = 4'b1101;
#5 in = 4'b1110;
#5 in = 4'b1111;
#5 $finish; //time = 90
end

initial begin //capture
$monitor("At time: ", $time, ", EN: %b, Sel: %b, Inputs: %b and Dout: %b", en, sel, in, dout, "\nAt first stage 2t1 mux between, I1_I3: %b, I2_I4: %b", mux4t1.I1_I3, mux4t1.I2_I4);
$dumpfile("mux4t1.vcd"); 
$dumpvars(0, tb_mux4t1);
end

endmodule
