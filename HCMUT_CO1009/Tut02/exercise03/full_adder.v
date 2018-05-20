module full_adder(
  sum, cout,
  in_1, in_2, cin
);

  output sum, cout;
  input  in_1, in_2, cin;

  assign {cout, sum} = in_1 + in_2 + cin;

endmodule
