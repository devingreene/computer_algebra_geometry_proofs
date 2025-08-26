-* Proof of Morley's theorem *-

-*
    Uses the fact that (a,b,c) is an equilateral triangle iff
            a + zeta b + zeta^2 c == 0
         or a + zeta^2 b zeta c == 0
    where zeta = primitive cube root of unity
*-

F = frac (ZZ[a,b])
R = F[sr3,r_0..r_1,c_0..c_1,s_0..s_1]

-* The vertices of the triangle *-
v0 = matrix{{0},{0}}
v1 = matrix{{1},{0}}
v2 = matrix{{a},{b}}

-* Vector edges *-
ar0 = v1 - v0
ar1 = v2 - v1
ar2 = v0 - v2

Ones = matrix{{1,1}}

-* Rotation matrix *-
third = (x,y) -> matrix{{x,-y},{y,x}}

third0 = third(c_0,s_0)
third0inv = transpose third0
third1 = third(c_1,s_1)
third1inv = transpose third1

rot60 = matrix{{1/2,-sr3/2},{sr3/2,1/2}}

I = ideal(
    sr3^2 - 3, -- sqrt(3)
    c_0^2 + s_0^2 - 1,
    c_1^2 + s_1^2 - 1,
    -* Rotate edges into each other *-
    r_0*third0^3*ar0 + ar2,
    r_1*third1^3*ar1 + ar0
   ) 

-* Sum of trisectors is 60 degress *-
third2 = rot60*third0inv*third1inv

Q = R/I

third0 = promote(third0,Q)
third1 = promote(third1,Q)
third2 = promote(third2,Q)

-* Emulate multiplication by third root of unity *-
rot120 = matrix{{-1/2,-sr3/2},{sr3/2,-1/2}}

a0 = (v0 | (v0 + third0*ar0))||Ones
l0 = det(a0^{1,2})||det(a0^{2,0})||det(a0^{0,1})

a1 = (v1 | (v1 + third1^2*ar1))||Ones
l1 = det(a1^{1,2})||det(a1^{2,0})||det(a1^{0,1})

a2 = (v1 | (v1 + third1*ar1))||Ones
l2 = det(a2^{1,2})||det(a2^{2,0})||det(a2^{0,1})

a3 = (v2 | (v2 + third2^2*ar2))||Ones
l3 = det(a3^{1,2})||det(a3^{2,0})||det(a3^{0,1})

a4 = (v2 | (v2 + third2*ar2))||Ones
l4 = det(a4^{1,2})||det(a4^{2,0})||det(a4^{0,1})

a5 = (v0 | (v0 + third0^2*ar0))||Ones
l5 = det(a5^{1,2})||det(a5^{2,0})||det(a5^{0,1})

b0 = l0|l1
b1 = l2|l3
b2 = l4|l5

p0_0 = det(b0^{1,2})||det(b0^{2,0})
p1_0 = det(b1^{1,2})||det(b1^{2,0})
p2_0 = det(b2^{1,2})||det(b2^{2,0})

-* These are the points of the triangle we wish to show is equilateral *-
p0 = p0_0*det(b1^{0,1})*det(b2^{0,1})
p1 = p1_0*det(b2^{0,1})*det(b0^{0,1})
p2 = p2_0*det(b0^{0,1})*det(b1^{0,1})

<< "Safety check.  Have I mod'ed out the whole ring? (Should be -1-)" << endl
<< 1_Q << endl
<< "Either this:" << endl << p0 + rot120 * p1 + rot120^2 * p2 << endl
<< "or this: " << endl << p0 + rot120^2 * p1 + rot120 * p2 << endl
<< "should be zero" << endl
<< "but not both." << endl
