`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2025 09:47:20 PM
// Design Name: 
// Module Name: Vending_Machine_Controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Vending_Machine_Controller (
    input clk,
    input reset,
    input coin_1,             // ₹1 coin input
    input coin_2,             // ₹2 coin input
    output reg product,    // product dispensed
    output reg [1:0] change // change returned (0–2)
);

reg [2:0] state;  // represents ₹0 to ₹6 (max 3 bits)

// State encoding: value = amount inserted
parameter S0 = 3'd0,
          S1 = 3'd1,
          S2 = 3'd2,
          S3 = 3'd3,
          S4 = 3'd4,
          S5 = 3'd5,
          S6 = 3'd6;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        product <= 0;
        change <= 0;
    end else begin
        product <= 0;
        change <= 0;

        case (state)
            S0: begin
                if (coin_1) state <= S1;
                else if (coin_2) state <= S2;
            end
            S1: begin
                if (coin_1) state <= S2;
                else if (coin_2) state <= S3;
            end
            S2: begin
                if (coin_1) state <= S3;
                else if (coin_2) state <= S4;
            end
            S3: begin
                if (coin_1) state <= S4;
                else if (coin_2) state <= S5;
            end
            S4: begin
                if (coin_1) begin
                    product <= 1;
                    change <= 0;
                    state <= S0;
                end else if (coin_2) begin
                    product <= 1;
                    change <= 1;
                    state <= S0;
                end
            end
            S5: begin
                product <= 1;
                change <= 0;
                state <= S0;
            end
            S6: begin
                product <= 1;
                change <= 1;
                state <= S0;
            end
            default: state <= S0;
        endcase
    end
end

endmodule