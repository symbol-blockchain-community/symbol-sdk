namespace SymbolSdk;
public static class NaclCatapult
{
    public static long[] Gf(long[]? init = null)
    {
        var r = new long[16];
        if (init == null) return r;
        for (var i = 0; i < init.Length; i++)
        {
            r[i] = init[i];
        }
        return r;
    }
    
    private static readonly long[] gf0 = Gf();
    private static readonly long[] gf1 = Gf(new long[] { 1 });
    private static readonly long[] D = Gf(new long[]{
    0x78a3,
    0x1359,
    0x4dca,
    0x75eb,
    0xd8ab,
    0x4141,
    0x0a4d,
    0x0070,
    0xe898,
    0x7779,
    0x4079,
    0x8cc7,
    0xfe73,
    0x2b6f,
    0x6cee,
    0x5203});
    private static readonly long[] D2 = Gf(new long[]{
    0xf159,
    0x26b2,
    0x9b94,
    0xebd6,
    0xb156,
    0x8283,
    0x149a,
    0x00e0,
    0xd130,
    0xeef3,
    0x80f2,
    0x198e,
    0xfce7,
    0x56df,
    0xd9dc,
    0x2406});
    private static long[] X = Gf(new long[]{
    0xd51a,
    0x8f25,
    0x2d60,
    0xc956,
    0xa7b2,
    0x9525,
    0xc760,
    0x692c,
    0xdc5c,
    0xfdd6,
    0xe231,
    0xc0a4,
    0x53fe,
    0xcd6e,
    0x36d3,
    0x2169});
    private static long[] Y = Gf(new long[]{
    0x6658,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666,
    0x6666});
    private static readonly long[] I = Gf(new long[]{
    0xa0b0,
    0x4a0e,
    0x1b27,
    0xc4ee,
    0xe478,
    0xad2f,
    0x1806,
    0x2f43,
    0xd7a7,
    0x3dfb,
    0x0099,
    0x2b4d,
    0xdf0b,
    0x4fc1,
    0x2480,
    0x2b83});
    public static byte[] L = new byte[]{
    0xed,
    0xd3,
    0xf5,
    0x5c,
    0x1a,
    0x63,
    0x12,
    0x58,
    0xd6,
    0x9c,
    0xf7,
    0xa2,
    0xde,
    0xf9,
    0xde,
    0x14,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0x10};

    public static void A(long[] o, long[] a, long[] b)
    {
        for (var i = 0; i < 16; i++)
        {
            o[i] = a[i] + b[i];
        }
    }

    public static void Z(long[] o, long[] a, long[] b)
    {
        for (var i = 0; i < 16; i++)
        {
            o[i] = a[i] - b[i];
        }
    }

