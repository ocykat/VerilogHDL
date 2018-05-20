module parallel_adder_4bit(
  a_reg,
  in,
  load, clr_n, trf
);

  output [3:0] a_reg;
  input  [3:0] in;
  input  load;
  input  clr_n;
  input  trf;
  wire   [3:0] b_reg;
  wire   [3:0] sum;

  adder_4bit adder_4bit(
    .sum(sum),
    .in_1(a_reg),
    .in_2(b_reg)
  );

  register_4bit a_register(
    .out(a_reg),
    .in(sum),
    .clr_n(clr_n),
    .load(trf)
  );

  register_4bit b_register(
    .out(b_reg),
    .in(in),
    .clr_n(4'b1111),
    .load(load)
  );


endmodule
