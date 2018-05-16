module two_complement(
  out,
  in
);

  output [3:0] out;
  input  [3:0] in;

  adder_4bit adder_4bit(
    .sum(out),
    .in_1(~in),
    .in_2(4'b0001)
  );

endmodule
