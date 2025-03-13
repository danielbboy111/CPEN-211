module datapath_tb();

reg err;
reg clk, write, vsel, loada, loadb, asel, bsel, loadc, loads;
reg [2:0] readnum, writenum; 
reg [1:0] shift, ALUop;
reg [8:0] LEDR;
reg [9:0] SW;
reg [15:0] datapath_in;

wire Z_out;
wire [15:0] datapath_out;

//module datapath(input clk, input [2:0] readnum, input vsel, input loada, input loadb, input [1:0] shift, input asel, input bsel,
 		//input [1:0] ALUop, input loadc, input loads, input [2:0] writenum, input write, input [15:0] datapath_in, output reg Z_out, 
               // output reg [15:0] datapath_out);

datapath dut(.clk(clk), .readnum(readnum), .vsel(vsel), .loada(loada), .loadb(loadb), 
.shift(shift), .asel(asel), .bsel(bsel), .ALUop(ALUop), .loadc(loadc), .loads(loads),
.writenum(writenum), .write(write), .datapath_in(datapath_in), .Z_out(Z_out), .datapath_out(datapath_out));
                 
initial begin
clk=0; #5;
forever begin
clk=1; #5;
clk=0; #5;
end
end

initial begin
//initialize everything to zero
err = 1'b0;
clk = 1'b0;
write = 1'b0;
vsel = 1'b0;
loada = 1'b0;
loadb = 1'b0;
asel = 1'b0;
bsel = 1'b0;
loadc = 1'b0;
loads = 1'b0;
readnum = 3'b000;
writenum = 3'b000;
shift = 2'b00;
ALUop = 2'b00;
LEDR = 9'b0;
SW = 10'b0;
datapath_in = 16'b0;
#10;


// set R0 to 7 and R1 to 2
vsel = 1'b1;
write = 1'b1;

//Write to R0
datapath_in = 16'b0000000000000111; 
writenum = 3'd0;
#20;

//Write to R1
datapath_in = 16'b0000000000000010;
writenum = 3'd1;
#20;

//ADD R2,R1,R0,LSL#1
readnum = 3'd1;
loada = 1'b1;
#20;

loada = 1'b0;
readnum = 3'd0;
loadb = 1'b1;
#20;

loadb = 3'b0;
ALUop = 2'b00;
asel = 1'b0;
bsel = 1'b0;
shift = 2'b01;
loadc = 1'b1;
loads = 1'b1;
#20;

loadc = 1'b0;
vsel = 1'b0;
write = 1'b0;
writenum = 3'b010;
#20;

if(datapath_tb.dut.datapath_out == 16'b0000000000010000) begin
$display("output of the datapath is %b, expected %b", datapath_tb.dut.datapath_out, 16'b0000000000010000);
end else begin
err = 1;
$display("ERROR ** output is %b, expected %b", datapath_tb.dut.datapath_out, 16'b0000000000010000);
end


// Substract R1 from R0
readnum = 3'd0;
loada = 1'b1;
#20;

loada = 1'b0;
readnum = 3'd1;
loadb = 1'b1;
#20;

//Substraction
loadb = 3'b0;
ALUop = 2'b01;
asel = 1'b0;
bsel = 1'b0;
shift = 2'b00;
loadc = 1'b1;
#20;

//R2 will have the result of substraction
loadc = 1'b0;
vsel = 1'b0;
write = 1'b0;
writenum = 3'b010;
#20;

if(datapath_tb.dut.datapath_out == 16'b0000000000000101) begin
$display("output of the datapath is %b, expected %b", datapath_tb.dut.datapath_out, 16'b0000000000000101);
end else begin
err = 1;
$display("ERROR ** output is %b, expected %b", datapath_tb.dut.datapath_out, 16'b0000000000000101);
end

// Bitwise And
readnum = 3'd0;
loada = 1'b1;
#20;

loada = 1'b0;
readnum = 3'd1;
loadb = 1'b1;
#20;


loadb = 3'b0;
ALUop = 2'b10;
asel = 1'b0;
bsel = 1'b0;
shift = 2'b00;
loadc = 1'b1;
#20;

//R2 will have the result of AND
loadc = 1'b0;
vsel = 1'b0;
write = 1'b0;
writenum = 3'b010;
#20;

if(datapath_tb.dut.datapath_out == 16'b0000000000000010) begin
$display("output of the datapath is %b, expected %b", datapath_tb.dut.datapath_out, 16'b0000000000000010);
end else begin
err = 1;
$display("ERROR ** output is %b, expected %b", datapath_tb.dut.datapath_out, 16'b0000000000000010);
end

// ~B
readnum = 3'd0;
loada = 1'b1;
#20;

//~B is the negation of R1
loada = 1'b0;
readnum = 3'd1;
loadb = 1'b1;
#20;


loadb = 3'b0;
ALUop = 2'b11;
asel = 1'b0;
bsel = 1'b0;
shift = 2'b00;
loadc = 1'b1;
#20;

//R2 will have the result of ~B
loadc = 1'b0;
vsel = 1'b0;
write = 1'b0;
writenum = 3'b010;
#20;

if(datapath_tb.dut.datapath_out == 16'b1111111111111101) begin
$display("output of the datapath is %b, expected %b", datapath_tb.dut.datapath_out, 16'b1111111111111101);
end else begin
err = 1;
$display("ERROR ** output is %b, expected %b", datapath_tb.dut.datapath_out, 16'b1111111111111101);
end


end
endmodule
