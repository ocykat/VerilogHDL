module d_ff(
  q,
  clk, d, clr_n
);

  output q;
  reg    q;
  input  clk;
  input  d, clr_n;

  always @ (posedge clk or negedge clr_n)
    begin
      if (!clr_n)
        q <= 0;
      else
        q <= d;
    end

endmodule
