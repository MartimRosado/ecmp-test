`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `INPUT(x,32),
   `OUTPUT(y,32)
   );

   `SIGNAL(cnt, 32)
   `SIGNAL(max, 32)
   `SIGNAL(s_out, 32)

   `REG_ARE(clk, rst, 1'b0, cnt!=99, s_out, max)
   `SIGNAL2OUT(y, s_out)

   //iteration counter
   `COUNTER_ARE(clk, rst, cnt!=99, cnt)

   `COMB begin
   if (x > max) begin
    max = x;
    end else
    max = s_out;
   end

endmodule
