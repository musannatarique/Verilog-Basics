// Module

module Full_Adder (
    input wire a, b, cin,
    output wire  sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


// Test Bench //

/* 

module tb_Full_Adder;
    reg a, b, cin;
    wire sum, cout;

    Full_Adder dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $display
		
        $finish;
    end
endmodule


*/