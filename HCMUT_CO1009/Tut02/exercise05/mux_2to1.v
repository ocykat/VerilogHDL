module mux_2to1(
  out,
  data_0, data_1, sel
);

  output out;
  input  data_0, data_1;
  input  sel;

  assign out = (!sel) ? (data_0) : (data_1);

endmodule
