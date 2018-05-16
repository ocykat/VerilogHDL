module mux_2to1(
  out,
  data_1, data_2, sel
);

  output out;
  input  in_1, in_2;
  input  sel;

  assign out = (sel) ? (in_1) : (in_2);

endmodule
