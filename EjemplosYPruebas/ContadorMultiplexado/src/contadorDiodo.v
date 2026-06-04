module contadorDiodo(
    input clk,
    input clr,
    output reg [3:0] diodos
);

reg [2:0] contador; 

always @(posedge clk or negedge clr) begin
    if (!clr) begin
        contador <= 3'b000;     
        diodos   <= 4'b1000;    
    end else begin 
        if (contador == 3'd3) begin 
            contador <= 3'b000;
        end else begin
            contador <= contador + 1'b1;
        end
        
       
        case (contador + 1'b1) 
            3'b000 : diodos <= 4'b1000;  // Estado 1
            3'b001 : diodos <= 4'b0100;  // Estado 2
            3'b010 : diodos <= 4'b0010;  // Estado 3
            3'b011 : diodos <= 4'b0001;  // Estado 4
            default: diodos <= 4'b1000;  // Estado 0
        endcase
    end
end

endmodule
