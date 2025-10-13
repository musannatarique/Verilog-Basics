module full_adder (
    input  A, B, Cin,
    output S, Cout
);
    wire X, C1, C2;

    xor (X, A, B);        // X = A ^ B
    xor (S, X, Cin);      // S = X ^ Cin
    and (C1, A, B);       // C1 = A & B
    and (C2, X, Cin);     // C2 = (A ^ B) & Cin
    or  (Cout, C1, C2);   // Cout = C1 | C2
endmodule
