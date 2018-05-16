module counter_s_mod8_ud_top(
  seg,
  raw_clk,
  up
);

  output [6:0] seg;
  input  raw_clk;
  input  up;

  wire  clk;
  wire  [2:0] counter_out;

  clk_divider clk_divider(
    .fout(clk),
    .fin(raw_clk)
  );

  counter_s_mod8_ud counter(
    .out(counter_out),
    .up(up),
    .clk(clk)
  );

  seven_seg seven_seg(
    .bcd(counter_out),
    .seg(seg)
  );

endmodule
