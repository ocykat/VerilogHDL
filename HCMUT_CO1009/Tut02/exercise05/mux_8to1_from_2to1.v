module mux_8to1_from_2to1(
  out, out_n,
  data, sel, en_n
);

  output out, out_n;
  input  [7:0] data;
  input  [2:0] sel;
  input  en_n;
  wire   [3:0] layer0;
  wire   [1:0] layer1;
  wire   layer2;

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1)
      begin : select_in_2
        mux_2to1 mux_2to1_0(
          .out(layer0[i]),
          .data_0(data[2 * i]),
          .data_1(data[2 * i + 1]),
          .sel(sel[0])
        );
      end
  endgenerate

  genvar j;
  generate
    for (j = 0; j < 2; j = j + 1)
      begin : select_in_4
        mux_2to1 mux_2to1_1(
          .out(layer1[j]),
          .data_0(layer0[2 * j]),
          .data_1(layer0[2 * j + 1]),
          .sel(sel[1])
        );
      end
  endgenerate

  mux_2to1 mux_2to1_2(
    .out(layer2),
    .data_0(layer1[0]),
    .data_1(layer1[1]),
    .sel(sel[2])
  );

  assign out   = (!en_n) ? (layer2) : (1'b0);
  assign out_n = ~out;

endmodule
