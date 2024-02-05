/* CSED273 lab4 experiment 1 */
/* lab4_1.v */


/* Implement Half Adder
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module halfAdder(
    input in_a,
    input in_b,
    output out_s,
    output out_c
    );

    xor(out_s, in_a, in_b);
    and(out_c, in_a, in_b);

endmodule

/* Implement Full Adder
 * You must use halfAdder module
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module fullAdder(
    input in_a,
    input in_b,
    input in_c,
    output out_s,
    output out_c
    );
    wire fir_s, fir_c, sec_c;

    halfAdder h1(in_a, in_b, fir_s, fir_c);
    halfAdder h2(fir_s, in_c, out_s, sec_c);
    or(out_c, sec_c, fir_c);
    
endmodule