module counter_as_mod14(
  out,
  clk,
  m_clr_n
);

  output [3:0] out;
  input  clk,
         m_clr_n;
         
  wire   clr_n;

  assign clr_n = m_clr_n & ~(out[3] & out[2] & out[1]); // 14 == 1110

  jk_ff_pd jk_ff_0(
    .q(out[0]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(clk),
    .j(1),
    .k(1)
  );

  jk_ff_pd jk_ff_1(
    .q(out[1]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(out[0]),
    .j(1),
    .k(1)
  );

  jk_ff_pd jk_ff_2(
    .q(out[2]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(out[1]),
    .j(1),
    .k(1)
  );

  jk_ff_pd jk_ff_3(
    .q(out[3]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(out[2]),
    .j(1),
    .k(1)
  );

endmodule
