module register_4bit(
  out,
  in, clr_n, load
);

  output [3:0] out;
  input  [3:0] in;
  input  clr_n, load;

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1)
      begin : register
        d_ff d_ff(
          .q(out[i]),
          .d(in[i]),
          .clr_n(clr_n),
          .clk(load)
        );
      end
  endgenerate

endmodule
