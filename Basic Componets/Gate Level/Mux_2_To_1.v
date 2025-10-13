// Module 

	module Mux2_To_1 (
    input d0, d1, sel,
    output y
);
    assign y = sel ? d1 : d0;
endmodule  

// Test Bench //

/* 

module tb_Mux2_To_1;
    reg d0, d1, sel;
    wire y;

    Mux2_To_1 dut (.d0(d0), .d1(d1), .sel(sel), .y(y));

    initial begin
        $display
        $finish;
    end
endmodule
