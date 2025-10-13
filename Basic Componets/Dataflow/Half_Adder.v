module half_adder (
    input A, B,
    output Sum, Carry
);
    wire xnor_out;
    // Carry = A & B
    and (Carry, A, B);
     // Sum = (A^B)
    xnor (Sum, A, B);

endmodule