    public static void M(long[] o, long[] a, long[] b)
    {
        long t0 = 0;
        long t1 = 0;
        long t2 = 0;
        long t3 = 0;
        long t4 = 0;
        long t5 = 0;
        long t6 = 0;
        long t7 = 0;
        long t8 = 0;
        long t9 = 0;
        long t10 = 0;
        long t11 = 0;
        long t12 = 0;
        long t13 = 0;
        long t14 = 0;
        long t15 = 0;
        long t16 = 0;
        long t17 = 0;
        long t18 = 0;
        long t19 = 0;
        long t20 = 0;
        long t21 = 0;
        long t22 = 0;
        long t23 = 0;
        long t24 = 0;
        long t25 = 0;
        long t26 = 0;
        long t27 = 0;
        long t28 = 0;
        long t29 = 0;
        long t30 = 0;

        long b0 = b[0];
        long b1 = b[1];
        long b2 = b[2];
        long b3 = b[3];
        long b4 = b[4];
        long b5 = b[5];
        long b6 = b[6];
        long b7 = b[7];
        long b8 = b[8];
        long b9 = b[9];
        long b10 = b[10];
        long b11 = b[11];
        long b12 = b[12];
        long b13 = b[13];
        long b14 = b[14];
        long b15 = b[15];

        long v = a[0];
        t0 += v * b0;
        
        t1 += v * b1;
        t2 += v * b2;
        t3 += v * b3;
        t4 += v * b4;
        t5 += v * b5;
        t6 += v * b6;
        t7 += v * b7;
        t8 += v * b8;
        t9 += v * b9;
        t10 += v * b10;
        t11 += v * b11;
        t12 += v * b12;
        t13 += v * b13;
        t14 += v * b14;
        t15 += v * b15;

        v = a[1];
        t1 += v * b0;
        t2 += v * b1;
        t3 += v * b2;
        t4 += v * b3;
        t5 += v * b4;
        t6 += v * b5;
        t7 += v * b6;
        t8 += v * b7;
        t9 += v * b8;
        t10 += v * b9;
        t11 += v * b10;
        t12 += v * b11;
        t13 += v * b12;
        t14 += v * b13;
        t15 += v * b14;
        t16 += v * b15;
        v = a[2];
        t2 += v * b0;
        t3 += v * b1;
        t4 += v * b2;
        t5 += v * b3;
        t6 += v * b4;
        t7 += v * b5;
        t8 += v * b6;
        t9 += v * b7;
        t10 += v * b8;
        t11 += v * b9;
        t12 += v * b10;
        t13 += v * b11;
        t14 += v * b12;
        t15 += v * b13;
        t16 += v * b14;
        t17 += v * b15;
        v = a[3];

        t3 += v * b0;
        t4 += v * b1;
        t5 += v * b2;
        t6 += v * b3;
        t7 += v * b4;
        t8 += v * b5;
        t9 += v * b6;
        t10 += v * b7;
        t11 += v * b8;
        t12 += v * b9;
        t13 += v * b10;
        t14 += v * b11;
        t15 += v * b12;
        t16 += v * b13;
        t17 += v * b14;
        t18 += v * b15;
        v = a[4];
        t4 += v * b0;
        t5 += v * b1;
        t6 += v * b2;
        t7 += v * b3;
        t8 += v * b4;
        t9 += v * b5;
        t10 += v * b6;
        t11 += v * b7;
        t12 += v * b8;
        t13 += v * b9;
        t14 += v * b10;
        t15 += v * b11;
        t16 += v * b12;
        t17 += v * b13;
        t18 += v * b14;
        t19 += v * b15;
        v = a[5];
        t5 += v * b0;
        t6 += v * b1;
        t7 += v * b2;
        t8 += v * b3;
        t9 += v * b4;
        t10 += v * b5;
        t11 += v * b6;
        t12 += v * b7;
        t13 += v * b8;
        t14 += v * b9;
        t15 += v * b10;
        t16 += v * b11;
        t17 += v * b12;
        t18 += v * b13;
        t19 += v * b14;
        t20 += v * b15;
        v = a[6];
        t6 += v * b0;
        t7 += v * b1;
        t8 += v * b2;
        t9 += v * b3;
        t10 += v * b4;
        t11 += v * b5;
        t12 += v * b6;
        t13 += v * b7;
        t14 += v * b8;
        t15 += v * b9;
        t16 += v * b10;
        t17 += v * b11;
        t18 += v * b12;
        t19 += v * b13;
        t20 += v * b14;
        t21 += v * b15;
        v = a[7];
        t7 += v * b0;
        t8 += v * b1;
        t9 += v * b2;
        t10 += v * b3;
        t11 += v * b4;
        t12 += v * b5;
        t13 += v * b6;
        t14 += v * b7;
        t15 += v * b8;
        t16 += v * b9;
        t17 += v * b10;
        t18 += v * b11;
        t19 += v * b12;
        t20 += v * b13;
        t21 += v * b14;
        t22 += v * b15;
        v = a[8];
        t8 += v * b0;
        t9 += v * b1;
        t10 += v * b2;
        t11 += v * b3;
        t12 += v * b4;
        t13 += v * b5;
        t14 += v * b6;
        t15 += v * b7;
        t16 += v * b8;
        t17 += v * b9;
        t18 += v * b10;
        t19 += v * b11;
        t20 += v * b12;
        t21 += v * b13;
        t22 += v * b14;
        t23 += v * b15;
        v = a[9];
        t9 += v * b0;
        t10 += v * b1;
        t11 += v * b2;
        t12 += v * b3;
        t13 += v * b4;
        t14 += v * b5;
        t15 += v * b6;
        t16 += v * b7;
        t17 += v * b8;
        t18 += v * b9;
        t19 += v * b10;
        t20 += v * b11;
        t21 += v * b12;
        t22 += v * b13;
        t23 += v * b14;
        t24 += v * b15;
        v = a[10];
        t10 += v * b0;
        t11 += v * b1;
        t12 += v * b2;
        t13 += v * b3;
        t14 += v * b4;
        t15 += v * b5;
        t16 += v * b6;
        t17 += v * b7;
        t18 += v * b8;
        t19 += v * b9;
        t20 += v * b10;
        t21 += v * b11;
        t22 += v * b12;
        t23 += v * b13;
        t24 += v * b14;
        t25 += v * b15;
        v = a[11];
        t11 += v * b0;
        t12 += v * b1;
        t13 += v * b2;
        t14 += v * b3;
        t15 += v * b4;
        t16 += v * b5;
        t17 += v * b6;
        t18 += v * b7;
        t19 += v * b8;
        t20 += v * b9;
        t21 += v * b10;
        t22 += v * b11;
        t23 += v * b12;
        t24 += v * b13;
        t25 += v * b14;
        t26 += v * b15;
        v = a[12];
        t12 += v * b0;
        t13 += v * b1;
        t14 += v * b2;
        t15 += v * b3;
        t16 += v * b4;
        t17 += v * b5;
        t18 += v * b6;
        t19 += v * b7;
        t20 += v * b8;
        t21 += v * b9;
        t22 += v * b10;
        t23 += v * b11;
        t24 += v * b12;
        t25 += v * b13;
        t26 += v * b14;
        t27 += v * b15;
        v = a[13];
        t13 += v * b0;
        t14 += v * b1;
        t15 += v * b2;
        t16 += v * b3;
        t17 += v * b4;
        t18 += v * b5;
        t19 += v * b6;
        t20 += v * b7;
        t21 += v * b8;
        t22 += v * b9;
        t23 += v * b10;
        t24 += v * b11;
        t25 += v * b12;
        t26 += v * b13;
        t27 += v * b14;
        t28 += v * b15;
        v = a[14];
        t14 += v * b0;
        t15 += v * b1;
        t16 += v * b2;
        t17 += v * b3;
        t18 += v * b4;
        t19 += v * b5;
        t20 += v * b6;
        t21 += v * b7;
        t22 += v * b8;
        t23 += v * b9;
        t24 += v * b10;
        t25 += v * b11;
        t26 += v * b12;
        t27 += v * b13;
        t28 += v * b14;
        t29 += v * b15;
        v = a[15];
        t15 += v * b0;
        t16 += v * b1;
        t17 += v * b2;
        t18 += v * b3;
        t19 += v * b4;
        t20 += v * b5;
        t21 += v * b6;
        t22 += v * b7;
        t23 += v * b8;
        t24 += v * b9;
        t25 += v * b10;
        t26 += v * b11;
        t27 += v * b12;
        t28 += v * b13;
        t29 += v * b14;
        t30 += v * b15;

        t0 += 38 * t16;
        t1 += 38 * t17;
        t2 += 38 * t18;
        t3 += 38 * t19;
        t4 += 38 * t20;
        t5 += 38 * t21;
        t6 += 38 * t22;
        t7 += 38 * t23;
        t8 += 38 * t24;
        t9 += 38 * t25;
        t10 += 38 * t26;
        t11 += 38 * t27;
        t12 += 38 * t28;
        t13 += 38 * t29;
        t14 += 38 * t30;
        // t15 left as is

        // first car
        long c = 1;
        v = t0 + c + 0xffff;
        c = v / 0x10000;
        t0 = v - c * 0x10000;
        v = t1 + c + 0xffff;
        c = v / 0x10000;
        t1 = v - c * 0x10000;
        v = t2 + c + 0xffff;
        c = v / 0x10000;
        t2 = v - c * 0x10000;
        v = t3 + c + 0xffff;
        c = v / 0x10000;
        t3 = v - c * 0x10000;
        v = t4 + c + 0xffff;
        c = v / 0x10000;
        t4 = v - c * 0x10000;
        v = t5 + c + 0xffff;
        c = v / 0x10000;
        t5 = v - c * 0x10000;
        v = t6 + c + 0xffff;
        c = v / 0x10000;
        t6 = v - c * 0x10000;
        v = t7 + c + 0xffff;
        c = v / 0x10000;
        t7 = v - c * 0x10000;
        v = t8 + c + 0xffff;
        c = v / 0x10000;
        t8 = v - c * 0x10000;
        v = t9 + c + 0xffff;
        c = v / 0x10000;
        t9 = v - c * 0x10000;
        v = t10 + c + 0xffff;
        c = v / 0x10000;
        t10 = v - c * 0x10000;
        v = t11 + c + 0xffff;
        c = v / 0x10000;
        t11 = v - c * 0x10000;
        v = t12 + c + 0xffff;
        c = v / 0x10000;
        t12 = v - c * 0x10000;
        v = t13 + c + 0xffff;
        c = v / 0x10000;
        t13 = v - c * 0x10000;
        v = t14 + c + 0xffff;
        c = v / 0x10000;
        t14 = v - c * 0x10000;
        v = t15 + c + 0xffff;
        c = v / 0x10000;
        t15 = v - c * 0x10000;
        t0 += c - 1 + 37 * (c - 1);

        // second car
        c = 1;
        v = t0 + c + 0xffff;
        c = v / 0x10000;
        t0 = v - c * 0x10000;
        v = t1 + c + 0xffff;
        c = v / 0x10000;
        t1 = v - c * 0x10000;
        v = t2 + c + 0xffff;
        c = v / 0x10000;
        t2 = v - c * 0x10000;
        v = t3 + c + 0xffff;
        c = v / 0x10000;
        t3 = v - c * 0x10000;
        v = t4 + c + 0xffff;
        c = v / 0x10000;
        t4 = v - c * 0x10000;
        v = t5 + c + 0xffff;
        c = v / 0x10000;
        t5 = v - c * 0x10000;
        v = t6 + c + 0xffff;
        c = v / 0x10000;
        t6 = v - c * 0x10000;
        v = t7 + c + 0xffff;
        c = v / 0x10000;
        t7 = v - c * 0x10000;
        v = t8 + c + 0xffff;
        c = v / 0x10000;
        t8 = v - c * 0x10000;
        v = t9 + c + 0xffff;
        c = v / 0x10000;
        t9 = v - c * 0x10000;
        v = t10 + c + 0xffff;
        c = v / 0x10000;
        t10 = v - c * 0x10000;
        v = t11 + c + 0xffff;
        c = v / 0x10000;
        t11 = v - c * 0x10000;
        v = t12 + c + 0xffff;
        c = v / 0x10000;
        t12 = v - c * 0x10000;
        v = t13 + c + 0xffff;
        c = v / 0x10000;
        t13 = v - c * 0x10000;
        v = t14 + c + 0xffff;
        c = v / 0x10000;
        t14 = v - c * 0x10000;
        v = t15 + c + 0xffff;
        c = v / 0x10000;
        t15 = v - c * 0x10000;
        t0 += c - 1 + 37 * (c - 1);
        
        o[0] = t0;
        o[1] = t1;
        o[2] = t2;
        o[3] = t3;
        o[4] = t4;
        o[5] = t5;
        o[6] = t6;
        o[7] = t7;
        o[8] = t8;
        o[9] = t9;
        o[10] = t10;
        o[11] = t11;
        o[12] = t12;
        o[13] = t13;
        o[14] = t14;
        o[15] = t15;
    }

