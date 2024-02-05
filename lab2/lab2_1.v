/* CSED273 lab2 experiment 1 */
/* lab2_1.v */

/* Unsimplifed equation
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_1(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT cal_gt(outGT, inA, inB);
    CAL_EQ cal_eq(outEQ, inA, inB);
    CAL_LT cal_lt(outLT, inA, inB);
    
endmodule

/* Implement output about "A>B" */
module CAL_GT(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );
    wire GT1, GT2, GT3, GT4, GT5, GT6;

    assign GT1 = ~inA[1] & inA[0] & ~inB[1] & ~inB[0];
    assign GT2 = inA[1] & inA[0] & ~inB[1] & ~inB[0];
    assign GT3 = inA[1] & ~inA[0] & ~inB[1] & ~inB[0];
    assign GT4 = inA[1] & inA[0] & ~inB[1] & inB[0];
    assign GT5 = inA[1] & ~inA[0] & ~inB[1] & inB[0];
    assign GT6 = inA[1] & inA[0] & inB[1] & ~inB[0];
    
    assign outGT = GT1 | GT2 | GT3 | GT4 | GT5 | GT6;
endmodule

/* Implement output about "A=B" */
module CAL_EQ(
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
module CAL_LT(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
wire LT1, LT2, LT3, LT4, LT5, LT6;

    assign LT1 = inA[1] & ~inA[0] & inB[1] & inB[0];
    assign LT2 = ~inA[1] & ~inA[0] & inB[1] & inB[0];
    assign LT3 = ~inA[1] & inA[0] & inB[1] & inB[0];
    assign LT4 = ~inA[1] & ~inA[0] & inB[1] & ~inB[0];
    assign LT5 = ~inA[1] & inA[0] & inB[1] & ~inB[0];
    assign LT6 = ~inA[1] & ~inA[0] & ~inB[1] & inB[0];
    
    assign outLT = LT1 | LT2 | LT3 | LT4 | LT5 | LT6;
endmodule