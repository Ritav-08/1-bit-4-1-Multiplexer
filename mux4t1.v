`timescale 1ns / 1ps

//Checkout Readme for more details

//1-bit 4:1 MUX using 2:1 MUX- Structural representation
module mux4t1(in, en, sel, dout);
input en; //enable
input [3:0]in; //4 input lines
input [1:0]sel; //2 select lines
output dout; //output data

//net(s)
wire I1_I3, I2_I4; //outputs of first stage 2:1 mux

//three 2:1 mux are used to model 4:1 mux
mux2t1 MuxI0_I2(.in1(in[0]), .in2(in[2]), .en(en), .sel(sel[0]), .dout(I1_I3)); //first stage mux
mux2t1 MuxI1_I3(.in1(in[1]), .in2(in[3]), .en(en), .sel(sel[0]), .dout(I2_I4)); //first stage mux
mux2t1 MuxI13_I24(.in1(I1_I3), .in2(I2_I4), .en(en), .sel(sel[1]), .dout(dout)); //second stage mux

endmodule
//------------------------------------------------
//2:1 MUX - Structural representation
module mux2t1(in1, in2, en, sel, dout);
input en; //enable
input sel; //select line
input in1; //first data input, I1
input in2; //second data input, I2
output dout; //output

//net(s)
wire bsel; //sel_inverted
wire I1_selected, I2_selected; //Ix is selected
wire I1_enabled, I2_enabled; //enable Ix_selected
wire mdout; //output of mux logic
wire sel_x; //'X' if select line is X, otherwise 0
wire in1_x; //'X' if input_1 is 'X', otherwise 0
wire in2_x; //'X' if input_2 is 'X', otherwise 0
wire any_x; //if any input is 'X', any_x is 'X' otherwise 0
wire force_x; //if enable is low and any input is 'X', force_x= 'X', otherwise 0

//structural representation of 2:1 mux
not SelBar(bsel, sel); 
and(I2_selected, bsel, in1);
and(I1_selected, sel, in2); 
and(I1_enabled, en, I1_selected);
and(I2_enabled, en, I2_selected); 
or(mdout, I1_enabled, I2_enabled); 

//when en=0, sel=x, in=x, dout=0 instead of 'X'; here's the fix
xor z(sel_x, sel, sel); //sel_x always 0 when sel is defined, otherwise 'X'
xor x(in1_x, in1, in1); //similar behaviour as sel_x 
xor c(in2_x, in2, in2); //similar behaviour as sel_x
not a(b_en, en);
or b(any_x, sel_x, in1_x, in2_x);
and m(force_x, b_en, any_x); //
or d(dout, force_x, mdout); //if force_x is 'X', output data line is 'X'

endmodule
//------------------------------------------------
