module d_ff(
  q, q_n,
  clk, d, rst_n
);

  output q, q_n;
  reg    q;
  input  clk,
         d,
         rst_n;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n)
        q <= 0;
      else
        q <= d;
    end

  assign q_n = ~q;

endmodule
