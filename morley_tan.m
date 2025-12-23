-* 'Tangent only' proof of Morley's theorem *-

uglyp = x -> print(toString(x))

-* t1, t2, t3 are angles rotated one-third of way from base edge to
other edge *-
R = QQ[a,b,t1,t2,t3]

-* Tan addition formula *-
addt = (x,y) -> (x + y)/(1 - x*y)

-* Finds lines connecting two point or point of intersection of two
lines (in projective space) *-
mnrs = m -> matrix{{det(m_{1,2}),det(m_{2,0}),det(m_{0,1})}}

-* These are the trisectors.  Second subscript '1' is rotating
cclockwise if b > 0.  '2' is clockwise. *-
t11 = mnrs(matrix{{0,0,1},{1,t1,1}})
t12 = mnrs(matrix{{0,0,1},{1,addt(t1,t1),1}})
t21 = mnrs(matrix{{1,0,1},{0,-addt(b/(a-1),t2),1}})
t22 = mnrs(matrix{{1,0,1},{0,-addt(addt(b/(a-1),t2),t2),1}})
t31 = mnrs(matrix{{a,b,1},{a + 1,b + addt(b/a,t3),1}})
t32 = mnrs(matrix{{a,b,1},{a + 1,b + addt(addt(b/a,t3),t3),1}})

-* Trisector points of intersection *-
p12 = mnrs(t11||t22)
p23 = mnrs(t21||t32)
p31 = mnrs(t31||t12)

-* Edges of triangle formed by these intersections *-
e1 = mnrs(p12||p31)
e2 = mnrs(p12||p23)
e3 = mnrs(p23||p31)

-* The slopes of these edges *-
m1 = -e1_(0,0)/e1_(0,1)
m2 = -e2_(0,0)/e2_(0,1)
m3 = -e3_(0,0)/e3_(0,1)

-* Angle between these edges.  These should all be 60 degrees. *-
a1 = (m1 - m2)/(1 + m1*m2)
a1n = numerator(a1)
a1d = denominator(a1)

a2 = (m1 - m3)/(1 + m1*m3)
a2n = numerator(a2)
a2d = denominator(a2)

-* Maxima derived relations *-

-- Numerator of addt(0,addt(addt(t1,t1),t1)) - b/a
r1 = a*t1^3-3*b*t1^2-3*a*t1+b
-- Numerator of addt(b/(a - 1),addt(addt(t2,t2),t2)) - 0
r2 = (-a*t2^3)+t2^3-3*b*t2^2+3*a*t2-3*t2+b
-- Numerator of addt(b/a,addt(addt(t3,t3),t3)) - b/(a - 1)
r3 = (-b^2*t3^3)-a^2*t3^3+a*t3^3+3*b*t3^2+3*b^2*t3+3*a^2*t3-3*a*t3-b
-* 'Regularizer' to make sure that trisector angles sum to sixty
degrees. *-
r4 = (t1^2*t2^2*t3^2-3*t2^2*t3^2-8*t1*t2*t3^2-3*t1^2*t3^2+t3^2-8*t1*t2^2*t3 
                      -8*t1^2*t2*t3+8*t2*t3+8*t1*t3-3*t1^2*t2^2+t2^2+8*t1*t2 
                                            +t1^2-3 )
S = R/(r1,r2,r3,r4)

a1n = promote(a1n,S)
a1d = promote(a1d,S)
a2n = promote(a2n,S)
a2d = promote(a2d,S)

-- Double check that I haven't 'zero-ized' the entire ring.
uglyp(1_S)
-- Must have a1n/a1d = sqrt(3)
uglyp(a1n^2 - 3*a1d^2)
uglyp(a2n^2 - 3*a2d^2)
exit 0
