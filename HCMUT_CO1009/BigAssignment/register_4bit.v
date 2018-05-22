module register_4bit(
  out,
  in, en, load
);

  output reg [3:0] out;
  input      [3:0] in;
  input  en;
  input  load;

  always @ (posedge load)
    begin
      if (en)
        out <= in;
    end

endmodule
