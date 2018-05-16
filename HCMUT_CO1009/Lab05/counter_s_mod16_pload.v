module counter_s_mod16_pload(
  out,
  clk,
  data,
  pl_n
);

  output [3:0] out;
  input  clk;
  input  [3:0] data;
  input  pl_n;

  wire   [3:0] pre_n;
  wire   [3:0] clr_n;
  wire   [3:1] j;
  wire   [3:1] k;

  assign pre_n[0] = (!pl_n) ? (~data[0]) : (1);
  assign clr_n[0] = (!pl_n) ?  (data[0]) : (1);
  assign pre_n[1] = (!pl_n) ? (~data[1]) : (1);
  assign clr_n[1] = (!pl_n) ?  (data[1]) : (1);
  assign pre_n[2] = (!pl_n) ? (~data[2]) : (1);
  assign clr_n[2] = (!pl_n) ?  (data[2]) : (1);
  assign pre_n[3] = (!pl_n) ? (~data[3]) : (1);
  assign clr_n[3] = (!pl_n) ?  (data[3]) : (1);

  jk_ff jk_ff_0(
    .q(out[0]),
    .pre_n(pre_n[0]),
    .clr_n(clr_n[0]),
    .clk_n(clk),
    .j(1),
    .k(1)
  );

  assign j[1] = out[0];
  assign k[1] = out[0];

  jk_ff jk_ff_1(
    .q(out[1]),
    .pre_n(pre_n[1]),
    .clr_n(clr_n[1]),
    .clk_n(clk),
    .j(j[1]),
    .k(k[1])
  );

  assign j[2] = out[0] & out[1];
  assign k[2] = out[0] & out[1];

  jk_ff jk_ff_2(
    .q(out[2]),
    .pre_n(pre_n[2]),
    .clr_n(clr_n[2]),
    .clk_n(clk),
    .j(j[2]),
    .k(k[2])
  );

  assign j[3] = out[0] & out[1] & out[2];
  assign k[3] = out[0] & out[1] & out[2];

  jk_ff jk_ff_3(
    .q(out[3]),
    .pre_n(pre_n[3]),
    .clr_n(clr_n[3]),
    .clk_n(clk),
    .j(j[3]),
    .k(k[3])
  );

endmodule
