module decodificarDisplays (
    input [2:0] codigo,
    output reg [6:0] disSem1,
    output reg [6:0] disSem2
);

/*
//Codigo resiclado del decodificador letras
                       //gfedcba 
            5'b00000: display = 7'b1110111; // A 0
            5'b00100: display = 7'b1111001; // E 4
            5'b10000: display = 7'b1010000; // r 16 
            5'b10100: display = 7'b0011100; // v 20
 */

 always @(*) begin
    case (codigo)
        3'b000: begin  //RV
            disSem1 = 7'b1010000;
            disSem2 = 7'b0011100;
        end

        3'b001: begin  //RA
            disSem1 = 7'b1010000;
            disSem2 = 7'b1110111;
        end

        3'b010: begin  //VR
            disSem1 = 7'b0011100;
            disSem2 = 7'b1010000;
        end

        3'b011: begin  //AR
            disSem1 = 7'b1110111;
            disSem2 = 7'b1010000;
        end

        3'b100: begin  //AA
            disSem1 = 7'b1110111;
            disSem2 = 7'b1110111;
        end

        default: begin  //EE
            disSem1 = 7'b1111001;
            disSem2 = 7'b1111001;
        end
    
    endcase
 end         
    
    
endmodule