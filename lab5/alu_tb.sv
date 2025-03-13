module ALU_tb();

reg err;
reg [15:0] Ain;
reg [15:0] Bin;
reg [1:0] ALUop;
reg Z;
reg [15:0] out;

ALU DUT(.Ain, .Bin, .ALUop, .out, .Z);

initial begin

err = 1'b0;
ALUop = 2'b00;
Ain = 16'b0;
Bin = 16'b0;
#10;

//Addition operation
$display("Addition operation");
Ain = 16'b0000010000000000;
Bin = 16'b1111011111011000;
#10;


if(ALU_tb.DUT.out == 16'b1111101111011000) begin
$display("%b", ALU_tb.DUT.out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", ALU_tb.DUT.out, 16'b1111101111011000);
end

//Addition operation with carry
$display("Addition operation with carry");
Ain = 16'b1111111111111111;
Bin = 16'b0000000000100000;
#10;

if(ALU_tb.DUT.out == 16'b0000000000011111) begin
$display("%b", ALU_tb.DUT.out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", ALU_tb.DUT.out, 16'b0000000000011111);
end

//Substraction operation
$display("Substraction operation");
ALUop = 2'b01;
Ain = 16'b1000000000000000;
Bin = 16'b0110011011100000;
#10;

if(ALU_tb.DUT.out == 16'b0001100100100000) begin
$display("%b", ALU_tb.DUT.out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", ALU_tb.DUT.out, 16'b0001100100100000);
end

//And operation
$display("And operation");
ALUop = 2'b10;
Ain = 16'b1000000000000000;
Bin = 16'b0110011011100000;
#10;

if(ALU_tb.DUT.out == 16'b0000000000000000) begin
$display("%b", ALU_tb.DUT.out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", ALU_tb.DUT.out, 16'b0000000000000000);
end

//Another And operation 
$display("Another And operation");
Ain = 16'b1111111111111111;
Bin = 16'b0110011011100000;
#10;

if(ALU_tb.DUT.out == 16'b0110011011100000) begin
$display("%b", ALU_tb.DUT.out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", ALU_tb.DUT.out, 16'b0110011011100000);
end

//~Bin
$display("~Bin");
ALUop = 2'b11;
#10;

if(ALU_tb.DUT.out == 16'b1001100100011111) begin
$display("%b", ALU_tb.DUT.out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", ALU_tb.DUT.out, 16'b1001100100011111);
end

end

endmodule
