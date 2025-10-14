// Parameterized Subtractor
module subtractor #(
    parameter WIDTH = 4
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    output [WIDTH-1:0] Diff,
    output Borrow
);
    assign {Borrow, Diff} = A - B;
endmodule

// Parameterized 4-to-1 Mux
module mux4_1 #(parameter WIDTH = 4) (
    input  [WIDTH-1:0] I0,
    input  [WIDTH-1:0] I1,
    input  [WIDTH-1:0] I2,
    input  [WIDTH-1:0] I3,
    input  [1:0] sel,
    output [WIDTH-1:0] Y
);
    assign Y = sel[1] ? (sel[0] ? I3 : I2) : (sel[0] ? I1 : I0);
endmodule

// Parity Checker
module parity_checker #(parameter WIDTH = 4) ( 
    input  [WIDTH-1:0] Ref,
    output Out
);
    assign Out = ^Ref;  
endmodule

// Top Module
module top_circuit #(parameter WIDTH = 4)(
    input  [WIDTH-1:0] A, B, P, Q,
    input  [1:0] S,
    output Out
);
    wire [WIDTH-1:0] D1, D0;
    wire B1, B0;
    wire [WIDTH-1:0] mux_out;

    // Subtractors
    subtractor #(WIDTH) sub1 (.A(A), .B(B), .Diff(D1), .Borrow(B1));
    subtractor #(WIDTH) sub2 (.A(P), .B(Q), .Diff(D0), .Borrow(B0));

    // Prepare 4 inputs for mux (each WIDTH bits)
    wire [WIDTH-1:0] I0 = { {(WIDTH-1){1'b0}}, B0 }; // pad Borrow to WIDTH bits
    wire [WIDTH-1:0] I1 = D0;
    wire [WIDTH-1:0] I2 = { {(WIDTH-1){1'b0}}, B1 }; // pad Borrow to WIDTH bits
    wire [WIDTH-1:0] I3 = D1;

    // Mux
    mux4_1 #(WIDTH) M1 (.I0(I0),.I1(I1),.I2(I2),.I3(I3),.sel(S),.Y(mux_out) );

    // Parity Checker
    parity_checker #(WIDTH) PC (.Ref(mux_out), .Out(Out));
endmodule