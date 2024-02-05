/* CSED273 lab2 experiment 2 */
/* lab2_2.v */

/* Simplifed equation by K-Map method
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_2(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT_2 cal_gt2(outGT, inA, inB);
    CAL_EQ_2 cal_eq2(outEQ, inA, inB);
    CAL_LT_2 cal_lt2(outLT, inA, inB);

endmodule

/* Implement output about "A>B" */
module CAL_GT_2(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );
    wire GT1, GT2, GT3;
    
    assign GT1 = inA[1] & ~inB[1];
    assign GT2 = inA[0] & ~inB[1] & ~inB[0];
    assign GT3 = inA[1] & inA[0] & ~inB[0];
    
    assign outGT = GT1 | GT2 | GT3;
endmodule

/* Implement output about "A=B" */
module CAL_EQ_2(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
    wire EQ1, EQ2, EQ3, EQ4;

    assign EQ1 = ~inA[1] & ~inA[0] & ~inB[1] & ~inB[0];
    assign EQ2 = ~inA[1] & inA[0] & ~inB[1] & inB[0];
    assign EQ3 = inA[1] & inA[0] & inB[1] & inB[0];
    assign EQ4 = inA[1] & ~inA[0] & inB[1] & ~inB[0];
    
    assign outEQ = EQ1 | EQ2 | EQ3 | EQ4;
endmodule

/* Implement output about "A<B" */
module CAL_LT_2(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
    wire LT1, LT2, LT3;
    
    assign LT1 = ~inA[1] & inB[1];
    assign LT2 = ~inA[0] & inB[1] & inB[0];
    assign LT3 = ~inA[1] & ~inA[0] & inB[0];
    
    assign outLT = LT1 | LT2 | LT3;
endmodule