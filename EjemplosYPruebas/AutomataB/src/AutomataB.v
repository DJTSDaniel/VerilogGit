module AutomataB (
    input X,
    input clk,
    input clr,
    output led,
    output reg salida1,
    output [6:0] display
);

wire Q1, Q0;
wire D1, D0;  
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
FlipFlopD FFD1(
    .D(D1),
    .clk(led),
    .clr(clr),
    .q(Q1) 
);

FlipFlopD FFD0 (
    .D(D0),
    .clk(led),
    .clr(clr),
    .q(Q0)
);
///////////////////Fin instancia FF/////////////////////////
////////////////////////////////////////////////////////////

// ECUACIONES 
 assign D1 = (~Q1 & Q0) | (Q1 & ~Q0);
 assign D0 = (X & ~Q1 & ~Q0) | (~X & ~Q1 & Q0) | (X & Q1 & Q0) | (~X & Q1 & ~Q0);

always @(posedge led or negedge clr) begin
    if (!clr) begin
        salida1 <= 0;
    end else begin
        salida1 <= (Q1 & Q0);
    end
end

assign entradaDeco = {2'b000,Q1, Q0}; // se le asignan dos bits 00 al inicio para usar el decodificador de letras


endmodule