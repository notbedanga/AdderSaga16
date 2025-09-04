module adderTest;

    reg [15:0] a, b;
    wire [15:0] c;
    wire sign, zero, carry, parity, overflow;
    str_cla_16adder DUT(a, b, c, sign, zero, carry, parity, overflow);

    initial
        begin
            $dumpfile("str_cla_adderTB.vcd");
            $dumpvars(0, adderTest);
            $monitor("a=%h, b=%h, c=%h, sign=%b, zero=%b, carry=%b, parity=%b, overflow=%b", a, b, c, sign, zero, carry, parity, overflow);
            #5 a=16'h8fff; b=16'h8000;
            #5 a=16'h6ffe; b=16'h0002;
            #5 a=16'haaaa; b=16'h5555;
            #5 a=16'hffff; b=16'h0001;
            #5 a=16'h0000; b=16'h0000;
            #5 $finish;
        end

endmodule