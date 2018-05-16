module counter_s_mod8_ud(
  out,
  up,
  clk
);

  output [2:0] out;
  input  up,
         clk;
  wire   [2:1] in;
  wire   [2:1] and_wire;
  wire   [2:1] and_wire_n;

  // FF 0
  jk_ff jk_ff_0(
    .q(out[0]),
    .pre_n(1),
    .clr_n(1),
    .j(1),
    .k(1),
    .clk_n(clk)
  );

  // FF 1
  and and_gate_1(
    and_wire[1],
    up, out[0]
  );

  and and_gate_n_1(
    and_wire_n[1],
    ~up, ~out[0]
  );

  or or_gate_1(
    in[1],
    and_wire[1], and_wire_n[1]
  );

  jk_ff jk_ff_1(
    .q(out[1]),
    .pre_n(1),
    .clr_n(1),
    .j(in[1]),
    .k(in[1]),
    .clk_n(clk)
  );

  // FF 2
  and and_gate_2(
    and_wire[2],
    up, out[0], out[1]
  );

  and and_gate_n_2(
    and_wire_n[2],
    ~up, ~out[0], ~out[1]
  );

  or or_gate_2(
    in[2],
    and_wire[2], and_wire_n[2]
  );

  jk_ff jk_ff_2(
    .q(out[2]),
    .pre_n(1),
    .clr_n(1),
    .j(in[2]),
    .k(in[2]),
    .clk_n(clk)
  );

endmodule
