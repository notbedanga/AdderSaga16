module full_adder(s, cout, a, b, cin);

    input a, b, cin;
    output s, cout;
    wire s1, c1, c2;

    xor G1(s1, a, b), G2(s, s1, cin), G3(cout, c1, c2);
    and G4(c1, a, b), G5(c2, s1, cin);

endmodule

    
module str_rca_4adder(s, cout, a, b, cin);

    input [3:0] a, b;
    input cin;
    output [3:0] s;
    output cout;
    wire c1, c2, c3;

    full_adder FA0(s[0], c1, a[0], b[0], cin);
    full_adder FA1(s[1], c2, a[1], b[1], c1);
    full_adder FA2(s[2], c3, a[2], b[2], c2);
    full_adder FA3(s[3], cout, a[3], b[3], c3);

endmodule


module str_rca_16adder(x, y, z, sign, zero, carry, parity, overflow);

    input [15:0] x, y;
    output [15:0] z;
    output sign, zero, carry, parity, overflow;
    wire c[3:1];

    assign sign = z[15];
    assign zero = ~|z;
    assign parity = ~^z;
    assign overflow = (x[15] & y[15] & ~z[15]) | (~x[15] & ~y[15] & z[15]);

    str_rca_4adder A0(z[3:0], c[1], x[3:0], y[3:0], 1'b0);
    str_rca_4adder A1(z[7:4], c[2], x[7:4], y[7:4], c[1]);
    str_rca_4adder A2(z[11:8], c[3], x[11:8], y[11:8], c[2]);
    str_rca_4adder A3(z[15:12], carry, x[15:12], y[15:12], c[3]);

endmodule