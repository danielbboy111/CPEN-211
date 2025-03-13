module tb_lab3();

reg clk, reset, err;
reg [9:0] in;
wire [6:0] sim_HEX0;
wire [6:0] sim_HEX1;
wire [6:0] sim_HEX2;
wire [6:0] sim_HEX3;
wire [6:0] sim_HEX4;
wire [6:0] sim_HEX5;
reg [9:0] LEDR;


//module lab3_top(SW,KEY,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,LEDR);
lab3_top dut(in, {reset,1'b0,1'b0,clk}, sim_HEX0, sim_HEX1, sim_HEX2, sim_HEX3, sim_HEX4, sim_HEX5, LEDR);

initial begin
clk = 1'b0;
err = 1'b0;
in = 1'b0;
clk = 1'b1;
clk = 1'b0;
reset = 0;
#5;
//Checking for the state 0 after reset
$display("checking for the state 0 after reset");

reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

err = 0;

if(tb_lab3.dut.state !== 4'd0) begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd0);
err = 1;
end

if(tb_lab3.dut.state == 4'd0) begin
$display("State is %d, expected %d", tb_lab3.dut.state, 4'd0);
end

//Checking for opening the lock
//Checking the transition from State 0 to State 1
$display("checking for opening the lock");
$display("checking State 0 -> State 1");

in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking the transition from State 1 to State 2
$display("checking State 1 -> State 2");
in = 10'd6;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd2) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd2);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
err = 1;
end

//Checking the transition from State 2 to State 3
$display("checking State 2 -> State 3");
in = 10'd4;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd3) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd3); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd3);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
err = 1;
end

//Checking the transition from State 3 to State 4
$display("checking State 3 -> State 4");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd4) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd4); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd4);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking the transition from State 4 to State 5
$display("checking State 4 -> State 5");
in = 10'd7;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd5) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd5);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd5);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111000);
err = 1;
end

//Checking the transition from State 5 to State 6
$display("checking State 5 -> State 6");
in = 10'd3;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd6) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd6);
$display("output is %d, expected %d", in, 10'd3); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1000000, 7'b0001100, 7'b0000110, 7'b0101011);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd6);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1000000, 7'b0001100, 7'b0000110, 7'b0101011);
err = 1;
end

//Checking state 6 to 6
$display("checking State 6 -> State 6");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd6) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd6);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1000000, 7'b0001100, 7'b0000110, 7'b0101011);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd6);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1000000, 7'b0001100, 7'b0000110, 7'b0101011);
err = 1;
end

//Check if reset from OPEn goes to state 0
$display("checking State 6 -> State 0");
reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

