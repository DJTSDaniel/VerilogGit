module AutomataA (
    input X,
    input clk,
    input clr,
    output led,
    output reg salida1,
    output [6:0] display
);

wire Q2, Q1, Q0, Q2n, Q1n, Qn0;
wire D2, D1, D0;  
wire [4:0] entradaDeco; // Se va ha tratar de completar los bits, ya que el creado tiene 5 bits

////////////////////////////////////////////////////////////
//////////// Instancia Decodificador Letras////////////////
decoDisplayLetras letras(
    .entrada(entradaDeco),
    .display(display)
);
////////////Fin Instancia Decodificador Letras/////////////
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
//////////// Instancia Divisor de Frecuencia////////////////
pReloj reloj(
    .clk(clk),
    .clr(clr),
    .led(led)
);
////////////Fin Instancia Divisor de Frecuencia/////////////
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
//////////////////////Instancia FFD/////////////////////////
FlipFlopD FFD2(
    .D(D2),
    .clk(led),    
    .clr(clr),
    .Q(Q2),
    .Qn(Q2n)
);

FlipFlopD FFD1(
    .D(D1),
    .clk(led),
    .clr(clr),
    .Q(Q1),
    .Qn(Q1n)
);

FlipFlopD FFD0 (
    .D(D0),
    .clk(led),
    .clr(clr),
    .Q(Q0),
    .Qn(Qn0)
);
///////////////////Fin instancia FF/////////////////////////
////////////////////////////////////////////////////////////

assign D2 = (~X & Q2n & Q1 & Q0) | (~X & Q2 & Q1n & Qn0) | (X & Q2n & Q1 & Q0) | (X & Q2 & Q1n & Q0);
assign D1 = (Q2 & Q1 & Qn0) | (X & Q2n & Q1n & Q0) | (X & Q2 & Q1n & Qn0);
assign D0 = (~X & Q2n & Q1n & Q0) | (~X & Q2n & Q1 & Qn0) | (~X & Q2 & Q1n & Qn0) | (X & Q2n & Q1n & Qn0);  


always @(posedge led or negedge clr) begin
    if (!clr) begin
        salida1 <= 0;
    end else begin
        salida1 = (~Q2 & Q1 & Q0) | (Q2 & ~Q1 & ~Q0);
    end
end

assign entradaDeco = {2'b00,Q2, Q1, Q0}; // se le asignan dos bits 00 al inicio para usar el decodificador de letras


endmodule