/* CSED273 lab5 experiment 2 */
/* lab5_2.v */

`timescale 1ns / 1ps

/* Implement srLatch */
module srLatch(
    input s, r,
    output q, q_
    );

    ////////////////////////
    assign q = ~(r|q_);
    assign q_ = ~(s|q);
    ////////////////////////

endmodule

/* Implement master-slave JK flip-flop with srLatch module */
module lab5_2(
    input reset_n, j, k, clk,
    output q, q_
    );

    ////////////////////////
    wire p, p_;
    
    srLatch s1(reset_n&(j&clk&q_), (k&q&clk)|~reset_n, p, p_);
    srLatch s2(p&~clk, p_&~clk, q, q_);
    ////////////////////////
    
endmodule