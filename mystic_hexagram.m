R = QQ[x0,y0,z0,
    x1,y1,z1,
    x2,y2,z2,
    x3,y3,z3,
    x4,y4,z4,
    x5,y5,z5,a,b]/(
        a*x0^2 + b*y0^2 + z0^2,
        a*x1^2 + b*y1^2 + z1^2,
        a*x2^2 + b*y2^2 + z2^2,
        a*x3^2 + b*y3^2 + z3^2,
        a*x4^2 + b*y4^2 + z4^2,
        a*x5^2 + b*y5^2 + z5^2);

M0 = matrix{{x0,y0,z0},{x1,y1,z1}};
M1 = matrix{{x1,y1,z1},{x2,y2,z2}};
M2 = matrix{{x2,y2,z2},{x3,y3,z3}};
M3 = matrix{{x3,y3,z3},{x4,y4,z4}};
M4 = matrix{{x4,y4,z4},{x5,y5,z5}};
M5 = matrix{{x5,y5,z5},{x0,y0,z0}};

L0 = matrix{{det(M0_{1,2}), det(M0_{2,0}), det(M0_{0,1})}};
L1 = matrix{{det(M1_{1,2}), det(M1_{2,0}), det(M1_{0,1})}};
L2 = matrix{{det(M2_{1,2}), det(M2_{2,0}), det(M2_{0,1})}};
L3 = matrix{{det(M3_{1,2}), det(M3_{2,0}), det(M3_{0,1})}};
L4 = matrix{{det(M4_{1,2}), det(M4_{2,0}), det(M4_{0,1})}};
L5 = matrix{{det(M5_{1,2}), det(M5_{2,0}), det(M5_{0,1})}};

m03 = L0||L3;
m14 = L1||L4;
m25 = L2||L5;

p1 = matrix{{det(m03_{1,2}),det(m03_{2,0}),det(m03_{0,1})}};
p2 = matrix{{det(m14_{1,2}),det(m14_{2,0}),det(m14_{0,1})}};
p3 = matrix{{det(m25_{1,2}),det(m25_{2,0}),det(m25_{0,1})}};

m = p1||p2||p3;
<< "Determinant is "
<< det(m);
