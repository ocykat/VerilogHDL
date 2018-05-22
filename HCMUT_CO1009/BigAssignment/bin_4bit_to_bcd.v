module bin_4bit_to_bcd(
  bcd,
  bin
);

  output [7:0] bcd;
  input  [3:0] bin;

  assign bcd[3:0] = (bin > 4'd9) ? (bin - 4'd10) : (bin);
  assign bcd[7:4] = (bin > 4'd9) ? (1'b1) : (1'b0);

endmodule
