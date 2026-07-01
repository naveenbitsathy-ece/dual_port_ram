`timescale 1ns/1ps

module dual_port_ram(
    input clock,
    input reset,  
    input write_en,
    input read_en,
    input [9:0]wr_addr,      //16KB = 16 * 1024 = 16384 == 2^14;
    input [9:0]rd_addr,
    input [7:0]data_in,

    output reg [7:0]data_out
);

reg [7:0]mem[1023:0];      // 16 * 1024 = 16384
integer i;

always@(posedge clock)
begin
    if(reset)
    begin 
    data_out <= 0;
    for(i=0;i<1024;i=i+1)
    mem
    end 

    else 
    begin 
      if(write_en && read_en)
    begin
        mem[wr_addr] <= data_in;
        data_out <= mem[rd_addr]; 
    end 
    else if(write_en)
    mem[wr_addr] <= data_in;
    else if(read_en)
    data_out <= mem[rd_addr];
    end 
end 
endmodule 