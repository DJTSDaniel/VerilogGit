module cambiadorEstados(
    input clk,
    input reset,
    output reg [2:0]codigo
);
reg [2:0]contador; 

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        contador <= 3'b000;
        codigo   <= 3'b000;
    end
    else if (contador == 3'd5) begin
        contador <= 3'b000;
        codigo   <= 3'b000;
    end
    else begin
        contador <= contador + 1'b1;
        codigo   <= contador;
    end
end

endmodule