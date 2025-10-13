module comparator_1bit (
    input A, B,
    output A_greater_B, A_less_B, A_equal_B
);
    wire A_not, B_not, xnor_out;

    // Not gates
    not A1 (A_not, A);
    not A2(B_not, B);

    xnor (A_equal_B, A, B); // A=B
    and (A_greater_B, A, B_not);  // A > B
    and (A_less_B, A_not, B);   // A < B
endmodule
