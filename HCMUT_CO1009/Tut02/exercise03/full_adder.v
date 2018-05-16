module full_adder(
  sum, cout
  in_1, in_2, cin
);

  output sum, cout;
  input  in_1, in_2, cin;

  assign sum  = (in_1 + in_2 > 4'd9) ? (in_1 + in_2 - 4'd10) : (in_1 + in_2);
  assign cout = (in_1 + in_2 > 4'd9) ? (1) : (0);

endmodule