    public static void S(long[] o, long[] a)
    {
        M(o, a, a);
    }

    public static long Vn(long[] x, int xi, long[] y, int yi, int n)
    {
        long d = 0;
        for (var i = 0; i < n; i++)
        {
            d |= x[xi + i] ^ y[yi + i];
        }
        return (1 & ((d - 1) >> 8)) - 1;
    }

    public static void Pow2523(long[] o, long[] i)
    {
        var c = Gf();
        for (var a = 0; a < 16; a++)
        {
            c[a] = i[a];
        }
        for (var a = 250; a >= 0; a--)
        {
            S(c, c);
            if (a != 1)
            {
                M(c, c, i);
            }
        }
        for (var a = 0; a < 16; a++)
        {
            o[a] = c[a];
        }
    }

    public static void Inv25519(long[] o, long[] i)
    {
        var c = Gf();
        for (var a = 0; a < 16; a++)
        {
            c[a] = i[a];
        }
        for (var a = 253; a >= 0; a--)
        {
            S(c, c);
            if (a != 2 && a != 4)
            {
                M(c, c, i);
            }
        }
        for (var a = 0; a < 16; a++)
        {
            o[a] = c[a];
        }
    }

    public static void Set25519(long[] r, long[] a)
    {
        for (var i = 0; i < 16; i++)
        {
            r[i] = a[i] | 0;
        }
    }

