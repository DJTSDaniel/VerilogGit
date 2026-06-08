module Top (
    input clk,
    input reset,

    output ledR,
    output ledN,
    output [7:0]bitOutF, // Salida de los leds de la fila que se debe encender
    output [7:0]bitOutC // Salida de la columna selecciona 
);

maquinaCarita carita(
    .clk(ledR),
    .reset(reset),
    .bitOutF(bitOutF),
    .bitOutC(bitOutC)
);

pRelojM relojR(
    .clk(clk),      //Reloj de 27 MHZ
    .clr(reset),   //Reset
    .led(ledR)    // Salida rapida para multiplexado
);

pReloj reloj(
    .clk(clk),      //Reloj de 27 MHZ
    .clr(reset),   //Reset
    .led(ledN)    // Salida Normal 1S
);

endmodule