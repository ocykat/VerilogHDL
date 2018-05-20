module exercise8_2(
  out,
  a, b, c, d, e
);

  output out;
  wire   abc;
  wire   [7:0] demux_out_n;
  input  a, b, c, d, e;

  demux_1to8 demux(
    .out_n(demux_out_n),
    .addr({a, b, c}),
    .en(3'b001)
  );

  assign abc =   ~demux_out_n[0]
               | ~demux_out_n[2]
               | ~demux_out_n[4]
               | ~demux_out_n[5];
  assign out = abc & ~d & e;

endmodule
