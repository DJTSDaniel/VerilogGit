module Top(
    input clk,
    input reset,
    input S,
    
    output [6:0]display,
    output [3:0] diodos,
    
    output ledR,
    output ledN
);
wire [2:0] codigo;
wire [4:0] q;
wire X;

wire s;

assign s = ~S;

ContadorTiempos tiempos(
    .clk(ledN), 
    .clr(s),
    .X(X)
);
AutomataSemaforo semaforos(
    .clk(ledN),
    .clr(reset),
    .S(s), 
    .X(X), 
    .Q(codigo)
);

////////////////////////////////////////////////////////////
//////////////////// Codigo depurado ///////////////////////

// Relojes
pReloj relojN(
    .clk(clk),        //Reloj de 27 MHZ
    .clr(reset),      //Reset
    .led (ledN)       //Reloj 1s
);

pRelojM relojM(
    .clk(clk),        //Reloj de 27 MHZ
    .clr(reset),      //Reset
    .led (ledR)       //Reloj Rapido Display Multiplexado
);
// Fin relojes


decoDisplayLetras decoL(
    .entrada(q), //Recibe 5 bits para representar las letras (0 - 23)
    .display (display) // Salida al display (Retorna 7 bits)
);

DosLetras dosletras(
    .clk(ledR), //Recibe el reloj rapido
    .reset(reset), // Recibe el reset de toda la vida

    .codigo(codigo), // Recibe el codigo de estado generado por el automata(son 3 bits)

    .q(q), //Retorna codificacion del dispaly
    .d(diodos) //Retorna el codigo para encender displays (transistores). 
);

////////////////////////////////////////////////////////////
////////////////// Fin Codigo depurado /////////////////////

endmodule