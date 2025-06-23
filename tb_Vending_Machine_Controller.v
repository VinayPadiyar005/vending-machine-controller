`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 12:08:28 AM
// Design Name: 
// Module Name: tb_Vending_Machine_Controller
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


module tb_Vending_Machine_Controller( );
reg clk,reset,coin_1,coin_2;
wire product ;
wire [1:0] change;


Vending_Machine_Controller uut (.clk(clk),.reset(reset),.coin_1(coin_1),.coin_2(coin_2),.product(product),.change(change));
initial begin 
clk = 0;
forever #5 clk = ~clk;
end
initial begin
    reset = 1;
    coin_1 = 0;
    coin_2 = 0;
    #10 reset = 0;
end
initial begin
#5 $monitor("Time = %t , clk = %b,dispense = %b,change = %b",$time , clk,product,change);
  // Input 1 + 2 + 2 = 5 , product = 1, chnage = 0;
  #10 coin_1 = 1;
  #10 coin_1 = 0;
  #10 coin_2 = 1;
  #10 coin_2 = 0;
  #10 coin_2 = 1;
  #10 coin_2 = 0;
  
  
  // Insert ₹2 + ₹2 + ₹2 = ₹6 -> Expect product = 1, change = 1
        #20 coin_2 = 1;    // ₹2
        #10 coin_2 = 0;
        #10 coin_2 = 1;    // ₹2
        #10 coin_2 = 0;
        #10 coin_2 = 1;    // ₹2
        #10 coin_2 = 0;
  #20 $finish;
end

endmodule
