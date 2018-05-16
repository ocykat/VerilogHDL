module adder_4bit(
  sum,
  in_1, in_2
);

  output [3:0] sum;
  input  [3:0] in_1;
  input  [3:0] in_2;
  wire   [2:0] cout;

  full_adder full_adder_0(
    .sum(sum[0]),
    .cout(cout[0]),
    .in_1(in_1[0]),
    .in_2(in_2[0]),
    .cin(0)
  );

  full_adder full_adder_1(
    .sum(sum[1]),
    .cout(cout[1]),
    .in_1(in_1[1]),
    .in_2(in_2[1]),
    .cin(cout[0])
  );

  full_adder full_adder_2(
    .sum(sum[2]),
    .cout(cout[2]),
    .in_1(in_1[2]),
    .in_2(in_2[2]),
    .cin(cout[1])
  );

  full_adder full_adder_3(
    .sum(sum[3]),
    .cout(),
    .in_1(in_1[3]),
    .in_2(in_2[3]),
    .cin(cout[2])
  );

endmodule
