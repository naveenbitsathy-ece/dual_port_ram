module dual_port_ram_tb;
   reg clock;
   reg reset;
   reg [7:0] data_in;
   reg  [13:0] wr_addr;
   reg [13:0] rd_addr;
   reg  write_en,read_en;
   
   wire [7:0] data_out;
   

   //Instantiate the RAM module and connect the ports
  dual_port_ram DUT(
    clock,
    reset,  
    write_en,
    read_en,
    wr_addr,      //16KB = 16 * 1024 = 16384 == 2^14;
    rd_addr,
    data_in,
    data_out
);
initial
clock=0;

always
#5 clock=~clock;

  initial 
begin
  reset=1;
  write_en=0;
  read_en=0;
  wr_addr=0;
  rd_addr=0;
repeat(2) @(posedge clock);
  reset=0;
end

task stimula;
input a,b;
input [13:0]w;
input [13:0]r;
input [7:0]c;
begin
    @(negedge clock);
write_en=a;
read_en=b;
wr_addr=w;
rd_addr=r;
data_in=c;

  @(posedge clock);
end
endtask 

initial
begin
    @(negedge clock)
stimula(1,0,3,0,8'd3); // write 
stimula(1,0,123,0,8'd5); // write 
stimula(1,0,233,0,8'd15); // write 
stimula(1,0,453,0,8'd25); // write

stimula(0,1,0,3,8'd0); // read
stimula(0,1,0,123,8'd0); // read
stimula(0,1,0,233,8'd0); // read
stimula(0,1,0,453,8'd0); // read

stimula(1,0,267,0,8'd89); // read
stimula(1,1,900,267,8'd7); // write and read  

 @(negedge clock);
    write_en = 0;
    read_en  = 0;

    #20;

    $display("Simulation Finished");
    $finish;
end 

initial
begin
  $monitor (" Time=%0t  reset=%b  write_en=%b read_en=%b rd_addr=%d wr_addr=%d data_in = %d  data_out=%d",
  $time,reset,write_en,read_en,rd_addr,wr_addr,data_in,data_out);
  
end
endmodule 