module exercise7_1(
  out,
  a, b, c, d
);

  output out;
  input  a, b, c, d;
  wire   [7:0] data;

  assign data[0] = d;
  assign data[1] = 0;
  assign data[2] = d;
  assign data[3] = 0;
  assign data[4] = d;
  assign data[5] = 0;
  assign data[6] = d;
  assign data[7] = 0;

  mux_8to1 mux_8to1(
    .out(out),
    .out_n(),
    .data(data),
    .sel({a, b, c}),
    .en_n(0)
  );

endmodule
