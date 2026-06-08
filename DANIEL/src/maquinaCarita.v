module maquinaCarita(
    input clk, // Recibe divisor de frecuencia rapido
    input reset, // El reset de toda la vida
    input [4:0]codigo, // Recibe codigo en binario del 0 - 27 (A - Z)
    output reg [7:0]bitOutF, // Salida de filas que tiene que prender
    output reg [7:0]bitOutC // Salidas de las columas que debe encender
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

case (codigo) 

     5'b00000: begin // A
          case(e_act)

        C0: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b10000000;
        end

        C1: begin
            bitOutF = 8'b01111110;
            bitOutC = 8'b01000000;
        end

        C2: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00100000;
        end

        C3: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00010000;
        end

        C4: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00001000;
        end

        C5: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00000100;
        end

        C6: begin
            bitOutF = 8'b01111110;
            bitOutC = 8'b00000010;
        end

        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end

        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;

        end
        endcase
     end // Fin caso 00000

//==================== B ====================
     5'b00001: begin // B
          case(e_act)

        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end

        C1: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b01000000;
        end

        C2: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00100000;
        end

        C3: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00010000;
        end

        C4: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00001000;
        end

        C5: begin
            bitOutF = 8'b01101100;
            bitOutC = 8'b00000100;
        end

        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end

        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end

        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;

        end
        endcase
     end // Fin caso 00001

//==================== C ====================
5'b00010: begin // C
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
            bitOutF = 8'b10000001;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10000001;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000001;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b01000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00100100;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== D ====================
5'b00011: begin // D
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b01000100;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00111000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== E ====================
5'b00100: begin // E
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== F ====================
5'b00101: begin // F
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b10000000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== G ====================
5'b00110: begin // G
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
            bitOutF = 8'b10000001;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10010001;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10010001;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b01011110;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== H ====================
5'b00111: begin // H
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== I ====================
5'b01000: begin // I
    case(e_act)
        C0: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== J ====================
5'b01001: begin // J
    case(e_act)
        C0: begin
            bitOutF = 8'b00000100;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b11111100;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== K ====================
5'b01010: begin // K
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00101000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b01000100;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== L ====================
5'b01011: begin // L
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== M ====================
5'b01100: begin // M
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b01000000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00100000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00100000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b01000000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== N ====================
5'b01101: begin // N
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b01000000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00100000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00001000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000100;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== Ñ ====================
5'b01110: begin // Ñ
    case(e_act)
        C0: begin
            bitOutF = 8'b01111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10100000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b01010000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00101000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00010100;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b01111110;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== O ====================
5'b01111: begin // O
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
            bitOutF = 8'b10000001;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10000001;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000001;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b01000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00111100;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== P ====================
5'b10000: begin // P
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b01100000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== Q ====================
5'b10001: begin // Q
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
            bitOutF = 8'b10000001;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10001001;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000101;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b01000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00111101;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== R ====================
5'b10010: begin // R
    case(e_act)
        C0: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10010000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10011000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10010100;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b01100001;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== S ====================
5'b10011: begin // S
    case(e_act)
        C0: begin
            bitOutF = 8'b01100010;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b10001100;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== T ====================
5'b10100: begin // T
    case(e_act)
        C0: begin
            bitOutF = 8'b10000000;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10000000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b11111110;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10000000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b10000000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== U ====================
5'b10101: begin // U
    case(e_act)
        C0: begin
            bitOutF = 8'b11111100;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b11111100;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== V ====================
5'b10110: begin // V
    case(e_act)
        C0: begin
            bitOutF = 8'b11110000;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00001100;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00001100;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b11110000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== W ====================
5'b10111: begin // W
    case(e_act)
        C0: begin
            bitOutF = 8'b11111100;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00001100;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00110000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00001100;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b11111100;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== X ====================
5'b11000: begin // X
    case(e_act)
        C0: begin
            bitOutF = 8'b11000110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00101000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00010000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b00101000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b11000110;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== Y ====================
5'b11001: begin // Y
    case(e_act)
        C0: begin
            bitOutF = 8'b11000000;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b00100000;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b00011110;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b00100000;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b11000000;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

//==================== Z ====================
5'b11010: begin // Z
    case(e_act)
        C0: begin
            bitOutF = 8'b10000110;
            bitOutC = 8'b10000000;
        end
        C1: begin
            bitOutF = 8'b10001010;
            bitOutC = 8'b01000000;
        end
        C2: begin
            bitOutF = 8'b10010010;
            bitOutC = 8'b00100000;
        end
        C3: begin
            bitOutF = 8'b10100010;
            bitOutC = 8'b00010000;
        end
        C4: begin
            bitOutF = 8'b11000010;
            bitOutC = 8'b00001000;
        end
        C5: begin
            bitOutF = 8'b10000010;
            bitOutC = 8'b00000100;
        end
        C6: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000010;
        end
        C7: begin
            bitOutF = 8'b00000000;
            bitOutC = 8'b00000001;
        end
        default: begin
            bitOutF = 8'b11111111;
            bitOutC = 8'b11111111;
        end
    endcase
end

endcase// Case Letras en codigo

  
end

endmodule