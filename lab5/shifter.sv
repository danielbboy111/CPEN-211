module shifter(in,shift,sout); 
input[15:0]in; 
input[1:0]shift; 
output [15:0]sout;

reg [15:0] sout;
reg [15:0] temp;

always_comb begin
temp = in >> 1; //right shift
end

always_comb begin;
case(shift)
	2'b00: sout = in; // no shift
	2'b01: sout = in << 1; //left shift
	2'b10: sout = in >> 1; //right shift
	2'b11: sout = {in[0], temp[14:0]};
default: sout = 16'bxxxxxxxxxxxxxxxx;
endcase
end
endmodule
