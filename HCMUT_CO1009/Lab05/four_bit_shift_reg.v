module four_bit_shift_reg(
  out,
  clk,
  data
);

  output [3:0] out;
  input  clk,
         data;

  d_ff d_ff_0(
    .q(out[0]),
    .clk(clk),
    .d(data),
    .rst_n(1)
  );

  d_ff d_ff_1(
    .q(out[1]),
    .clk(clk),
    .d(out[0]),
    .rst_n(1)
  );

  d_ff d_ff_2(
    .q(out[2]),
    .clk(clk),
    .d(out[1]),
    .rst_n(1)
  );

  d_ff d_ff_3(
    .q(out[3]),
    .clk(clk),
    .d(out[2]),
    .rst_n(1)
  );

endmodule
