-- Triangle bisectors common intersection point.

-- Here is an interesting computational way of doing it. This shows (if
-- I have not made any errors) that one can increment each slope by 90
-- degress.  If the the total rotation is 90 mod 180, then the lines
-- switch from having a common intersection point to not having a common
-- intersection point.  This implies the following geometric result
-- which I wasn't aware of:
--
--      On a triangle ABC.  The bisector at A and the two lines
--      perpendicular to the other two bisectors at B and C intersect at
--      common point

mnrs = m -> matrix{{det(m_{1,2}),det(m_{2,0}),det(m_{0,1})}}
addt = (x,y) -> (x+y)/(1 - x*y)

R = QQ[a,b,t1,t2,t3]

-- Copy and pasted from maxima
r1 = b*t1^2+2*a*t1-b
r2 = (b*t2^2+(2-2*a)*t2-b)
r3 = (-b*t3^2)-2*b^2*t3-2*a^2*t3+2*a*t3+b

bs1 = mnrs(matrix{{0,0,1},{1,t1,1}})
bs2 = mnrs(matrix{{1,0,1},{0,-addt(b/(a - 1),t2),1}})
bs3 = mnrs(matrix{{a,b,1},{a + 1,b + addt(b/a,t3),1}})

bs1alt = mnrs(matrix{{0,0,1},{1,-1/t1,1}})

p1 = mnrs(bs2||bs3)
p2 = mnrs(bs1||bs3)
p3 = mnrs(bs1||bs2)

p1alt = p1
p2alt = mnrs(bs1alt||bs3)
p3alt = mnrs(bs1alt||bs2)

D = det(p1||p2||p3)
Dalt = det(p1alt||p2alt||p3alt)

Dn = numerator(D)
Dd = denominator(D)

Dnalt = numerator(Dalt)
Ddalt = denominator(Dalt)

S = R/(r1,r2,r3)

Dn = promote(Dn,S)
Dd = promote(Dd,S)
Dnalt = promote(Dnalt,S)
Ddalt = promote(Ddalt,S)

<< Dn*Dnalt == 0 << endl
<< Dd*Ddalt != 0 << endl

-- Check a minor
<< det(p2||p3)_{1,2} != 0 << endl
<< "Please examine source code for clarification" << endl
exit 0
-- vim: ft=
