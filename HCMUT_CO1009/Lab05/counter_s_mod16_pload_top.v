module counter_s_mod16_pload_top(
  seg,
  raw_clk,
  data,
  pl_n
);

  output [13:0] seg;
  input  raw_clk;
  input  [3:0] data;
  input  pl_n;
  wire   clk;
  wire   [3:0] counter_out;
  wire   [3:0] unit_bcd;
  wire   [3:0] tenth_bcd;

  clk_divider clk_divider(
    .fout(clk),
    .fin(raw_clk)
  );

  counter_s_mod16_pload counter(
    .out(counter_out),
    .clk(clk),
    .data(data),
    .pl_n(pl_n)
  );

  assign unit_bcd = (counter_out > 4'd9) ? (counter_out - 4'd10) : (counter_out);
  assign tenth_bcd = (counter_out > 4'd9) ? (4'd1) : (4'd0);

  seven_seg seven_seg_0(
    .bcd(unit_bcd),
    .seg(seg[6:0])
  );

  seven_seg seven_seg_1(
    .bcd(tenth_bcd),
    .seg(seg[13:7])
  );

endmodule
