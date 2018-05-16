module counter_as_mod8(
  out,
  clk,
  rst_n
);

  output [2:0] out;
  input  clk,
         rst_n;

  d_ff_pd d_ff_0(
    .q(out[0]),
    .rst_n(rst_n),
    .clk(clk),
    .d(~out[0])
  );

  d_ff_pd d_ff_1(
    .q(out[1]),
    .rst_n(rst_n),
    .clk(~out[0]),
    .d(~out[1])
  );

  d_ff_pd d_ff_2(
    .q(out[2]),
    .rst_n(rst_n),
    .clk(~out[1]),
    .d(~out[2])
  );

endmodule
