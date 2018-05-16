/*
  74138 IC: 1-to-8 DEMUX
*/

module demux_1_to_8(
  out_n,
  addr, en
);

  output [7:0] out_n;
  input  [2:0] addr;
  input  [2:0] en;
  wire   enable;

  assign enable = (en[0] & ~en[1] & ~en[2]);

  assign out_n =
    (enable) ?
      (
        (~addr[0] & ~addr[1] & ~addr[2]) ? (8'b11111110) :
        (~addr[0] & ~addr[1] &  addr[2]) ? (8'b11111101) :
        (~addr[0] &  addr[1] & ~addr[2]) ? (8'b11111011) :
        (~addr[0] &  addr[1] &  addr[2]) ? (8'b11110111) :
        ( addr[0] & ~addr[1] & ~addr[2]) ? (8'b11101111) :
        ( addr[0] & ~addr[1] &  addr[2]) ? (8'b11011111) :
        ( addr[0] &  addr[1] & ~addr[2]) ? (8'b10111111) :
                                           (8'b01111111)
      ) :
      (8'b11111111);

endmodule