    public static void Car25519(long[] o)
    {
        long c = 1;
        for (var i = 0; i < 16; i++)
        {
            var v = o[i] + c + 0xffff;
            c = v / 0x10000;
            o[i] = v - c * 0x10000;
        }
        o[0] += c - 1 + 37 * (c - 1);
    }

    public static void Sel25519(long[] p, long[] q, long b)
    {
        var c = ~(b - 1);
        for (var i = 0; i < 16; i++)
        {
            var t = c & (p[i] ^ q[i]);
            p[i] ^= t;
            q[i] ^= t;
        }
    }

    public static void Pack25519(long[] o, long[] n)
    {
        var m = Gf();
        var t = Gf();
        for (var i = 0; i < 16; i++)
        {
            t[i] = n[i];
        }
        Car25519(t);
        Car25519(t);
        Car25519(t);
        for (var j = 0; j < 2; j++)
        {
            m[0] = t[0] - 0xffed;
            for (var i = 1; i < 15; i++)
            {
                m[i] = t[i] - 0xffff - ((m[i - 1] >> 16) & 1);
                m[i - 1] &= 0xffff;
            }
            m[15] = t[15] - 0x7fff - ((m[14] >> 16) & 1);
            var b = (m[15] >> 16) & 1;
            m[14] &= 0xffff;
            Sel25519(t, m, 1 - b);
        }
        for (var i = 0; i < 16; i++)
        {
            o[2 * i] = t[i] & 0xff;
            o[2 * i + 1] = t[i] >> 8;
        }
    }

