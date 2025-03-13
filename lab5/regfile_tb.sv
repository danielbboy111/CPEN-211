module regfile_tb();

reg err;
reg [15:0] data_in;
reg [2:0] writenum, readnum;
reg write, clk;
reg [15:0] data_out;

regfile DUT(.data_in(data_in), .writenum(writenum), .write(write), .readnum(readnum), .clk(clk), .data_out(data_out));


initial begin
clk=0; #5;
forever begin
clk=1; #5;
clk=0; #5;
end
end



initial begin

//set every input to zero
err = 1'b0;
readnum = 3'b000;
write = 1'b0;
writenum = 3'b000;
readnum = 3'b000;
data_in = 16'b0000000000000000;

#10;

// We read and write 16'b00000000000000001 to register 1
write = 1'b1;
writenum = 3'b001;
data_in = 16'b0000000000000001;
readnum = 3'b001;

#10;

if(regfile_tb.DUT.data_out == 16'b0000000000000001) begin
$display("%b", regfile_tb.DUT.R1);
$display("%b", regfile_tb.DUT.data_out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", regfile_tb.DUT.data_out, 16'b0000000000000001);
end


//We read and write 16'b0000000000101010 in R3
data_in = 16'b0000000000101010;
writenum = 3'b011;

#7; //combinational delay
readnum = 3'b011;

#10;

if(regfile_tb.DUT.data_out == 16'b0000000000101010) begin
$display("%b", regfile_tb.DUT.R3);
$display("%b", regfile_tb.DUT.data_out);
end else begin
err = 1'b1;
$display("ERROR ** output is %b, expected %b", regfile_tb.DUT.data_out, 16'b0000000000101010);
end

end

endmodule

