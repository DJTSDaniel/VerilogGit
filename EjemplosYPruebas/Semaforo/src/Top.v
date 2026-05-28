module Top (
    input clk,
    input clr,
    input S, 
    output X,
    output led, 
    output [2:0]Q,

    output [6:0] disSem1,
    output [6:0] disSem2,
    output [5:0]luzSemaforos,

    output [3:0] leds_apagados // Linea para forzar apagado de los leds sobrantes
);

pReloj reloj(
    .clk(clk),
    .clr(clr),
    .led(led)
);
ContadorTiempos tiempos(
    .clk(led), 
    .clr(S),
    .X(X)
);
AutomataSemaforo semaforos(
    .clk(led),
    .clr(clr),
    .S(S), 
    .X(X), 
    .Q(Q)
);

decodificarDisplays displays(
    .codigo(Q),
    .disSem1(disSem1),
    .disSem2(disSem2)
);

decodificadorSemaforo decoSem(
    .codigo(Q),
    .luzSemaforos(luzSemaforos)
);

assign leds_apagados = 4'b0000;

endmodule