    public static void Cswap(long[][] p, long[][] q, int b)
    {
        for (var i = 0; i < 4; i++)
        {
            Sel25519(p[i], q[i], b);
        }
    }

    public static long Neq25519(long[] a, long[] b)
    {
        var c = new long[32];
        var d = new long[32];
        Pack25519(c, a);
        Pack25519(d, b);
        return CryptoVerify32(c, 0, d, 0);
    }

    public static long CryptoVerify32(long[] x, int xi, long[] y, int yi)
    {
        return Vn(x, xi, y, yi, 32);
    }

    public static long Par25519(long[] a)
    {
        var d = new long[32];
        Pack25519(d, a);
        return d[0] & 1;
    }

    public static void Unpack25519(long[] o, byte[] n)
    {
        for (var i = 0; i < 16; i++)
        {
            o[i] = n[2 * i] + (n[2 * i + 1] << 8);
        }
        o[15] &= 0x7fff;
    }

    public static void Add(IReadOnlyList<long[]> p, IReadOnlyList<long[]> q)
    {
        var a = Gf();
        var b = Gf();
        var c = Gf();
        var d = Gf();
        var e = Gf();
        var f = Gf();
        var g = Gf();
        var h = Gf();
        var t = Gf();

        Z(a, p[1], p[0]);
        Z(t, q[1], q[0]);
        M(a, a, t);
        A(b, p[0], p[1]);
        A(t, q[0], q[1]);
        M(b, b, t);
        M(c, p[3], q[3]);
        M(c, c, D2);
        M(d, p[2], q[2]);
        A(d, d, d);
        Z(e, b, a);
        Z(f, d, c);
        A(g, d, c);
        A(h, b, a);

        M(p[0], e, f);
        M(p[1], h, g);
        M(p[2], g, f);
        M(p[3], e, h);
    }

    public static void Pack(long[] r, long[][] p)
    {
        var tx = Gf();
        var ty = Gf();
        var zi = Gf();
        Inv25519(zi, p[2]);
        M(tx, p[0], zi);
        M(ty, p[1], zi);
        Pack25519(r, ty);
        r[31] ^= Par25519(tx) << 7;
    }

    public static void Scalarmult(long[][] p, long[][] q, byte[] s)
    {
        Set25519(p[0], gf0);
        Set25519(p[1], gf1);
        Set25519(p[2], gf1);
        Set25519(p[3], gf0);
        for (var i = 255; i >= 0; --i)
        {
            var b = ((int)s[(i / 8) | 0] >> (i & 7)) & 1;
            Cswap(p, q, b);
            Add(q, p);
            Add(p, p);
            Cswap(p, q, b);
        }
    }

