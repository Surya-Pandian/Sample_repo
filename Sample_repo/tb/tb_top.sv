`timescale 1ns/1ps

module tb_top;

reg  [3:0] a, b;
reg  [1:0] sel;
wire [3:0] y;

alu dut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial begin
    
    $display("INSIDE LOGIC");

    a = 4'd5; b = 4'd3; sel = 2'b00; #10; // Add
    a = 4'd8; b = 4'd2; sel = 2'b01; #10; // Sub
    a = 4'd6; b = 4'd3; sel = 2'b10; #10; // AND
    a = 4'd6; b = 4'd3; sel = 2'b11; #10; // OR

    $finish;

end

initial begin
    $monitor("Time=%0t a=%d b=%d sel=%b y=%d",
              $time, a, b, sel, y);
end

endmodule
