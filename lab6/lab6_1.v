/* CSED273 lab6 experiment 1 */
/* lab6_1.v */

`timescale 1ps / 1fs

/* Implement synchronous BCD decade counter (0-9)
 * You must use JK flip-flop of lab6_ff.v */
module decade_counter(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    wire rev[3:0];
    wire ja, ka, jb, kb, jc, kc, jd, kd;
    
    assign ja = count[2]&count[1]&count[0];
    assign ka = count[0];
    assign jb = count[1]&count[0];
    assign kb = count[1]&count[0];
    assign jc = rev[3]&count[0];
    assign kc = count[0];
    assign jd = 1;
    assign kd = 1;
    
    edge_trigger_JKFF a0(reset_n, ja, ka, clk, count[3], rev[3]);
    edge_trigger_JKFF a1(reset_n, jb, kb, clk, count[2], rev[2]);
    edge_trigger_JKFF a2(reset_n, jc, kc, clk, count[1], rev[1]);
    edge_trigger_JKFF a3(reset_n, jd, kd, clk, count[0], rev[0]);
    ////////////////////////
	
endmodule