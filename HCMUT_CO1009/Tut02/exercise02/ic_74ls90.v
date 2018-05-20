/*
  74LS90 IC: Ripple MOD10 counter

  Q_0: MOD2 counter
  Q_1 to Q_3: MOD5 counter
  => Q_0 to Q_3: MOD10 counter
*/


module ic_74ls90(
  q,
  cp_0, cp_1,
  ms_1, ms_2,
  mr_1, mr_2
);

  output [3:0] q;
  input  cp_0, cp_1;
  input  ms_1, ms_2;
  input  mr_1, mr_2;

  wire   [3:0] pre;
  wire   clr;

  assign pre = (ms_1 & ms_2) ? (4'b0110) : (4'b1111);
  assign clr = (mr_1 & mr_2 & (~ms_1 | ~ms_2)) ? (1'b0) : (1'b1);

  jk_ff jk_ff_0(
    .q(q[0]),
    .q_n(),
    .clk_n(cp_0),
    .pre_n(pre[0]),
    .clr_n(clr),
    .j(1'b1),
    .k(1'b1)
  );

  jk_ff jk_ff_1(
    .q(q[1]),
    .q_n(),
    .clk_n(cp_1),
    .pre_n(pre[1]),
    .clr_n(clr),
    .j(~q[3]),
    .k(1'b1)
  );

  jk_ff jk_ff_2(
    .q(q[2]),
    .q_n(),
    .clk_n(q[1]),
    .pre_n(pre[2]),
    .clr_n(clr),
    .j(1'b1),
    .k(1'b1)
  );

  wire s_3;
  and and_0(s_3, q[1], q[2]);

  sr_ff sr_ff_3(
    .q(q[3]),
    .q_n(),
    .clk_n(cp_1),
    .pre_n(pre[3]),
    .clr_n(clr),
    .s(s_3),
    .r(q[3])
  );

endmodule
