-- Proof of Napolean's theorem using fact that tan(30) = 1/sqrt(3),
-- tan(60) = sqrt(3), and tan subtraction formula.
--
-- It should be pointed out that this also shows that the equilateral
-- triangles can be on the interior of the triangle and the result still
-- holds.

mnrs = m -> matrix{{det(m_{1,2}),det(m_{2,0}),det(m_{0,1})}}

-- t = tan(30)
R = QQ[a,b,t]/(3*t^2  - 1)

p1 = matrix{{1,-t,1}}
p2 = matrix{{1 + a + t*b,b - t*(a - 1),1}}
p3 = matrix{{a - t*b,b + t*a,1}}

e1 = mnrs(p2||p3)
e2 = mnrs(p3||p1)
e3 = mnrs(p1||p2)

rel1 = ( (e1_(0,0)*e2_(0,1) - e2_(0,0)*e1_(0,1))^2 -
    3*(e1_(0,1)*e2_(0,1) + e1_(0,0)*e2_(0,0))^2 )
rel2 = ( (e1_(0,0)*e3_(0,1) - e3_(0,0)*e1_(0,1))^2 -
    3*(e1_(0,1)*e3_(0,1) + e1_(0,0)*e3_(0,0))^2 )
rel3 = ( (e2_(0,0)*e3_(0,1) - e3_(0,0)*e2_(0,1))^2 -
    3*(e2_(0,1)*e3_(0,1) + e2_(0,0)*e3_(0,0))^2 )

<< rel1 == 0 and rel2 == 0 and rel3 == 0 << endl

exit 0
