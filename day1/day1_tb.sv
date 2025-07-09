module mux_tb();
  logic [7:0]A;
  logic [7:0]B;
  logic SEL;
  logic [7:0]Y;
  
  mux MUX(.a(A), .b(B), .sel(SEL), .y(Y));
  
  initial begin
  for(int i=0; i<10; i++) begin
    A = $urandom_range(0, 8'hFF);
    B = $urandom_range(0, 8'hFF);
    SEL = $random%2;
    #5;
  end
  end
   
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, mux_tb);
  end
  
endmodule