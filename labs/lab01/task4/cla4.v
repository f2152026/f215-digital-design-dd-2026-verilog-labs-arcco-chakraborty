module cla4(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  wire p0, p1, p2, p3;
  wire g0, g1, g2, g3;
  wire c1, c2, c3;
  wire t1a;
  wire t2a, t2b;
  wire t3a, t3b, t3c;
  wire t4a, t4b, t4c, t4d;

  xor (p0, a[0], b[0]);
  xor (p1, a[1], b[1]);
  xor (p2, a[2], b[2]);
  xor (p3, a[3], b[3]);

  and (g0, a[0], b[0]);
  and (g1, a[1], b[1]);
  and (g2, a[2], b[2]);
  and (g3, a[3], b[3]);

  and (t1a, p0, cin);
  or (c1, g0, t1a);

  and (t2a, p1, g0);
  and (t2b, p1, p0, cin);
  or (c2, g1, t2a, t2b);

  and (t3a, p2, g1);
  and (t3b, p2, p1, g0);
  and (t3c, p2, p1, p0, cin);
  or (c3, g2, t3a, t3b, t3c);

  and (t4a, p3, g2);
  and (t4b, p3, p2, g1);
  and (t4c, p3, p2, p1, g0);
  and (t4d, p3, p2, p1, p0, cin);
  or (cout, g3, t4a, t4b, t4c, t4d);

  xor (sum[0], p0, cin);
  xor (sum[1], p1, c1);
  xor (sum[2], p2, c2);
  xor (sum[3], p3, c3);

endmodule
