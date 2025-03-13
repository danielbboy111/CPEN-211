module datapath(input clk, input [2:0] readnum, input vsel, input loada, input loadb, input [1:0] shift, input asel, input bsel,
 		input [1:0] ALUop, input loadc, input loads, input [2:0] writenum, input write, input [15:0] datapath_in, output reg Z_out, 
                output reg [15:0] datapath_out);

reg [15:0] data_in;
reg [15:0] data_out;
reg [15:0] in;
reg [15:0] sout;
reg [15:0] Ain;
reg [15:0] Bin;
reg [15:0] out;
reg [15:0] A;

//Output of loadc
reg [15:0] C;

assign datapath_out=C;

wire Z;
//data_in multiplexer logic; if vsel is 1 then takes datapath_in, else if vsel is 0 then takes the value of C 
assign data_in = (vsel== 1) ? datapath_in : C;

//Z1 is needed to connect the output of ALU to the status block
reg Z1;
assign Z_out = Z1;

//regfile
regfile REGFILE(.data_in(data_in), .writenum(writenum), .write(write), .readnum(readnum), .clk(clk), .data_out(data_out));

// if loada is 1, A takes the value of data_out
// if loadb is 1, in takes the value of data_out
// A and in are the output of the block A and B, respectively
always_ff @(posedge clk) begin
    if (loada)
      A <= data_out;
    if (loadb)
      in <= data_out;
  end

//shifter
shifter SHIFTER(.in(in), .shift(shift), .sout(sout));

assign Ain = (asel == 1) ? 16'b0000000000000000 : A;
assign Bin = (bsel == 1) ? {11'b00000000000,datapath_in[4:0]} : sout;

//ALU
ALU ALU(.Ain (Ain), .Bin (Bin), .ALUop (ALUop), .out (out), .Z (Z));

//status and c block
always_ff @(posedge clk) begin
    if(loadc)
       C <= out;
    if(loads)
      Z1 <= Z;
  end


endmodule
