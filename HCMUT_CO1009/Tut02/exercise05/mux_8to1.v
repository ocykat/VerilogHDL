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
    (!en_n) ? (0) :
      (~sel[0] & ~sel[1] ~sel[2]) ? (data[0]) :
      (~sel[0] & ~sel[1]  sel[2]) ? (data[1]) :
      (~sel[0] &  sel[1] ~sel[2]) ? (data[2]) :
      (~sel[0] &  sel[1]  sel[2]) ? (data[3]) :
      ( sel[0] & ~sel[1] ~sel[2]) ? (data[4]) :
      ( sel[0] & ~sel[1]  sel[2]) ? (data[5]) :
      ( sel[0] &  sel[1] ~sel[2]) ? (data[6]) :
                                    (data[7]);
  assign out_n = ~out;

endmodule
