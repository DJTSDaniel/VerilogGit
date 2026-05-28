module contadorAnillo (
    input clr,
    input clk,
    input dir, // Control de dirección
    output led,
    output reg [3:0] Q
);

wire Q3,Q2,Q1,Q0;

wire D3,D2,D1,D0;

pReloj reloj(
    .clk(clk),
    .clr(clr),
    .led(led)
);

// Selección de dirección (Condicion ternaria, igual que en java y c)
assign D3 = (dir) ? Q2 : ~Q0;
assign D2 = (dir) ? Q1 : Q3;
assign D1 = (dir) ? Q0 : Q2;
assign D0 = (dir) ? ~Q3 : Q1;

//
// Flip-Flops
//

FlipFlopD FFD3(
    .D(D3),
    .clk(led),
    .clr(clr),
    .Q(Q3)
);

FlipFlopD FFD2(
    .D(D2),
    .clk(led),
    .clr(clr),
    .Q(Q2)
);

FlipFlopD FFD1(
    .D(D1),
    .clk(led),
    .clr(clr),
    .Q(Q1)
);

FlipFlopD FFD0(
    .D(D0),
    .clk(led),
    .clr(clr),
    .Q(Q0)
);

//
// Salida
//

always @(posedge led or negedge clr) begin
    if(!clr)
        Q <= 4'b0000;
    else
        Q <= {Q3,Q2,Q1,Q0};
end

endmodule