    public static int Unpack(long[][] r, byte[] p)
    {
        var t = Gf();
        var chk = Gf();
        var num = Gf();
        var den = Gf();
        var den2 = Gf();
        var den4 = Gf();
        var den6 = Gf();
        Set25519(r[2], gf1);
        Unpack25519(r[1], p);
        
        // num = u = y^2 - 1
        // den = v = d * y^2 + 1
        S(num, r[1]);
        M(den, num, D);
        Z(num, num, r[2]);
        A(den, r[2], den);
        
        // r[0] = x = sqrt(u / v)
        S(den2, den);
        S(den4, den2);
        M(den6, den4, den2);
        M(t, den6, num);
        M(t, t, den);

        Pow2523(t, t);
        
        M(t, t, num);
        M(t, t, den);
        M(t, t, den);
        M(r[0], t, den);
        
        S(chk, r[0]);
        M(chk, chk, den);
        
        if (Neq25519(chk, num) != 0)
        {
            M(r[0], r[0], I);
        }
        
        S(chk, r[0]);
        M(chk, chk, den);
        if (Neq25519(chk, num) != 0)
        {
            return -1;
        }
        
        if (Par25519(r[0]) == Shr32(p[31], 7))
        {
            Z(r[0], gf0, r[0]);
        }
        
        M(r[3], r[0], r[1]);
        return 0;
    }
    
    private static readonly byte[] iv = {
        0x6a, 0x09, 0xe6, 0x67, 0xf3, 0xbc, 0xc9, 0x08,
        0xbb, 0x67, 0xae, 0x85, 0x84, 0xca, 0xa7, 0x3b,
        0x3c, 0x6e, 0xf3, 0x72, 0xfe, 0x94, 0xf8, 0x2b,
        0xa5, 0x4f, 0xf5, 0x3a, 0x5f, 0x1d, 0x36, 0xf1,
        0x51, 0x0e, 0x52, 0x7f, 0xad, 0xe6, 0x82, 0xd1,
        0x9b, 0x05, 0x68, 0x8c, 0x2b, 0x3e, 0x6c, 0x1f,
        0x1f, 0x83, 0xd9, 0xab, 0xfb, 0x41, 0xbd, 0x6b,
        0x5b, 0xe0, 0xcd, 0x19, 0x13, 0x7e, 0x21, 0x79
    };
    
    public static void CryptoHash(byte[] outp, byte[] m)
    {
        byte[] h = new byte[64], x = new byte[256];
        var n = m.Length;
        var b = n;

        for (var i = 0; i < 64; i++) h[i] = iv[i];

        CryptoHashblocks(h, m, n);
        n %= 128;

        for (var i = 0; i < 256; i++) x[i] = 0;
        for (var i = 0; i < n; i++) x[i] = m[b - n + i];
        x[n] = 128;

        n = 256 - 128 * (n < 112 ? 1 : 0);
        x[n - 9] = 0;
        Ts64(x, n - 8, U64((uint)((b / 0x20000000) | 0), (uint)(b << 3)));
        CryptoHashblocks(h, x, n);

        for (var i = 0; i < 64; i++) outp[i] = h[i];
    }
    
    private static U64Class Dl64(byte[] x, int i)
    {
        var h = (x[i] << 24) | (x[i + 1] << 16) | (x[i + 2] << 8) | x[i + 3];
        var l = (x[i + 4] << 24) | (x[i + 5] << 16) | (x[i + 6] << 8) | x[i + 7];
        return U64((uint)h, (uint)l);
    }
    
    private static U64Class Add64(params U64Class[] arguments)
    {
        uint a = 0, b = 0, c = 0, d = 0, m16 = 0xffff, l, h, i;
        for (i = 0; i < arguments.Length; i++)
        {
            l = arguments[i].Lo;
            h = arguments[i].Hi;
            a += (l & m16); b += (l >> 16);
            c += (h & m16); d += (h >> 16);
        }

        b += (a >> 16);
        c += (b >> 16);
        d += (c >> 16);

        return U64((c & m16) | (d << 16), (a & m16) | (b << 16));
    }
    
    private static U64Class R(U64Class x, int c)
    {
        uint h = 0, l = 0;
        int c1 = 32 - c;
        if (c < 32)
        {
            h = (x.Hi >> c) | (x.Lo << c1);
            l = (x.Lo >> c) | (x.Hi << c1);
        }
        else if (c < 64)
        {
            h = (x.Lo >> c) | (x.Hi << c1);
            l = (x.Hi >> c) | (x.Lo << c1);
        }
        return U64(h, l);
    }
    
    static int Shr32(int x, int n) => (int)(x & 0xffffffff) >> n;
    private static U64Class Shr64(U64Class x, int c)
    {
        return U64((x.Hi >> c), (x.Lo >> c) | (x.Hi << (32 - c)));
    }
    
