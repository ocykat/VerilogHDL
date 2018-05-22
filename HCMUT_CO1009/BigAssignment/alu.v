module alu(
  out, ovr,
  sel,
  a, b, c
);

  output [3:0] out;
  output ovr;
  input  [2:0] sel;
  input  [3:0] a;
  input  [3:0] b;
  input  [3:0] c;

  assign out =
      (sel == 3'b000) ? (a - b)
    : (sel == 3'b001) ? (b - a)
    : (sel == 3'b010) ? (a + b)
    : (sel == 3'b011) ? (a & b)
    : (sel == 3'b100) ? (a | b)
    : (sel == 3'b101) ? (a ^ b)
    : (sel == 3'b110) ? (~c)
    : (4'b0000);

  assign ovr =
      (
        (sel == 3'b000 && a < b) |
        (sel == 3'b001 && b < a) |
        (sel == 3'b010 && a + b > 5'd15)
      ) ? (1'b1) : (1'b0);

endmodule
