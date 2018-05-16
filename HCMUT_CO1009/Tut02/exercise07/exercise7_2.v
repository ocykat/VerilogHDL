module exercise7_2(
  out,
  a, b, c, d
);

  output out;
  input  a, b, c, d;
  wire   [7:0] data;

  assign data[0] =  0;
  assign data[1] =  1;
  assign data[2] =  0;
  assign data[3] =  0;
  assign data[4] = ~d;
  assign data[5] =  d;
  assign data[6] =  0;
  assign data[7] =  0;

  mux_8to1 mux_8to1(
    .out(out),
    .out_n(),
    .data(data),
    .sel({a, b, c}),
    .en_n(0)
  );

endmodule
