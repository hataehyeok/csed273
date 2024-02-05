/* CSED273 lab6 experiments */
/* lab6_tb.v */

`timescale 1ps / 1fs

module lab6_tb();

    integer Passed;
    integer Failed;

    /* Define input, output and instantiate module */
    ////////////////////////
    reg reset_n_1;
    reg clk_1;
    wire [3:0] count_1;
    
    reg reset_n_2;
    reg clk_2;
    wire [7:0] count_2;
    
    reg reset_n_3;
    reg clk_3;
    wire [3:0] count_3;
    
    decade_counter m1(.reset_n(reset_n_1), .clk(clk_1), .count(count_1));
    decade_counter_2digits m2(.reset_n(reset_n_2), .clk(clk_2), .count(count_2));
    counter_369 m3(.reset_n(reset_n_3), .clk(clk_3), .count(count_3));
    ////////////////////////

    initial begin
        Passed = 0;
        Failed = 0;

        lab6_1_test;
        lab6_2_test;
        lab6_3_test;

        $display("Lab6 Passed = %0d, Failed = %0d", Passed, Failed);
        $finish;
    end

    /* Implement test task for lab6_1 */
    task lab6_1_test;
        ////////////////////////             
        integer i;
        reg [3:0] out_expected;        
        begin
            $display("lab6_1_test");            
            clk_1 = 1'b1;
            reset_n_1 = 1'b0;
            #1 clk_1 = 1'b0;
            
            #2 clk_1 = 1;
            out_expected = 4'b0;
            reset_n_1 = 1'b1;
            
            for (i=0; i < 10; i = i + 1) begin
                if(out_expected == 9) begin
                    out_expected = 4'b0;
                end
                else begin
                    out_expected = out_expected + 1'b1;
                end
                
                #1 clk_1 = 1'b0;
                
                #1;
                if (count_1 == out_expected) begin
                    Passed = Passed + 1;
                end
                else begin
                    $display("Lab6_1 Error");
                    Failed = Failed + 1;
                end
                
                #1 clk_1 = 1'b1;
            end
        end
        ////////////////////////
    endtask

    /* Implement test task for lab6_2 */
    task lab6_2_test;
        ////////////////////////
        integer i;
        integer j;
        reg [7:0] out_expected;
        begin
            $display("lab6_2_test");
            clk_1 = 1'b1;
            reset_n_1 = 1'b1;            
            for(j=0; j < 9; j = j + 1)begin
                #1 clk_2 = 1'b0;
                #1 clk_2 = 1'b1;
            end
            reset_n_2 = 1'b0;
            #1 clk_2 = 1'b0;
            
            #1 clk_2 = 1'b1;
            
            #2 clk_2 = 1;
            out_expected = 8'b0;
            reset_n_2 = 1'b1;
            
            for (i=0; i < 100; i = i + 1) begin
                if(out_expected == 8'b10011001) begin
                    out_expected = 8'b0;
                end
                else if ((out_expected[0]==1)&&(out_expected[3]==1)) begin
                    out_expected = out_expected + 4'b0111;
                end
                else begin
                    out_expected = out_expected + 1'b1;
                end
                
                #1 clk_2 = 1'b0;
                
                #1;
                if (count_2 == out_expected) begin
                    Passed = Passed + 1;
                end
                else begin
                    $display("Lab6_2 Error");
                    Failed = Failed + 1;
                end
                
                #1 clk_2 = 1'b1;
            end
        end
        ////////////////////////
    endtask

    /* Implement test task for lab6_3 */
    task lab6_3_test;
        ////////////////////////
        integer i;
        reg [3:0] out_expected;        
        begin
            $display("lab6_3_test");
            clk_3 = 1'b1;
            reset_n_3 = 1'b0;
            #1 clk_3 = 1'b0;
            
            #2 clk_3 = 1;
            out_expected = 4'b0;
            reset_n_3 = 1'b1;

            for (i=0; i < 10; i = i + 1) begin
                if(out_expected == 9) begin
                    out_expected = out_expected + 4'b0100;
                end
                else if(out_expected == 13) begin
                    out_expected = 4'b0110;
                end
                else begin
                    out_expected = out_expected + 4'b0011;
                end
                
                #1 clk_3 = 1'b0;
                
                #1;
                if (count_3 == out_expected) begin
                    Passed = Passed + 1;
                end
                else begin
                    $display("Lab6_3 Error");
                    Failed = Failed + 1;
                end
                
                #1 clk_3 = 1'b1;
            end
        end
        ////////////////////////
    endtask

endmodule