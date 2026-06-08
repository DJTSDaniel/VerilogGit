module Contador(
    input clk,
    input clr,
    output reg [4:0] codigo  
);
    always @(posedge clk or negedge clr) begin
        if (!clr) begin
            codigo <= 0;
        end else begin 
            if (codigo == 26) begin
                codigo <= 0;
            end else begin
                codigo <= codigo + 1;
            end
        end
    end
endmodule