module Top(
    input clk,     //Reloj de 27 MHZ
    input clr,     //Reset
    output led,    //salida al LED (Es la variable salida en el codigo del profe)

    output [6:0] display, // Vector que muestra el numero en decimal en el display
    output [3:0] diodos
);

wire [3:0] bitOut; // Vector que muestra la entrada recibida en binario

pReloj reloj(
    .clk(clk),
    .clr(clr),
    .led(led)
); 

decodificadorDisplay Ddisplay(
    .bitIn(bitOut),
    .display(display)
);

Contador(
    .clk(led),        //Reloj de 27 MHZ
    .clr(clr),        //Reset

    .bitOut(bitOut) // Vector que muestra la entrada recibida en binario
);

contadorDiodo(
     .clk(led),        //Reloj de 27 MHZ
     .clr(clr),        //Reset
     .diodos(diodos)
);

endmodule