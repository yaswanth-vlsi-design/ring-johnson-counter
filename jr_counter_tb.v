module jr_counter_tb;  
  parameter WIDTH = 4;  

  reg clk;  
  reg rstn;  
  reg j_r;
  wire [WIDTH-1:0] out;  
    
 jr_counter  u0 (.clk (clk),  
                .rstn (rstn),
                .j_r(j_r),  
                .out (out));  
    
  always #10 clk = ~clk;  
    
  initial begin  
    clk=0;
     rstn = 1;  
    j_r=1;
     
    repeat (2) @(posedge clk);  
    rstn <= 0;  
    repeat (15) @(posedge clk);  

    j_r=0;
     
    repeat (2) @(posedge clk);  
    rstn <= 0;  
    repeat (15) @(posedge clk); 
    $finish;  
  end  
endmodule  

