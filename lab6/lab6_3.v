/* CSED273 lab6 experiment 3 */
/* lab6_3.v */

`timescale 1ps / 1fs

/* Implement 369 game counter (0, 3, 6, 9, 13, 6, 9, 13, 6 ...)
 * You must first implement D flip-flop in lab6_ff.v
 * then you use D flip-flop of lab6_ff.v */
module counter_369(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    wire rev[3:0];
    wire d0, d1, d2, d3;
    
    assign d0 = (count[3]&rev[2])|(count[1]&rev[0]);
    assign d1 = count[0];
    assign d2 = (rev[3]&rev[2])|(count[2]&count[0]);
    assign d3 = (count[3]&rev[2])|rev[0];
    
    edge_trigger_D_FF m0(reset_n, d0, clk, count[3], rev[3]);
    edge_trigger_D_FF m1(reset_n, d1, clk, count[2], rev[2]);
    edge_trigger_D_FF m2(reset_n, d2, clk, count[1], rev[1]);
    edge_trigger_D_FF m3(reset_n, d3, clk, count[0], rev[0]);
    ////////////////////////
	
endmodule
