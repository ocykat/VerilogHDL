module counter_as_mod8_top(
  seg,
  raw_clk,
  rst_n
);

  output [6:0] seg;
  input  raw_clk;
  input  rst_n;

  wire   clk;
  wire   [2:0] clk_out;

  clk_divider clk_divider(
    .fout(clk),
    .fin(raw_clk)
  );

  counter_as_mod8 counter(
    .out(clk_out),
    .clk(clk),
    .rst_n(rst_n)
  );

  seven_seg seven_seg(
    .seg(seg),
    .bcd(clk_out)
  );

endmodule
