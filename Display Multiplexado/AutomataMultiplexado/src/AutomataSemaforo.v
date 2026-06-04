module AutomataSemaforo (
    input clk,
    input clr,
    input S, // switch externo (paro de emergencia)
    input X, // Tiempo dado por el contador de tiempo 
    output [2:0]Q // Salida de estados en 3 bits
);
wire D2, D1, D0;
wire Q2, Q1, Q0;

assign Q = {Q2, Q1, Q0};

FlipFlopD FF2 (
    .clk(clk),
    .clr(clr),
    .D(D2),
    .q(Q2)
);

FlipFlopD FF1 (
    .clk(clk),
    .clr(clr),
    .D(D1),
    .q(Q1)
);

FlipFlopD FF0 (
    .clk(clk),
    .clr(clr),
    .D(D0),
    .q(Q0)
);

// Ecuaciones
assign D2 = S;
assign D1 = (~S & ~X & ~Q2 & Q1)|(~S & ~Q2 & Q1 & ~Q0)|(~S & X & ~Q2 & ~Q1 & Q0);
assign D0 = (~S & Q2) | (~S & ~X & Q0) | (~S & X & ~Q0);
// Fin Ecuaciones   

endmodule