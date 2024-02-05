/* CSED273 lab3 experiment 3 */
/* lab3_3.v */


/* 8-to-1 Multiplexer
 * You must use this module to implement 5-bit Majority Function */
module mux(
    input wire [7:0] data_input,
    input wire [2:0] select_input,
    output wire out
    );

    wire i0, i1, i2, i3, i4, i5, i6, i7;
    and(i0, ~select_input[2], ~select_input[1], ~select_input[0], data_input[0]);
    and(i1, ~select_input[2], ~select_input[1],  select_input[0], data_input[1]);
    and(i2, ~select_input[2],  select_input[1], ~select_input[0], data_input[2]);
    and(i3, ~select_input[2],  select_input[1],  select_input[0], data_input[3]);
    and(i4,  select_input[2], ~select_input[1], ~select_input[0], data_input[4]);
    and(i5,  select_input[2], ~select_input[1],  select_input[0], data_input[5]);
    and(i6,  select_input[2],  select_input[1], ~select_input[0], data_input[6]);
    and(i7,  select_input[2],  select_input[1],  select_input[0], data_input[7]);
    or(out, i0, i1, i2, i3, i4, i5, i6, i7);

endmodule


/* Implement 5-bit Majority Function
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab3_3(
    input wire [4:0] in,
    output wire out
    );
    
    wire [7:0] input_line;
    assign input_line[7] = 1;
    assign input_line[6] = in[1] | in[0];
    assign input_line[5] = in[1] | in[0];
    assign input_line[4] = in[1] & in[0];
    assign input_line[3] = in[1] | in[0];
    assign input_line[2] = in[1] & in[0];
    assign input_line[1] = in[1] & in[0];
    assign input_line[0] = 0;
    
    
    mux M1 ({input_line[7], input_line[6], input_line[5], input_line[4], input_line[3], input_line[2], input_line[1], input_line[0]}, {in[4], in[3], in[2]}, out);

endmodule