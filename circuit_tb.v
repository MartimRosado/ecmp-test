`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit_tb;

   `CLOCK(clk, 10)
   `RESET(rst, 1, 10)
   `SIGNAL(en, 1)
   `SIGNAL(x, 32)
   `SIGNAL_OUT(y, 32)

   integer i;

   initial begin
      $dumpfile("circuit.vcd");
      $dumpvars();
      en=1;
      for (i=0; i<100; i=i+1) begin
         @(posedge clk) #1 x = $random;
         @(posedge clk) #1 $write("Max Number: %d\n", y);
      end

      @(posedge clk) #200 $finish;

   end

   circuit c0
     (
      .rst(rst),
      .clk(clk),
      .en(en),
      .x(x),
      .y(y)
      );


endmodule
