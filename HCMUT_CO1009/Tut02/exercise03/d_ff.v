module d_ff(
  q,
  clk, d, clr_n
);

  output q;
  reg    q_npd;   // q output with no propagation delay
  input  clk;
  input  d, clr_n;

  always @ (posedge clk or negedge clr_n)
    begin
      if (!clr_n)
        q_npd <= 0;
      else
        q_npd <= d;
    end

  assign #2 q = q_npd;
endmodule