    private static U64Class Xor64(params U64Class[] arguments)
    {
        uint l = 0, h = 0, i;
        for (i = 0; i < arguments.Length; i++)
        {
            l ^= arguments[i].Lo;
            h ^= arguments[i].Hi;
        }
        return U64(h, l);
    }
    
    private static U64Class Sigma0(U64Class x) { return Xor64(R(x, 28), R(x, 34), R(x, 39)); }
    private static U64Class Sigma1(U64Class x) { return Xor64(R(x, 14), R(x, 18), R(x, 41)); }
    private static U64Class sigma0(U64Class x) { return Xor64(R(x, 1), R(x, 8), Shr64(x, 7)); }
    private static U64Class sigma1(U64Class x) { return Xor64(R(x, 19), R(x, 61), Shr64(x, 6)); }

    private static U64Class Ch(U64Class x, U64Class y, U64Class z)
    {
        uint h = (x.Hi & y.Hi) ^ (~x.Hi & z.Hi),
            l = (x.Lo & y.Lo) ^ (~x.Lo & z.Lo);
        return U64(h, l);
    }
    
    private static U64Class[] K = {
          U64(0x428a2f98, 0xd728ae22), U64(0x71374491, 0x23ef65cd),
          U64(0xb5c0fbcf, 0xec4d3b2f), U64(0xe9b5dba5, 0x8189dbbc),
          U64(0x3956c25b, 0xf348b538), U64(0x59f111f1, 0xb605d019),
          U64(0x923f82a4, 0xaf194f9b), U64(0xab1c5ed5, 0xda6d8118),
          U64(0xd807aa98, 0xa3030242), U64(0x12835b01, 0x45706fbe),
          U64(0x243185be, 0x4ee4b28c), U64(0x550c7dc3, 0xd5ffb4e2),
          U64(0x72be5d74, 0xf27b896f), U64(0x80deb1fe, 0x3b1696b1),
          U64(0x9bdc06a7, 0x25c71235), U64(0xc19bf174, 0xcf692694),
          U64(0xe49b69c1, 0x9ef14ad2), U64(0xefbe4786, 0x384f25e3),
          U64(0x0fc19dc6, 0x8b8cd5b5), U64(0x240ca1cc, 0x77ac9c65),
          U64(0x2de92c6f, 0x592b0275), U64(0x4a7484aa, 0x6ea6e483),
          U64(0x5cb0a9dc, 0xbd41fbd4), U64(0x76f988da, 0x831153b5),
          U64(0x983e5152, 0xee66dfab), U64(0xa831c66d, 0x2db43210),
          U64(0xb00327c8, 0x98fb213f), U64(0xbf597fc7, 0xbeef0ee4),
          U64(0xc6e00bf3, 0x3da88fc2), U64(0xd5a79147, 0x930aa725),
          U64(0x06ca6351, 0xe003826f), U64(0x14292967, 0x0a0e6e70),
          U64(0x27b70a85, 0x46d22ffc), U64(0x2e1b2138, 0x5c26c926),
          U64(0x4d2c6dfc, 0x5ac42aed), U64(0x53380d13, 0x9d95b3df),
          U64(0x650a7354, 0x8baf63de), U64(0x766a0abb, 0x3c77b2a8),
          U64(0x81c2c92e, 0x47edaee6), U64(0x92722c85, 0x1482353b),
          U64(0xa2bfe8a1, 0x4cf10364), U64(0xa81a664b, 0xbc423001),
          U64(0xc24b8b70, 0xd0f89791), U64(0xc76c51a3, 0x0654be30),
          U64(0xd192e819, 0xd6ef5218), U64(0xd6990624, 0x5565a910),
          U64(0xf40e3585, 0x5771202a), U64(0x106aa070, 0x32bbd1b8),
          U64(0x19a4c116, 0xb8d2d0c8), U64(0x1e376c08, 0x5141ab53),
          U64(0x2748774c, 0xdf8eeb99), U64(0x34b0bcb5, 0xe19b48a8),
          U64(0x391c0cb3, 0xc5c95a63), U64(0x4ed8aa4a, 0xe3418acb),
          U64(0x5b9cca4f, 0x7763e373), U64(0x682e6ff3, 0xd6b2b8a3),
          U64(0x748f82ee, 0x5defb2fc), U64(0x78a5636f, 0x43172f60),
          U64(0x84c87814, 0xa1f0ab72), U64(0x8cc70208, 0x1a6439ec),
          U64(0x90befffa, 0x23631e28), U64(0xa4506ceb, 0xde82bde9),
          U64(0xbef9a3f7, 0xb2c67915), U64(0xc67178f2, 0xe372532b),
          U64(0xca273ece, 0xea26619c), U64(0xd186b8c7, 0x21c0c207),
          U64(0xeada7dd6, 0xcde0eb1e), U64(0xf57d4f7f, 0xee6ed178),
          U64(0x06f067aa, 0x72176fba), U64(0x0a637dc5, 0xa2c898a6),
          U64(0x113f9804, 0xbef90dae), U64(0x1b710b35, 0x131c471b),
          U64(0x28db77f5, 0x23047d84), U64(0x32caab7b, 0x40c72493),
          U64(0x3c9ebe0a, 0x15c9bebc), U64(0x431d67c4, 0x9c100d4c),
          U64(0x4cc5d4be, 0xcb3e42b6), U64(0x597f299c, 0xfc657e2a),
          U64(0x5fcb6fab, 0x3ad6faec), U64(0x6c44198c, 0x4a475817)
        };
    
