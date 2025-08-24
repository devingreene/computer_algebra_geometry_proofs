R = QQ[a,b,c,z]/(z^2 + z + 1);

d = -a*z^2 - b*z;
e = -b*z^2 - c*z;
f = -c*z^2 - a*z;

p0 = a + b + d;
p1 = b + c + e;
p2 = c + a + f;

<< p0 + p1*z + p2*z^2 << " <- this should be 0"
