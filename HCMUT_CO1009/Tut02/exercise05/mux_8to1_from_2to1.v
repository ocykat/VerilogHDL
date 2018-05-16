module mux_8to1_from_2to1(
  out, out_n,
  data, sel, en_n
);

  output out;
  input  [7:0] data;
  input  [2:0] sel;
  input  en_n;
  wire   [3:0] layer1;
  wire   [1:0] layer2;
  wire   layer3;

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1)
      begin : select_in_2
        mux_2to1 mux_2to1_layer1(
          .out(layer1[i]),
          .data_1(data[2 * i]),
          .data_2(data[2 * i + 1]),
          .sel(sel[2])
        );
      end
  endgenerate;

  genvar j;
  generate
    for (j = 0; j < 2; j = j + 1)
      begin : select_in_4
        mux_2to1 mux_2to1_1_layer2(
          .out(layer2[j]),
          .data_1(layer1[2 * j]),
          .data_2(layer1[2 * j + 1]),
          .sel(sel[1])
        );
      end
  endgenerate;

  mux_2to1 mux_2to1_layer3(
    .out(layer3),
    .data_1(layer2[0]),
    .data_2(layer2[1]),
    .sel(sel[0])
  );

  assign out   = (!en_n) ? (0) : (layer3);
  assign out_n = ~out;

endmodule
