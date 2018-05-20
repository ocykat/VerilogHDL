module sr_ff(
  q, q_n,
  clk_n,
  pre_n, clr_n,
  s, r
);

  output q, q_n;
  reg    q_npd;   // q output with no propagation delay
  input  clk_n;
  input  pre_n, clr_n;
  input  s, r;

  always @ (negedge clk_n or negedge pre_n or negedge clr_n)
    begin
      if (!pre_n)
        q_npd <= 1;
      else if (!clr_n)
        q_npd <= 0;
      else
        if (s)
          q_npd <= 1;
        else if (r)
          q_npd <= 0;
    end

  assign #2 q   = q_npd;
  assign    q_n = ~q;

endmodule
