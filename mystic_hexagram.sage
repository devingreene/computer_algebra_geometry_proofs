#!/usr/bin/sage
R.<x1,x2,x3,x4,x5,x6,y1,y2,y3,y4,y5,y6,a,b> = ZZ[]

A12,B12,C12 = (y1 - y2),(x2 - x1),x1*y2-x2*y1
A23,B23,C23 = (y2 - y3),(x3 - x2),x2*y3-x3*y2
A34,B34,C34 = (y3 - y4),(x4 - x3),x3*y4-x4*y3
A45,B45,C45 = (y4 - y5),(x5 - x4),x4*y5-x5*y4
A56,B56,C56 = (y5 - y6),(x6 - x5),x5*y6-x6*y5
A61,B61,C61 = (y6 - y1),(x1 - x6),x6*y1-x1*y6

p14x = B12*C45 - C12*B45
p14y = C12*A45 - A12*C45
D14 = A12*B45 - B12*A45

p25x = B23*C56 - C23*B56
p25y = C23*A56 - A23*C56
D25 = A23*B56 - B23*A56

p36x = B34*C61 - C34*B61
p36y = C34*A61 - A34*C61
D36 = A34*B61 - B34*A61

D = det(matrix(
    [[p14x,p14y,D14],
    [p25x,p25y,D25],
    [p36x,p36y,D36]],
    ))
assert D.parent() == R

I = [a*x^2 + b*y^2 - 1 for x,y in zip([x1,x2,x3,x4,x5,x6],[y1,y2,y3,y4,y5,y6])]
print(D.mod(I))
