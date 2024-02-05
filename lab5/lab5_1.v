/* CSED273 lab5 experiment 1 */
/* lab5_1.v */

`timescale 1ps / 1fs

/* Implement adder 
 * You must not use Verilog arithmetic operators */
module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 
    wire [2:0] c;
        
    ////////////////////////
    assign out[0] = x[0]^y[0]^c_in;
    assign c[0] = (x[0]&y[0])|(x[0]&c_in)|(y[0]&c_in);
    
    assign out[1] = x[1]^y[1]^c[0];
    assign c[1] = (x[1]&y[1])|(x[1]&c[0])|(y[1]&c[0]);

    assign out[2] = x[2]^y[2]^c[1];
    assign c[2] = (x[2]&y[2])|(x[2]&c[1])|(y[2]&c[1]);

    assign out[3] = x[3]^y[3]^c[2];
    assign c_out = (x[3]&y[3])|(x[3]&c[2])|(y[3]&c[2]);
    ////////////////////////

endmodule

/* Implement arithmeticUnit with adder module
 * You must use one adder module.
 * You must not use Verilog arithmetic operators */
module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire [3:0]y_2;
    
    assign y_2[0] = (y[0]&select[1])|(~y[0]&select[2]);
    assign y_2[1] = (y[1]&select[1])|(~y[1]&select[2]);
    assign y_2[2] = (y[2]&select[1])|(~y[2]&select[2]);
    assign y_2[3] = (y[3]&select[1])|(~y[3]&select[2]);
        
    adder a(x, y_2, select[0], out, c_out);
    ////////////////////////

endmodule

/* Implement 4:1 mux */
module mux4to1(
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////
    assign out = (in[0]&~select[1]&~select[0])|(in[1]&~select[1]&select[0])
    |(in[2]&select[1]&~select[0])|(in[3]&select[1]&select[0]);
    ////////////////////////

endmodule

/* Implement logicUnit with mux4to1 */
module logicUnit(
    input [3:0] x,
    input [3:0] y,
    input [1:0] select,
    output [3:0] out
);

    ////////////////////////    
    mux4to1 m0({~x[0], x[0]^y[0], x[0]|y[0], x[0]&y[0]}, select, out[0]);
    mux4to1 m1({~x[1], x[1]^y[1], x[1]|y[1], x[1]&y[1]}, select, out[1]);
    mux4to1 m2({~x[2], x[2]^y[2], x[2]|y[2], x[2]&y[2]}, select, out[2]);
    mux4to1 m3({~x[3], x[3]^y[3], x[3]|y[3], x[3]&y[3]}, select, out[3]);
    ////////////////////////

endmodule

/* Implement 2:1 mux */
module mux2to1(
    input [1:0] in,
    input  select,
    output out
);

    ////////////////////////
    assign out = (in[0]&~select)|(in[1]&select);
    ////////////////////////

endmodule

/* Implement ALU with mux2to1 */
module lab5_1(
    input [3:0] x,
    input [3:0] y,
    input [3:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire [3:0] out_1, out_2;
    
    arithmeticUnit g0(x, y, {select[2], select[1], select[0]}, out_1, c_out);
    logicUnit g1(x, y, {select[1], select[0]}, out_2);
    
    mux2to1 q0({out_2[0], out_1[0]}, select[3], out[0]);
    mux2to1 q1({out_2[1], out_1[1]}, select[3], out[1]);
    mux2to1 q2({out_2[2], out_1[2]}, select[3], out[2]);
    mux2to1 q3({out_2[3], out_1[3]}, select[3], out[3]);
    ////////////////////////

endmodule
