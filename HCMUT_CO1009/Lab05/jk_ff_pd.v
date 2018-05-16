module jk_ff_pd(
  q,
  pre_n, clr_n,
  clk_n,
  j, k
);

  output q;
  reg    q_nodelay;
  input  pre_n,
         clr_n,
         clk_n,
         j,
         k;

  always @ (negedge clk_n or negedge pre_n or negedge clr_n)
    begin
      if (!pre_n)
        q_nodelay <= 1;
      else if (!clr_n)
        q_nodelay <= 0;
      else
        if (j)
          if (k)
            q_nodelay <= ~q_nodelay;
          else
            q_nodelay <= 1;
        else
          if (k)
            q_nodelay <= 0;
    end

  assign #2 q = q_nodelay;

endmodule
