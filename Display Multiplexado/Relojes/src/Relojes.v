module Relojes(
    input clk,
    input clr,
    output ledN,
    output ledR
);

pReloj relojN(
    .clk(clk),        //Reloj de 27 MHZ
    .clr(clr),        //Reset
    .led (ledN)       //Reloj de 1 seg
);

pRelojM relojM(
    .clk(clk),        //Reloj de 27 MHZ
    .clr(clr),        //Reset
    .led (ledR)       //Reloj rapido
);

endmodule