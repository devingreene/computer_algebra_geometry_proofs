#!/usr/bin/sage

R.<x1,x2,x3,x4,x5,x6,y1,y2,y3,y4,y5,y6,z1,z2,z3,z4,z5,z6> = ZZ[]

A12,B12,C12 = y1*z2-y2*z1,z1*x2-z2*x1,x1*y2-x2*y1
A23,B23,C23 = y2*z3-y3*z2,z2*x3-z3*x2,x2*y3-x3*y2
A34,B34,C34 = y3*z4-y4*z3,z3*x4-z4*x3,x3*y4-x4*y3
A45,B45,C45 = y4*z5-y5*z4,z4*x5-z5*x4,x4*y5-x5*y4
A56,B56,C56 = y5*z6-y6*z5,z5*x6-z6*x5,x5*y6-x6*y5
A61,B61,C61 = y6*z1-y1*z6,z6*x1-z1*x6,x6*y1-x1*y6

p14x = B12*C45 - C12*B45
p14y = C12*A45 - A12*C45
p14z = A12*B45 - B12*A45

p25x = B23*C56 - C23*B56
p25y = C23*A56 - A23*C56
p25z = A23*B56 - B23*A56

p36x = B34*C61 - C34*B61
p36y = C34*A61 - A34*C61
p36z = A34*B61 - B34*A61

D = det(matrix(
    [[p14x,p14y,p14z],
    [p25x,p25y,p25z],
    [p36x,p36y,p36z]],
    ))
assert D.parent() is R

points = zip([x1,x2,x3,x4,x5,x6],[y1,y2,y3,y4,y5,y6],[z1,z2,z3,z4,z5,z6])
I = [x^2 + y^2 + z^2 for x,y,z in points]
print(D.mod(I))
