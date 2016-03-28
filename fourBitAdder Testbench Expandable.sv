// Testbench
module test;
  parameter SIZE = 4;
  
  reg a[SIZE-1:0];
  reg b[SIZE-1:0];
  
  wire s[SIZE-1:0];
  wire cf;
  
  // Instantiate design under test
  fourBitAdder fBA(.a(a), .b(b), .s(s), .cf(cf));
  
  initial begin
    for(int i=0;i<SIZE;i=i+1) begin
      a[i] = 1'b0;
      b[i] = 1'b0;
    end
    #256 $finish;
  end
  
  always #128 a[3] = ~a[3];
  always #64 a[2] = ~a[2];
  always #32 a[1] = ~a[1];
  always #16 a[0] = ~a[0];
  always #8 b[3] = ~b[3];
  always #4 b[2] = ~b[2];
  always #2 b[1] = ~b[1];
  always #1 b[0] = ~b[0];
  
  //always @(a[0]) begin
  // initial begin
  //	forever #1 $display("helo");
  //end
    
   initial begin
     forever #1 $display("time=%0t \tINPUT VALUES: \t a[3]=%b a[2]=%b a[1]=%b a[0]=%b b[3]=%b b[2]=%b b[1]=%b b[0]=%b\t cf=%b s[3]=%b s[2]=%b s[1]=%b s[0]=%b", $time, a[3],a[2],a[1],a[0],b[3],b[2],b[1],b[0],cf,s[3],s[2],s[1],s[0]);
   end	
endmodule