    private static U64Class Maj(U64Class x, U64Class y, U64Class z)
    {
        uint h = (x.Hi & y.Hi) ^ (x.Hi & z.Hi) ^ (y.Hi & z.Hi),
            l = (x.Lo & y.Lo) ^ (x.Lo & z.Lo) ^ (y.Lo & z.Lo);
        return U64(h, l);
    }
    
    private static int CryptoHashblocks(byte[] x, byte[] m, int n)
    {
        var z = new U64Class[8];
        var b = new U64Class[8];
        var a = new U64Class[8];
        var w = new U64Class[16];
        U64Class t = new();

        for (var i = 0; i < 8; i++) z[i] = a[i] = Dl64(x, 8 * i);

        var pos = 0;
        while (n >= 128)
        {
            for (var i = 0; i < 16; i++) w[i] = Dl64(m, 8 * i + pos);
            for (var i = 0; i < 80; i++)
            {
                for (var j = 0; j < 8; j++) b[j] = a[j];
                t = Add64(a[7], Sigma1(a[4]), Ch(a[4], a[5], a[6]), K[i], w[i % 16]);
                b[7] = Add64(t, Sigma0(a[0]), Maj(a[0], a[1], a[2]));
                b[3] = Add64(b[3], t);
                for (var j = 0; j < 8; j++) a[(j + 1) % 8] = b[j];
                if (i % 16 == 15)
                {
                    for (var j = 0; j < 16; j++)
                    {
                        w[j] = Add64(w[j], w[(j + 9) % 16], sigma0(w[(j + 1) % 16]), sigma1(w[(j + 14) % 16]));
                    }
                }
            }

            for (var i = 0; i < 8; i++)
            {
                a[i] = Add64(a[i], z[i]);
                z[i] = a[i];
            }

            pos += 128;
            n -= 128;
        }

        for (var i = 0; i < 8; i++) Ts64(x, 8 * i, z[i]);
        return n;
    }
    
    private static void Ts64(byte[] x, int i, U64Class u)
    {
        x[i] = (byte)((u.Hi >> 24) & 0xff);
        x[i + 1] = (byte)((u.Hi >> 16) & 0xff);
        x[i + 2] = (byte)((u.Hi >> 8) & 0xff);
        x[i + 3] = (byte)(u.Hi & 0xff);
        x[i + 4] = (byte)((u.Lo >> 24) & 0xff);
        x[i + 5] = (byte)((u.Lo >> 16) & 0xff);
        x[i + 6] = (byte)((u.Lo >> 8) & 0xff);
        x[i + 7] = (byte)(u.Lo & 0xff);
    }
    
    private static U64Class U64(uint h, uint l)
    {
        return new U64Class(h, l);
    }
    
    internal class U64Class
    {
        public uint Hi { get; set; }
        public uint Lo { get; set; }

        public U64Class()
        {
            Hi = 0;
            Lo = 0;
        }

        public U64Class(uint hi, uint lo)
        {
            Hi = hi;
            Lo = lo;
        }

        public uint ToUint()
        {
            uint x = Hi;
            x = (x << 32);
            x = x | Lo;
            return x;
        }

        public static U64Class ToU64Class(uint x)
        {
            uint hi = (uint)(x >> 32);
            uint lo = (uint)(x & 0xffffffff);
            return new U64Class(hi, lo);
        }
    }
}