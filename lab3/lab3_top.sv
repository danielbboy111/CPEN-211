module lab3_top(SW,KEY,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,LEDR);
  input [9:0] SW;
  input [3:0] KEY;
  output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  output [9:0] LEDR;   // optional: use these outputs for debugging on your DE1-SoC

  wire clk = ~KEY[0];  // this is your clock
  wire rst_n = KEY[3]; // this is your reset; your reset should be synchronous and active-low

  reg [3:0] state;
  reg [6:0] HEX0;
  reg [6:0] HEX1;
  reg [6:0] HEX2;
  reg [6:0] HEX3;
  reg [6:0] HEX4;
  reg [6:0] HEX5;

always_ff @(posedge clk) begin

// state 4'd6 is OPEn
// state 4'd12 is CLOSED
if(~rst_n) begin
state <= 4'd0;
end

case(state)

//Shows which state does state 0 goes to after a certain value in switch
// If switch input is 0, my first of 6 digits, then state 0 goes to state 1
// If switch input is otherwise, then state 0 goes to state 7
// If reset is inserted, then it goes to state 0 
4'd0: if(((SW == 10'd0) | (SW == 10'd1) | (SW == 10'd2) | (SW == 10'd3) | (SW == 10'd4) |
(SW == 10'd5) | (SW == 10'd6) | (SW == 10'd7) | (SW == 10'd8) | (SW == 10'd9))
&& (~rst_n)) begin
state <= 4'd0;
end else if((SW == 10'd0) && (rst_n)) begin
state <= 4'd1;
end else begin 
state <= 4'd7;
end


//Shows which state does state 1 goes to after a certain value in switch
// If switch input is 6, my second of 6 digits, then state 1 goes to state 2
// If switch input is otherwise, then state 1 goes to state 8
// If reset is inserted, then it goes to state 0 
4'd1: if(SW == 10'd6) begin
state <= 4'd2;
end else if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd8;
end

//Shows which state does state 7 goes to after a certain value in switch
// If reset is inserted, then it goes to state 0 
// Otherwise, state 7 goes to state 8

4'd7: if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd8;
end

//Shows which state does state 2 goes to after a certain value in switch
// If switch input is 4, my third of 6 digits, then state 2 goes to state 3
// If switch input is otherwise, then state 2 goes to state 9
// If reset is inserted, then it goes to state 0 
4'd2: if(SW == 10'd4) begin
state <= 4'd3;
end else if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd9;
end

//Shows which state does state 8 goes to after a certain value in switch
// If reset is inserted, then it goes to state 0 
// Otherwise, state 8 goes to state 9

4'd8: if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd9;
end

//Shows which state does state 3 goes to after a certain value in switch
// If switch input is 2, my fourth of 6 digits, then state 3 goes to state 4
// If switch input is otherwise, then state 3 goes to state 10
// If reset is inserted, then it goes to state 0 

4'd3: if(SW == 10'd2) begin
state <= 4'd4;
end else if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd10;
end

//Shows which state does state 9 goes to after a certain value in switch
// If reset is inserted, then it goes to state 0 
// Otherwise, state 9 goes to state 10

4'd9: if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd10;
end

//Shows which state does state 4 goes to after a certain value in switch
// If switch input is 7, my fifth of 6 digits, then state 4 goes to state 5
// If switch input is otherwise, then state 4 goes to state 11
// If reset is inserted, then it goes to state 0 

4'd4: if(SW == 10'd7) begin
state <= 4'd5;
end else if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd11;
end

//Shows which state does state 10 goes to after a certain value in switch
// If reset is inserted, then it goes to state 0 
// Otherwise, state 10 goes to state 11

4'd10: if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd11;
end

//Shows which state does state 5 goes to after a certain value in switch
// If switch input is 3, my fifth of 6 digits, then state 5 goes to state 6
// If switch input is otherwise, then state 5 goes to state 12
// If reset is inserted, then it goes to state 0 

4'd5: if(SW == 10'd3) begin
state <= 4'd6;
end else if (SW != 10'd3) begin
state <=4'd12;
end else if (~rst_n) begin
state <= 4'd0;
end

//Shows which state does state 11 goes to after a certain value in switch
// If reset is inserted, then it goes to state 0 
// Otherwise, state 11 goes to state 12

4'd11: if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd12;
end

//Shows which state does state 6 goes to after a certain value in switch
// If the reset input is asserted, then the state goes to 0
// For every other value of input, state remains at 6

4'd6:
if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd6;
end

//Shows which state does state 12 goes to after a certain value in switch
// If reset is inserted, then it goes to state 0 
// Otherwise, state 12 remains at its state

4'd12: if (~rst_n) begin
state <= 4'd0;
end else begin
state <= 4'd12;
end

//default: if (~rst_n) begin
//state <= 4'd0;
//end else begin
//state <= 4'dx;
//end

endcase
end

always_comb begin

//Set Hex's to be zero as default value
HEX0 = 7'b0000000;
HEX1 = 7'b0000000;
HEX2 = 7'b0000000;
HEX3 = 7'b0000000;
HEX4 = 7'b0000000;
HEX5 = 7'b0000000;

//At state OPEn, HEX's show OPEn
if(state == 4'd6) begin
HEX0 = 7'b0101011;
HEX1 = 7'b0000110;
HEX2 = 7'b0001100;
HEX3 = 7'b1000000;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;

//At state CLOSED, HEX's show CLOSED
end else if(state == 4'd12) begin
HEX0 = 7'b1000000;
HEX1 = 7'b0000110;
HEX2 = 7'b0010010;
HEX3 = 7'b1000000;
HEX4 = 7'b1000111;
HEX5 = 7'b1000110;
end else

begin
case(SW)

// Shows 0 when switch is 0
10'd0: begin
HEX0 = 7'b1000000;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 1 when switch is 1
10'd1: begin
HEX0 = 7'b1111001;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 2 when switch is 2

10'd2: begin
HEX0 = 7'b0100100;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 3 when switch is 3
10'd3: begin
HEX0 = 7'b0110000;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 4 when switch is 4
10'd4: begin
HEX0 = 7'b0011001;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 5 when switch is 5
10'd5: begin
HEX0 = 7'b0010010;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 6 when switch is 6
10'd6: begin
HEX0 = 7'b0000010;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 7 when switch is 7
10'd7: begin
HEX0 = 7'b1111000;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 8 when switch is 8
10'd8: begin
HEX0 = 7'b0000000;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows 9 when switch is 9
10'd9: begin
HEX0 = 7'b0011000;
HEX1 = 7'b1111111;
HEX2 = 7'b1111111;
HEX3 = 7'b1111111;
HEX4 = 7'b1111111;
HEX5 = 7'b1111111;
end

// Shows ErrOr when switch value is above 9
default: begin
HEX0 = 7'b0101111;
HEX1 = 7'b1000000;
HEX2 = 7'b0101111;
HEX3 = 7'b0101111;
HEX4 = 7'b0000110;
HEX5 = 7'b1111111;
end

endcase
end
end
endmodule
