module jk_ff(
  q, q_n,
  clk_n,
  pre_n, clr_n,
  j, k
);

  output q, q_n;
  reg    q_npd;   // q output with no propagation delay
  input  cp_n;
  input  pre_n, clr_n;
  input  j, k;

  always @ (negedge clk_n or negedge pre_n or negedge clr_n)
    begin
      if (!pre_n)
        q_npd <= 1;
      else if (!clr_n)
        q_npd <= 0;
      else
        if (j)
          if (k)
            q_npd <= ~q_npd;
          else
            q_npd <= 1;
        else
          if (k)
            q_npd <= 0;
    end

  assign #2 q   = q_npd;
  assign    q_n = ~q;

endmodule
