K = nfinit(polcyclo(3));
d = -a*x^2 - b*x;
e = -b*x^2 - c*x;
f = -c*x^2 - a*x;
c1 = a + b + d
c2 = b + c + e
c3 = c + a + f
print(Mod(c1 + c2*x + c3*x^2,K.pol))
quit()
