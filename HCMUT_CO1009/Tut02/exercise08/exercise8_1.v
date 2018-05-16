module exercise8_1(
  out,
  a, b, c, d
);

  output out;
  wire   abc;
  wire   [7:0] demux_out_n;
  input  a, b, c, d;

  demux_1_to_8 demux(
    out_n(demux_out_n),
    addr(a, b, c),
    en(3'b100)
  );

  assign abc = ~demux_out_n[0] | ~demux_out_n[2] | ~demux_out_n[4];
  assign out = abc & d;

endmodule
