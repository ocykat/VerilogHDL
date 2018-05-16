module jk_ff(
  q, q_n,
  pre_n, clr_n,
  clk_n,
  j, k
);

  output q,
         q_n;
  reg    q;
  input  pre_n,
         clr_n,
         clk_n,
         j,
         k;

  always @ (negedge clk_n or negedge pre_n or negedge clr_n)
    begin
      if (!pre_n)
        q <= 1;
      else if (!clr_n)
        q <= 0;
      else
        if (j)
          if (k)
            q <= ~q;
          else
            q <= 1;
        else
          if (k)
            q <= 0;
    end

  assign q_n = ~q;

endmodule
