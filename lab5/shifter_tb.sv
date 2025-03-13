module shifter_tb();

reg [15:0] in;
reg [1:0] shift;
reg [15:0] sout;
reg err;



shifter DUT(.in, .shift, .sout);

initial begin

//initialize everything to zero
shift = 2'b00;
in = 16'b0000000000000000;
err = 1'b0;
#10;


//No shift
in = 16'b1111000011001111;
#10;

if(shifter_tb.DUT.sout == 16'b1111000011001111) begin
$display("%b", shifter_tb.DUT.shift);
$display("%b", shifter_tb.DUT.in);
$display("%b", shifter_tb.DUT.sout);
end else begin
$display("ERROR ** state is %b, expected %b", shifter_tb.DUT.sout, 16'b1111000011001111);
err = 1'b1;
end

//Left shift
in = 16'b1111000011001111;
shift = 2'b01;
#10;

if(shifter_tb.DUT.sout == 16'b1110000110011110) begin
$display("%b", shifter_tb.DUT.shift);
$display("%b", shifter_tb.DUT.in);
$display("%b", shifter_tb.DUT.sout);
end else begin
$display("ERROR ** state is %b, expected %b", shifter_tb.DUT.sout, 16'b1110000110011110);
err = 1'b1;
end

//Right shift
in = 16'b1111000011001111;
shift = 2'b10;
#10;

if(shifter_tb.DUT.sout == 16'b0111100001100111) begin
$display("%b", shifter_tb.DUT.shift);
$display("%b", shifter_tb.DUT.in);
$display("%b", shifter_tb.DUT.sout);
end else begin
$display("ERROR ** state is %b, expected %b", shifter_tb.DUT.sout, 16'b0111100001100111);
err = 1'b1;
end

//shift = 2'b11;
in = 16'b1111000011001111;
shift = 2'b11;
#10;

if(shifter_tb.DUT.sout == 16'b1111100001100111) begin
$display("%b", shifter_tb.DUT.shift);
$display("%b", shifter_tb.DUT.in);
$display("%b", shifter_tb.DUT.sout);
end else begin
$display("ERROR ** state is %b, expected %b", shifter_tb.DUT.sout, 16'b1111100001100111);
err = 1'b1;

end

end

endmodule

