module alu_top(
  seg_a, seg_b, seg_c, ledr,
  sw,
  key
);

  output [13:0] seg_a;
  output [13:0] seg_b;
  output [13:0] seg_c;
  output ledr;
  input [7:0] sw;
  input [1:0] key;

  wire  [3:0] reg_a;
  wire  [3:0] reg_b;
  wire  [3:0] reg_c;


  // A & B registers
  register_4bit register_a(
    .out(reg_a),
    .in(sw[3:0]),
    .en(~sw[4]),
    .load(key[0])
  );

  register_4bit register_b(
    .out(reg_b),
    .in(sw[3:0]),
    .en(sw[4]),
    .load(key[0])
  );


  // ALU
  wire [3:0] alu_out;

  alu alu(
    .out(alu_out),
    .ovr(ledr),
    .sel(sw[7:5]),
    .a(reg_a),
    .b(reg_b),
    .c(reg_c)
  );

  register_4bit register_c(
    .out(reg_c),
    .in(alu_out),
    .en(1'b1),
    .load(key[1])
  );


  // Bin to BCD
  wire  [7:0] bcd_a;
  wire  [7:0] bcd_b;
  wire  [7:0] bcd_c;

  bin_4bit_to_bcd bin_to_bcd_a(
    .bcd(bcd_a),
    .bin(reg_a)
  );

  bin_4bit_to_bcd bin_to_bcd_b(
    .bcd(bcd_b),
    .bin(reg_b)
  );

  bin_4bit_to_bcd bin_to_bcd_c(
    .bcd(bcd_c),
    .bin(reg_c)
  );

  // BCD to 7seg LEDs
  seven_seg_decoder seven_seg_a_0(
    .seg(seg_a[6:0]),
    .bcd(bcd_a[3:0])
  );

  seven_seg_decoder seven_seg_a_1(
    .seg(seg_a[13:7]),
    .bcd(bcd_a[7:4])
  );

  seven_seg_decoder seven_seg_b_0(
    .seg(seg_b[6:0]),
    .bcd(bcd_b[3:0])
  );

  seven_seg_decoder seven_seg_b_1(
    .seg(seg_b[13:7]),
    .bcd(bcd_b[7:4])
  );

  seven_seg_decoder seven_seg_c_0(
    .seg(seg_c[6:0]),
    .bcd(bcd_c[3:0])
  );

  seven_seg_decoder seven_seg_c_1(
    .seg(seg_c[13:7]),
    .bcd(bcd_c[7:4])
  );

endmodule
