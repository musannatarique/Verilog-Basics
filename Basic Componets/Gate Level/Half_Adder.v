// Module

module Half_Adder (
    input  logic a, b,
    output logic sum, carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule


// Test Bench	//

 /* module tb_Half_Adder;
    reg a, b;
    wire sum, carry;

    Half_Adder dut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        $display
		
		
		
        $finish;
    end
endmodule		 */
