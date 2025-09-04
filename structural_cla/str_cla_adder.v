module str_cla_4adder(s, cout, a, b, cin);

    input [3:0] a, b;
    input cin;
    output [3:0] s;
    output cout;
    wire p[3:0], g[3:0], c[2:0];

    assign p[0] = a[0] ^ b[0];
    assign p[1] = a[1] ^ b[1];
    assign p[2] = a[2] ^ b[2];
    assign p[3] = a[3] ^ b[3];

    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];
    assign g[2] = a[2] & b[2];
    assign g[3] = a[3] & b[3];

    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

    assign s[0] = p[0] ^ cin;
    assign s[1] = p[1] ^ c[0];
    assign s[2] = p[2] ^ c[1];
    assign s[3] = p[3] ^ c[2];

endmodule


module str_cla_16adder(x, y, z, sign, zero, carry, parity, overflow);

    input [15:0] x, y;
    output [15:0] z;
    output sign, zero, carry, parity, overflow;
    wire c[3:1];

    assign sign = z[15];
    assign zero = ~|z;
    assign parity = ~^z;
    assign overflow = (x[15] & y[15] & ~z[15]) | (~x[15] & ~y[15] & z[15]);

    str_cla_4adder A0(z[3:0], c[1], x[3:0], y[3:0], 1'b0);
    str_cla_4adder A1(z[7:4], c[2], x[7:4], y[7:4], c[1]);
    str_cla_4adder A2(z[11:8], c[3], x[11:8], y[11:8], c[2]);
    str_cla_4adder A3(z[15:12], carry, x[15:12], y[15:12], c[3]);

endmodule