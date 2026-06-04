module DosLetras(
    input clk,
    input reset,

    input [2:0]codigo,

    output reg [4:0] q,
    output reg [3:0] d
);

reg [4:0] letraIzq;
reg [4:0] letraDer;

reg [1:0] e_act, e_sig;

localparam [1:0]
    D1 = 2'b00,
    D2 = 2'b01,
    D3 = 2'b10,
    D4 = 2'b11;

always @(posedge clk or negedge reset) begin
    if(!reset)
        e_act <= D1;
    else
        e_act <= e_sig;
end

// Selector de letra izquierda y letra derecha
always @(*) begin
   case (codigo)
        3'b000 : begin // RV
            letraIzq = 5'b10000; //r
            letraDer = 5'b10100; // v 
        end

        3'b001 : begin // RA
            letraIzq = 5'b10000; // R
            letraDer = 5'b00000; // A 
        end

        3'b010 : begin // VR
            letraIzq = 5'b10100; // V
            letraDer = 5'b10000; // R 
        end

        3'b011 : begin // AR
            letraIzq = 5'b00000; // A
            letraDer = 5'b10000; // R 
        end
        
        3'b100 : begin // AA
            letraIzq = 5'b00000; // A
            letraDer = 5'b00000; // A 
        end

        default: begin
            letraIzq = 5'b11111;
            letraDer = 5'b11111;
        end
        endcase
end


// Automata Estados Dispalay
always @(*) begin
    case(e_act)
        D1: e_sig = D2;
        D2: e_sig = D3;
        D3: e_sig = D4;
        D4: e_sig = D1;
        default: e_sig = D1;
    endcase
end

always @(*) begin
    case(e_act)

        D1: begin
            q = letraIzq;
            d = 4'b1000;
        end

        D2: begin
            q = 5'b11111;
            d = 4'b0000;
        end

        D3: begin
            q = 5'b11111;
            d = 4'b0000;
        end

        D4: begin
            q = letraDer;
            d = 4'b0001;
        end

        default: begin
            q = 5'b11111;
            d = 4'b0000;
        end

    endcase
end
// fin automata Estados display

endmodule