module counter_mod9(
  q,
  clk
);

  output [3:0] q;
  input  clk;

  wire   clk_1;
  wire   mr_1, mr_2;

  assign clk_1 = q[0];
  assign mr_1  = q[0];
  assign mr_2  = q[3];

  ic_74ls90(
    .q(q),
    .cp_0(clk),
    .cp_1(clk_1),
    .ms_1(1'b0),
    .ms_2(1'b0),
    .mr_1(mr_1),
    .mr_2(mr_2)
  );

endmodule
