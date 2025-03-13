module ALU(Ain,Bin,ALUop,out,Z);
input [15:0] Ain, Bin;
input [1:0] ALUop;
output [15:0] out;
output Z;

reg [15:0] out;
reg Z;
reg carry; //needed so that ex) 16'b1111111111111111 + 16'0000000000000001 resullts in 17'b10000000000000000

always_comb begin
case(ALUop)
	2'b00: {carry, out} = Ain + Bin; // addition operation
	2'b01: {carry, out} = Ain - Bin; // substraction operation
	2'b10: out = Ain & Bin; // and operation
	2'b11: out = ~Bin; // not operation
        default: out = 16'b0000000000000000; //default
endcase

//Z is set to 1 if output is 16'b0
if (out == 16'b0)
Z = 1'b1;
else 
Z = 1'b0;
end
  
endmodule
