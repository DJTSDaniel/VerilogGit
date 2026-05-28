module timer (
    input clk_1s,          // Conectado a la señal 'led' (1 segundo) de tu pReloj
    input clr,             // Reset general de la tarjeta
    input resetTimer,     // Señal que manda el autómata para volver a 0 (al cambiar de estado)
    input [2:0] codigo,    // El estado actual del autómata [Q2, Q1, Q0]
    output reg X           // Salida hacia el autómata (1 = tiempo cumplido)
);

reg [3:0]segundos;

always @(posedge clk_1s or negedge clr ) begin
    if (!clr) begin
            segundos <= 4'b0000;
    end else if(resetTimer) begin
        segundos <= 4'b0000;
    end else begin
        segundos <= segundos + 1;
    end 
end

always @(*) begin
    case (codigo)
         3'b000: begin // Estado RV 10 segundos
            if (segundos == 10) 
                X = 1'b1;
            else                   
                X = 1'b0;
        end
            
        3'b001: begin // Estado RA 5 segundos
            if (segundos == 5)  
                X = 1'b1;
            else                   
                X = 1'b0;
        end
            
        3'b010: begin // Estado VR 8 segundos
            if (segundos == 8)  
                X = 1'b1;
            else                   
                X = 1'b0;
        end
            
        3'b011: begin // Estado AR 5 segundos
            if (segundos == 5)  
                X = 1'b1;
            else                  
                X = 1'b0;
        end
            
            default: begin // S_NOCHE o Estados Inválidos
                X = 1'b0;  // El tiempo no importa en estos estados
            end
    endcase
end

endmodule