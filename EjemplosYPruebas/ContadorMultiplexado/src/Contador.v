module Contador(
    input clk,        //Reloj de 27 MHZ
    input clr,        //Reset

    output [3:0] bitOut // Vector que muestra la entrada recibida en binario
);
    
reg [3:0] contador;



always @(posedge clk or negedge clr) begin
    if (!clr) begin
        contador <= 0;
    end else begin 
        if (contador == 9) begin // debido a que un display solo cuenta hasta el nueve, se trunca para resetearlo a cero
            contador <= 0;
        end else begin
            contador <= contador + 1; // Contador sigue aumentando hasta el 9
        end
    end
end

assign bitOut = contador;

endmodule