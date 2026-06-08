module Contador(
    input clk,
    input clr,
    output reg [5:0] codigo  
);
reg [2:0]conteo;

always @(posedge clk or negedge clr) begin
    if (!clr) begin
            conteo <= 0;
    end else begin 
    if (conteo == 5) begin
            conteo <= 0;
    end else begin
            conteo <= conteo + 1;
    end
    end
    end

always @(*) begin
    case (conteo)
        3'b000 : codigo = 5'b00011; // D
        3'b001 : codigo = 5'b00000; // A
        3'b010 : codigo = 5'b01101; // N
        3'b011 : codigo = 5'b01000; // I
        3'b100 : codigo = 5'b00100; // E
        3'b101 : codigo = 5'b01011; // L


    endcase
end // Fin always

endmodule