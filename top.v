`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:18 05/10/2022 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module top_RAM_B(Mem_Addr,C,Mem_Write,Clk,LED);
	input [7:2]Mem_Addr;
	input Mem_Write,Clk;
	input [1:0]C;
	output reg [7:0]LED;
	wire [31:0]M_R_Data;
	reg [31:0]M_W_Data;
	RAMB your_instance_name (
  .clka(Clk), 
  .wea(Mem_Write), 
  .addra(Mem_Addr[7:2]), 
  .dina(M_W_Data), 
  .douta(M_R_Data) 
  );
	always@(*)
	begin
		LED=0;
		M_W_Data=0;
		if(!Mem_Write)
		begin
		case(C)
		2'b00:LED=M_R_Data[7:0];
		2'b01:LED=M_R_Data[15:8];
		2'b10:LED=M_R_Data[23:16];
		2'b11:LED=M_R_Data[31:24];
		endcase
		end
	else
	begin
	  case(C)
	   2'b00:M_W_Data=32'h0055_7523;
		2'b01:M_W_Data=32'h1234_5678;
		2'b10:M_W_Data=32'h8765_4321;
		2'b11:M_W_Data=32'hffff_ffff;
		endcase
   end
	end
endmodule