if(tb_lab3.dut.state !== 4'd0) begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd0);
err = 1;
end

if(tb_lab3.dut.state == 4'd0) begin
$display("State is %d, expected %d", tb_lab3.dut.state, 4'd0);
end

//Checking CLOSED
//Checking state 0 to state 7
$display("checking for CLOSED");
$display("checking State 0 -> State 7");
in = 10'd3;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd7) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd7);
$display("output is %d, expected %d", in, 10'd3); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0110000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd7);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0110000);
err = 1;
end

//Checking state 7 to 8
$display("checking State 7 -> State 8");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd8) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd8);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end
  
//Checking state 8 to 9
$display("checking State 8 -> State 9");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd9) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd9);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 9 to 10
$display("checking State 9 -> State 10");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd10) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd10);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 10 to 11
$display("checking State 10 -> State 11");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd11) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd11);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 11 to 12
$display("checking State 11 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

//Checking state 12 to 12
$display("checking State 12 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

//Checking state 12 to 0 after reset
$display("checking State 12 -> State 0");
reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

if(tb_lab3.dut.state !== 4'd0) begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd0);
err = 1;
end

if(tb_lab3.dut.state == 4'd0) begin
$display("State is %d, expected %d", tb_lab3.dut.state, 4'd0);
end

//Checking state 0 -> state 1 -> state 2 -> state 3 -> state 0
$display("checking State 0 -> State 1 -> State 2 -> State 3 -> State 0");
$display("checking State 0 -> State 1");
in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1); 
$display("output in DE1-SOC is %b, expected %b", tb_lab3.dut.HEX0, 7'b1000000);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking the transition from State 1 to State 2
$display("checking State 1 -> State 2");
in = 10'd6;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd2) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd2); 
$display("output in DE1-SOC is %b, expected %b", tb_lab3.dut.HEX0, 7'b0000010);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd2);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
err = 1;
end

//Checking the transition from State 2 to State 3
$display("checking State 2 -> State 3");
in = 10'd4;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd3) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd3); 
$display("output in DE1-SOC is %b, expected %b", tb_lab3.dut.HEX0, 7'b0011001);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd3);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
err = 1;
end

//Checking state 3 to 0 after reset
$display("checking State 3 -> State 0");
reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

if(tb_lab3.dut.state !== 4'd0) begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd0);
err = 1;
end

if(tb_lab3.dut.state == 4'd0) begin
$display("State is %d, expected %d", tb_lab3.dut.state, 4'd0);
end

//Checking CLOSED
//Checking state 0 to state 1
$display("checking for CLOSED from wrong input at state 1");
$display("checking State 0 -> State 1");
in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1);
$display("output is %d, expected %d", in, 10'd0); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking state 1 to 8
$display("checking State 1 -> State 8");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd8) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd8);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end
  
//Checking state 8 to 9
$display("checking State 8 -> State 9");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd9) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd9);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 9 to 10
$display("checking State 9 -> State 10");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd10) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd10);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 10 to 11
$display("checking State 10 -> State 11");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd11) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd11);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 11 to 12
$display("checking State 11 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

//Checking CLOSED
//Checking state 0 to state 1
$display("checking for CLOSED from wrong input at state 2");
$display("checking State 0 -> State 1");
in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1);
$display("output is %d, expected %d", in, 10'd0); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking state 1 to 2
$display("checking State 1 -> State 2");
in = 10'd6;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd2) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd2);
$display("output is %d, expected %d", in, 10'd6); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd2);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
err = 1;
end
  
//Checking state 2 to 9
$display("checking State 2 -> State 9");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd9) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd9);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 9 to 10
$display("checking State 9 -> State 10");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd10) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd10);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 10 to 11
$display("checking State 10 -> State 11");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd11) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd11);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 11 to 12
$display("checking State 11 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

//Checking CLOSED
//Checking state 0 to state 1
$display("checking for CLOSED from wrong input at state 3");
$display("checking State 0 -> State 1");
in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1);
$display("output is %d, expected %d", in, 10'd0); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking state 1 to 2
$display("checking State 1 -> State 2");
in = 10'd6;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd2) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd2);
$display("output is %d, expected %d", in, 10'd6); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd2);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
err = 1;
end
  
//Checking state 2 to 3
$display("checking State 2 -> State 3");
in = 10'd4;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd3) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd3);
$display("output is %d, expected %d", in, 10'd4); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd3);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
err = 1;
end

//Checking state 3 to 10
$display("checking State 3 -> State 10");
in = 10'd3;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd10) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd10);
$display("output is %d, expected %d", in, 10'd3); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0110000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd10);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0110000);
err = 1;
end

//Checking state 10 to 11
$display("checking State 10 -> State 11");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd11) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd11);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 11 to 12
$display("checking State 11 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

//reset to state 0
reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

//Checking CLOSED
//Checking state 0 to state 1
$display("checking for CLOSED from wrong input at state 5");
$display("checking State 0 -> State 1");
in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1);
$display("output is %d, expected %d", in, 10'd0); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking state 1 to 2
$display("checking State 1 -> State 2");
in = 10'd6;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd2) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd2);
$display("output is %d, expected %d", in, 10'd6); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd2);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
err = 1;
end
  
//Checking state 2 to 3
$display("checking State 2 -> State 3");
in = 10'd4;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd3) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd3);
$display("output is %d, expected %d", in, 10'd4); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd3);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
err = 1;
end

//Checking state 3 to 4
$display("checking State 3 -> State 4");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd4) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd4);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd4);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 4 to 5
$display("checking State 4 -> State 5");
in = 10'd7;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd5) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd5);
$display("output is %d, expected %d", in, 10'd7); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0010010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd5);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0010010);
err = 1;
end

//Checking state 5 to 12
$display("checking State 5 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

//reset to state 0
reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

//Checking CLOSED
//Checking state 0 to state 1
$display("checking for CLOSED from wrong input at state 4");
$display("checking State 0 -> State 1");
in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1);
$display("output is %d, expected %d", in, 10'd0); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking state 1 to 2
$display("checking State 1 -> State 2");
in = 10'd6;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd2) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd2);
$display("output is %d, expected %d", in, 10'd6); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd2);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
err = 1;
end
  
//Checking state 2 to 3
$display("checking State 2 -> State 3");
in = 10'd4;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd3) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd3);
$display("output is %d, expected %d", in, 10'd4); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd3);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
err = 1;
end

//Checking state 3 to 4
$display("checking State 3 -> State 4");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd4) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd4);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd4);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 4 to 11
$display("checking State 4 -> State 11");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd11) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd11);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 11 to 12
$display("checking State 11 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

//reset to state 0
reset = 1'd0;
#5;
clk = 1'd0;
#5;
clk = 1'd1;
#5;
reset = 1'd1;
#5;

//Checking CLOSED
//Checking state 0 to state 1
$display("checking for CLOSED from wrong input at state 5");
$display("checking State 0 -> State 1");
in = 10'd0;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd1) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd1);
$display("output is %d, expected %d", in, 10'd0); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd1);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1000000);
err = 1;
end

//Checking state 1 to 2
$display("checking State 1 -> State 2");
in = 10'd6;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd2) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd2);
$display("output is %d, expected %d", in, 10'd6); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd2);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0000010);
err = 1;
end
  
//Checking state 2 to 3
$display("checking State 2 -> State 3");
in = 10'd4;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd3) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd3);
$display("output is %d, expected %d", in, 10'd4); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd3);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0011001);
err = 1;
end

//Checking state 3 to 4
$display("checking State 3 -> State 4");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd4) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd4);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd4);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b0100100);
err = 1;
end

//Checking state 4 to 5
$display("checking State 4 -> State 5");
in = 10'd7;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd5) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd5);
$display("output is %d, expected %d", in, 10'd7); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111000);
end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd5);
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111000);
err = 1;
end

//Checking state 5 to 12
$display("checking State 5 -> State 12");
in = 10'd2;
clk = 0;
#5;
clk = 1;
#5;

if(tb_lab3.dut.state == 4'd12) begin
$display("State is %d, expected state is %d", tb_lab3.dut.state, 4'd12);
$display("output is %d, expected %d", in, 10'd2); 
$display("output in DE1-SOC is %b %b %b %b %b %b, expected %b %b %b %b %b %b", 
tb_lab3.dut.HEX5, tb_lab3.dut.HEX4, tb_lab3.dut.HEX3, tb_lab3.dut.HEX2, tb_lab3.dut.HEX1, tb_lab3.dut.HEX0, 
7'b1000110, 7'b1000111, 7'b1000000, 7'b0010010, 7'b0000110, 7'b1000000);

end else begin
$display("ERROR ** state is %d, expected %d", tb_lab3.dut.state, 4'd8);
err = 1;
end

if( ~err ) $display("PASSED");
$stop;

 
end
endmodule: tb_lab3

