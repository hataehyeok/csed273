/* CSED273 lab4 experiment 4 */
/* lab4_4.v */

/* Implement 5x3 Binary Mutliplier
 * You must use lab4_2 module in lab4_2.v
 * You cannot use fullAdder or halfAdder module directly
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_4(
    input [4:0]in_a,
    input [2:0]in_b,
    output [7:0]out_m
    );
    wire [4:0]n1;
    
    assign out_m[0] = in_a[0]&in_b[0];
    
    lab4_2 r1({in_a[4]&in_b[1], in_a[3]&in_b[1], in_a[2]&in_b[1], in_a[1]&in_b[1], in_a[0]&in_b[1]},
    {0, in_a[4]&in_b[0], in_a[3]&in_b[0], in_a[2]&in_b[0], in_a[1]&in_b[0]}, 0,
    {n1[3], n1[2], n1[1], n1[0], out_m[1]}, n1[4]);
    
    lab4_2 r2({in_a[4]&in_b[2], in_a[3]&in_b[2], in_a[2]&in_b[2], in_a[1]&in_b[2], in_a[0]&in_b[2]},
    {n1[4], n1[3], n1[2], n1[1], n1[0]}, 0,
    {out_m[6], out_m[5], out_m[4], out_m[3], out_m[2]}, out_m[7]);
    
endmodule




