module ContadorTiempos(
    input clk, 
    input clr,
    
    output led,
    output reg X,
    output [5:0]num
);

reg [5:0]contador;

pReloj reloj(
    .clk(clk),
    .clr(clr),
    .led(led)
);

always @(posedge led or negedge clr) begin
    if (!clr) begin
        contador <= 6'd1;
        X <= 1'b0;
    end else begin 
        if (contador == 6'd5  || contador == 6'd13 || contador == 6'd18 || contador == 6'd28) begin 
            X <= 1'b1;
        end else begin
           X <= 1'b0; 
    end
    
     // Contador de 1 a 28
        if (contador == 6'd28)
            contador <= 6'd1;
        else
            contador <= contador + 1'b1;
       end
end

assign num = contador;

endmodule