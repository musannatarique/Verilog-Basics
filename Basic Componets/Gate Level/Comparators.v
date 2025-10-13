// Data-Path
	
	module Comparator (
    input wire a, b,
    output wire a_gt_b, a_lt_b, a_eq_b
);
    assign a_gt_b = a & ~b;
    assign a_lt_b = ~a & b;
    assign a_eq_b = ~(a ^ b);
endmodule

// Test Bench //


module tb_Comparator;
    reg a, b;
    wire a_gt_b, a_lt_b, a_eq_b;	 
	integer i ;

    Comparator dut (.a(a), .b(b), .a_gt_b(a_gt_b), .a_lt_b(a_lt_b), .a_eq_b(a_eq_b));

    initial begin 
		
         for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end  
    end	
	 initial 
	$monitor (" Time=%0t,a=%0b,b=%0b,eq=%0b,gt=%0b,less=%0b",
	$realtime,a,b,a_gt_b, a_lt_b, a_eq_b);
endmodule

/* 

A  B	A=B	 A>B  A<B
0  0    1     0    0
0  1	 0    0	   1
1  0	 0	  1	   0
1  1	 1	  0    0   */
