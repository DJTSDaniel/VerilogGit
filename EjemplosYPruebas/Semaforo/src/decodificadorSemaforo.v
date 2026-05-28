module decodificadorSemaforo (
    input [2:0]codigo,
    output reg [5:0]luzSemaforos
);

always @(*) begin
    case (codigo)
        3'b000: luzSemaforos = 6'b100001; //RV
        3'b001: luzSemaforos = 6'b100010; //RA
        3'b010: luzSemaforos = 6'b001100; //VR
        3'b011: luzSemaforos = 6'b010100; //AR
        3'b100: luzSemaforos = 6'b010010; //AA

        default: luzSemaforos = 6'b111111; //Error: Todos los focos se prenden

    endcase
end

endmodule