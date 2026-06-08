module maquinaCarita(
    input clk,
    input reset,
    output reg [7:0]bitOutF,
    output reg [7:0]bitOutC
);

reg [2:0] e_act, e_sig;

localparam [3:0] 
    C0 = 3'b000, 
    C1 = 3'b001, 
    C2 = 3'b010, 
    C3 = 3'b011, 
    C4 = 3'b100, 
    C5 = 3'b101, 
    C6 = 3'b110, 
    C7 = 3'b111;

always @(posedge clk or negedge reset) begin
    if(!reset)
        e_act <= C0;
    else
        e_act <= e_sig;
end

// Automata Estados Matriz
always @(*) begin
    case(e_act)
        C0: e_sig = C1;
        C1: e_sig = C2;
        C2: e_sig = C3;
        C3: e_sig = C4;
        C4: e_sig = C5;
        C5: e_sig = C6;
        C6: e_sig = C7;
        C7: e_sig = C0;
        default: e_sig = C0;
    endcase
end

always @(*) begin
    case(e_act)

        C0: begin
            bitOutF = 8'b00111100;
            bitOutC = 8'b10000000;
        end

        C1: begin
            bitOutF = 8'b01000010;
            bitOutC = 8'b01000000;
        end

        C2: begin
            bitOutF = 8'b10101001;
            bitOutC = 8'b00100000;
        end

        C3: begin
            bitOutF = 8'b10000101;
            bitOutC = 8'b00010000;
        end

        C4: begin
            bitOutF = 8'b10000101;
            bitOutC = 8'b00001000;
        end

        C5: begin
            bitOutF = 8'b10101001;
            bitOutC = 8'b00000100;
        end

        C6: begin
            bitOutF = 8'b01000010;
            bitOutC = 8'b00000010;
        end

        C7: begin
            bitOutF = 8'b00111100;
            bitOutC = 8'b00000001;
        end

        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;

        end

    endcase
end

endmodule