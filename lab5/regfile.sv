module regfile(data_in,writenum,write,readnum,clk,data_out);
input[15:0] data_in;
input [2:0] writenum, readnum;
input write, clk;
output [15:0] data_out;

//registers R0 to R7
reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7;

reg [7:0] out;
reg [7:0] rout;
reg [15:0] data_out;

//This always_ff block implements the logic that at the rising edge of the clk, if write is 1, writenum selects which register to write.
//Note that 3:8 decoder is implemented internally by case statement
always_ff @(posedge clk) begin

if(write) begin

case(writenum)

3'b000: R0 <= data_in;
3'b001: R1 <= data_in;
3'b010: R2 <= data_in;
3'b011: R3 <= data_in;
3'b100: R4 <= data_in;
3'b101: R5 <= data_in;
3'b110: R6 <= data_in;
3'b111: R7 <= data_in;

endcase
end

end

//This always_comb block assigns data_out to have the value of the register that is selected by readnum
//Note that the 3:8 decoder is implemented internally
//This is not coordinated with the clock
always_comb begin
 case(readnum)
   3'b000: data_out = R0;
   3'b001: data_out = R1;
   3'b010: data_out = R2;
   3'b011: data_out = R3;
   3'b100: data_out = R4;
   3'b101: data_out = R5;
   3'b110: data_out = R6;
   3'b111: data_out = R7;

   default: data_out = 16'bxxxxxxxxxxxxxxxx;
 endcase
end

endmodule
