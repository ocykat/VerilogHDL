/*
  74151 IC: 8-to-1 MUX
*/

module mux_8to1(
  out, out_n,
  data, sel, en_n
);

  output out, out_n;
  input  [7:0] data;
  input  [2:0] sel;
  input  en_n;

  assign out =
    (!en_n) ?
    (
      (~sel[2] & ~sel[1] & ~sel[0]) ? (data[0]) :
      (~sel[2] & ~sel[1] &  sel[0]) ? (data[1]) :
      (~sel[2] &  sel[1] & ~sel[0]) ? (data[2]) :
      (~sel[2] &  sel[1] &  sel[0]) ? (data[3]) :
      ( sel[2] & ~sel[1] & ~sel[0]) ? (data[4]) :
      ( sel[2] & ~sel[1] &  sel[0]) ? (data[5]) :
      ( sel[2] &  sel[1] & ~sel[0]) ? (data[6]) :
                                      (data[7])
    ) : (1'b0);
  assign out_n = ~out;

endmodule
