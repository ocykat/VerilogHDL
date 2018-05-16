module clk_divider(
  fout,
  fin
);

  output fout;
  wire   [26:0] f;
  input  fin;

  assign f[0] = fin;

  genvar i;
  generate
    for (i = 1; i <= 26; i = i + 1)
      begin : d_ff_label
        d_ff d_ff(
          .q(f[i]),
          .q_n(),
          .d(~f[i]),
          .clk(f[i - 1]),
          .rst_n(1)
        );
      end
  endgenerate
  

  assign fout = f[26];

endmodule
