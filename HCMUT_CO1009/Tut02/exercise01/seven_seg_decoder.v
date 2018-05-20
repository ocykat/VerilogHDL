module seven_seg_decoder(
  seg,
  bcd, rst_n
);

  output [7:0] seg;
  input  [3:0] bcd;
  input  rst_n;

  assign seg =
    (!rst_n) ? (7'b1111111) :
      (bcd == 4'h0) ? (7'b1000000) :
      (bcd == 4'h1) ? (7'b1111001) :
      (bcd == 4'h2) ? (7'b0100100) :
      (bcd == 4'h3) ? (7'b0110000) :
      (bcd == 4'h4) ? (7'b0011001) :
      (bcd == 4'h5) ? (7'b0010010) :
      (bcd == 4'h6) ? (7'b0000010) :
      (bcd == 4'h7) ? (7'b1111000) :
      (bcd == 4'h8) ? (7'b0000000) :
      (bcd == 4'h9) ? (7'b0010000) :
      (bcd == 4'hA) ? (7'b0001000) :
      (bcd == 4'hB) ? (7'b0000011) :
      (bcd == 4'hC) ? (7'b1000110) :
      (bcd == 4'hD) ? (7'b0100001) :
      (bcd == 4'hE) ? (7'b0000110) :
      (bcd == 4'hF) ? (7'b0001110) :
                      (7'b1111111);

endmodule
