module Mux2to1(
    input  D0,D1,S,
    output Y
);

    // Internal
    wire sn;
    wire y0, y1;

    //Gate_LvL
    not (sn);
    and (y0, D0, sn);  // 00
    and (y1, D1, sn);   // 01
    or (Y, y0, y1); //Out

endmodule
