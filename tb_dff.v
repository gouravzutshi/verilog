// Code your testbench here
// or browse Examples
module tb_dff;

reg d;
reg clk;
wire q;

dff uut(
    .d(d),
    .clk(clk),
    .q(q)
);

initial begin
    clk=0;
    forever #5 clk=~clk;
end

initial begin

  $monitor("Time=%0t | d=%b, q=%b, clk=%b",$time, d, q, clk);
  	
  d = 0; #10;
        if (q !== d) $error("Mismatch at time %0t: Expected q=%b, Got q=%b", $time, d, q);

        d = 1; #10;
        if (q !== d) $error("Mismatch at time %0t: Expected q=%b, Got q=%b", $time, d, q);

        d = 0; #10;
        if (q !== d) $error("Mismatch at time %0t: Expected q=%b, Got q=%b", $time, d, q);

        d = 1; #10;
        if (q !== d) $error("Mismatch at time %0t: Expected q=%b, Got q=%b", $time, d, q);

  
    $finish;

end
endmodule