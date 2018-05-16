module counter_s_mod11_rule(
  out,
  clk,
  clr_n,
);

  output [3:0] out;
  input  clk,
         clr_n;

  wire   [3:0] j;
  wire   [3:0] k;

  /********* Wire assignment *********/
  wire   a, b, c, d;
  assign a = out[3];
  assign b = out[2];
  assign c = out[1];
  assign d = out[0];

  /*********** FF Inputs ***********/
  assign j[0] = (~a & ~b & ~c) | (~a & b & c) | (a & ~b & c);
  assign k[0] = (a) | (b);
  assign j[1] = (~a & b) | (~a & d);
  assign k[1] = (~a & ~b) | (a & d);
  assign j[2] = (~a & c);
  assign k[2] = (a) | (~c & d);
  assign j[3] = (b & c & d);
  assign k[3] = (~c) | (d);

  /*********** FFs **************/
  jk_ff jk_ff_0(
    .q(out[0]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(clk),
    .j(j[0]),
    .k(k[0])
  );

  jk_ff jk_ff_1(
    .q(out[1]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(clk),
    .j(j[1]),
    .k(k[1])
  );

  jk_ff jk_ff_2(
    .q(out[2]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(clk),
    .j(j[2]),
    .k(k[2])
  );

  jk_ff jk_ff_3(
    .q(out[3]),
    .pre_n(1),
    .clr_n(clr_n),
    .clk_n(clk),
    .j(j[3]),
    .k(k[3])
  );

endmodule
