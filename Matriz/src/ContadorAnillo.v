module contadorAnillo (
    input clr,
    input clk,     
    output led,
    output [7:0] Q
);

// Señales internas
wire [7:0] D;
wire [7:0] Q_int;

// Lógica del contador de anillo
assign D[7] = Q_int[0];
assign D[6] = Q_int[7];
assign D[5] = Q_int[6];
assign D[4] = Q_int[5];
assign D[3] = Q_int[4];
assign D[2] = Q_int[3];
assign D[1] = Q_int[2];
assign D[0] = Q_int[1];

// Flip-Flops
FlipFlopD1 FF7(
    .D(D[7]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[7])
);

FlipFlopD FF6(
    .D(D[6]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[6])
);

FlipFlopD FF5(
    .D(D[5]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[5])
);

FlipFlopD FF4(
    .D(D[4]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[4])
);

FlipFlopD FF3(
    .D(D[3]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[3])
);

FlipFlopD FF2(
    .D(D[2]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[2])
);

FlipFlopD FF1(
    .D(D[1]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[1])
);

FlipFlopD FF0(
    .D(D[0]),
    .clk(led),
    .clr(clr),
    .Q(Q_int[0])
);

// Salida
assign Q = Q_int;

endmodule