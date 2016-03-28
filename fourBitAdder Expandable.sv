// Design
// Four Bit Adder

module fourBitAdder (a, b, s, cf);
  parameter SIZE = 4;
  
  input logic a[SIZE-1:0];
  input logic b[SIZE-1:0];
  
  wire c[SIZE-2:0];
  
  wire x[SIZE-1:0];
  wire y[SIZE-1:0];
  wire z[SIZE-1:0];

  output s[SIZE-1:0];
  output cf;
  
  assign s[0] = a[0] ^ b[0];
  assign c[0] = a[0] & b[0];
  
  genvar i;
  generate
    for (i=1; i<SIZE-1;i=i+1) begin:middle
      assign x[i] = a[i] ^ b[i];
      assign y[i] = x[i] & c[i-1];
      assign z[i] = a[i] & b[i];
      assign c[i] = y[i] | z[i];
      assign s[i] = x[i] ^ c[i-1];
    end
  endgenerate
  
  assign x[SIZE-1] = a[SIZE-1] ^ b[SIZE-1];
  assign y[SIZE-1] = x[SIZE-1] & c[SIZE-2];
  assign z[SIZE-1] = a[SIZE-1] & b[SIZE-1];
  assign cf = y[SIZE-1] | z[SIZE-1];
  assign s[SIZE-1] = x[SIZE-1] ^ c[SIZE-2];
  
endmodule
